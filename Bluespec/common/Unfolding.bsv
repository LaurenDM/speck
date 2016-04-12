import FIFOF::*; // for inputfifo, to check if empty
import FIFO::*; // for outputfifo
import Vector::*;
import SpeckTypes::*;

module mkEncrypt_unfold(Integer stages ,EncryptDecrypt#(n,m,t) ifc);
    // Permanent Regs
    Vector#(TSub#(TAdd#(t,m),1), Reg#(UInt#(n))) l <- replicateM(mkReg(0)); // for key expansion
    Reg#(UInt#(n)) k0 <- mkReg(0); // first round key

    Reg#(UInt#(TLog#(n))) alpha <- mkReg(8);
    Reg#(UInt#(TLog#(n))) beta <- mkReg(3);

    // Regs between rounds/stages
    Vector#(stages,Reg#(UInt#(n))) round <- replicateM(mkReg(0));
    Vector#(stages,Reg#(UInt#(n))) roundkey <- replicateM(mkReg(0));
    Vector#(stages,Reg#(Block#(n))) xyReg <- replicateM(mkReg(tuple2(0,0)));

    // Input/outputFIFO's
    FIFOF#(Block#(n)) plaintextFIFO <- mkFIFOF(); // inputfifo
    FIFO#(Block#(n)) ciphertextFIFO <- mkFIFO(); //outputfifo

    function UInt#(n) rotateLeft(UInt#(n) x, UInt#(TLog#(n)) r);
        return unpack(rotateBitsBy(pack(x),r));
    endfunction

    function UInt#(n) rotateRight(UInt#(n) x, UInt#(TLog#(n)) r);
        return unpack(rotateBitsBy(pack(x),fromInteger(valueof(n))-r));
    endfunction

    // Round function
    function Block#(n) roundfun(Block#(n) xy, UInt#(n) k);
        let x = tpl_1(xy); // x is most significant word
        let y = tpl_2(xy); // y is least significant word
        let x_new = (rotateRight(x,alpha)+y)^k;
        let y_new = rotateLeft(y,beta)^x_new;
        return tuple2(x_new,y_new);
    endfunction

    function Bool isNonZero(UInt#(n) a);
        return (a!=0);
    endfunction

    // function to determine if busy (encryptmode) or we can set key, making rules and setkey mutually exclusive
    function Bool isBusy();
        return (plaintextFIFO.notEmpty | any(isNonZero, round));
    endfunction

    rule stage0(isBusy());
        Block#(n) xy = ?;
        if(round[0]==0 & !plaintextFIFO.notEmpty()) begin
            round[1] <= 0;
        end
        else begin
            if(round[0]==0) begin
                xy = plaintextFIFO.first();
                plaintextFIFO.deq;
            end
            else begin
                xy = xyReg[0];
            end
            let xynew = roundfun(xy,k[0]);
            let lk = roundfun(tuple2(l[0],k[0]),0);
            l[fromInteger(valueof(m))-1] <= tpl_1(lk);
            if(round[0] == fromInteger(valueof(t)-1)) begin
                round[1] <= 0;
                ciphertextFIFO.enq(xy_new);
            end
            else begin
                roundkey[1] <= tpl_2(lk);
                round[1] <= 1;
                xyReg[1] <= xy_new;
            end
        end
    endrule

    rule pipeline(isBusy());
        Block#(n) xy = ?;
        for(Integer s=1; s<stages; s=s+1) begin
            if(round[s]==0) begin //round = 0 is equivalent to tagged Invalid for xyReg
                round[mod(s+1,stages)] <= 0;
            end
            else begin // if round not 0 then the xyReg is valid
                let xy_new = roundfun(xyReg[s],roundkey[s]);
                let lk = roundfun(tuple2(l[round[s]],roundkey[s]),round[s]);
                l[round[s]+fromInteger(valueof(m))-1] <= tpl_1(lk);
                if(round[s] == fromInteger(valueof(t)-1)) begin // compiler smart enough to only add extra hardware to one stage or do we need extra if s==mod(valueof(t),stages)-1
                    round[mod(s+1,stages)] <= 0;
                    ciphertextFIFO.enq(xy_new);
                end
                else begin
                    roundkey[mod(s+1,stages)] <= tpl_2(lk);
                    round[mod(s+1,stages)] <= round[s]+1;
                    xyReg[mod(s+1,stages)] <= xy_new;
                end
            end
        end
    endrule

    method Action setKey(Vector#(m,UInt#(n)) key) if(!isBusy());
        for(Integer i=0; i<valueof(m)-1; i=i+1) begin
            l[i] <= key[i+1];
        end
        k0 <= key[0];
        if(valueof(n)==16) begin
            alpha <= 7;
            beta <= 2;
        end
    endmethod

    method Action inputMessage(Block#(n) text);
        plaintextFIFO.enq(text);
    endmethod

    method ActionValue#(Block#(n)) getResult();
        ciphertextFIFO.deq();
        return ciphertextFIFO.first();
    endmethod
endmodule


module mkDecrypt_unfold(Integer stages, EncryptDecrypt#(n,m,t) ifc);
    // Permanent Regs
    Vector#(TSub#(TAdd#(t,m),1), Reg#(UInt#(n))) l <- replicateM(mkReg(0)); // for key expansion
    Reg#(UInt#(n)) k0 <- mkReg(0); // first round key

    Reg#(UInt#(TLog#(n))) alpha <- mkReg(8);
    Reg#(UInt#(TLog#(n))) beta <- mkReg(3);

    // Regs between rounds/stages
    Vector#(stages,Reg#(UInt#(n))) round <- replicateM(mkReg(0));
    Vector#(stages,Reg#(UInt#(n))) roundkey <- replicateM(mkReg(0));
    Vector#(stages,Reg#(Block#(n))) xyReg <- replicateM(mkReg(tuple2(0,0)));

    // Input/outputFIFO's
    FIFOF#(Block#(n)) ciphertextFIFO <- mkFIFOF(); // inputfifo
    FIFO#(Block#(n)) plaintextFIFO <- mkFIFO(); //outputfifo

    function UInt#(n) rotateLeft(UInt#(n) x, UInt#(TLog#(n)) r);
        return unpack(rotateBitsBy(pack(x),r));
    endfunction

    function UInt#(n) rotateRight(UInt#(n) x, UInt#(TLog#(n)) r);
        return unpack(rotateBitsBy(pack(x),fromInteger(valueof(n))-r));
    endfunction

    // Round function
    function Block#(n) roundfuninv(Block#(n) xy, UInt#(n) k);
        let x = tpl_1(xy); // x is most significant word
        let y = tpl_2(xy); // y is least significant word
        let y_new = rotateRight(x^y,beta);
        let x_new = rotateLeft((x^k)-y_new,alpha);
        return tuple2(x_new,y_new);
    endfunction

    function Bool isNonZero(UInt#(n) a);
        return (a!=0);
    endfunction

    // function to determine if busy (encryptmode) or we can set key, making rules and setkey mutually exclusive
    function Bool isBusy();
        return (ciphertextFIFO.notEmpty | any(isNonZero, round));
    endfunction

    rule stage0(isBusy());
        Block#(n) xy = ?;
        if(round[0]==0 & !ciphertextFIFO.notEmpty()) begin
            round[1] <= 0;
        end
        else begin
            if(round[0]==0) begin
                xy = ciphertextFIFO.first();
                ciphertextFIFO.deq;
            end
            else begin
                xy = xyReg[0];
            end
            let xynew = roundfuninv(xy,k[0]);
            let lk = roundfuninv(tuple2(l[0],k[0]),0);
            l[fromInteger(valueof(m))-1] <= tpl_1(lk);
            if(round[0] == fromInteger(valueof(t)-1)) begin
                round[1] <= 0;
                plaintextFIFO.enq(xy_new);
            end
            else begin
                roundkey[1] <= tpl_2(lk);
                round[1] <= 1;
                xyReg[1] <= xy_new;
            end
        end
    endrule

    rule pipeline(isBusy());
        Block#(n) xy = ?;
        for(Integer s=1; s<stages; s=s+1) begin
            if(round[s]==0) begin //round = 0 is equivalent to tagged Invalid for xyReg
                round[mod(s+1,stages)] <= 0;
            end
            else begin // if round not 0 then the xyReg is valid
                let xy_new = roundfuninv(xyReg[s],roundkey[s]);
                let lk = roundfuninv(tuple2(l[round[s]],roundkey[s]),round[s]);
                l[round[s]+fromInteger(valueof(m))-1] <= tpl_1(lk);
                if(round[s] == fromInteger(valueof(t)-1)) begin // compiler smart enough to only add extra hardware to one stage or do we need extra if s==mod(valueof(t),stages)-1
                    round[mod(s+1,stages)] <= 0;
                    plaintextFIFO.enq(xy_new);
                end
                else begin
                    roundkey[mod(s+1,stages)] <= tpl_2(lk);
                    round[mod(s+1,stages)] <= round[s]+1;
                    xyReg[mod(s+1,stages)] <= xy_new;
                end
            end
        end
    endrule

    method Action setKey(Vector#(m,UInt#(n)) key) if(!isBusy());
        for(Integer i=0; i<valueof(m)-1; i=i+1) begin
            l[i] <= key[i+1];
        end
        k0 <= key[0];
        if(valueof(n)==16) begin
            alpha <= 7;
            beta <= 2;
        end
    endmethod

    method Action inputMessage(Block#(n) text);
        ciphertextFIFO.enq(text);
    endmethod

    method ActionValue#(Block#(n)) getResult();
        plaintextFIFO.deq();
        return plaintextFIFO.first();
    endmethod
endmodule
