#!/usr/bin/env xtclsh

file delete -force mkBridge.xise
project new mkBridge.xise
project set "Device Family" "virtex7"
project set "Device" "xc7vx485t"
project set "Package" "ffg1761"
project set "Speed Grade" "-2"
project set "Synthesis Tool" "XST (VHDL/Verilog)"
project set "Simulator" "ISim (VHDL/Verilog)"

xfile add "/mnt/nfs/var/nfs/ldemeyer/speck/Bluespec/scemi_ofb_throughput/fpga/vlog_dut/mkThroughputOFB.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkPCIEtoBNoCSceMi_4.v"
xfile add "/mnt/nfs/var/nfs/ldemeyer/speck/Bluespec/scemi_ofb_throughput/fpga/vlog_dut/mkDutWrapper.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkTLPDispatcher.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkSceMiUInt32Parameter.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkTLPArbiter.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkSceMiLinkTypeParameter.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkSceMiUInt64Parameter.v"
xfile add "/mnt/nfs/var/nfs/ldemeyer/speck/Bluespec/scemi_ofb_throughput/fpga/vlog_dut/mkBridge.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ProbeHook.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ResetInverter.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncWire.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncReset0.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/FIFOL1.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/RegUN.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/CrossingRegUN.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/RWire.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncResetA.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/MakeClock.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SizedFIFO.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ClockInverter.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncHandshake.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ResetEither.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/CrossingRegN.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/RegN.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/CRegN5.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncPulse.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/FIFO2.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/RegA.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/CrossingBypassWire.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncBit05.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncFIFO.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ClockGen.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/MakeReset0.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/RWire0.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/BypassWire.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ConfigRegN.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/MakeResetA.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/BRAM2.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/RevertReg.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/xilinx_v7_pcie_wrapper.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_axi_basic_rx.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_axi_basic_rx_null_gen.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_axi_basic_rx_pipeline.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_axi_basic_top.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_axi_basic_tx.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_axi_basic_tx_pipeline.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_axi_basic_tx_thrtl_ctl.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_gt_rx_valid_filter_7x.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_gt_top.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_gt_wrapper.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_gtp_pipe_rate.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_gtp_pipe_reset.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pcie_7x.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pcie_bram_7x.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pcie_bram_top_7x.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pcie_brams_7x.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pcie_pipe_lane.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pcie_pipe_misc.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pcie_pipe_pipeline.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pcie_top.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pipe_clock.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pipe_drp.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pipe_eq.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pipe_rate.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pipe_reset.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pipe_sync.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pipe_user.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pipe_wrapper.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_qpll_drp.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_qpll_reset.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_qpll_wrapper.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_rxeq_scan.v"
xfile add "default.ucf"
project close