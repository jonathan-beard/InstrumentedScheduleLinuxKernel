#!/bin/bash


echo "Starting runs of HPCG-3.0"

echo "Warmup run (8threads)"
threadnum_var=8
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_warmup.log
dmesg > dmesg_dump_latest_warmup

#if false; then
#Runs I want to skip here

threadnum_var=1

echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-1.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-2.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-3.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-4.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-5.log
dmesg > dmesg_dump_latest_$threadnum_var


(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-1.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-2.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-3.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-4.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-5.log
dmesg > dmesg_dump_latest_$threadnum_var


(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-1.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-2.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-3.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-4.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-5.log
dmesg > dmesg_dump_latest_$threadnum_var

(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var


( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-1.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-2.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-3.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-4.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-5.log
dmesg > dmesg_dump_latest_$threadnum_var



(( threadnum_var=threadnum_var + 4 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-1.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-2.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-3.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-4.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-5.log
dmesg > dmesg_dump_latest_$threadnum_var


(( threadnum_var=threadnum_var + 4 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-1.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-2.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-3.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-4.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-5.log
dmesg > dmesg_dump_latest_$threadnum_var


(( threadnum_var=threadnum_var + 8 ))

echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-1.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-2.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-3.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-4.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-5.log
dmesg > dmesg_dump_latest_$threadnum_var

(( threadnum_var=threadnum_var + 8 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-1.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-2.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-3.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-4.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-5.log
dmesg > dmesg_dump_latest_$threadnum_var


(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-1.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-2.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-3.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-4.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-5.log
dmesg > dmesg_dump_latest_$threadnum_var


(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-1.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-2.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-3.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-4.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-5.log
dmesg > dmesg_dump_latest_$threadnum_var

#fi
#threadnum_var=128

(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-1.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-2.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-3.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-4.log
dmesg > dmesg_dump_latest_$threadnum_var

( time printf 'y' |   ./omp-csr -s 20 -e 22 ) &> runtest_threads_$threadnum_var-5.log
dmesg > dmesg_dump_latest_$threadnum_var

