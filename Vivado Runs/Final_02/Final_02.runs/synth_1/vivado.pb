
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental {C:/Users/tomih/Desktop/EE2390 Digital System Design Projects/Final_Project/Vivado Runs/Final_02/Final_02.srcs/utils_1/imports/synth_1/top_stopwatch.dcp}Z12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2�
�C:/Users/tomih/Desktop/EE2390 Digital System Design Projects/Final_Project/Vivado Runs/Final_02/Final_02.srcs/utils_1/imports/synth_1/top_stopwatch.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
h
Command: %s
53*	vivadotcl27
5synth_design -top top_stopwatch -part xc7a35tcpg236-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
z
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2	
xc7a35tZ17-347h px� 
j
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2	
xc7a35tZ17-349h px� 
D
Loading part %s157*device2
xc7a35tcpg236-1Z21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
11800Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:05 ; elapsed = 00:00:06 . Memory (MB): peak = 1027.191 ; gain = 467.445
h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
dun2
wire2n
jC:/Users/tomih/Desktop/EE2390 Digital System Design Projects/Final_Project/Verilog Modules/top_stopwatch.v2
818@Z8-11241h px� 
�
synthesizing module '%s'%s4497*oasys2
top_stopwatch2
 2n
jC:/Users/tomih/Desktop/EE2390 Digital System Design Projects/Final_Project/Verilog Modules/top_stopwatch.v2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
por2
 2d
`C:/Users/tomih/Desktop/EE2390 Digital System Design Projects/Final_Project/Verilog Modules/por.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
por2
 2
02
12d
`C:/Users/tomih/Desktop/EE2390 Digital System Design Projects/Final_Project/Verilog Modules/por.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
button_proc2
 2l
hC:/Users/tomih/Desktop/EE2390 Digital System Design Projects/Final_Project/Verilog Modules/button_proc.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
button_proc2
 2
02
12l
hC:/Users/tomih/Desktop/EE2390 Digital System Design Projects/Final_Project/Verilog Modules/button_proc.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
	stopwatch2
 2j
fC:/Users/tomih/Desktop/EE2390 Digital System Design Projects/Final_Project/Verilog Modules/stopwatch.v2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
clk_divider_100ms2
 2r
nC:/Users/tomih/Desktop/EE2390 Digital System Design Projects/Final_Project/Verilog Modules/clk_divider_100ms.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
clk_divider_100ms2
 2
02
12r
nC:/Users/tomih/Desktop/EE2390 Digital System Design Projects/Final_Project/Verilog Modules/clk_divider_100ms.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
stopwatch_ctrl2
 2o
kC:/Users/tomih/Desktop/EE2390 Digital System Design Projects/Final_Project/Verilog Modules/stopwatch_ctrl.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
stopwatch_ctrl2
 2
02
12o
kC:/Users/tomih/Desktop/EE2390 Digital System Design Projects/Final_Project/Verilog Modules/stopwatch_ctrl.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
bcd_counter2
 2l
hC:/Users/tomih/Desktop/EE2390 Digital System Design Projects/Final_Project/Verilog Modules/bcd_counter.v2
18@Z8-6157h px� 
F
%s
*synth2.
,	Parameter MAX bound to: 9 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
bcd_counter2
 2
02
12l
hC:/Users/tomih/Desktop/EE2390 Digital System Design Projects/Final_Project/Verilog Modules/bcd_counter.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
bcd_counter__parameterized02
 2l
hC:/Users/tomih/Desktop/EE2390 Digital System Design Projects/Final_Project/Verilog Modules/bcd_counter.v2
18@Z8-6157h px� 
F
%s
*synth2.
,	Parameter MAX bound to: 5 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
bcd_counter__parameterized02
 2
02
12l
hC:/Users/tomih/Desktop/EE2390 Digital System Design Projects/Final_Project/Verilog Modules/bcd_counter.v2
18@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	stopwatch2
 2
02
12j
fC:/Users/tomih/Desktop/EE2390 Digital System Design Projects/Final_Project/Verilog Modules/stopwatch.v2
18@Z8-6155h px� 
�
cfor the instance '%s' of module '%s' declared at '%s:%s', named port connection '%s' does not exist18531*oasys2
u_sw2
	stopwatch2h
fC:/Users/tomih/Desktop/EE2390 Digital System Design Projects/Final_Project/Verilog Modules/stopwatch.v2
12	
running2n
jC:/Users/tomih/Desktop/EE2390 Digital System Design Projects/Final_Project/Verilog Modules/top_stopwatch.v2
738@Z8-11365h px� 
�
cfor the instance '%s' of module '%s' declared at '%s:%s', named port connection '%s' does not exist18531*oasys2
u_sw2
	stopwatch2h
fC:/Users/tomih/Desktop/EE2390 Digital System Design Projects/Final_Project/Verilog Modules/stopwatch.v2
12
dir2n
jC:/Users/tomih/Desktop/EE2390 Digital System Design Projects/Final_Project/Verilog Modules/top_stopwatch.v2
748@Z8-11365h px� 
�
synthesizing module '%s'%s4497*oasys2
stopwatch_flash2
 2p
lC:/Users/tomih/Desktop/EE2390 Digital System Design Projects/Final_Project/Verilog Modules/stopwatch_flash.v2
18@Z8-6157h px� 
�
!failed synthesizing module '%s'%s4496*oasys2
stopwatch_flash2
 2p
lC:/Users/tomih/Desktop/EE2390 Digital System Design Projects/Final_Project/Verilog Modules/stopwatch_flash.v2
18@Z8-6156h px� 
�
!failed synthesizing module '%s'%s4496*oasys2
top_stopwatch2
 2n
jC:/Users/tomih/Desktop/EE2390 Digital System Design Projects/Final_Project/Verilog Modules/top_stopwatch.v2
18@Z8-6156h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:07 ; elapsed = 00:00:07 . Memory (MB): peak = 1131.855 ; gain = 572.109
h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
~
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
272
02
02
5Z4-41h px� 
<

%s failed
30*	vivadotcl2
synth_designZ4-43h px� 
|
Command failed: %s
69*common2G
ESynthesis failed - please see the console or run log file for detailsZ17-69h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Tue Apr 29 11:01:24 2025Z17-206h px� 


End Record