#!/bin/bash

set -euf -o pipefail

#-- compile and run Speck GUI --#
javac SpeckGUI.java
java SpeckGUI

#-- we can program FPGA from here; things to decide downstream --#
# cd fgpa
# programfpga xilinx/mkBridge.bit

#-- run tb --#
#runtb ./tb
