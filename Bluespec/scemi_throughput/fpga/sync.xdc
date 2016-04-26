set delay_ratio 1

create_generated_clock -name my_clk_usr [get_nets usrClk_mmcm_pll\$CLKOUT0]

#set usr_clk_var [get_clocks -of_objects [get_nets usrClk_mmcm_pll\$CLKOUT0]]
set usr_clk_var [get_clocks my_clk_usr]
set cclock_var [get_clocks cclock]

set user_delay [expr $delay_ratio * [get_property PERIOD $usr_clk_var]]
set cc_delay [expr $delay_ratio * [get_property PERIOD $cclock_var]]

#Clock domain crossing from/to clk_usr to cclock (scemi)
set_max_delay $user_delay -datapath_only -from $cclock_var -to $usr_clk_var
set_max_delay $cc_delay -datapath_only -from $usr_clk_var -to $cclock_var
