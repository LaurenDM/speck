#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/opt/xilinx/vivado2014.1/Vivado/2014.1/ids_lite/ISE/bin/lin64:/opt/xilinx/vivado2014.1/Vivado/2014.1/bin
else
  PATH=/opt/xilinx/vivado2014.1/Vivado/2014.1/ids_lite/ISE/bin/lin64:/opt/xilinx/vivado2014.1/Vivado/2014.1/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=/opt/xilinx/vivado2014.1/Vivado/2014.1/ids_lite/ISE/lib/lin64
else
  LD_LIBRARY_PATH=/opt/xilinx/vivado2014.1/Vivado/2014.1/ids_lite/ISE/lib/lin64:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD=`dirname "$0"`
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

# pre-commands:
/bin/touch .init_design.begin.rst
EAStep vivado -log mkBridge.vdi -applog -m64 -messageDb vivado.pb -mode batch -source mkBridge.tcl -notrace

