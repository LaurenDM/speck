import Speck::*;
import Vector::*;
import Printf::*;

typedef 24 N;
typedef 4 M;
typedef 23 T;

typedef enum { Keyset, Encrypt, Decrypt, Check, Finish } Status deriving (Bits, Eq);

module mkSpeckTest(Empty);
    EncryptDecrypt#(N,M,T) enc <- mkEncrypt();
    EncryptDecrypt#(N,M,T) dec <- mkDecrypt();

    Block#(N) plaintext = tuple2('h6d2073, 'h696874);
    Block#(N) ciphertext = tuple2('h735e10, 'hb6445d);
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

    rule setEncKey(status==Keyset);
        enc.setKey(key);
        status <= Encrypt;
    endrule

    rule setDecKey(status==Keyset);
        dec.setKey(dec_key);
    endrule

    rule encrypt(status==Encrypt);
        enc.inputMessage(plaintext);
        status <= Decrypt;
    endrule

    rule decrypt(status==Decrypt);
        let ciphertext2 <- enc.getResult();
        if(ciphertext2 != ciphertext) begin
            $display("ct should be: ");
            $display("%h %h", tpl_1(ciphertext), tpl_2(ciphertext));
            $display("ct is: ");
            $display("%h %h", tpl_1(ciphertext2), tpl_2(ciphertext2));
            passed <= False;
        end
        dec.inputMessage(ciphertext2);
        status <= Check;
    endrule

    rule check(status==Check);
        let plaintext2 <- dec.getResult();
        if(plaintext2 != plaintext) begin
            $display("pt should be: ");
            $display("%h %h", tpl_1(plaintext), tpl_2(plaintext));
            $display("pt is: ");
            $display("%h %h", tpl_1(plaintext2), tpl_2(plaintext2));
            passed <= False;
        end
        status <= Finish;
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
