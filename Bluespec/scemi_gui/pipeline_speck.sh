#!/bin/bash

set -euf -o pipefail

#-- we'll do these only once --#
# cd fgpa
# programfpga xilinx/mkBridge.bit
javac SpeckGUI.java #compile GUI

#-- run GUI and tb --#
java SpeckGUI
#runtb ./tb
