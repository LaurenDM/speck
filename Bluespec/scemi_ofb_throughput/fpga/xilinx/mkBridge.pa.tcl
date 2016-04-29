if {[ file exists ./mkBridge ]} {
  # if the project directory exists, delete it and create a new one
  file delete -force ./mkBridge
}
file delete -force ./mkBridge.bit

create_project mkBridge ./mkBridge -part xc7vx485t-ffg1761-2
set_property design_mode RTL [current_fileset -srcset]
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkPCIEtoBNoCSceMi_4.v}
add_file -norecurse {/mnt/nfs/var/nfs/ldemeyer/speck/Bluespec/scemi2/fpga/vlog_dut/mkDutWrapper.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkTLPDispatcher.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkSceMiUInt32Parameter.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkTLPArbiter.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkSceMiLinkTypeParameter.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkSceMiUInt64Parameter.v}
add_file -norecurse {/mnt/nfs/var/nfs/ldemeyer/speck/Bluespec/scemi2/fpga/vlog_dut/mkThroughputDecrypt.v}
add_file -norecurse {/mnt/nfs/var/nfs/ldemeyer/speck/Bluespec/scemi2/fpga/vlog_dut/mkBridge.v}
add_file -norecurse {/mnt/nfs/var/nfs/ldemeyer/speck/Bluespec/scemi2/fpga/vlog_dut/mkThroughputEncrypt.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ProbeHook.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ResetInverter.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncWire.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncReset0.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/FIFOL1.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/RegUN.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/CrossingRegUN.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/RWire.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncResetA.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog.Vivado/MakeClock.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog.Vivado/SizedFIFO.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ClockInverter.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncHandshake.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ResetEither.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/CrossingRegN.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/RegN.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/CRegN5.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncPulse.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/FIFO2.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/RegA.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/CrossingBypassWire.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncBit05.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncFIFO.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ClockGen.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/MakeReset0.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/RWire0.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/BypassWire.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ConfigRegN.v}
add_file -norecurse {/opt/bluespec/Bluespec-2014.07.A/lib/Verilog/MakeResetA.v}
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
add_file -norecurse {/mnt/nfs/var/nfs/ldemeyer/speck/Bluespec/scemi2/fpga/vlog_dut/mkBridge.v}
read_xdc ./default.xdc

set_property top mkBridge [get_property srcset [current_run]]

set_property strategy {Vivado Synthesis Defaults} [get_runs synth_1]
set_property strategy {Vivado Implementation Defaults} [get_runs impl_1]
set_property STEPS.SYNTH_DESIGN.ARGS.FSM_EXTRACTION off [get_runs synth_1]

synth_design -rtl -name rtl_1 -verilog_define BSV_TOP=mkBridge
