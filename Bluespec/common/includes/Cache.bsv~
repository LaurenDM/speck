import CacheTypes::*;
import SpeckTypes::*; //defines BlockType, FlagType, Addr, etc.
import MemTypes::*; //defines MemReq, MemResp
import MemInit::*;
import MemUtil::*;
import WideMemInit::*;
import Vector::*;
import Fifo::*;

typedef enum {Ready, StartMiss, SendFillReq, WaitFillResp} CacheStatus deriving (Bits, Eq);

interface Translator;
   method Action req(MemReq r);
   method ActionValue#(MemResp) resp;
endinterface

module mkTranslator(WideMem widemem, Cache cache);   
   Fifo#(2, Bit#(TLog#(CacheLineWords))) offsetFifo <- mkCFFifo;
   function Bit#(TLog#(CacheLineWords)) getOffset(Addr addr) = truncate(addr >> 2);
   
   method Action req(MemReq r);
      WideMemReq convertedReq = toWideMemReq(r);
      widemem.req(convertedReq);
      
      if (r.op == Ld) begin
	 let offset = getOffset(r.addr);
	 offsetFifo.enq(offset);
      end
   endmethod
   
   method ActionValue#(Data) resp();
      CacheLine cacheline <- widemem.resp();
   
      let offset = offsetFifo.first;
      offsetFifo.deq;
   
      Data res = cacheline[offset];
      return res;
   endmethod
endmodule


module mkCache(WideMem widemem, Cache cache);
   Vector#(CacheLineWords, Reg#(CacheLine)) dataArray <-replicateM(mkRegU);
   Vector#(CacheLineWords, Reg#(Maybe#(CacheTag))) tagArray <- replicateM(mkReg(tagged Invalid));
   Vector#(CacheLineWords, Reg#(Bool)) dirtyArray <-replicateM(mkReg(False));
   Fifo#(2, Data) hitQ <- mkCFFifo;
   Reg#(MemReq) missReq <- mkRegU;
   Reg#(CacheStatus) mshr <- mkReg(Ready);
   Fifo#(2, MemReq) memReqQ <- mkCFFifo;
   Fifo#(2, CacheLine) memRespQ <- mkCFFifo;
   
   function CacheIndex getIdx(Addr addr) = truncate(addr>>4);
   function Bit#(TLog#(CacheLineWords)) getOffset(Addr addr) = truncate(addr >> 2);
   function CacheTag getTag(Addr addr) = truncateLSB(addr);
   
   rule startMiss(mshr == StartMiss);
      $fwrite(stderr, "start miss\t");
      let idx = getIdx(missReq.addr);
      let tag = tagArray[idx];
      let dirty = dirtyArray[idx];
      
      if(isValid(tag) && dirty) begin // initiate write-back
	 let addr = {fromMaybe(?,tag), idx, 6'b0};
	 let data = dataArray[idx];
	 memReqQ.enq(MemReq{op: St, addr: addr, data: missReq.data});
      end
      mshr <= SendFillReq;
   endrule
   
   rule sendFillReq (mshr == SendFillReq);
      $fwrite(stderr, "send fill\t");
      memReqQ.enq(missReq);
      mshr <= WaitFillResp;
   endrule
   
   rule waitFillResp(mshr == WaitFillResp);
      $fwrite(stderr, "wait fill\t");
      let idx = getIdx(missReq.addr);
      let tag = getTag(missReq.addr);
      let data = memRespQ.first;
      tagArray[idx] <= Valid(tag);
      let wOffset = getOffset(missReq.addr);
      
      if(missReq.op == Ld) begin
	 dirtyArray[idx] <= False;
	 dataArray[idx] <= data;
	 hitQ.enq(data[wOffset]);
      end
      else begin
	 data[wOffset] = missReq.data;
	 dirtyArray[idx] <= True;
	 dataArray[idx] <= data;
      end
      
      memRespQ.deq;
      mshr <= Ready;
   endrule
   
   method Action req(MemReq r) if (mshr == Ready);
      let idx = getIdx(r.addr);
      let tag = getTag(r.addr);
      let wOffset = getOffset(r.addr);
      let currTag = tagArray[idx];
      let hit = isValid(currTag) ? fromMaybe(?,currTag)==tag : False;
      
      if (hit) begin
	 $fwrite(stderr, "hit");
	 let x = dataArray[idx];
	 
	 if(r.op == Ld) begin
	    hitQ.enq(x[wOffset]);
	 end
	 else begin
	    x[wOffset] = r.data; //overwrite word
	    dataArray[idx] <= x;
	    dirtyArray[idx] <= True;
	 end
      end
      else begin
	 $fwrite(stderr, "miss\t");
	 missReq <= r;
	 mshr <= StartMiss;
      end
   endmethod
   
   method ActionValue#(Data) resp;
      $fwrite(stderr, "resp\t");
      hitQ.deq;
      return hitQ.first;
   endmethod
   
   method ActionValue#(MemReq) memReq;
      memReqQ.deq;
      return memReqQ.first;
   endmethod
   
   method Action memResp(CacheLine r);
      memRespQ.enq(r);
   endmethod
endmodule