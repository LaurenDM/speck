
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
82default:defaultZ23-27
L
DRC finished with %s
272*project2
0 Errors2default:defaultZ1-461
[
BPlease refer to the DRC report (report_drc) for more information.
274*projectZ1-462
Œ

%s
*constraints2u
aTime (s): cpu = 00:00:00.64 ; elapsed = 00:00:00.65 . Memory (MB): peak = 1809.934 ; gain = 4.0202default:default
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
132default:defaultZ31-138
B
Retargeted %s cell(s).
49*opt2
02default:defaultZ31-49
3
'Phase 1 Retarget | Checksum: 283199ed9
*common
†

%s
*constraints2o
[Time (s): cpu = 00:00:02 ; elapsed = 00:00:01 . Memory (MB): peak = 1809.934 ; gain = 0.0002default:default
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
24122default:defaultZ31-10
?
3Phase 2 Constant Propagation | Checksum: 1d3e4c64a
*common
†

%s
*constraints2o
[Time (s): cpu = 00:00:07 ; elapsed = 00:00:06 . Memory (MB): peak = 1809.934 ; gain = 0.0002default:default
]

Phase %s%s
101*constraints2
3 2default:default2
Sweep2default:defaultZ18-101
N
 Eliminated %s unconnected nets.
12*opt2
48812default:defaultZ31-12
O
!Eliminated %s unconnected cells.
11*opt2
17022default:defaultZ31-11
0
$Phase 3 Sweep | Checksum: 19a75b02c
*common
†

%s
*constraints2o
[Time (s): cpu = 00:00:09 ; elapsed = 00:00:08 . Memory (MB): peak = 1809.934 ; gain = 0.0002default:default
A
5Ending Logic Optimization Task | Checksum: 19a75b02c
*common
†

%s
*constraints2o
[Time (s): cpu = 00:00:09 ; elapsed = 00:00:08 . Memory (MB): peak = 1809.934 ; gain = 0.0002default:default
8
,Implement Debug Cores | Checksum: 28f0fe933
*common
5
)Logic Optimization | Checksum: 28f0fe933
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
8Ending PowerOpt TimerUpdates Task | Checksum: 19a75b02c
*common
†

%s
*constraints2o
[Time (s): cpu = 00:00:03 ; elapsed = 00:00:02 . Memory (MB): peak = 1809.934 ; gain = 0.0002default:default
4
Applying IDT optimizations ...
9*pwroptZ34-9
6
Applying ODC optimizations ...
10*pwroptZ34-10


*pwropt
ê
¡WRITE_MODE attribute of %s BRAM(s) out of a total of %s has been updated to save power.
    Run report_power_opt to get a complete listing of the BRAMs updated.
129*pwropt2
62default:default2
142default:defaultZ34-162
[
+Structural ODC has moved %s WE to EN ports
155*pwropt2
02default:defaultZ34-201
 
CNumber of BRAM Ports augmented: %s newly gated: %s Total Ports: %s
65*pwropt2
02default:default2
02default:default2
282default:defaultZ34-65
A
5Ending Power Optimization Task | Checksum: 19a75b02c
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:00:10 ; elapsed = 00:00:09 . Memory (MB): peak = 1938.957 ; gain = 129.0232default:default
Q
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83
¿
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
252default:default2
172default:default2
112default:default2
02default:defaultZ4-41
S
%s completed successfully
29*	vivadotcl2

opt_design2default:defaultZ4-42
û
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2 
opt_design: 2default:default2
00:00:202default:default2
00:00:182default:default2
1938.9572default:default2
133.0432default:defaultZ17-268
4
Writing XDEF routing.
211*designutilsZ20-211
A
#Writing XDEF routing logical nets.
209*designutilsZ20-209
A
#Writing XDEF routing special nets.
210*designutilsZ20-210
ˆ
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:00.532default:default2
00:00:00.592default:default2
1939.9572default:default2
0.0002default:defaultZ17-268


End Record