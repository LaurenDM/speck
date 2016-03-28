
import FIFOF::*; // for inputfifo, to check if empty
import FIFO::*; // for outputfifo 
import Vector::*;



interface EncryptDecrypt#(numeric type n, numeric type m, numeric type T);
    method Action setKey(Vector#(m,UInt#(n)) key);
    method Action inputMessage(Vector#(2,UInt#(n)) text);
    method ActionValue#(Vector#(2,UInt#(n)) text) getResult();
endinterface

module mkEncrypt(EncryptDecrypt#(n,m,T));
endmodule


module mkDecrypt(EncryptDecrypt#(n,m,T));

    Reg#(Vector#(TSub#(TAdd#(T,m),1), UInt#(n))) l <- mkReg(replicate(0)); // for key expansion
    Reg#(UInt#(6)) round <- mkReg(0);
    Reg#(UInt#(n)) roundkey <- mkReg(0);

    Reg#(Uint#(n)) xReg <- mkReg(0);
    Reg#(Uint#(n)) yReg <- mkReg(0);

    FIFOF#(Vector#(2,Uint#(n))) ciphertextFIFO <- mkFIFOF(); // inputfifo
    FIFO#(Vector#(2,Uint#(n))) plaintextFIFO <- mkFIFO(); //outputfifo

    rule pipeline(); // guard: implicit on ciphertextFIFO, will not fire as long as no ciphertext
    // since key can only be set if ciphertextFIFO empty, key will be set first -> always valid
        UInt#(n) x = ?;
        Uint#(n) y = ?;
        if(round == 0) begin
            x = ciphertextFIFO.first()[1]; // Most significant word
            y = ciphertextFIFO.first()[0]; // Least significant word
            ciphertextFIFO.deq();
        end
        else begin
            x = xReg;
            y = yReg;
        end
        // todo apply round function to keys and xy

    endrule

    method Action setKey(Vector#(m,UInt#(n)) key) if(!ciphertextFIFO.notEmpty());
        Vector#(TSub#(TAdd#(T,m),1), UInt#(n)) l_initial = replicate(0);
        for(Integer i=0; i<valueof(m)-1; i=i+1) begin
            l_initial[i] = key[i+1];
        end
        l <= l_initial;
        roundkey <= key[0];
    endmethod

    method Action inputMessage(Vector#(2,UInt#(n)) text);
        ciphertextFIFO.enq(text);
    endmethod

    method ActionValue#(Vector#(2,UInt#(n)) text) getResult();
        plaintextFIFO.deq();
        return plaintextFIFO.first();
    endmethod


endmodule
