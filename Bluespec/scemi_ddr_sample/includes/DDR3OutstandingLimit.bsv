import GetPut::*;
import ClientServer::*;
import FIFO::*;
import Vector::*;
import Memory::*;
import MemTypes::*;
import Cntrs::*;

typedef 32 MAX_OUTSTANDING_READS;

module mkConnectionOutstandingLimit#(DDR3_Client cli, DDR3_Server srv)(Empty);

  //Rate limit read requests so that we guarantee there is always space in the respbuf to
  //receive the data
  Count#(Bit#(TLog#(MAX_OUTSTANDING_READS))) outstanding <- mkCount(0);
  FIFO#(DDR3_Resp) respbuf <- mkSizedFIFO(valueof(MAX_OUTSTANDING_READS));

  rule request if (outstanding != fromInteger(valueof(MAX_OUTSTANDING_READS)-1));
    DDR3_Req req <- cli.request.get();
    srv.request.put(req);
    if (!req.write) begin
      outstanding.incr(1);
    end
  endrule

  rule response;
    let x <- srv.response.get();
    respbuf.enq(x);
  endrule

  rule forward;
    let x <- toGet(respbuf).get();
    cli.response.put(x);
    outstanding.decr(1);
  endrule
endmodule

  
