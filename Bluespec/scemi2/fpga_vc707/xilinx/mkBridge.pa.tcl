if {[ file exists ./mkBridge ]} {
  # if the project directory exists, delete it and create a new one
  file delete -force ./mkBridge
}
file delete -force ./mkBridge.bit

create_project mkBridge ./mkBridge -part xc7vx485t-ffg1761-2
set_property design_mode RTL [current_fileset -srcset]
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkPCIEtoBNoCSceMi_4.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkTLPArbiter.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkSceMiLinkTypeParameter.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkSceMiUInt32Parameter.v}
add_file -norecurse {/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/vlog_dut/module_aluBr.v}
add_file -norecurse {/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/vlog_dut/mkBypassRFile.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkSceMiUInt64Parameter.v}
add_file -norecurse {/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/vlog_dut/mkProc.v}
add_file -norecurse {/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/vlog_dut/mkBridge.v}
add_file -norecurse {/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/vlog_dut/mkCsrFile.v}
add_file -norecurse {/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/vlog_dut/module_exec.v}
add_file -norecurse {/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/vlog_dut/mkDutWrapper.v}
add_file -norecurse {/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/vlog_dut/module_alu.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkTLPDispatcher.v}
add_file -norecurse {/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/vlog_dut/module_decode.v}
add_file -norecurse {/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/vlog_dut/module_brAddrCalc.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ProbeHook.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ResetInverter.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncWire.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncResetA.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog.Vivado/MakeClock.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ClockInverter.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/FIFO2.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncPulse.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncBit05.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ConfigRegN.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/RegUN.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/FIFOL1.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog.Vivado/SizedFIFO.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncHandshake.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/RegA.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/MakeReset0.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/Counter.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/CrossingRegUN.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/RegN.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/RWire0.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/BypassWire.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/MakeResetA.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncReset0.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/RWire.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncFIFO1.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/CRegN5.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/CrossingRegN.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ResetEither.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncFIFO.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ClockGen.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/CrossingBypassWire.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog.Vivado/BRAM2.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/RevertReg.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/xilinx_v7_pcie_wrapper.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_axi_basic_rx.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_axi_basic_rx_null_gen.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_axi_basic_rx_pipeline.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_axi_basic_top.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_axi_basic_tx.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_axi_basic_tx_pipeline.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_axi_basic_tx_thrtl_ctl.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_gt_rx_valid_filter_7x.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_gt_top.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_gt_wrapper.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_gtp_pipe_rate.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_gtp_pipe_reset.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pcie_7x.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pcie_bram_7x.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pcie_bram_top_7x.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pcie_brams_7x.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pcie_pipe_lane.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pcie_pipe_misc.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pcie_pipe_pipeline.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pcie_top.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pipe_clock.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pipe_drp.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pipe_eq.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pipe_rate.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pipe_reset.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pipe_sync.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pipe_user.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pipe_wrapper.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_qpll_drp.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_qpll_reset.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_qpll_wrapper.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_rxeq_scan.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ddr3_v2_0.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ddr3_v2_0_mig.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ddr3_wrapper.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/clocking/mig_7series_v2_0_clk_ibuf.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/clocking/mig_7series_v2_0_infrastructure.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/clocking/mig_7series_v2_0_iodelay_ctrl.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/clocking/mig_7series_v2_0_tempmon.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_arb_mux.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_arb_row_col.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_arb_select.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_bank_cntrl.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_bank_common.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_bank_compare.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_bank_mach.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_bank_queue.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_bank_state.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_col_mach.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_mc.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_rank_cntrl.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_rank_common.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_rank_mach.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/controller/mig_7series_v2_0_round_robin_arb.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ecc/mig_7series_v2_0_ecc_buf.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ecc/mig_7series_v2_0_ecc_dec_fix.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ecc/mig_7series_v2_0_ecc_gen.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ecc/mig_7series_v2_0_ecc_merge_enc.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ecc/mig_7series_v2_0_fi_xor.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ip_top/mig_7series_v2_0_mem_intfc.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ip_top/mig_7series_v2_0_memc_ui_top_std.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_byte_group_io.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_byte_lane.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_calib_top.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_if_post_fifo.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_mc_phy.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_mc_phy_wrapper.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_of_pre_fifo.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_phy_4lanes.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_phy_ck_addr_cmd_delay.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_phy_dqs_found_cal.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_phy_dqs_found_cal_hr.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_phy_init.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_phy_oclkdelay_cal.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_phy_prbs_rdlvl.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_phy_rdlvl.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_phy_tempmon.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_phy_top.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_phy_wrcal.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_phy_wrlvl.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_phy_wrlvl_off_delay.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/phy/mig_7series_v2_0_ddr_prbs_gen.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ui/mig_7series_v2_0_ui_cmd.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ui/mig_7series_v2_0_ui_rd_data.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ui/mig_7series_v2_0_ui_top.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/ddr3_v2_0/ddr3_v2_0/user_design/rtl/ui/mig_7series_v2_0_ui_wr_data.v}
add_file -norecurse {/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/vlog_dut/mkBridge.v}
read_xdc ./default.xdc

set_property top mkBridge [get_property srcset [current_run]]

set_property strategy {Vivado Synthesis Defaults} [get_runs synth_1]
set_property strategy {Vivado Implementation Defaults} [get_runs impl_1]
set_property STEPS.SYNTH_DESIGN.ARGS.FSM_EXTRACTION off [get_runs synth_1]

synth_design -rtl -name rtl_1 -verilog_define BSV_TOP=mkBridge
