#!/bin/bash

set -euf -o pipefail
cd fpga

# define files
key_file="key.txt"
iv_file="key.txt"
message_input_file="in.txt"
message_output_file="message_out.txt" # correct? I'll double check this

#-- we'll do these only once --#
# programfpga fpga/xilinx/mkBridge.bit
javac SpeckGUI.java #compile GUI

#-- run GUI and tb --#
while true; do #CTR-c CTR-c to kill; we'll add in user prompt in SpeckGUI
    java SpeckGUI $key_file $iv_file $message_input_file
    #runtb ./tb
done
