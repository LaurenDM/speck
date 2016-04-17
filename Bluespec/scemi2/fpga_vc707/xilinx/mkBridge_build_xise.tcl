#!/usr/bin/env xtclsh

file delete -force mkBridge.xise
project new mkBridge.xise
project set "Device Family" "virtex7"
project set "Device" "xc7vx485t"
project set "Package" "ffg1761"
project set "Speed Grade" "-2"
project set "Synthesis Tool" "XST (VHDL/Verilog)"
project set "Simulator" "ISim (VHDL/Verilog)"

xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkPCIEtoBNoCSceMi_4.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkTLPArbiter.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkSceMiLinkTypeParameter.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkSceMiUInt32Parameter.v"
xfile add "/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/vlog_dut/module_aluBr.v"
xfile add "/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/vlog_dut/mkBypassRFile.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkSceMiUInt64Parameter.v"
xfile add "/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/vlog_dut/mkProc.v"
xfile add "/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/vlog_dut/mkBridge.v"
xfile add "/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/vlog_dut/mkCsrFile.v"
xfile add "/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/vlog_dut/module_exec.v"
xfile add "/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/vlog_dut/mkDutWrapper.v"
xfile add "/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/vlog_dut/module_alu.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkTLPDispatcher.v"
xfile add "/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/vlog_dut/module_decode.v"
xfile add "/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/vlog_dut/module_brAddrCalc.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ProbeHook.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ResetInverter.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncWire.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncResetA.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/MakeClock.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ClockInverter.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/FIFO2.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncPulse.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncBit05.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ConfigRegN.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/RegUN.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/FIFOL1.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SizedFIFO.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncHandshake.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/RegA.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/MakeReset0.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/Counter.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/CrossingRegUN.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/RegN.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/RWire0.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/BypassWire.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/MakeResetA.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncReset0.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/RWire.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncFIFO1.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/CRegN5.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/CrossingRegN.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ResetEither.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncFIFO.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ClockGen.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/CrossingBypassWire.v"
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
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ddr3_v2_0.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ddr3_v2_0_mig.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ddr3_wrapper.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/clocking/mig_7series_v2_0_clk_ibuf.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/clocking/mig_7series_v2_0_infrastructure.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/clocking/mig_7series_v2_0_iodelay_ctrl.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/clocking/mig_7series_v2_0_tempmon.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_arb_mux.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_arb_row_col.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_arb_select.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_bank_cntrl.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_bank_common.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_bank_compare.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_bank_mach.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_bank_queue.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_bank_state.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_col_mach.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_mc.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_rank_cntrl.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_rank_common.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_rank_mach.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_round_robin_arb.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ecc/mig_7series_v2_0_ecc_buf.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ecc/mig_7series_v2_0_ecc_dec_fix.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ecc/mig_7series_v2_0_ecc_gen.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ecc/mig_7series_v2_0_ecc_merge_enc.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ecc/mig_7series_v2_0_fi_xor.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ip_top/mig_7series_v2_0_mem_intfc.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ip_top/mig_7series_v2_0_memc_ui_top_std.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_byte_group_io.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_byte_lane.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_calib_top.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_if_post_fifo.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_mc_phy.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_mc_phy_wrapper.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_of_pre_fifo.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_phy_4lanes.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_phy_ck_addr_cmd_delay.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_phy_dqs_found_cal.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_phy_dqs_found_cal_hr.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_phy_init.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_phy_oclkdelay_cal.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_phy_prbs_rdlvl.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_phy_rdlvl.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_phy_tempmon.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_phy_top.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_phy_wrcal.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_phy_wrlvl.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_phy_wrlvl_off_delay.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_prbs_gen.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ui/mig_7series_v2_0_ui_cmd.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ui/mig_7series_v2_0_ui_rd_data.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ui/mig_7series_v2_0_ui_top.v"
xfile add "/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ui/mig_7series_v2_0_ui_wr_data.v"
xfile add "default.ucf"
project close