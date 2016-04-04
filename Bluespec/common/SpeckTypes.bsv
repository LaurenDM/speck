import Complex::*;
import FixedPoint::*;
import GetPut::*;
import Vector::*;

typedef 24 N;
typedef 4 M;
typedef 23 T;

typedef Tuple2#(UInt#(n), UInt#(n)) Block#(numeric type n);
typedef Vector#(M, UInt#(N)) KeyType;
typedef enum {Encrypt, Decrypt} FlagType deriving (Bits, Eq);
typedef Block#(N) BlockType;

typedef struct{
   KeyType key;
   FlagType flag;
} Key_Flag deriving(Bits, Eq);

typedef struct{ 
   BlockType block;
   FlagType flag;
} Block_Flag deriving(Bits, Eq);