import ClientServer::*;
import FIFO::*;
import GetPut::*;
import DefaultValue::*;
import SceMi::*;
import Clocks::*;
import ResetXactor::*;
import Memory::*;
import SimMem::*;

import Types::*;
import ProcTypes::*;
import MemTypes::*;
import Connectable::*;

// Where to find mkProc
// PROCFILE is defined differently for each scemi build target
import `PROC_FILE::*;

typedef Proc DutInterface;
typedef CpuToHostData ToHost;
typedef Addr FromHost;

`ifdef DDR3
typedef DDR3_Client SceMiLayer;
`else
typedef Empty SceMiLayer;
`endif


(* synthesize *)
module [Module] mkDutWrapper (DutInterface);
    let m <- mkProc();
    return m;
endmodule

module [SceMiModule] mkSceMiLayer( SceMiLayer );

    SceMiClockConfiguration conf = defaultValue;

    SceMiClockPortIfc clk_port <- mkSceMiClockPort(conf);
    DutInterface dut <- buildDutWithSoftReset(mkDutWrapper, clk_port);

    Empty mem <- mkPutXactor(dut.memInit.request, clk_port);
    Empty tohost <- mkGetXactor(toGet(dut.cpuToHost), clk_port);
    Empty fromhost <- mkPutXactor(toPut(dut.hostToCpu), clk_port);

    Empty shutdown <- mkShutdownXactor();

    // cross ddr3 fifos from controlled clock into uncontrolled domain
    let uclock <- sceMiGetUClock;
    let ureset <- sceMiGetUReset;
    SyncFIFOIfc#(DDR3_Req) reqFifo <- mkSyncFIFO(1, clk_port.cclock, clk_port.creset, uclock);
    SyncFIFOIfc#(DDR3_Resp) respFifo <- mkSyncFIFO(1, uclock, ureset, clk_port.cclock);
    mkConnection( dut.ddr3client , toGPServer( reqFifo, respFifo ) );
`ifdef DDR3
	// FPGA synthesis, return to mkBridge and connecto real DDR3
    return toGPClient( reqFifo, respFifo );
`else
	// simulation
	mkSimMem(toGPClient(reqFifo, respFifo));
`endif
endmodule

