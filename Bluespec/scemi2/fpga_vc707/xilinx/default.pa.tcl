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
