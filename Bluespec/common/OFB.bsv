import FIFO::*;
import Vector::*;
import SpeckTypes::*;
import Speck::*;

(* synthesize *)
module mkSynthesizedOFB(OperationMode#(N,M,T));
    OperationMode#(N,M,T) ofb <- mkOFB();
    return ofb;
endmodule

module mkOFB(OperationMode#(n,m,t));
    EncryptDecrypt#(n,m,t) enc <- mkEncrypt();
    Reg#(Bool) started <- mkReg(False);

    // Input/outputFIFO's
    FIFO#(Block#(n)) inputFIFO <- mkFIFO();
    FIFO#(Block#(n)) outputFIFO <- mkFIFO();

    function Block#(n) blockxor(Block#(n) key, Block#(n) pt);
        return tuple2(tpl_1(key)^tpl_1(pt),tpl_2(key)^tpl_2(pt));
    endfunction

    rule do_xor if (started); // will only fire if enc result available and plaintext ready
        let xorkey <- enc.getResult();
        outputFIFO.enq(blockxor(xorkey,inputFIFO.first()));
        inputFIFO.deq;
        enc.inputMessage(xorkey);
    endrule

    rule empty if (!started); // empty outputfifo of encryption module
        let dummy <- enc.getResult();
    endrule

    method Action setKeyIV(Vector#(m,UInt#(n)) key, Block#(n) iv) if (!started);
        enc.setKey(key);
        enc.inputMessage(iv);
        started <= True;
    endmethod

    method Action inputMessage(Block#(n) text);
        inputFIFO.enq(text);
    endmethod

    method ActionValue#(Block#(n)) getResult();
        outputFIFO.deq();
        return outputFIFO.first();
    endmethod

    method Action reset();
        started <= False;
    endmethod

endmodule
