#!/bin/bash

# Runs benchmark on whatever proc is programmed on the fpga

bmarks_tests=(
	median
	multiply
	qsort
	towers
	vvadd
  mandelbrot
	)

vmh_dir=../../programs/build/benchmarks/vmh
wait_time=3

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
bash bluenoc_hotswap
sleep 1
bluenoc reset
sleep 1
bluenoc reset
./tb $tb_arg # run test bench
sleep 1
bluenoc reset
sleep 1
