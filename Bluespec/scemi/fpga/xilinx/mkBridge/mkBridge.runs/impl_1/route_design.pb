
H
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
	xc7vx485t2default:defaultZ17-347
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
	xc7vx485t2default:defaultZ17-349
g
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22
G
Running DRC with %s threads
24*drc2
82default:defaultZ23-27
M
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198
\
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199
M

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103
p
BMultithreading enabled for route_design using a maximum of %s CPUs97*route2
82default:defaultZ35-254
K

Starting %s Task
103*constraints2
Route2default:defaultZ18-103
g

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101
9
-Phase 1 Build RT Design | Checksum: e3bce963
*common
�

%s
*constraints2q
]Time (s): cpu = 00:02:10 ; elapsed = 00:01:41 . Memory (MB): peak = 2416.641 ; gain = 242.6022default:default
m

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101
f

Phase %s%s
101*constraints2
2.1 2default:default2 
Create Timer2default:defaultZ18-101
8
,Phase 2.1 Create Timer | Checksum: e3bce963
*common
�

%s
*constraints2q
]Time (s): cpu = 00:02:10 ; elapsed = 00:01:42 . Memory (MB): peak = 2416.641 ; gain = 242.6022default:default
g

Phase %s%s
101*constraints2
2.2 2default:default2!
Update Timing2default:defaultZ18-101
9
-Phase 2.2 Update Timing | Checksum: a6e97cb4
*common
�

%s
*constraints2q
]Time (s): cpu = 00:02:42 ; elapsed = 00:01:57 . Memory (MB): peak = 2489.973 ; gain = 315.9342default:default
~
Estimated Timing Summary %s
57*route2J
6| WNS=0.59   | TNS=0      | WHS=-0.43  | THS=-833   |
2default:defaultZ35-57
?
3Phase 2 Router Initialization | Checksum: c8aae9ea
*common
�

%s
*constraints2q
]Time (s): cpu = 00:02:58 ; elapsed = 00:02:04 . Memory (MB): peak = 2489.973 ; gain = 315.9342default:default
g

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101
9
-Phase 3 Initial Routing | Checksum: 7e59c08f
*common
�

%s
*constraints2q
]Time (s): cpu = 00:03:21 ; elapsed = 00:02:08 . Memory (MB): peak = 2489.973 ; gain = 315.9342default:default
j

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101
l

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101
�
�The following overlapped %s exist in the design and there is low overall congestion. 
Resolution: Check for routing resource conflicts on the identified nets or significant localized congestion using the Route Congestion Metrics in the Device View. %s125*route2
nodes2default:default2�
�
1. INT_R_X117Y153/WR1BEG1
Overlapping nets: 2
	scemi_clk_port_scemi_clkgen/CLK
	scemi_uclkgen/p_0_in
2. INT_R_X119Y153/WR1BEG1
Overlapping nets: 2
	scemi_clk_port_scemi_clkgen/CLK
	scemi_uclkgen/p_0_in
2default:defaultZ35-325
i

Phase %s%s
101*constraints2
4.1.1 2default:default2!
Update Timing2default:defaultZ18-101
;
/Phase 4.1.1 Update Timing | Checksum: f12a8a20
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:13 ; elapsed = 00:02:28 . Memory (MB): peak = 2489.973 ; gain = 315.9342default:default
~
Estimated Timing Summary %s
57*route2J
6| WNS=0.251  | TNS=0      | WHS=N/A    | THS=N/A    |
2default:defaultZ35-57
>
2Phase 4.1 Global Iteration 0 | Checksum: be509702
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:13 ; elapsed = 00:02:28 . Memory (MB): peak = 2489.973 ; gain = 315.9342default:default
<
0Phase 4 Rip-up And Reroute | Checksum: be509702
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:13 ; elapsed = 00:02:28 . Memory (MB): peak = 2489.973 ; gain = 315.9342default:default
e

Phase %s%s
101*constraints2
5 2default:default2!
Delay CleanUp2default:defaultZ18-101
g

Phase %s%s
101*constraints2
5.1 2default:default2!
Update Timing2default:defaultZ18-101
9
-Phase 5.1 Update Timing | Checksum: be509702
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:19 ; elapsed = 00:02:30 . Memory (MB): peak = 2489.973 ; gain = 315.9342default:default
~
Estimated Timing Summary %s
57*route2J
6| WNS=0.338  | TNS=0      | WHS=N/A    | THS=N/A    |
2default:defaultZ35-57
7
+Phase 5 Delay CleanUp | Checksum: be509702
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:19 ; elapsed = 00:02:30 . Memory (MB): peak = 2489.973 ; gain = 315.9342default:default
o

Phase %s%s
101*constraints2
6 2default:default2+
Clock Skew Optimization2default:defaultZ18-101
A
5Phase 6 Clock Skew Optimization | Checksum: be509702
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:19 ; elapsed = 00:02:30 . Memory (MB): peak = 2489.973 ; gain = 315.9342default:default
e

Phase %s%s
101*constraints2
7 2default:default2!
Post Hold Fix2default:defaultZ18-101
g

Phase %s%s
101*constraints2
7.1 2default:default2!
Update Timing2default:defaultZ18-101
9
-Phase 7.1 Update Timing | Checksum: be509702
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:28 ; elapsed = 00:02:32 . Memory (MB): peak = 2489.973 ; gain = 315.9342default:default
~
Estimated Timing Summary %s
57*route2J
6| WNS=0.338  | TNS=0      | WHS=-0.154 | THS=-1.52  |
2default:defaultZ35-57
7
+Phase 7 Post Hold Fix | Checksum: a533bfa1
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:30 ; elapsed = 00:02:33 . Memory (MB): peak = 2489.973 ; gain = 315.9342default:default
f

Phase %s%s
101*constraints2
8 2default:default2"
Route finalize2default:defaultZ18-101
8
,Phase 8 Route finalize | Checksum: a533bfa1
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:31 ; elapsed = 00:02:33 . Memory (MB): peak = 2489.973 ; gain = 315.9342default:default
m

Phase %s%s
101*constraints2
9 2default:default2)
Verifying routed nets2default:defaultZ18-101
?
3Phase 9 Verifying routed nets | Checksum: a533bfa1
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:31 ; elapsed = 00:02:33 . Memory (MB): peak = 2489.973 ; gain = 315.9342default:default
j

Phase %s%s
101*constraints2
10 2default:default2%
Depositing Routes2default:defaultZ18-101
=
1Phase 10 Depositing Routes | Checksum: 13ab16788
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:34 ; elapsed = 00:02:36 . Memory (MB): peak = 2489.973 ; gain = 315.9342default:default
k

Phase %s%s
101*constraints2
11 2default:default2&
Post Router Timing2default:defaultZ18-101
h

Phase %s%s
101*constraints2
11.1 2default:default2!
Update Timing2default:defaultZ18-101
;
/Phase 11.1 Update Timing | Checksum: 13ab16788
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:42 ; elapsed = 00:02:37 . Memory (MB): peak = 2489.973 ; gain = 315.9342default:default
~
Estimated Timing Summary %s
57*route2J
6| WNS=0.338  | TNS=0      | WHS=0.027  | THS=0      |
2default:defaultZ35-57
�
�The final timing numbers are based on the router estimated timing analysis. For a complete and accurate timing signoff, please run report_timing_summary.
127*routeZ35-327
>
2Phase 11 Post Router Timing | Checksum: 13ab16788
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:42 ; elapsed = 00:02:37 . Memory (MB): peak = 2489.973 ; gain = 315.9342default:default
4
Router Completed Successfully
16*routeZ35-16
4
(Ending Route Task | Checksum: 13ab16788
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:43 ; elapsed = 00:02:37 . Memory (MB): peak = 2489.973 ; gain = 315.9342default:default
�

%s
*constraints2q
]Time (s): cpu = 00:04:43 ; elapsed = 00:02:37 . Memory (MB): peak = 2489.973 ; gain = 315.9342default:default
Q
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
502default:default2
192default:default2
112default:default2
02default:defaultZ4-41
U
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
route_design: 2default:default2
00:04:502default:default2
00:02:422default:default2
2489.9732default:default2
359.1602default:defaultZ17-268
4
Writing XDEF routing.
211*designutilsZ20-211
A
#Writing XDEF routing logical nets.
209*designutilsZ20-209
A
#Writing XDEF routing special nets.
210*designutilsZ20-210
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:052default:default2
00:00:052default:default2
2489.9732default:default2
0.0002default:defaultZ17-268
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2&
write_checkpoint: 2default:default2
00:00:072default:default2
00:00:092default:default2
2489.9732default:default2
0.0002default:defaultZ17-268
G
Running DRC with %s threads
24*drc2
82default:defaultZ23-27
�
#The results of DRC are in file %s.
168*coretcl2�
p/mnt/nfs/var/nfs/ldemeyer/speck/Bluespec/scemi/fpga/xilinx/mkBridge/mkBridge.runs/impl_1/mkBridge_drc_routed.rptp/mnt/nfs/var/nfs/ldemeyer/speck/Bluespec/scemi/fpga/xilinx/mkBridge/mkBridge.runs/impl_1/mkBridge_drc_routed.rpt2default:default8Z2-168
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2 
report_drc: 2default:default2
00:00:132default:default2
00:00:052default:default2
2489.9732default:default2
0.0002default:defaultZ17-268
�
UpdateTimingParams:%s.
91*timing2P
< Speed grade: -2, Delay Type: min_max, Constraints type: SDC2default:defaultZ38-91
s
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
82default:defaultZ38-191
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2+
report_timing_summary: 2default:default2
00:00:352default:default2
00:00:112default:default2
2489.9732default:default2
0.0002default:defaultZ17-268
B
,Running Vector-less Activity Propagation...
51*powerZ33-51
G
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1
�
�MMCM/PLL RST static_probability should be either 0 or 1, power analysis is using 0 by default.
Use 'set_switching_activity -static_probability 1 -signal_rate 0 [get_nets %s]'  to set the static_probabiblity to '1'  if desired.207*power24
 scemi_pcie_ep/pcie_7x_v1_10_i/O12default:defaultZ33-218
�
�MMCM/PLL RST static_probability should be either 0 or 1, power analysis is using 0 by default.
Use 'set_switching_activity -static_probability 1 -signal_rate 0 [get_nets %s]'  to set the static_probabiblity to '1'  if desired.207*power2-
scemi_scemi_clkgen_rReset2default:defaultZ33-218
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
report_power: 2default:default2
00:00:132default:default2
00:00:142default:default2
2492.9652default:default2
2.9922default:defaultZ17-268


End Record