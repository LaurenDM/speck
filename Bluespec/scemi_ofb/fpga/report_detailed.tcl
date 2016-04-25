set PROJ_DIR [get_property DIRECTORY [current_project]]
set PROJ [get_project]
set UTIL_RPT $PROJ_DIR/$PROJ.runs/impl_1/mkBridge_utilization_placed_hierarchical.rpt
set TIMING_RPT $PROJ_DIR/$PROJ.runs/impl_1/mkBridge_timing_detailed_routed.rpt
open_run impl_1
report_utilization -hierarchical -file $UTIL_RPT
report_timing_summary -warn_on_violation -delay_type min_max -check_timing_verbose -max_paths 10 -input_pins -file $TIMING_RPT

