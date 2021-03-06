set_property SRC_FILE_INFO {cfile:/mnt/nfs/var/nfs/ldemeyer/speck/Bluespec/scemi_gui/fpga/xilinx/default.xdc rfile:../default.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:91 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC IBUFDS_GTE2_X1Y5  [get_cells { *_sys_clk_buf }]
set_property src_info {type:XDC file:1 line:93 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC MMCME2_ADV_X1Y2 [get_cells -hier -filter { NAME =~ */ext_clk.pipe_clock_i/mmcm_i }]
set_property src_info {type:XDC file:1 line:94 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC MMCME2_ADV_X1Y1 [get_cells -hier -filter { NAME =~ *clkgen_pll }]
set_property src_info {type:XDC file:1 line:95 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC MMCME2_ADV_X1Y5 [get_cells -hier -filter { NAME =~ *clk_gen_pll }]
set_property src_info {type:XDC file:1 line:105 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC GTXE2_CHANNEL_X1Y11 [get_cells -hierarchical -regexp {.*pipe_lane\[0\].gt_wrapper_i/gtx_channel.gtxe2_channel_i}]
set_property src_info {type:XDC file:1 line:107 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC GTXE2_CHANNEL_X1Y10 [get_cells -hierarchical -regexp {.*pipe_lane\[1\].gt_wrapper_i/gtx_channel.gtxe2_channel_i}]
set_property src_info {type:XDC file:1 line:109 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC GTXE2_CHANNEL_X1Y9 [get_cells -hierarchical -regexp {.*pipe_lane\[2\].gt_wrapper_i/gtx_channel.gtxe2_channel_i}]
set_property src_info {type:XDC file:1 line:111 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC GTXE2_CHANNEL_X1Y8 [get_cells -hierarchical -regexp {.*pipe_lane\[3\].gt_wrapper_i/gtx_channel.gtxe2_channel_i}]
set_property src_info {type:XDC file:1 line:113 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC GTXE2_CHANNEL_X1Y7 [get_cells -hierarchical -regexp {.*pipe_lane\[4\].gt_wrapper_i/gtx_channel.gtxe2_channel_i}]
set_property src_info {type:XDC file:1 line:115 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC GTXE2_CHANNEL_X1Y6 [get_cells -hierarchical -regexp {.*pipe_lane\[5\].gt_wrapper_i/gtx_channel.gtxe2_channel_i}]
set_property src_info {type:XDC file:1 line:117 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC GTXE2_CHANNEL_X1Y5 [get_cells -hierarchical -regexp {.*pipe_lane\[6\].gt_wrapper_i/gtx_channel.gtxe2_channel_i}]
set_property src_info {type:XDC file:1 line:119 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC GTXE2_CHANNEL_X1Y4 [get_cells -hierarchical -regexp {.*pipe_lane\[7\].gt_wrapper_i/gtx_channel.gtxe2_channel_i}]
set_property src_info {type:XDC file:1 line:125 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PCIE_X1Y0 [get_cells -hierarchical -regexp {.*pcie_7x_i/pcie_block_i}]
set_property src_info {type:XDC file:1 line:130 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC RAMB36_X14Y25 [get_cells {*/pcie_7x_v1_10_i/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_rx/brams[7].ram/use_tdp.ramb36/genblk*.bram36_tdp_bl.bram36_tdp_bl}]
set_property src_info {type:XDC file:1 line:131 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC RAMB36_X14Y26 [get_cells {*/pcie_7x_v1_10_i/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_rx/brams[6].ram/use_tdp.ramb36/genblk*.bram36_tdp_bl.bram36_tdp_bl}]
set_property src_info {type:XDC file:1 line:132 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC RAMB36_X13Y27 [get_cells {*/pcie_7x_v1_10_i/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_rx/brams[5].ram/use_tdp.ramb36/genblk*.bram36_tdp_bl.bram36_tdp_bl}]
set_property src_info {type:XDC file:1 line:133 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC RAMB36_X13Y26 [get_cells {*/pcie_7x_v1_10_i/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_rx/brams[4].ram/use_tdp.ramb36/genblk*.bram36_tdp_bl.bram36_tdp_bl}]
set_property src_info {type:XDC file:1 line:134 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC RAMB36_X13Y25 [get_cells {*/pcie_7x_v1_10_i/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_rx/brams[3].ram/use_tdp.ramb36/genblk*.bram36_tdp_bl.bram36_tdp_bl}]
set_property src_info {type:XDC file:1 line:135 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC RAMB36_X13Y24 [get_cells {*/pcie_7x_v1_10_i/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_rx/brams[2].ram/use_tdp.ramb36/genblk*.bram36_tdp_bl.bram36_tdp_bl}]
set_property src_info {type:XDC file:1 line:136 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC RAMB36_X13Y23 [get_cells {*/pcie_7x_v1_10_i/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_rx/brams[1].ram/use_tdp.ramb36/genblk*.bram36_tdp_bl.bram36_tdp_bl}]
set_property src_info {type:XDC file:1 line:137 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC RAMB36_X13Y22 [get_cells {*/pcie_7x_v1_10_i/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_rx/brams[0].ram/use_tdp.ramb36/genblk*.bram36_tdp_bl.bram36_tdp_bl}]
set_property src_info {type:XDC file:1 line:138 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC RAMB36_X13Y21 [get_cells {*/pcie_7x_v1_10_i/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_tx/brams[0].ram/use_tdp.ramb36/genblk*.bram36_tdp_bl.bram36_tdp_bl}]
set_property src_info {type:XDC file:1 line:139 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC RAMB36_X13Y20 [get_cells {*/pcie_7x_v1_10_i/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_tx/brams[1].ram/use_tdp.ramb36/genblk*.bram36_tdp_bl.bram36_tdp_bl}]
set_property src_info {type:XDC file:1 line:140 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC RAMB36_X13Y19 [get_cells {*/pcie_7x_v1_10_i/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_tx/brams[2].ram/use_tdp.ramb36/genblk*.bram36_tdp_bl.bram36_tdp_bl}]
set_property src_info {type:XDC file:1 line:141 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC RAMB36_X13Y18 [get_cells {*/pcie_7x_v1_10_i/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_tx/brams[3].ram/use_tdp.ramb36/genblk*.bram36_tdp_bl.bram36_tdp_bl}]
set_property src_info {type:XDC file:1 line:142 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC RAMB36_X13Y17 [get_cells {*/pcie_7x_v1_10_i/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_tx/brams[4].ram/use_tdp.ramb36/genblk*.bram36_tdp_bl.bram36_tdp_bl}]
set_property src_info {type:XDC file:1 line:143 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC RAMB36_X14Y17 [get_cells {*/pcie_7x_v1_10_i/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_tx/brams[5].ram/use_tdp.ramb36/genblk*.bram36_tdp_bl.bram36_tdp_bl}]
set_property src_info {type:XDC file:1 line:144 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC RAMB36_X14Y18 [get_cells {*/pcie_7x_v1_10_i/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_tx/brams[6].ram/use_tdp.ramb36/genblk*.bram36_tdp_bl.bram36_tdp_bl}]
set_property src_info {type:XDC file:1 line:145 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC RAMB36_X14Y19 [get_cells {*/pcie_7x_v1_10_i/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_tx/brams[7].ram/use_tdp.ramb36/genblk*.bram36_tdp_bl.bram36_tdp_bl}]
set_property src_info {type:XDC file:1 line:151 export:INPUT save:INPUT read:READ} [current_design]
create_pblock pblock_pcie0
add_cells_to_pblock [get_pblocks pblock_pcie0] [get_cells {*_pcie_ep*}]
add_cells_to_pblock [get_pblocks pblock_pcie0] [get_cells {*_outFifo*}]
add_cells_to_pblock [get_pblocks pblock_pcie0] [get_cells {*_fifoTxData_*}]
add_cells_to_pblock [get_pblocks pblock_pcie0] [get_cells {*_fifoRxData_*}]
add_cells_to_pblock [get_pblocks pblock_pcie0] [get_cells */pbb*]
add_cells_to_pblock [get_pblocks pblock_pcie0] [get_cells {*fS1OutPort*}]
add_cells_to_pblock [get_pblocks pblock_pcie0] [get_cells {*fS1MsgOut*}]
add_cells_to_pblock [get_pblocks pblock_pcie0] [get_cells {*fS2MsgOut*}]
add_cells_to_pblock [get_pblocks pblock_pcie0] [get_cells scemi_inFifo]
resize_pblock [get_pblocks pblock_pcie0] -add {SLICE_X166Y51:SLICE_X221Y149}
resize_pblock [get_pblocks pblock_pcie0] -add {DSP48_X16Y22:DSP48_X19Y59}
resize_pblock [get_pblocks pblock_pcie0] -add {RAMB18_X11Y22:RAMB18_X14Y59}
resize_pblock [get_pblocks pblock_pcie0] -add {RAMB36_X11Y11:RAMB36_X14Y29}
set_property src_info {type:XDC file:1 line:200 export:INPUT save:INPUT read:READ} [current_design]
set_case_analysis 1 [get_pins {*/ext_clk.pipe_clock_i/pclk_i1_bufgctrl.pclk_i1/S0}]
set_property src_info {type:XDC file:1 line:201 export:INPUT save:INPUT read:READ} [current_design]
set_case_analysis 0 [get_pins {*/ext_clk.pipe_clock_i/pclk_i1_bufgctrl.pclk_i1/S1}]
set_property src_info {type:XDC file:1 line:207 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_clocks cclock] -to [get_clocks core_clock] 20.000 -datapath_only
set_property src_info {type:XDC file:1 line:208 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_clocks uclock] -to [get_clocks core_clock] 20.000 -datapath_only
set_property src_info {type:XDC file:1 line:209 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_clocks core_clock] -to [get_clocks cclock] 20.000 -datapath_only
set_property src_info {type:XDC file:1 line:210 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_clocks core_clock] -to [get_clocks uclock] 20.000 -datapath_only
set_property src_info {type:XDC file:1 line:211 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_clocks uclock] -to [get_clocks cclock] 20.000 -datapath_only
set_property src_info {type:XDC file:1 line:212 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_clocks cclock] -to [get_clocks uclock] 20.000 -datapath_only
set_property src_info {type:XDC file:1 line:213 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_clocks userclk2] -to [get_clocks noc_clk] 8.000 -datapath_only
set_property src_info {type:XDC file:1 line:214 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_clocks noc_clk] -to [get_clocks userclk2] 8.000 -datapath_only
set_property src_info {type:XDC file:1 line:227 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 5.0 -datapath_only -from [get_clocks cclock] -to [get_clocks my_clk_usr]
set_property src_info {type:XDC file:1 line:228 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 20.0 -datapath_only -from [get_clocks my_clk_usr] -to [get_clocks cclock]
