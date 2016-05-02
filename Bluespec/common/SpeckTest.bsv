import Speck::*;
import SpeckTypes::*;
import Unfolding::*;
import Vector::*;
import Printf::*;
import Throughput::*;
import OFB::*;

typedef 10 NB;

typedef enum { Keyset, Encrypt, Decrypt, Check, Finish } Status deriving (Bits, Eq);

module mkSpeckTest3(Empty); // this test tests the OFB implementation
    OperationMode#(N,M,T) ofb <- mkOFB();

    Vector#(NB,Block#(N)) plaintext = newVector();
    plaintext[0] = tuple2('h6d2073, 'h696874);
    plaintext[1] = tuple2('h20796c, 'h6c6172);
    plaintext[2] = tuple2('h83e5a0, 'h12d53f);
    plaintext[3] = tuple2('h6574a8, 'h694c42);
    plaintext[4] = tuple2('h746146, 'h736e61);
    plaintext[5] = tuple2('h3b7265, 'h747543);
    plaintext[6] = tuple2('h65776f, 'h68202c);
    plaintext[7] = tuple2('h656761, 'h737520);
    plaintext[8] = tuple2('h656d69, 'h74206e);
    plaintext[9] = tuple2('h69202c, 'h726576);
    Vector#(NB,Block#(N)) ciphertext = newVector();
    ciphertext[0] = tuple2('hb5cdcb, 'hba36a5);
    ciphertext[1] = tuple2('he3634c, 'h396bda);
    ciphertext[2] = tuple2('h26061b, 'hc496ac);
    ciphertext[3] = tuple2('h8e1493, 'he3f373);
    ciphertext[4] = tuple2('hce014c, 'h256c1b);
    ciphertext[5] = tuple2('h5ba2d8, 'hf12e4d);
    ciphertext[6] = tuple2('hf506d4, 'h9c66ba);
    ciphertext[7] = tuple2('h571eb4, 'h9bbb66);
    ciphertext[8] = tuple2('h13c236, 'hfb4849);
    ciphertext[9] = tuple2('h92ebc3, 'h62e379);
    Vector#(M, UInt#(N)) key = newVector();
    key[0] = 'h020100;
    key[1] = 'h0a0908;
    key[2] = 'h121110;
    key[3] = 'h1a1918;
    Block#(N) iv = tuple2('h735e10, 'hb6445d);

    Reg#(Status) status <- mkReg(Keyset);
    Reg#(Bool) passed <- mkReg(True);
    Reg#(int) feedpt <- mkReg(0);
    Reg#(int) recct <- mkReg(0);
    Reg#(int) feedct <- mkReg(0);
    Reg#(int) recpt <- mkReg(0);

    rule setKey(status==Keyset);
        ofb.setKeyIV(key,iv);
        if(feedpt ==0 )
            status <= Encrypt;
        else
            status <= Decrypt;
        $display("set key");
    endrule

    rule encrypt(status==Encrypt && feedpt < fromInteger(valueof(NB)));
        ofb.inputMessage(plaintext[feedpt]);
        feedpt <= feedpt+1;
        $display("encrypting");
    endrule

    rule check_encrypt(status==Encrypt);
        let ciphertext2 <- ofb.getResult();
        if(ciphertext2 != ciphertext[recct]) begin
            $display("ct should be: ");
            $display("%h %h", tpl_1(ciphertext[recct]), tpl_2(ciphertext[recct]));
            $display("ct is: ");
            $display("%h %h", tpl_1(ciphertext2), tpl_2(ciphertext2));
            passed <= False;
        end
        recct <= recct + 1;
        if(recct == fromInteger(valueof(NB))-1) begin
            ofb.reset();
            status <= Keyset;
        end
        $display("checking encrypt");
    endrule

    rule decrypt(status==Decrypt && feedct < fromInteger(valueof(NB)));
        ofb.inputMessage(ciphertext[feedct]);
        feedct <= feedct +1;
        $display("decrypting");
    endrule

    rule check_decrypt(status==Decrypt);
        let plaintext2 <- ofb.getResult();
        if(plaintext2 != plaintext[recpt]) begin
            $display("pt should be: ");
            $display("%h %h", tpl_1(plaintext[recpt]), tpl_2(plaintext[recpt]));
            $display("pt is: ");
            $display("%h %h", tpl_1(plaintext2), tpl_2(plaintext2));
            passed <= False;
        end
        recpt <= recpt +1;
        if(recpt == fromInteger(valueof(NB))-1)
            status <= Finish;
        $display("checking decrypt");
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


module mkSpeckTest(Empty); // this test tests the throughput implementation
    SetKeyIV#(N,M,T) tp <- mkThroughputOB();

    Vector#(M, UInt#(N)) key = newVector();
    key[0] = 'h020100;
    key[1] = 'h0a0908;
    key[2] = 'h121110;
    key[3] = 'h1a1918;
    Block#(N) iv = tuple2('h735e10, 'hb6445d);
    
    Reg#(Status) status <- mkReg(Keyset);

    rule setEncKey(status==Keyset);
        tp.setKey(key);
        status <= Check;
        $display("set enc key");
    endrule

    rule check(status==Check);
        let x <- tp.ready();
        if(x) begin
            status <= Finish;
        end
    endrule

    rule finish(status==Finish);
        $display("Finished");
        $finish();
    endrule
endmodule


module mkSpeckTest1(Empty); // this test checks the original implementation
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
