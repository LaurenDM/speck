import ClientServer::*;
import FIFO::*;
import GetPut::*;
import DefaultValue::*;
import Clocks::*;
import Memory::*;
import MemTypes::*;
import Vector::*;

interface DutInterface;
  interface Put#(Bit#(32)) dataToDut;
  interface Get#(Bit#(32)) dataFromDut;
  interface Put#(Bit#(32)) startRead;
  interface DDR3_Client ddr3client;
endinterface


module mkDut (DutInterface);
  FIFO#(DDR3_Req) ddrReqQ <- mkFIFO();
  FIFO#(DDR3_Resp) ddrRespQ <- mkFIFO();

  FIFO#(Bit#(32)) truncRdataQ <- mkFIFO();
  FIFO#(Bit#(32)) truncWdataQ <- mkFIFO();
  Reg#(DDR3Addr) raddr <- mkReg(0);
  Reg#(DDR3Addr) waddr <- mkReg(0);
  Reg#(Bool) started <- mkReg(False);
  Reg#(DDR3Addr) readLen <- mkReg(0);

  Reg#(Bit#(32)) cyc <- mkReg(0);

  rule incCyc;
    cyc <= cyc + 1;
  endrule

  rule sendReadReq if (started && raddr < readLen );
    DDR3_Req r = DDR3_Req { write: False, byteen: -1, address: raddr, data: ? };
    ddrReqQ.enq(r);
    raddr <= raddr + 1;
    $display("[%d] HW: read req addr = %x", cyc, raddr);
  endrule

  // This is probably not required
  rule deqTrash if (!started);
    ddrRespQ.deq;
  endrule
 
  rule handleReadResp if (started);
    DDR3_Resp rdata = ddrRespQ.first;
    ddrRespQ.deq;
    truncRdataQ.enq(truncate(rdata.data));
    $display("[%d] HW: read = %x", cyc, rdata.data);
  endrule
  

  //conflicts with sendReadReq. We make writes have higher priority
  (* descending_urgency = "sendWriteReq, sendReadReq" *)
  rule sendWriteReq;
    Bit#(32) wdata = truncWdataQ.first;
    truncWdataQ.deq;
    DDR3_Req r = DDR3_Req { write: True, byteen: -1, address: waddr, data: zeroExtend(waddr) };
    ddrReqQ.enq(r);
    waddr <= waddr + 1;
    $display("[%d] HW: write [%x] = %x", cyc, waddr, waddr);
  endrule


  interface dataToDut = toPut(truncWdataQ);
  interface dataFromDut = toGet(truncRdataQ);

  interface Put startRead;
    method Action put(Bit#(32) len);
      started <= True;
      readLen <= truncate(len);
    endmethod
  endinterface

  interface ddr3client = toGPClient( ddrReqQ, ddrRespQ );

endmodule
