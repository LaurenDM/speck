
import FIFOF::*; // for inputfifo, to check if empty
import FIFO::*; // for outputfifo
import Vector::*;

typedef Tuple2#(UInt#(n), UIInt#(n)) Block#(numeric type n)

define ALPHA 8
define BETA 3
//TODO: make alpha/beta dynamic? how to change when n=16?

interface EncryptDecrypt#(numeric type n, numeric type m, numeric type T);
    method Action setKey(Vector#(m,UInt#(n)) key);
    method Action inputMessage(Block#(n) text);
    method ActionValue#(Block#(n)) getResult();
endinterface

module mkEncrypt(EncryptDecrypt#(n,m,T));
    // Permanent Regs
    Reg#(Vector#(TSub#(TAdd#(T,m),1), UInt#(n))) l <- mkReg(replicate(0)); // for key expansion
    Reg#(UInt#(n)) k0 <- mkReg(0); // first round key

    // Regs between rounds
    Reg#(UInt#(6)) round <- mkReg(0);
    Reg#(UInt#(n)) roundkey <- mkReg(0);
    Reg#(Block#(n)) xyReg <- mkReg(tuple2(0,0));

    // Input/outputFIFO's
    FIFOF#(Block#(n)) plaintextFIFO <- mkFIFOF(); // inputfifo
    FIFO#(Block#(n)) ciphertextFIFO <- mkFIFO(); //outputfifo

    // Round function
    function Block#(n) roundfun(Block#(n) xy, UInt#(n) k);
        let x = tpl_1(xy); // x is most significant word
        let y = tpl_2(xy); // y is least significant word
        let x_new = (rotateBitsBy(x,fromInteger(valueof(n))-ALPHA)+y)^k;
        let y_new = rotateBitsBy(y,BETA)^x_new;
        return tuple2(x_new,y_new);
    endfunction

    rule pipeline(); // guard: implicit on plaintextFIFO, will not fire as long as no ciphertext
    // since key can only be set if ciphertextFIFO empty, key will be set first -> always valid
        Block#(n) xy = ?;
        if(round == 0) begin
            xy = plaintextFIFO.first();
            plaintextFIFO.deq();
        end
        else begin
            xy = xyReg;
        end
        let xy_new = roundfun(xy,roundkey);
        let lk = roundfun(tuple2(l[round],roundkey),round);
        l[round+valueof(m)-1] <= tpl_1(lk);
        if(round == fromInteger(valueof(T)-1)) begin
            roundkey <= k0;
            round <= 0;
            ciphertextFIFO.enq(xy_new);
        end
        else begin
            roundkey <= tpl_2(lk);
            round <= round + 1;
            xyReg <= xy_new;
        end
    endrule

    method Action setKey(Vector#(m,UInt#(n)) key) if(!plaintextFIFO.notEmpty());
        Vector#(TSub#(TAdd#(T,m),1), UInt#(n)) l_initial = replicate(0);
        for(Integer i=0; i<valueof(m)-1; i=i+1) begin
            l_initial[i] = key[i+1];
        end
        l <= l_initial;
        k0 <= key[0];
        roundkey <= key[0];
    endmethod

    method Action inputMessage(Block#(n) text);
        plaintextFIFO.enq(text);
    endmethod

    method ActionValue#(Block#(n)) getResult();
        ciphertextFIFO.deq();
        return ciphertextFIFO.first();
    endmethod
endmodule


module mkDecrypt(EncryptDecrypt#(n,m,T));
    // Permanent Regs
    Reg#(Vector#(TSub#(TAdd#(T,m),1), UInt#(n))) l <- mkReg(replicate(0)); // for key expansion
    Reg#(UInt#(n)) k0 <- mkReg(0); // first round key

    // Regs between rounds
    Reg#(UInt#(6)) round <- mkReg(0);
    Reg#(UInt#(n)) roundkey <- mkReg(0);
    Reg#(Block#(n)) xyReg <- mkReg(tuple2(0,0));

    // Input/outputFIFO's
    FIFOF#(Block#(n)) ciphertextFIFO <- mkFIFOF(); // inputfifo
    FIFO#(Block#(n)) plaintextFIFO <- mkFIFO(); //outputfifo

    // Round function
    function Block#(n) roundfuninv(Block#(n) xy, UInt#(n) k);
        let x = tpl_1(xy); // x is most significant word
        let y = tpl_2(xy); // y is least significant word
        let y_new = rotateBitsBy(x^y,fromInteger(valueof(n)-BETA));
        let x_new = rotateBitsBy((x^k)-y_new,ALPHA);
        return tuple2(x_new,y_new);
    endfunction

    rule pipeline(); // guard: implicit on ciphertextFIFO, will not fire as long as no ciphertext
    // since key can only be set if ciphertextFIFO empty, key will be set first -> always valid
        Block#(n) xy = ?;
        if(round == 0) begin
            xy = ciphertextFIFO.first();
            ciphertextFIFO.deq();
        end
        else begin
            xy = xyReg;
        end
        let xy_new = roundfuninv(xy,roundkey);
        let lk = roundfuninv(tuple2(l[round],roundkey),fromInteger(valueof(T))-2-round);
        l[round+valueof(m)-1] <= tpl_1(lk);
        if(round == fromInteger(valueof(T)-1)) begin
            roundkey <= k0;
            round <= 0;
            plaintextFIFO.enq(xy_new);
        end
        else begin
            roundkey <= tpl_2(lk);
            round <= round + 1;
            xyReg <= xy_new;
        end
    endrule

    method Action setKey(Vector#(m,UInt#(n)) key) if(!ciphertextFIFO.notEmpty());
        Vector#(TSub#(TAdd#(T,m),1), UInt#(n)) l_initial = replicate(0);
        for(Integer i=0; i<valueof(m)-1; i=i+1) begin
            l_initial[i] = key[i+1];
        end
        l <= l_initial;
        k0 <= key[0];
        roundkey <= key[0];
    endmethod

    method Action inputMessage(Block#(n) text);
        ciphertextFIFO.enq(text);
    endmethod

    method ActionValue#(Block#(n)) getResult();
        plaintextFIFO.deq();
        return plaintextFIFO.first();
    endmethod
endmodule
