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

typedef Server#(Block_Flag, Block_Flag) DutInterface;
interface SettableDutInterface;
   interface DutInterface dut;
   interface Put#(Key_Flag) setkey;
endinterface

(* synthesize *)
module [Module] mkDutWrapper#(Clock clk_usr)(SettableDutInterface);

   //Since DUT runs at clk_usr (67 MHz) and SceMi transactors run at 50MHz, we need to
   //cross clock domains. Thus we must wrap our DUT using synchronization primitives (SyncFIFOs). 
   Clock clk_scemi <- exposeCurrentClock; //clk_scemi is the implicit SceMi clock (50Mhz)
   Reset rst_usr <- mkAsyncResetFromCR(6, clk_usr);
   SyncFIFOIfc#(Block_Flag) toSyncQ <- mkSyncFIFOFromCC(2, clk_usr);          //clk_scemi -> clk_usr
   SyncFIFOIfc#(Block_Flag) fromSyncQ <- mkSyncFIFOToCC(2, clk_usr, rst_usr); //clk_usr -> clk_scemi
   SyncFIFOIfc#(KeyType) toKeySyncQ <- mkSyncFIFOFromCC(2, clk_usr);
   
   EncryptDecrypt#(N,M,T) encrypt <- mkSynthesizedEncrypt(clocked_by clk_usr, reset_by rst_usr);
   EncryptDecrypt#(N,M,T) decrypt <- mkSynthesizedDecrypt(clocked_by clk_usr, reset_by rst_usr);
   
   rule enqRequest;
      Block_Flag x = toSyncQ.first;
      toSyncQ.deq;
      
      if (x.flag == Encrypt) begin
	 encrypt.inputMessage(x.block);
      end
      else if (x.flag == Decrypt) begin
      	 decrypt.inputMessage(x.block);
      end
   endrule

   rule getResponseEncrypt;
      Block_Flag response;
      response.flag = Encrypt;
      response.block <- encrypt.getResult();
      fromSyncQ.enq(response);
   endrule

   rule getResponseDecrypt;
      Block_Flag response;
      response.flag = Decrypt;
      response.block <- decrypt.getResult();
      fromSyncQ.enq(response);
   endrule
   
   interface DutInterface dut;
      interface Put request = toPut(toSyncQ);
      interface Get response = toGet(fromSyncQ);
   endinterface
   
   interface Put setkey;
      method Action put(Key_Flag x);
	 if (x.flag == Encrypt) begin
   	    encrypt.setKey(x.key);
	 end
	 else if (x.flag == Decrypt) begin
   	    decrypt.setKey(x.key);
	 end
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

