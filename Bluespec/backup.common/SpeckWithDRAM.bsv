
import FIFOF::*; // for inputfifo, to check if empty
import FIFO::*; // for outputfifo
import Vector::*;
import SpeckTypes::*;
import WideMemInit::*; //initializes WideMem
import MemUtil::*; // module for going between WideMem and DDR3


(* synthesize *)
module mkSynthesizedEncrypt(EncryptDecrypt#(N,M,T));
    EncryptDecrypt#(N,M,T) enc <- mkEncrypt();
    return enc;
endmodule

(* synthesize *)
module mkSynthesizedDecrypt(EncryptDecrypt#(N,M,T));
    EncryptDecrypt#(N,M,T) dec <- mkDecrypt();
    return dec;
endmodule

module mkEncrypt(EncryptDecrypt#(n,m,t));
   //DDR3 Memory
   Fifo#(2, DDR3_Req)  plaintextFifo  <- mkCFFifo; //input fifo
   Fifo#(2, DDR3_Resp) ciphertextFifo <- mkCFFifo; //output fifo
   WideMemInitIfc ddr3InitIfc <- mkWideMemInitDDR3(ddr3ReqFifo);
   Bool memReady = ddr3InitIfc.done;
   WideMem  wideMemWrapper <- mkWideMemFromDDR3(ddr3ReqFifo, ddr3RespFifo);
    
   // Permanent Regs
   Reg#(Vector#(TSub#(TAdd#(t,m),1), UInt#(n))) l <- mkReg(replicate(0)); // for key expansion
   Reg#(UInt#(n)) k0 <- mkReg(0); // first round key

   Reg#(UInt#(TLog#(n))) alpha <- mkReg(8);
   Reg#(UInt#(TLog#(n))) beta <- mkReg(3);

    // Regs between rounds
    Reg#(UInt#(n)) round <- mkReg(0);
    Reg#(UInt#(n)) roundkey <- mkReg(0);
    Reg#(Block#(n)) xyReg <- mkReg(tuple2(0,0));

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

    rule pipeline(plaintextFIFO.notEmpty()); // guard: implicit on plaintextFIFO, will not fire as long as no ciphertext
    // since key can only be set if ciphertextFIFO empty, key will be set first -> always valid
        Block#(n) xy = ?;
        if(round == 0) begin
            xy = plaintextFIFO.first();
        end
        else begin
            xy = xyReg;
        end
        let xy_new = roundfun(xy,roundkey);
        let lk = roundfun(tuple2(l[round],roundkey),round);
        l[round+fromInteger(valueof(m))-1] <= tpl_1(lk);
        if(round == fromInteger(valueof(t)-1)) begin
            roundkey <= k0;
            round <= 0;
            ciphertextFIFO.enq(xy_new);
            plaintextFIFO.deq();
        end
        else begin
            roundkey <= tpl_2(lk);
            round <= round + 1;
            xyReg <= xy_new;
        end
    endrule

    method Action setKey(Vector#(m,UInt#(n)) key) if(!plaintextFIFO.notEmpty());
        Vector#(TSub#(TAdd#(t,m),1), UInt#(n)) l_initial = replicate(0);
        for(Integer i=0; i<valueof(m)-1; i=i+1) begin
            l_initial[i] = key[i+1];
        end
        l <= l_initial;
        k0 <= key[0];
        roundkey <= key[0];
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


module mkDecrypt(EncryptDecrypt#(n,m,t));
    // Permanent Regs
    Reg#(Vector#(TSub#(TAdd#(t,m),1), UInt#(n))) l <- mkReg(replicate(0)); // for key expansion
    Reg#(UInt#(n)) k0 <- mkReg(0); // first round key

    Reg#(UInt#(TLog#(n))) alpha <- mkReg(8);
    Reg#(UInt#(TLog#(n))) beta <- mkReg(3);

    // Regs between rounds
    Reg#(UInt#(n)) round <- mkReg(0);
    Reg#(UInt#(n)) roundkey <- mkReg(0);
    Reg#(Block#(n)) xyReg <- mkReg(tuple2(0,0));

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

    rule pipeline(ciphertextFIFO.notEmpty()); // guard: implicit on ciphertextFIFO, will not fire as long as no ciphertext
    // since key can only be set if ciphertextFIFO empty, key will be set first -> always valid
        Block#(n) xy = ?;
        if(round == 0) begin
            xy = ciphertextFIFO.first();
        end
        else begin
            xy = xyReg;
        end
        let xy_new = roundfuninv(xy,roundkey);
        let lk = roundfuninv(tuple2(l[round],roundkey),fromInteger(valueof(t))-2-round);
        l[round+fromInteger(valueof(m))-1] <= tpl_1(lk);
        if(round == fromInteger(valueof(t)-1)) begin
            roundkey <= k0;
            round <= 0;
            plaintextFIFO.enq(xy_new);
            ciphertextFIFO.deq();
        end
        else begin
            roundkey <= tpl_2(lk);
            round <= round + 1;
            xyReg <= xy_new;
        end
    endrule

    method Action setKey(Vector#(m,UInt#(n)) key) if(!ciphertextFIFO.notEmpty());
        Vector#(TSub#(TAdd#(t,m),1), UInt#(n)) l_initial = replicate(0);
        for(Integer i=0; i<valueof(m)-1; i=i+1) begin
            l_initial[i] = key[i+1];
        end
        l <= l_initial;
        k0 <= key[0];
        roundkey <= key[0];
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
