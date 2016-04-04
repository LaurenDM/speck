import Complex::*;
import FixedPoint::*;
import GetPut::*;
import Vector::*;

typedef 24 N;
typedef 4 M;
typedef 23 T;

typedef Tuple2#(UInt#(n), UInt#(n)) Block#(numeric type n);

interface EncryptDecrypt#(numeric type n, numeric type m, numeric type t);
    method Action setKey(Vector#(m,UInt#(n)) key);
    method Action inputMessage(Block#(n) text);
    method ActionValue#(Block#(n)) getResult();
endinterface
