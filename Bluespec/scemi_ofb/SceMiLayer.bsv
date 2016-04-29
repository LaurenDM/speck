import ClientServer::*;
import FIFO::*;
import GetPut::*;
import DefaultValue::*;
import SceMi::*;
import Clocks::*;
import ResetXactor::*;
import Xilinx::*;

import OFB::*;
import SpeckTypes::*;
import FixedPoint::*;
import Vector::*;

/* because OFB only uses encrypt module, we are exclusively using BlockType and KeyType
 instead of Block_Flag and Key_Flag */

typedef Server#(BlockType, BlockType) DutInterface;
interface SettableDutInterface;
   interface DutInterface dut;
   interface Put#(Key_Iv) setkeyandIV;
endinterface

(* synthesize *)
module [Module] mkDutWrapper#(Clock clk_usr)(SettableDutInterface);

   //Since DUT runs at clk_usr (67 MHz) and SceMi transactors run at 50MHz, we need to
   //cross clock domains. Thus we must wrap our DUT using synchronization primitives (SyncFIFOs).
   Clock clk_scemi <- exposeCurrentClock; //clk_scemi is the implicit SceMi clock (50Mhz)
   Reset rst_usr <- mkAsyncResetFromCR(6, clk_usr);
   SyncFIFOIfc#(BlockType) toSyncQ <- mkSyncFIFOFromCC(2, clk_usr);          //clk_scemi -> clk_usr
   SyncFIFOIfc#(BlockType) fromSyncQ <- mkSyncFIFOToCC(2, clk_usr, rst_usr); //clk_usr -> clk_scemi
   SyncFIFOIfc#(Key_Iv) toKeySyncQ <- mkSyncFIFOFromCC(2, clk_usr);

   OperationMode#(N,M,T) ofb <- mkSynthesizedOFB(clocked_by clk_usr, reset_by rst_usr);

   rule enqRequest;
      BlockType request = toSyncQ.first;
      toSyncQ.deq;
      ofb.inputMessage(request);
   endrule

   rule getResponse;
      BlockType response;
      response <- ofb.getResult();
      fromSyncQ.enq(response);
   endrule

   rule putKey;
      let key_iv = toKeySyncQ.first;
      toKeySyncQ.deq;
      ofb.setKeyIV(key_iv.key, key_iv.iv);
   endrule

   interface DutInterface dut;
      interface Put request = toPut(toSyncQ);
      interface Get response = toGet(fromSyncQ);
   endinterface

   interface Put setkeyandIV;
      method Action put(Key_Iv key_iv);
	       toKeySyncQ.enq(key_iv);
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
   Empty setkey <- mkPutXactor(settabledut.setkeyandIV, clk_port_scemi);

   Empty shutdown <- mkShutdownXactor();
endmodule
