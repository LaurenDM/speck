#!/bin/bash

if [ $# -ne 1 ] ; then
    echo "ERROR: missing processor name for testing"
    echo "Expected use:"
    echo "    ./run_mandelbrot <proc_name>"
    echo "where <proc_name> is replaced with the processor target you are testing"
    exit 1
fi

targetname=$1

if ! [ -e "./${targetname}_dut" ] ; then
    echo "ERROR: ./${targetname}_dut not found."
    echo "Need to run 'build -v ${targetname}' first."
    exit 1
fi

pkill bluetcl

./${targetname}_dut > /dev/null &
sleep 5
./tb ../../programs/build/benchmarks/vmh/mandelbrot.riscv.vmh
