#!/bin/bash


echo "Starting runs of HPCG-3.0"

echo "Warmup run (8threads)"
threadnum_var=8
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./hpgmg-fv 6 40 ) &> runtest_threads_warmup.log
dmesg > dmesg_dump_latest_warmup


threadnum_var=1

echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./hpgmg-fv 6 40 ) &> runtest_threads_$threadnum_var.log
dmesg > dmesg_dump_latest_$threadnum_var


(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./hpgmg-fv 6 40 ) &> runtest_threads_$threadnum_var.log
dmesg > dmesg_dump_latest_$threadnum_var


(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./hpgmg-fv 6 40 ) &> runtest_threads_$threadnum_var.log
dmesg > dmesg_dump_latest_$threadnum_var


(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./hpgmg-fv 6 40 ) &> runtest_threads_$threadnum_var.log
dmesg > dmesg_dump_latest_$threadnum_var


(( threadnum_var=threadnum_var + 4 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./hpgmg-fv 6 40 ) &> runtest_threads_$threadnum_var.log
dmesg > dmesg_dump_latest_$threadnum_var


(( threadnum_var=threadnum_var + 4 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./hpgmg-fv 6 40 ) &> runtest_threads_$threadnum_var.log
dmesg > dmesg_dump_latest_$threadnum_var

(( threadnum_var=threadnum_var + 8 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./hpgmg-fv 6 40 ) &> runtest_threads_$threadnum_var.log
dmesg > dmesg_dump_latest_$threadnum_var


(( threadnum_var=threadnum_var + 8 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./hpgmg-fv 6 40 ) &> runtest_threads_$threadnum_var.log
dmesg > dmesg_dump_latest_$threadnum_var

(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./hpgmg-fv 6 40 ) &> runtest_threads_$threadnum_var.log
dmesg > dmesg_dump_latest_$threadnum_var

(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./hpgmg-fv 6 40 ) &> runtest_threads_$threadnum_var.log
dmesg > dmesg_dump_latest_$threadnum_var

(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./hpgmg-fv 6 40 ) &> runtest_threads_$threadnum_var.log
dmesg > dmesg_dump_latest_$threadnum_var

#(( threadnum_var=threadnum_var*2 ))
#echo "Threads "
#echo $threadnum_var
#export OMP_NUM_THREADS=$threadnum_var
#
#( time printf 'y' |   ./hpgmg-fv 6 40 ) &> runtest_threads_$threadnum_var.log
#dmesg > dmesg_dump_latest_$threadnum_var

