import FIFO::*;
import Vector::*;
import SpeckTypes::*;

module mkOFB(OperationMode#(n,m,t));
    EncryptDecrypt#(n,m,t) enc <- mkEncrypt();

    // Input/outputFIFO's
    FIFO#(Block#(n)) inputFIFO <- mkFIFO();
    FIFO#(Block#(n)) outputFIFO <- mkFIFO();

    function xor(Block#(n) key, Block#(n) pt);
        return tuple2(tpl_1(key)^tpl_1(pt),tpl_2(key)^tpl_2(pt));
    endfunction

    rule do_xor; // will only fire if enc result available and plaintext ready
        let xorkey <- enc.getResult();
        outputFIFO.enq(xor(xorkey,inputFIFO.first()));
        inputFIFO.deq;
        enc.inputMessage(xorkey);
    endrule

    method Action setKeyIV(Vector#(m,UInt#(n)) key, Block#(n) iv);
        enc.setKey(key);
        enc.inputMessage(iv);
    endmethod

    method Action inputMessage(Block#(n) text);
        inputFIFO.enq(text);
    endmethod

    method ActionValue#(Block#(n)) getResult();
        outputFIFO.deq();
        return outputFIFO.first();
    endmethod


endmodule
