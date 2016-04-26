import FIFOF::*; // for inputfifo, to check if empty
import FIFO::*; // for outputfifo
import Vector::*;
import SpeckTypes::*;

typedef 4 STAGES;

module mkEncrypt_unfold(EncryptDecrypt#(n,m,t));
    // Permanent Regs
    Vector#(TSub#(TAdd#(t,m),1), Reg#(UInt#(n))) l <- replicateM(mkReg(0)); // for key expansion
    Reg#(UInt#(n)) k0 <- mkReg(0); // first round key

    Reg#(UInt#(TLog#(n))) alpha <- mkReg(8);
    Reg#(UInt#(TLog#(n))) beta <- mkReg(3);

    // Regs between rounds/stages
    Vector#(STAGES,Reg#(UInt#(n))) round <- replicateM(mkReg(0));
    Vector#(STAGES,Reg#(UInt#(n))) roundkey <- replicateM(mkReg(0));
    Vector#(STAGES,Reg#(Block#(n))) xyReg <- replicateM(mkReg(tuple2(0,0)));

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
        return (plaintextFIFO.notEmpty || any(isNonZero, readVReg(round)));
    endfunction

    rule pipeline(isBusy());
        Block#(n) xy = ?;
        UInt#(n) key = ?;
        for(Integer s=0; s<valueof(STAGES); s=s+1) begin
            if(round[s]==0 && (s!=0 || !plaintextFIFO.notEmpty())) begin //round = 0 is equivalent to tagged Invalid for xyReg
                round[mod(s+1,valueof(STAGES))] <= 0;
            end
            else begin
                if(round[s]==0) begin
                    xy = plaintextFIFO.first();
                    plaintextFIFO.deq();
                    key = k0;
                end
                else begin
                    xy = xyReg[s];
                    key = roundkey[s];
                end
                let xy_new = roundfun(xy,key);
                let lk = roundfun(tuple2(l[round[s]],key),round[s]);
                if(round[s]==0 || countElem(round[s],readVReg(round))==1) // should always be true, just testing to make compiler happy
                    l[round[s]+fromInteger(valueof(m))-1] <= tpl_1(lk);
                if(mod(valueof(t),valueof(STAGES))-1==s && round[s] == fromInteger(valueof(t)-1)) begin
                    round[mod(s+1,valueof(STAGES))] <= 0;
                    ciphertextFIFO.enq(xy_new);
                end
                else begin
                    roundkey[mod(s+1,valueof(STAGES))] <= tpl_2(lk);
                    round[mod(s+1,valueof(STAGES))] <= round[s]+1;
                    xyReg[mod(s+1,valueof(STAGES))] <= xy_new;
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


module mkDecrypt_unfold(EncryptDecrypt#(n,m,t));
    // Permanent Regs
    Vector#(TSub#(TAdd#(t,m),1), Reg#(UInt#(n))) l <- replicateM(mkReg(0)); // for key expansion
    Reg#(UInt#(n)) k0 <- mkReg(0); // first round key

    Reg#(UInt#(TLog#(n))) alpha <- mkReg(8);
    Reg#(UInt#(TLog#(n))) beta <- mkReg(3);

    // Regs between rounds/stages
    Vector#(STAGES,Reg#(UInt#(n))) round <- replicateM(mkReg(0));
    Vector#(STAGES,Reg#(UInt#(n))) roundkey <- replicateM(mkReg(0));
    Vector#(STAGES,Reg#(Block#(n))) xyReg <- replicateM(mkReg(tuple2(0,0)));

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
        return (ciphertextFIFO.notEmpty || any(isNonZero, readVReg(round)));
    endfunction

    rule pipeline(isBusy());
        Block#(n) xy = ?;
        UInt#(n) key = ?;
        for(Integer s=0; s<valueof(STAGES); s=s+1) begin
            if(round[s]==0 && (s!=0 || !ciphertextFIFO.notEmpty())) begin //round = 0 is equivalent to tagged Invalid for xyReg
                round[mod(s+1,valueof(STAGES))] <= 0;
            end
            else begin
                if(round[s]==0) begin
                    xy = ciphertextFIFO.first();
                    ciphertextFIFO.deq();
                    key = k0;
                end
                else begin
                    xy = xyReg[s];
                    key = roundkey[s];
                end
                let xy_new = roundfuninv(xy,key);
                let lk = roundfuninv(tuple2(l[round[s]],key),fromInteger(valueof(t))-2-round[s]);
                if(round[s]==0 || countElem(round[s],readVReg(round))==1)
                    l[round[s]+fromInteger(valueof(m))-1] <= tpl_1(lk);
                if(mod(valueof(t),valueof(STAGES))-1==s && round[s] == fromInteger(valueof(t)-1)) begin
                    round[mod(s+1,valueof(STAGES))] <= 0;
                    plaintextFIFO.enq(xy_new);
                end
                else begin
                    roundkey[mod(s+1,valueof(STAGES))] <= tpl_2(lk);
                    round[mod(s+1,valueof(STAGES))] <= round[s]+1;
                    xyReg[mod(s+1,valueof(STAGES))] <= xy_new;
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
