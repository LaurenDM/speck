import GetPut::*;
import SpeckTypes::*;
import Memory::*;

typedef BlockType MemResp;

typedef enum{Ld, St} MemOp deriving(Eq, Bits, FShow);
typedef struct{
   MemOp op;
   Addr  addr;
   BlockType block;
} MemReq deriving(Eq, Bits, FShow);

typedef 24 DDR3AddrSize;
typedef Bit#(DDR3AddrSize) DDR3Addr;
typedef 512 DDR3BlockSize;
typedef Bit#(DDR3BlockSize) DDR3Block;
typedef TDiv#(DDR3BlockSize, 8) DDR3BlockBytes;
typedef Bit#(DDR3BlockBytes) DDR3ByteEn;
typedef TDiv#(DDR3BlockSize, BlockSz) DDR3BlockWords;

// typedef struct {
//     Bool        write;
//     Bit#(64)    byteen;
//     Bit#(24)    address;
//     Bit#(512)   block;
// } DDR3_Req deriving (Bits, Eq);
typedef MemoryRequest#(DDR3AddrSize, DDR3BlockSize) DDR3_Req;

// typedef struct {
//     Bit#(512)   block;
// } DDR3_Resp deriving (Bits, Eq);
typedef MemoryResponse#(DDR3BlockSize) DDR3_Resp;

// interface DDR3_Client;
//     interface Get#( DDR3_Req )  request;
//     interface Put#( DDR3_Resp ) response;
// endinterface;
typedef MemoryClient#(DDR3AddrSize, DDR3BlockSize) DDR3_Client;

typedef struct {
   Addr addr;
   BlockType block;
} MemInitLoad deriving(Eq, Bits, FShow);

typedef union tagged {
    MemInitLoad InitLoad;
     void InitDone;
} MemInit deriving(Eq, Bits, FShow);

interface MemInitIfc;
    interface Put#(MemInit) request;
    method Bool done();
endinterface

typedef struct {
    DDR3Addr addr;
    DDR3Block block;
} WideMemInitLoad deriving(Eq, Bits, FShow);

typedef union tagged {
    WideMemInitLoad InitLoad;
    void InitDone;
} WideMemInit deriving(Eq, Bits, FShow);

interface WideMemInitIfc;
    interface Put#(WideMemInit) request;
    method Bool done();
endinterface

