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

typedef Server#(Block_Flag, Block_Flag) DutInterface;
interface SettableDutInterface;
   interface Get#(Bool) dut;
   interface Put#(Key_Flag) setkey;
endinterface

(* synthesize *)
module [Module] mkDutWrapper#(Clock clk_usr)(SettableDutInterface);

   //Since DUT runs at clk_usr (67 MHz) and SceMi transactors run at 50MHz, we need to
   //cross clock domains. Thus we must wrap our DUT using synchronization primitives (SyncFIFOs).
   Clock clk_scemi <- exposeCurrentClock; //clk_scemi is the implicit SceMi clock (50Mhz)
   Reset rst_usr <- mkAsyncResetFromCR(6, clk_usr);
   SyncFIFOIfc#(Key_Flag) toKeySyncQ <- mkSyncFIFOFromCC(2, clk_usr);
   SyncFIFOIfc#(Bool) fromSyncQ <- mkSyncFIFOToCC(2, clk_usr);

   SetKey#(N,M,T) tpEnc <- mkThroughputEncrypt(encrypt, clocked_by clk_usr, reset_by rst_usr);
   SetKey#(N,M,T) tpDec <- mkThroughputDecrypt(decrypt, clocked_by clk_usr, reset_by rst_usr);

   rule putKey;
      let x = toKeySyncQ.first;
      toKeySyncQ.deq;
      if (x.flag == Encrypt) begin
          tpEnc.setKey(x.key);
      end
      else if (x.flag == Decrypt) begin
          tpDec.setKey(x.key);
      end
   endrule

   interface Get response = toGet(fromSyncQ);

   interface Put setkey;
      method Action put(Key_Flag x);
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
