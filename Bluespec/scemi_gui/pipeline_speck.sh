#!/bin/bash

set -euf -o pipefail

#-- we'll do these only once --#
cd fpga
# programfpga fpga/xilinx/mkBridge.bit
javac SpeckGUI.java #compile GUI

#-- run GUI and tb --#
while true; do
    java SpeckGUI
    #runtb ./tb
done
