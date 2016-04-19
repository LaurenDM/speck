import Speck::*;
import SpeckTypes::*;
import Unfolding::*;
import Vector::*;
import Printf::*;

typedef 4 NB;

typedef enum { Keyset, Encrypt, Decrypt, Check, Finish } Status deriving (Bits, Eq);


module mkSpeckTest(Empty);
    EncryptDecrypt#(N,M,T) enc <- mkEncrypt_unfold();
    EncryptDecrypt#(N,M,T) dec <- mkDecrypt_unfold();

    Vector#(NB,Block#(N)) plaintext = newVector();
    plaintext[0] = tuple2('h6d2073, 'h696874);
    plaintext[1] = tuple2('h20796c, 'h6c6172);
    plaintext[2] = tuple2('h83e5a0, 'h12d53f);
    plaintext[3] = tuple2('h6574a8, 'h694c42);
    Vector#(NB,Block#(N)) ciphertext = newVector();
    ciphertext[0] = tuple2('h735e10, 'hb6445d);
    ciphertext[1] = tuple2('h5df9b2, 'h241c3b);
    ciphertext[2] = tuple2('haba111, 'hf34cb2);
    ciphertext[3] = tuple2('haf2939, 'h909907);
    Vector#(M, UInt#(N)) key = newVector();
    key[0] = 'h020100;
    key[1] = 'h0a0908;
    key[2] = 'h121110;
    key[3] = 'h1a1918;
    Vector#(M, UInt#(N)) dec_key = newVector();
    dec_key[0] = 'hcb6915;
    dec_key[1] = 'hc6cbb1;
    dec_key[2] = 'h4a5369;
    dec_key[3] = 'h7f5a9d;

    Reg#(Status) status <- mkReg(Keyset);
    Reg#(Bool) passed <- mkReg(True);
    Reg#(int) feedpt <- mkReg(0);
    Reg#(int) feedct <- mkReg(0);
    Reg#(int) rec <- mkReg(0);

    rule setEncKey(status==Keyset);
        enc.setKey(key);
        status <= Encrypt;
        $display("set enc key");
    endrule

    rule setDecKey(status==Keyset);
        dec.setKey(dec_key);
        $display("set dec key");
    endrule

    rule encrypt(status==Encrypt);
        enc.inputMessage(plaintext[feedpt]);
        feedpt <= feedpt+1;
        if(feedpt == fromInteger(valueof(NB))-1)
            status <= Decrypt;
        $display("encrypting");
    endrule

    rule decrypt(status==Decrypt);
        let ciphertext2 <- enc.getResult();
        if(ciphertext2 != ciphertext[feedct]) begin
            $display("ct should be: ");
            $display("%h %h", tpl_1(ciphertext[feedct]), tpl_2(ciphertext[feedct]));
            $display("ct is: ");
            $display("%h %h", tpl_1(ciphertext2), tpl_2(ciphertext2));
            passed <= False;
        end
        feedct <= feedct + 1;
        dec.inputMessage(ciphertext2);
        if(feedct == fromInteger(valueof(NB))-1)
            status <= Check;
        $display("decrypting");
    endrule

    rule check(status==Check);
        let plaintext2 <- dec.getResult();
        if(plaintext2 != plaintext[rec]) begin
            $display("pt should be: ");
            $display("%h %h", tpl_1(plaintext[rec]), tpl_2(plaintext[rec]));
            $display("pt is: ");
            $display("%h %h", tpl_1(plaintext2), tpl_2(plaintext2));
            passed <= False;
        end
        rec <= rec +1;
        if(rec == fromInteger(valueof(NB))-1)
            status <= Finish;
        $display("checking");
    endrule

    rule finish(status==Finish);
        if(passed) begin
            $display("PASSED");
        end else begin
            $display("FAILED");
        end
        $finish();
    endrule

endmodule
