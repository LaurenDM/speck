#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage ./run_asm.sh <proc name>"
	exit
fi

simdut=${1}_dut

asm_tests=(
	simple
	add addi
	and andi
	auipc
	beq bge bgeu blt bltu bne
	j jal jalr
	lw
	lui
	or ori
	sw
	sll slli
	slt slti
	sra srai
	srl srli
	sub
	xor xori
	bpred_bht bpred_j bpred_j_noloop bpred_ras
	cache
	)

vmh_dir=../../programs/build/assembly/vmh
wait_time=3

# kill previous bsim if any
pkill bluetcl

# arg to tb contains each test
tb_arg=""
for test_name in ${asm_tests[@]}; do
	# add vmh to tb arg
	mem_file=${vmh_dir}/${test_name}.riscv.vmh
	if [ ! -f $mem_file ]; then
		echo "ERROR: $mem_file does not exit, you need to first compile"
		exit
	fi
	tb_arg="$tb_arg $mem_file"
done

# run test
./${simdut} > asm.log & # run bsim, redirect outputs to log
sleep ${wait_time} # wait for bsim to setup
./tb $tb_arg # run test bench
