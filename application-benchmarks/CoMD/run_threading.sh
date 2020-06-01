#!/bin/bash

echo "Starting runs of CoMD"

echo "Single_threaded"
export OMP_NUM_THREADS=1
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run1_0.log

echo "Attempt 1"
export OMP_NUM_THREADS=2
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run1_1.log

export OMP_NUM_THREADS=4
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run1_2.log

export OMP_NUM_THREADS=8
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run1_3.log

export OMP_NUM_THREADS=12
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run1_4.log

export OMP_NUM_THREADS=16
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run1_5.log

export OMP_NUM_THREADS=32
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run1_6.log

echo "Attempt 2"
export OMP_NUM_THREADS=2
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run2_1.log

export OMP_NUM_THREADS=4
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run2_2.log

export OMP_NUM_THREADS=8
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run2_3.log

export OMP_NUM_THREADS=12
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run2_4.log

export OMP_NUM_THREADS=16
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run2_5.log

export OMP_NUM_THREADS=32
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run2_6.log


echo "Attempt 3"
export OMP_NUM_THREADS=2
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run3_1.log

export OMP_NUM_THREADS=4
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run3_2.log

export OMP_NUM_THREADS=8
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run3_3.log

export OMP_NUM_THREADS=12
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run3_4.log

export OMP_NUM_THREADS=16
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run3_5.log

export OMP_NUM_THREADS=32
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run3_6.log


echo "Attempt 4"
export OMP_NUM_THREADS=2
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run4_1.log

export OMP_NUM_THREADS=4
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run4_2.log

export OMP_NUM_THREADS=8
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run4_3.log

export OMP_NUM_THREADS=12
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run4_4.log

export OMP_NUM_THREADS=16
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run4_5.log

export OMP_NUM_THREADS=32
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run4_6.log


echo "Attempt 5"
export OMP_NUM_THREADS=2
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run5_1.log

export OMP_NUM_THREADS=4
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run5_2.log

export OMP_NUM_THREADS=8
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run5_3.log

export OMP_NUM_THREADS=12
( time printf 'y' |   ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run5_4.log

export OMP_NUM_THREADS=16
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run5_5.log

export OMP_NUM_THREADS=32
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run5_6.log


echo "Attempt 6"
export OMP_NUM_THREADS=2
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run6_1.log

export OMP_NUM_THREADS=4
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run6_2.log

export OMP_NUM_THREADS=8
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run6_3.log

export OMP_NUM_THREADS=12
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run6_4.log

export OMP_NUM_THREADS=16
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run6_5.log

export OMP_NUM_THREADS=32
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run6_6.log


echo "Attempt 7"
export OMP_NUM_THREADS=2
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run7_1.log

export OMP_NUM_THREADS=4
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run7_2.log

export OMP_NUM_THREADS=8
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run7_3.log

export OMP_NUM_THREADS=12
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run7_4.log

export OMP_NUM_THREADS=16
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run7_5.log

export OMP_NUM_THREADS=32
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run7_6.log


echo "Attempt 8"
export OMP_NUM_THREADS=2
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run8_1.log

export OMP_NUM_THREADS=4
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run8_2.log

export OMP_NUM_THREADS=8
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run8_3.log

export OMP_NUM_THREADS=12
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run8_4.log

export OMP_NUM_THREADS=16
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run8_5.log

export OMP_NUM_THREADS=32
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run8_6.log


echo "Attempt 9"
export OMP_NUM_THREADS=2
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run9_1.log

export OMP_NUM_THREADS=4
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run9_2.log

export OMP_NUM_THREADS=8
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run9_3.log

export OMP_NUM_THREADS=12
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run9_4.log

export OMP_NUM_THREADS=16
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run9_5.log

export OMP_NUM_THREADS=32
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run9_6.log

echo "Attempt 10"
export OMP_NUM_THREADS=2
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run10_1.log

export OMP_NUM_THREADS=4
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run10_2.log

export OMP_NUM_THREADS=8
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run10_3.log

export OMP_NUM_THREADS=12
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run10_4.log

export OMP_NUM_THREADS=16
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run10_5.log

export OMP_NUM_THREADS=32
( time printf 'y' | ./bin/CoMD-openmp -e -x 64 -y 64 -z 64 -N 20 - T 4000 ) &> run10_6.log


