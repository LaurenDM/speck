import ClientServer::*;
import FIFO::*;
import GetPut::*;
import DefaultValue::*;
import SceMi::*;
import Clocks::*;
import ResetXactor::*;
import Xilinx::*;

import Speck::*;
import Throughput::*;
import SpeckTypes::*;
import FixedPoint::*;
import Vector::*;

typedef Server#(Bool, Bit#(32)) DutInterface;
interface SettableDutInterface;
   interface DutInterface dut;
   interface Put#(Key_Iv) setkey;
endinterface

(* synthesize *)
module [Module] mkDutWrapper#(Clock clk_usr)(SettableDutInterface);

   //Since DUT runs at clk_usr (67 MHz) and SceMi transactors run at 50MHz, we need to
   //cross clock domains. Thus we must wrap our DUT using synchronization primitives (SyncFIFOs).
   Clock clk_scemi <- exposeCurrentClock; //clk_scemi is the implicit SceMi clock (50Mhz)
   Reset rst_usr <- mkAsyncResetFromCR(6, clk_usr);
   SyncFIFOIfc#(Key_Iv) toKeySyncQ <- mkSyncFIFOFromCC(2, clk_usr);
   SyncFIFOIfc#(Bool) toSyncQ <- mkSyncFIFOFromCC(2, clk_usr);          //clk_scemi -> clk_usr
   SyncFIFOIfc#(Bit#(32)) fromSyncQ <- mkSyncFIFOToCC(2, clk_usr, rst_usr);

   //Reg#(Bit#(64)) starttime <- mkReg(0);

   SetKeyIV#(N,M,T) tpOfb <- mkThroughputOFB(clocked_by clk_usr, reset_by rst_usr);

   rule putKey;
      let key_iv = toKeySyncQ.first;
      toKeySyncQ.deq;
      //let t <- $time;
      //starttime <= t;
      tpOfb.setKeyIV(key_iv.key, key_iv.iv);
   endrule

   rule getResponse;
      let x <- tpOfb.ready();
      //let endtime = ?;
      if(tpl_1(x))
          //endtime <- $time;
          //let duration = endtime - starttime;
          fromSyncQ.enq(tpl_2(x));
   endrule

   interface DutInterface dut;
      interface Put request = toPut(toSyncQ);
      interface Get response = toGet(fromSyncQ);
   endinterface

   interface Put setkey;
      method Action put(Key_Iv x);
	         toKeySyncQ.enq(x);
      endmethod
   endinterface
endmodule

module [SceMiModule] mkSceMiLayer#(Clock clk_usr)();

   //SceMi clock is used for Xactors. Fixed at 50MHz
   SceMiClockConfiguration conf = defaultValue;
   SceMiClockPortIfc clk_port_scemi <- mkSceMiClockPort(conf);

   //DUT is clocked by clk_usr, crossing domains to SceMi clock.
   //clk_usr rate is parameterized in the build file.
   SettableDutInterface settabledut <- buildDutWithSoftReset(mkDutWrapper(clk_usr), clk_port_scemi);

   Empty processor <- mkServerXactor(settabledut.dut, clk_port_scemi);
   Empty setkey <- mkPutXactor(settabledut.setkey, clk_port_scemi);

   Empty shutdown <- mkShutdownXactor();
endmodule
