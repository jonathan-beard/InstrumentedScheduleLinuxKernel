#!/bin/bash


echo "Starting runs of CoMD"

threadnum_var=1

echo "Single Thread "
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000) &> runtest_threads_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var

(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000) &> runtest_threads_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var
(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

dmesg > dmesg_dump_latest_$threadnum_var
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000) &> runtest_threads_$threadnum_var.log

(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

dmesg > dmesg_dump_latest_$threadnum_var
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000) &> runtest_threads_$threadnum_var.log

(( threadnum_var=threadnum_var + 4 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

dmesg > dmesg_dump_latest_$threadnum_var
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000) &> runtest_threads_$threadnum_var.log


(( threadnum_var=threadnum_var + 4 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

dmesg > dmesg_dump_latest_$threadnum_var
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000) &> runtest_threads_$threadnum_var.log

(( threadnum_var=threadnum_var + 8 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

dmesg > dmesg_dump_latest_$threadnum_var
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000) &> runtest_threads_$threadnum_var.log

(( threadnum_var=threadnum_var + 8 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

dmesg > dmesg_dump_latest_$threadnum_var
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000) &> runtest_threads_$threadnum_var.log

(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

dmesg > dmesg_dump_latest_$threadnum_var
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000) &> runtest_threads_$threadnum_var.log


(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

dmesg > dmesg_dump_latest_$threadnum_var
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000) &> runtest_threads_$threadnum_var.log


