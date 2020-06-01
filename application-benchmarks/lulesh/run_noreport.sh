#!/bin/bash


echo "Starting runs of lulesh clean no reporting"

export OMP_SCHEDULE="static"
echo "export OMP_SCHEDULE="static""
echo "export OMP_DYNAMIC=FALSE"
export OMP_DYNAMIC=FALSE

threadnum_var=8

echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'n' |   ./lulesh2.0 -p -s 80 -i 20) &> runtest_threads_noreport_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var
(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'n' |   ./lulesh2.0 -p -s 80 -i 20) &> runtest_threads_noreport_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var
(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'n' |   ./lulesh2.0 -p -s 80 -i 20) &> runtest_threads_noreport_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var
(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'n' |   ./lulesh2.0 -p -s 80 -i 20) &> runtest_threads_noreport_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var

(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'n' |   ./lulesh2.0 -p -s 80 -i 20) &> runtest_threads_noreport_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var

(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'n' |   ./lulesh2.0 -p -s 80 -i 20) &> runtest_threads_noreport_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var
(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'n' |   ./lulesh2.0 -p -s 80 -i 20) &> runtest_threads_noreport_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var
(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'n' |   ./lulesh2.0 -p -s 80 -i 20) &> runtest_threads_noreport_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var
(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'n' |   ./lulesh2.0 -p -s 80 -i 20) &> runtest_threads_noreport_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var
(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'n' |   ./lulesh2.0 -p -s 80 -i 20) &> runtest_threads_noreport_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var
(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'n' |   ./lulesh2.0 -p -s 80 -i 20) &> runtest_threads_noreport_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var
(( threadnum_var=threadnum_var*2 ))
echo "Threads "
echo $threadnum_var
export OMP_NUM_THREADS=$threadnum_var

( time printf 'n' |   ./lulesh2.0 -p -s 80 -i 20) &> runtest_threads_noreport_$threadnum_var.log

dmesg > dmesg_dump_latest_$threadnum_var

