
import FIFOF::*;
import GetPut::*;
import Vector::*;


interface EncryptDecrypt#(numeric type n, numeric type m, numeric type T);
    method Action setKey(Vector#(m,UInt#(n)) key);
    method Action inputMessage(Vector#(2,UInt#(n)) text);
    method ActionValue#(Vector#(2,UInt#(n)) text) getResult();
endinterface

module mkEncrypt(EncryptDecrypt#(n,m,T));
endmodule


module mkDecrypt(EncryptDecrypt#(n,m,T));
endmodule
