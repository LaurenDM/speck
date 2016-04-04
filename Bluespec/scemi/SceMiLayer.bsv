import ClientServer::*;
import FIFO::*;
import GetPut::*;
import DefaultValue::*;
import SceMi::*;
import Clocks::*;
import ResetXactor::*;
import Xilinx::*;

import Speck::*;
import SpeckTypes::*;
import FixedPoint::*;
import Vector::*;


typedef Vector#(M, UInt#(N)) KeyType;
typedef Server#(Block#(N), Block#(N)) DutInterface;

interface SettableDutInterface;
   interface DutInterface dut;
   interface Put#(KeyType) setkey;
endinterface

(* synthesize *)
module [Module] mkDutWrapper#(Clock clk_usr)(SettableDutInterface);

   //Since DUT runs at clk_usr (67 MHz) and SceMi transactors run at 50MHz, we need to
   //cross clock domains. Thus we must wrap our DUT using synchronization primitives (SyncFIFOs). 
   Clock clk_scemi <- exposeCurrentClock; //clk_scemi is the implicit SceMi clock (50Mhz)
   Reset rst_usr <- mkAsyncResetFromCR(6, clk_usr);
   SyncFIFOIfc#(Block#(N)) toApSyncQ <- mkSyncFIFOFromCC(2, clk_usr);          //clk_scemi -> clk_usr
   SyncFIFOIfc#(Block#(N)) fromApSyncQ <- mkSyncFIFOToCC(2, clk_usr, rst_usr); //clk_usr -> clk_scemi
   SyncFIFOIfc#(KeyType) toApFactorSyncQ <- mkSyncFIFOFromCC(2, clk_usr);
   
   EncryptDecrypt#(N,M,T) encrypt <- mkEncrypt();
   EncryptDecrypt#(N,M,T) decrypt <- mkDecrypt();
   
   //-- two rules below will be good place to decide on storage approach---//   
   // rule enqAPRequest;
   //    p.putSampleInput(toApSyncQ.first);
   //    toApSyncQ.deq;
   // endrule

   // rule getAPResponse;
   //    let x <- p.getSampleOutput();
   //    fromApSyncQ.enq(x);
   // endrule
   
   interface DutInterface dut;
      interface Put request = toPut(toApSyncQ);
      interface Get response = toGet(fromApSyncQ);
   endinterface
   
   interface Put setkey;
      method Action put(KeyType x);
   	 encrypt.setfactor.put(x);
      	 decrypt.setfactor.put(x); //we want both here, yes?
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

