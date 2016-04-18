#open_hw
connect_hw_server
#current_hw_target [get_hw_targets */xilinx_tcf/Digilent/*]
#set_property PARAM.FREQUENCY 30000000 [get_hw_targets */xilinx_tcf/Digilent/*]
open_hw_target 
set vc707fpga [lindex [get_hw_devices] 0] 

set file xilinx/fpga.bit
set_property PROGRAM.FILE $file $vc707fpga
puts "fpga is $vc707fpga, bit file size is [exec ls -sh $file], PROGRAM BEGIN"
program_hw_devices $vc707fpga

refresh_hw_device $vc707fpga
