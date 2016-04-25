source mkBridge.pa.tcl

launch_runs synth_1
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1

# copy bit file
file copy -force mkBridge/mkBridge.runs/impl_1/mkBridge.bit ./mkBridge.bit
file copy -force mkBridge/mkBridge.runs/impl_1/mkBridge.bit ./fpga.bit
file copy -force mkBridge/mkBridge.runs/synth_1/runme.log         ./mkBridge.slog
if { [file exists mkBridge/mkBridge.runs/impl_1/mkBridge.ll] == 1} {
   file copy -force mkBridge/mkBridge.runs/impl_1/mkBridge.ll  ./mkBridge.ll
}
if { [file exists mkBridge/mkBridge.runs/impl_1/synth_netlist.edf] == 1} {
   file copy -force mkBridge/mkBridge.runs/impl_1/synth_netlist.edf ./mkBridge.edf
}
set PROJ_DIR [get_property DIRECTORY [current_project]]
set PROJ [get_project]
set UTIL_RPT $PROJ_DIR/$PROJ.runs/impl_1/mkBridge_utilization_placed_hierarchical.rpt
set TIMING_RPT $PROJ_DIR/$PROJ.runs/impl_1/mkBridge_timing_detailed_routed.rpt
open_run impl_1
report_utilization -hierarchical -file $UTIL_RPT
report_timing_summary -warn_on_violation -delay_type min_max -check_timing_verbose -max_paths 10 -input_pins -file $TIMING_RPT

