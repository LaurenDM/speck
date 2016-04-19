
F
Command: %s
53*	vivadotcl2

opt_design2default:defaultZ4-113
œ
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
	xc7vx485t2default:defaultZ17-347
Œ
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
	xc7vx485t2default:defaultZ17-349
e
,Running DRC as a precondition to command %s
22*	vivadotcl2

opt_design2default:defaultZ4-22
I

Starting %s Task
103*constraints2
DRC2default:defaultZ18-103
G
Running DRC with %s threads
24*drc2
22default:defaultZ23-27
L
DRC finished with %s
272*project2
0 Errors2default:defaultZ1-461
[
BPlease refer to the DRC report (report_drc) for more information.
274*projectZ1-462
†

%s
*constraints2o
[Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 2194.527 ; gain = 0.0002default:default
X

Starting %s Task
103*constraints2&
Logic Optimization2default:defaultZ18-103
Û
zUser defined clock exists on pin %s and will prevent any subsequent automatic derivation of generated clocks on that pin.
3*timing2H
scemi_clkgen_pll/CLKOUT0scemi_clkgen_pll/CLKOUT02default:default8Z38-3
é
zUser defined clock exists on pin %s and will prevent any subsequent automatic derivation of generated clocks on that pin.
3*timing2V
scemi_scemi_clkgen_mmcm/CLKOUT0scemi_scemi_clkgen_mmcm/CLKOUT02default:default8Z38-3
`

Phase %s%s
101*constraints2
1 2default:default2
Retarget2default:defaultZ18-101
D
Pushed %s inverter(s).
98*opt2
142default:defaultZ31-138
B
Retargeted %s cell(s).
49*opt2
02default:defaultZ31-49
3
'Phase 1 Retarget | Checksum: 14a2bb5d0
*common
†

%s
*constraints2o
[Time (s): cpu = 00:00:12 ; elapsed = 00:00:10 . Memory (MB): peak = 2194.527 ; gain = 0.0002default:default
l

Phase %s%s
101*constraints2
2 2default:default2(
Constant Propagation2default:defaultZ18-101
D
Pushed %s inverter(s).
98*opt2
162default:defaultZ31-138
C
Eliminated %s cells.
10*opt2
24572default:defaultZ31-10
?
3Phase 2 Constant Propagation | Checksum: 1752351e6
*common
†

%s
*constraints2o
[Time (s): cpu = 00:00:49 ; elapsed = 00:00:48 . Memory (MB): peak = 2194.527 ; gain = 0.0002default:default
]

Phase %s%s
101*constraints2
3 2default:default2
Sweep2default:defaultZ18-101
N
 Eliminated %s unconnected nets.
12*opt2
56392default:defaultZ31-12
O
!Eliminated %s unconnected cells.
11*opt2
17212default:defaultZ31-11
0
$Phase 3 Sweep | Checksum: 1f5121aa1
*common
†

%s
*constraints2o
[Time (s): cpu = 00:01:00 ; elapsed = 00:00:58 . Memory (MB): peak = 2194.527 ; gain = 0.0002default:default
A
5Ending Logic Optimization Task | Checksum: 1f5121aa1
*common
†

%s
*constraints2o
[Time (s): cpu = 00:01:01 ; elapsed = 00:01:00 . Memory (MB): peak = 2194.527 ; gain = 0.0002default:default
8
,Implement Debug Cores | Checksum: 196421023
*common
5
)Logic Optimization | Checksum: 196421023
*common
X

Starting %s Task
103*constraints2&
Power Optimization2default:defaultZ18-103
[

Starting %s Task
103*constraints2)
PowerOpt TimerUpdates2default:defaultZ18-103
‰
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2…
oddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/xadc_supplied_temperature.tempmon_state[0]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
‰
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2…
oddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/xadc_supplied_temperature.tempmon_state[1]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ˆ
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2„
nddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/xadc_supplied_temperature.temperature[11]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
İ
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2Z
Dddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/GND	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
İ
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2Z
Dddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/VCC	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ö
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2s
]ddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_gt_band1_inc_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ö
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2s
]ddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_gt_band1_inc_i_2	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ö
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2s
]ddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_gt_band1_inc_i_3	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ö
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2s
]ddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_gt_band2_inc_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ö
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2s
]ddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_gt_band2_inc_i_2	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ö
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2s
]ddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_gt_band2_inc_i_3	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ö
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2s
]ddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_gt_band2_inc_i_4	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ö
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2s
]ddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_gt_band3_inc_i_3	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ö
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2s
]ddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_gt_band3_inc_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ö
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2s
]ddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_gt_band3_inc_i_2	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ö
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2s
]ddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_gt_band3_inc_i_4	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ö
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2s
]ddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_gt_band4_inc_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ö
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2s
]ddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_gt_band4_inc_i_2	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ö
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2s
]ddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_gt_band4_inc_i_3	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
û
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2x
bddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_gt_previous_temp_i_10	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ú
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2w
addr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_gt_previous_temp_i_3	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ú
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2w
addr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_gt_previous_temp_i_4	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ú
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2w
addr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_gt_previous_temp_i_7	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ú
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2w
addr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_gt_previous_temp_i_8	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ú
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2w
addr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_gt_previous_temp_i_9	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ş
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2{
eddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_gt_previous_temp_reg_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ş
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2{
eddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_gt_previous_temp_reg_i_2	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ö
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2s
]ddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_lt_band0_dec_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ö
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2s
]ddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_lt_band0_dec_i_2	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ö
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2s
]ddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_lt_band1_dec_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ò
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2o
Yddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_lt_band1_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ò
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2o
Yddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_lt_band1_i_2	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ö
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2s
]ddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_lt_band2_dec_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ö
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2s
]ddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_lt_band2_dec_i_2	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ö
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2s
]ddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_lt_band2_dec_i_3	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ò
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2o
Yddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_lt_band2_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ö
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2s
]ddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_lt_band3_dec_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ö
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2s
]ddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_lt_band3_dec_i_2	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ò
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2o
Yddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_lt_band3_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ò
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2o
Yddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_lt_band4_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ò
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2o
Yddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_lt_band4_i_2	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
î
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2k
Uddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_r[0]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ï
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2l
Vddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_r[10]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ï
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2l
Vddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_r[11]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
î
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2k
Uddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_r[1]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
î
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2k
Uddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_r[2]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
î
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2k
Uddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_r[3]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
î
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2k
Uddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_r[4]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
î
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2k
Uddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_r[5]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
î
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2k
Uddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_r[6]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
î
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2k
Uddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_r[7]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
î
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2k
Uddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_r[8]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
î
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2k
Uddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_r[9]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ø
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2u
_ddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_sync_r4_neq_r3_i_2	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ø
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2u
_ddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_sync_r4_neq_r3_i_3	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ø
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2u
_ddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_sync_r4_neq_r3_i_4	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ø
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2u
_ddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_sync_r4_neq_r3_i_5	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ü
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2y
cddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/device_temp_sync_r4_neq_r3_reg_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ê
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2g
Qddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/sync_cntr[0]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ê
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2g
Qddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/sync_cntr[1]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ê
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2g
Qddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/sync_cntr[2]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ê
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2g
Qddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/sync_cntr[3]_i_2	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ê
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2g
Qddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/sync_cntr[3]_i_3	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402

$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2~
hddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/xadc_supplied_temperature.sample_en_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402

$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2~
hddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/xadc_supplied_temperature.sample_en_i_2	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
‰
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2…
oddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/xadc_supplied_temperature.sample_timer[10]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ˆ
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2„
nddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/xadc_supplied_temperature.sample_timer[0]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
‰
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2…
oddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/xadc_supplied_temperature.sample_timer[10]_i_2	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
‰
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2…
oddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/xadc_supplied_temperature.sample_timer[10]_i_3	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
‰
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2…
oddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/xadc_supplied_temperature.sample_timer[10]_i_4	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ˆ
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2„
nddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/xadc_supplied_temperature.sample_timer[1]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ˆ
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2„
nddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/xadc_supplied_temperature.sample_timer[2]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ˆ
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2„
nddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/xadc_supplied_temperature.sample_timer[3]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ˆ
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2„
nddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/xadc_supplied_temperature.sample_timer[4]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ˆ
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2„
nddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/xadc_supplied_temperature.sample_timer[5]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ˆ
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2„
nddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/xadc_supplied_temperature.sample_timer[6]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ˆ
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2„
nddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/xadc_supplied_temperature.sample_timer[7]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ˆ
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2„
nddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/xadc_supplied_temperature.sample_timer[7]_i_2	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ˆ
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2„
nddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/xadc_supplied_temperature.sample_timer[8]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ˆ
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2„
nddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/xadc_supplied_temperature.sample_timer[9]_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ˆ
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2„
nddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/xadc_supplied_temperature.sample_timer[9]_i_2	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
‰
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2…
oddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/xadc_supplied_temperature.sample_timer_clr_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
ˆ
$%s: '%s' is not a valid startpoint.
402*constraints2!
set_max_delay2default:default2„
nddr3_ctrl/u_ddr3_v2_0/u_ddr3_v2_0_mig/temp_mon_enabled.u_tempmon/xadc_supplied_temperature.sample_timer_en_i_1	2default:default2z
d/afs/athena.mit.edu/user/l/d/ldemeyer/6.375/ldemeyer/riscv-lab6b/scemi/fpga_vc707/xilinx/default.xdc2default:default2
10062default:default8@Z18-402
<
%Done setting XDC timing constraints.
35*timingZ38-35
Û
zUser defined clock exists on pin %s and will prevent any subsequent automatic derivation of generated clocks on that pin.
3*timing2H
scemi_clkgen_pll/CLKOUT0scemi_clkgen_pll/CLKOUT02default:default8Z38-3
é
zUser defined clock exists on pin %s and will prevent any subsequent automatic derivation of generated clocks on that pin.
3*timing2V
scemi_scemi_clkgen_mmcm/CLKOUT0scemi_scemi_clkgen_mmcm/CLKOUT02default:default8Z38-3
D
8Ending PowerOpt TimerUpdates Task | Checksum: 1f5121aa1
*common
†

%s
*constraints2o
[Time (s): cpu = 00:00:22 ; elapsed = 00:00:20 . Memory (MB): peak = 2194.527 ; gain = 0.0002default:default
4
Applying IDT optimizations ...
9*pwroptZ34-9
6
Applying ODC optimizations ...
10*pwroptZ34-10


*pwropt
ë
¡WRITE_MODE attribute of %s BRAM(s) out of a total of %s has been updated to save power.
    Run report_power_opt to get a complete listing of the BRAMs updated.
129*pwropt2
142default:default2
222default:defaultZ34-162
[
+Structural ODC has moved %s WE to EN ports
155*pwropt2
02default:defaultZ34-201
 
CNumber of BRAM Ports augmented: %s newly gated: %s Total Ports: %s
65*pwropt2
02default:default2
82default:default2
442default:defaultZ34-65
A
5Ending Power Optimization Task | Checksum: 1c646d6ff
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:01:16 ; elapsed = 00:01:14 . Memory (MB): peak = 2437.527 ; gain = 243.0002default:default
Q
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83
À
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
322default:default2
2002default:default2
172default:default2
02default:defaultZ4-41
S
%s completed successfully
29*	vivadotcl2

opt_design2default:defaultZ4-42
û
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2 
opt_design: 2default:default2
00:02:222default:default2
00:02:192default:default2
2437.5272default:default2
243.0042default:defaultZ17-268
4
Writing XDEF routing.
211*designutilsZ20-211
A
#Writing XDEF routing logical nets.
209*designutilsZ20-209
A
#Writing XDEF routing special nets.
210*designutilsZ20-210
‚
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:022default:default2
00:00:022default:default2
2437.5312default:default2
0.0002default:defaultZ17-268
ÿ
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2&
write_checkpoint: 2default:default2
00:00:162default:default2
00:00:262default:default2
2437.5312default:default2
0.0042default:defaultZ17-268


End Record