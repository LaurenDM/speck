import CacheTypes::*;
import SpeckTypes::*; //defines BlockType, FlagType, Addr, etc.
import MemTypes::*; //defines MemReq, MemResp
import MemInit::*;
import MemUtil::*;
import WideMemInit::*;
import Vector::*;
import Fifo::*;

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