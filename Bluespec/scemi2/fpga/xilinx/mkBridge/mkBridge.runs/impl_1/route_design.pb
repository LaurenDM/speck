
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
:
.Phase 1 Build RT Design | Checksum: 1d783a45d
*common
�

%s
*constraints2q
]Time (s): cpu = 00:02:11 ; elapsed = 00:01:42 . Memory (MB): peak = 2377.297 ; gain = 246.3672default:default
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
9
-Phase 2.1 Create Timer | Checksum: 1d783a45d
*common
�

%s
*constraints2q
]Time (s): cpu = 00:02:11 ; elapsed = 00:01:43 . Memory (MB): peak = 2377.297 ; gain = 246.3672default:default
g

Phase %s%s
101*constraints2
2.2 2default:default2!
Update Timing2default:defaultZ18-101
:
.Phase 2.2 Update Timing | Checksum: 1d3d62292
*common
�

%s
*constraints2q
]Time (s): cpu = 00:02:40 ; elapsed = 00:01:56 . Memory (MB): peak = 2449.480 ; gain = 318.5512default:default
~
Estimated Timing Summary %s
57*route2J
6| WNS=0.705  | TNS=0      | WHS=-0.43  | THS=-684   |
2default:defaultZ35-57
@
4Phase 2 Router Initialization | Checksum: 19f31efe1
*common
�

%s
*constraints2q
]Time (s): cpu = 00:02:53 ; elapsed = 00:02:02 . Memory (MB): peak = 2449.480 ; gain = 318.5512default:default
g

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101
9
-Phase 3 Initial Routing | Checksum: ab324735
*common
�

%s
*constraints2q
]Time (s): cpu = 00:03:15 ; elapsed = 00:02:06 . Memory (MB): peak = 2449.480 ; gain = 318.5512default:default
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
�
�The following overlapped %s exist in the design and there is low overall congestion. 
Resolution: Check for routing resource conflicts on the identified nets or significant localized congestion using the Route Congestion Metrics in the Device View. %s125*route2
node2default:default2�
�
1. INT_R_X123Y57/IMUX30
Overlapping nets: 2
	scemi_bridge/pbb_csr_clock_status/n_0_data0_reg[15]_i_23
	scemi_bridge/pbb_csr_clock_status/n_0_data0_reg[15]_i_24
2default:defaultZ35-325
i

Phase %s%s
101*constraints2
4.1.1 2default:default2!
Update Timing2default:defaultZ18-101
;
/Phase 4.1.1 Update Timing | Checksum: 89b2f126
*common
�

%s
*constraints2q
]Time (s): cpu = 00:03:54 ; elapsed = 00:02:19 . Memory (MB): peak = 2449.480 ; gain = 318.5512default:default
~
Estimated Timing Summary %s
57*route2J
6| WNS=0.402  | TNS=0      | WHS=N/A    | THS=N/A    |
2default:defaultZ35-57
>
2Phase 4.1 Global Iteration 0 | Checksum: af37d69a
*common
�

%s
*constraints2q
]Time (s): cpu = 00:03:54 ; elapsed = 00:02:19 . Memory (MB): peak = 2449.480 ; gain = 318.5512default:default
<
0Phase 4 Rip-up And Reroute | Checksum: af37d69a
*common
�

%s
*constraints2q
]Time (s): cpu = 00:03:54 ; elapsed = 00:02:19 . Memory (MB): peak = 2449.480 ; gain = 318.5512default:default
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
-Phase 5.1 Update Timing | Checksum: af37d69a
*common
�

%s
*constraints2q
]Time (s): cpu = 00:03:59 ; elapsed = 00:02:21 . Memory (MB): peak = 2449.480 ; gain = 318.5512default:default
~
Estimated Timing Summary %s
57*route2J
6| WNS=0.489  | TNS=0      | WHS=N/A    | THS=N/A    |
2default:defaultZ35-57
7
+Phase 5 Delay CleanUp | Checksum: af37d69a
*common
�

%s
*constraints2q
]Time (s): cpu = 00:03:59 ; elapsed = 00:02:21 . Memory (MB): peak = 2449.480 ; gain = 318.5512default:default
o

Phase %s%s
101*constraints2
6 2default:default2+
Clock Skew Optimization2default:defaultZ18-101
A
5Phase 6 Clock Skew Optimization | Checksum: af37d69a
*common
�

%s
*constraints2q
]Time (s): cpu = 00:03:59 ; elapsed = 00:02:21 . Memory (MB): peak = 2449.480 ; gain = 318.5512default:default
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
-Phase 7.1 Update Timing | Checksum: af37d69a
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:06 ; elapsed = 00:02:23 . Memory (MB): peak = 2449.480 ; gain = 318.5512default:default
~
Estimated Timing Summary %s
57*route2J
6| WNS=0.489  | TNS=0      | WHS=-0.145 | THS=-0.304 |
2default:defaultZ35-57
8
,Phase 7 Post Hold Fix | Checksum: 15fe8769b
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:07 ; elapsed = 00:02:23 . Memory (MB): peak = 2449.480 ; gain = 318.5512default:default
f

Phase %s%s
101*constraints2
8 2default:default2"
Route finalize2default:defaultZ18-101
9
-Phase 8 Route finalize | Checksum: 15fe8769b
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:08 ; elapsed = 00:02:23 . Memory (MB): peak = 2449.480 ; gain = 318.5512default:default
m

Phase %s%s
101*constraints2
9 2default:default2)
Verifying routed nets2default:defaultZ18-101
@
4Phase 9 Verifying routed nets | Checksum: 15fe8769b
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:08 ; elapsed = 00:02:23 . Memory (MB): peak = 2449.480 ; gain = 318.5512default:default
j

Phase %s%s
101*constraints2
10 2default:default2%
Depositing Routes2default:defaultZ18-101
=
1Phase 10 Depositing Routes | Checksum: 1695b56e8
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:10 ; elapsed = 00:02:26 . Memory (MB): peak = 2449.480 ; gain = 318.5512default:default
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
/Phase 11.1 Update Timing | Checksum: 1695b56e8
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:17 ; elapsed = 00:02:27 . Memory (MB): peak = 2449.480 ; gain = 318.5512default:default
~
Estimated Timing Summary %s
57*route2J
6| WNS=0.489  | TNS=0      | WHS=0.026  | THS=0      |
2default:defaultZ35-57
�
�The final timing numbers are based on the router estimated timing analysis. For a complete and accurate timing signoff, please run report_timing_summary.
127*routeZ35-327
>
2Phase 11 Post Router Timing | Checksum: 1695b56e8
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:17 ; elapsed = 00:02:27 . Memory (MB): peak = 2449.480 ; gain = 318.5512default:default
4
Router Completed Successfully
16*routeZ35-16
4
(Ending Route Task | Checksum: 1695b56e8
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:17 ; elapsed = 00:02:27 . Memory (MB): peak = 2449.480 ; gain = 318.5512default:default
�

%s
*constraints2q
]Time (s): cpu = 00:04:17 ; elapsed = 00:02:27 . Memory (MB): peak = 2449.480 ; gain = 318.5512default:default
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
00:04:242default:default2
00:02:312default:default2
2449.4802default:default2
360.7772default:defaultZ17-268
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
00:00:042default:default2
00:00:042default:default2
2449.4802default:default2
0.0002default:defaultZ17-268
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2&
write_checkpoint: 2default:default2
00:00:062default:default2
00:00:082default:default2
2449.4802default:default2
0.0002default:defaultZ17-268
G
Running DRC with %s threads
24*drc2
82default:defaultZ23-27
�
#The results of DRC are in file %s.
168*coretcl2�
q/mnt/nfs/var/nfs/ldemeyer/speck/Bluespec/scemi2/fpga/xilinx/mkBridge/mkBridge.runs/impl_1/mkBridge_drc_routed.rptq/mnt/nfs/var/nfs/ldemeyer/speck/Bluespec/scemi2/fpga/xilinx/mkBridge/mkBridge.runs/impl_1/mkBridge_drc_routed.rpt2default:default8Z2-168
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
00:00:292default:default2
00:00:082default:default2
2449.4802default:default2
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
00:00:122default:default2
00:00:122default:default2
2449.4802default:default2
0.0002default:defaultZ17-268


End Record