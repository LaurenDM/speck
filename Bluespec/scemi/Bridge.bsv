import SceMi      :: *;
import SceMiLayer :: *;

// TCP bridge for simulation only
`ifdef SCEMI_TCP
(* synthesize *)
module mkBridge ();
   Clock clk <- exposeCurrentClock;
   Empty scemi <- buildSceMi(mkSceMiLayer(clk), TCP);

endmodule: mkBridge
`endif //SCEMI_TCP


`ifdef SCEMI_PCIE_VIRTEX7
`ifdef BOARD_VC707

// Setup for SCE-MI over PCIE to a Virtex7
import Xilinx       :: *;
import XilinxPCIE   :: *;
import Clocks       :: *;
import DefaultValue :: *;
import TieOff       :: *;

(* synthesize, no_default_clock, no_default_reset *)
module mkBridge #(Clock pci_sys_clk_p, Clock pci_sys_clk_n,
                  Clock sys_clk_p, Clock sys_clk_n,
                  Reset pci_sys_reset_n)
                 (VC707_FPGA);

   Clock sys_clk <- mkClockIBUFDS(defaultValue, sys_clk_p, sys_clk_n);

   //(mingliu): Create user clock so we're not constrained by 50MHz SceMi clock
   ClockGenerator7Params clk_params = defaultValue();
   clk_params.clkin1_period     = 5.000;       // 200 MHz reference clock
   clk_params.clkin_buffer      = False;       // IBUFDS above
   clk_params.reset_stages      = 0;           // no sync on reset so input clock has pll as only load
   clk_params.clkfbout_mult_f   = 5.000;      // 1000 MHz VCO
   clk_params.clkout0_divide_f    = `USER_CLK_PERIOD;
   ClockGenerator7 usrClk_mmcm <- mkClockGenerator7(clk_params, clocked_by sys_clk, reset_by noReset);   
  
   Clock clk_usr = usrClk_mmcm.clkout0;
   //Reset rst_usr = mkAsyncReset(10, pci_sys_reset_n, clk_usr);

   SceMiV7PCIEArgs pcie_args;
   pcie_args.pci_sys_clk_p = pci_sys_clk_p;
   pcie_args.pci_sys_clk_n = pci_sys_clk_n;
   pcie_args.pci_sys_reset = pci_sys_reset_n;
   pcie_args.clock_period  = `SCEMI_CLOCK_PERIOD;
   pcie_args.link_type     = PCIE_VIRTEX7;

   SceMiV7PCIEIfc#(Empty, 8) scemi <- buildSceMi(mkSceMiLayer(clk_usr), pcie_args);
   
   mkTieOff(scemi.noc_cont);
   
   ReadOnly#(Bool) _isLinkUp         <- mkNullCrossing(noClock, scemi.isLinkUp);
   ReadOnly#(Bool) _isOutOfReset     <- mkNullCrossing(noClock, scemi.isOutOfReset);
   ReadOnly#(Bool) _isClockAdvancing <- mkNullCrossing(noClock, scemi.isClockAdvancing);

   rule drive_memory_calibration;
      scemi.isDDRReady(False);
   endrule

   interface pcie = scemi.pcie;

   method leds = zeroExtend({pack(_isClockAdvancing)
                            ,pack(_isOutOfReset)
                            ,pack(_isLinkUp)
                            });
endmodule: mkBridge

`endif //SCEMI_PCIE_VIRTEX7
`endif //BOARD_VC707
