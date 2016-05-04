#!/bin/bash

set -euf -o pipefail
cd fpga

# define files
key_file="key.txt"
iv_file="iv.txt"
message_input_file="in.txt"
message_output_file="out.txt"

# Remove old files
if [ -f out.txt ]
then
    rm out.txt
fi
if [ -f in.txt ]
then
    rm in.txt
fi
# Initialize empty files
echo "Type your message here" >> in.txt
echo "" >> out.txt

#-- we'll do these only once --#
# programfpga fpga/xilinx/mkBridge.bit
javac SpeckGUI.java #compile GUI

#-- run GUI and tb --#
while true; do #CTR-c CTR-c to kill; we'll add in user prompt in SpeckGUI
    java SpeckGUI $key_file $iv_file $message_input_file $message_output_file
    #runtb ./tb
done
