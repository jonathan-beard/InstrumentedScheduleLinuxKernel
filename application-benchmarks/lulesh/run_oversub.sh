#!/bin/bash

echo "Starting runs of Lulesh, s120 i20"

echo "Warmup run (8 threads)"
threadnum_var=8
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./lulesh2.0 -p -s 80 -i 20 ) &> runtest_threads_warmup.log
dmesg > dmesg_dump_latest_warmup

threadnum_var=1

echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./lulesh2.0 -p -s 120 -i 20 ) &> runtest_threads_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var
(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./lulesh2.0 -p -s 120 -i 20 ) &> runtest_threads_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var
(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./lulesh2.0 -p -s 120 -i 20 ) &> runtest_threads_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var
(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./lulesh2.0 -p -s 120 -i 20 ) &> runtest_threads_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var
(( threadnum_var=threadnum_var + 4 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./lulesh2.0 -p -s 120 -i 20 ) &> runtest_threads_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var

(( threadnum_var=threadnum_var + 4 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./lulesh2.0 -p -s 120 -i 20 ) &> runtest_threads_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var
(( threadnum_var=threadnum_var + 8 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./lulesh2.0 -p -s 120 -i 20 ) &> runtest_threads_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var

(( threadnum_var=threadnum_var + 8 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./lulesh2.0 -p -s 120 -i 20 ) &> runtest_threads_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var
(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./lulesh2.0 -p -s 120 -i 20 ) &> runtest_threads_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var
(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./lulesh2.0 -p -s 120 -i 20 ) &> runtest_threads_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var
(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./lulesh2.0 -p -s 120 -i 20 ) &> runtest_threads_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var
(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./lulesh2.0 -p -s 120 -i 20 ) &> runtest_threads_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var
(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./lulesh2.0 -p -s 120 -i 20 ) &> runtest_threads_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var
(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'y' |   ./lulesh2.0 -p -s 120 -i 20 ) &> runtest_threads_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var
