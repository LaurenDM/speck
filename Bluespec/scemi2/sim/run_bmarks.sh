#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage ./run_bmarks.sh <proc name>"
	exit
fi

simdut=${1}_dut

bmarks_tests=(
	median
	multiply
	qsort
	towers
	vvadd
	)

vmh_dir=../../programs/build/benchmarks/vmh
wait_time=3

# kill previous bsim if any
pkill bluetcl

# run each test
tb_arg=""
for test_name in ${bmarks_tests[@]}; do
	# add vmh to tb arg
	mem_file=${vmh_dir}/${test_name}.riscv.vmh
	if [ ! -f $mem_file ]; then
		echo "ERROR: $mem_file does not exit, you need to first compile"
		exit
	fi
	tb_arg="$tb_arg $mem_file"
done

# run test
./${simdut} > bmarks.log & # run bsim, redirect outputs to log
sleep ${wait_time} # wait for bsim to setup
./tb $tb_arg # run test bench
