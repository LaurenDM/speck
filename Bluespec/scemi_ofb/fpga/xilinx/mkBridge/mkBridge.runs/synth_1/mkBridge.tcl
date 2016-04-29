# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7vx485tffg1761-2
set_property target_language Verilog [current_project]
set_param project.compositeFile.enableAutoGeneration 0
set_property default_lib xil_defaultlib [current_project]
read_verilog -library xil_defaultlib {
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pcie_bram_7x.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_rxeq_scan.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pcie_brams_7x.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_axi_basic_tx_thrtl_ctl.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_axi_basic_tx_pipeline.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_axi_basic_rx_pipeline.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_axi_basic_rx_null_gen.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_qpll_wrapper.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_qpll_reset.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_qpll_drp.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pipe_user.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pipe_sync.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pipe_reset.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pipe_rate.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pipe_eq.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pipe_drp.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pipe_clock.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pcie_pipe_misc.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pcie_pipe_lane.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pcie_bram_top_7x.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_gt_wrapper.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_gtp_pipe_reset.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_gtp_pipe_rate.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_axi_basic_tx.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_axi_basic_rx.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pipe_wrapper.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pcie_pipe_pipeline.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pcie_7x.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_gt_rx_valid_filter_7x.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_axi_basic_top.v
  /opt/bluespec/Bluespec-2014.07.A/lib/Verilog/FIFO2.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_pcie_top.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10_gt_top.v
  /opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncResetA.v
  /opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncFIFO.v
  /opt/bluespec/Bluespec-2014.07.A/lib/Verilog.Vivado/SizedFIFO.v
  /opt/bluespec/Bluespec-2014.07.A/lib/Verilog.Vivado/BRAM2.v
  /opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkTLPDispatcher.v
  /opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkTLPArbiter.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/pcie_7x_v1_10.v
  /mnt/nfs/var/nfs/ldemeyer/speck/Bluespec/scemi_ofb/fpga/vlog_dut/mkSynthesizedOFB.v
  /opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncWire.v
  /opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncReset0.v
  /opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncPulse.v
  /opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncHandshake.v
  /opt/bluespec/Bluespec-2014.07.A/lib/Verilog/SyncBit05.v
  /opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ResetInverter.v
  /opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ResetEither.v
  /opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ProbeHook.v
  /opt/bluespec/Bluespec-2014.07.A/lib/Verilog/MakeResetA.v
  /opt/bluespec/Bluespec-2014.07.A/lib/Verilog/MakeReset0.v
  /opt/bluespec/Bluespec-2014.07.A/lib/Verilog/FIFOL1.v
  /opt/bluespec/Bluespec-2014.07.A/lib/Verilog/ClockInverter.v
  /opt/bluespec/Bluespec-2014.07.A/lib/Verilog.Vivado/MakeClock.v
  /opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkSceMiUInt64Parameter.v
  /opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkSceMiUInt32Parameter.v
  /opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkSceMiLinkTypeParameter.v
  /opt/bluespec/Bluespec-2014.07.A/lib/Libraries/mkPCIEtoBNoCSceMi_4.v
  /opt/bluespec/Bluespec-2014.07.A/lib/board_support/bluenoc/xilinx/VC707/verilog/pcie_7x_v1_10/source/xilinx_v7_pcie_wrapper.v
  /mnt/nfs/var/nfs/ldemeyer/speck/Bluespec/scemi_ofb/fpga/vlog_dut/mkDutWrapper.v
  /mnt/nfs/var/nfs/ldemeyer/speck/Bluespec/scemi_ofb/fpga/vlog_dut/mkBridge.v
}
read_xdc /mnt/nfs/var/nfs/ldemeyer/speck/Bluespec/scemi_ofb/fpga/xilinx/default.xdc
set_property used_in_implementation false [get_files /mnt/nfs/var/nfs/ldemeyer/speck/Bluespec/scemi_ofb/fpga/xilinx/default.xdc]

set_param synth.vivado.isSynthRun true
set_property verilog_define BSV_TOP=mkBridge [current_fileset]
set_property webtalk.parent_dir /mnt/nfs/var/nfs/ldemeyer/speck/Bluespec/scemi_ofb/fpga/xilinx/mkBridge/mkBridge.cache/wt [current_project]
set_property parent.project_dir /mnt/nfs/var/nfs/ldemeyer/speck/Bluespec/scemi_ofb/fpga/xilinx/mkBridge [current_project]
synth_design -top mkBridge -part xc7vx485tffg1761-2 -fsm_extraction off
write_checkpoint mkBridge.dcp
report_utilization -file mkBridge_utilization_synth.rpt -pb mkBridge_utilization_synth.pb
