#!/bin/bash

echo "Starting runs of Tealeaf, tea.in"


echo "Single_threaded"
export OMP_NUM_THREADS=1
time  ./tea_leaf &> run1_0.log

echo "Attempt 1"
export OMP_NUM_THREADS=2
time  ./tea_leaf &> run1_1.log

export OMP_NUM_THREADS=4
time  ./tea_leaf &> run1_2.log

export OMP_NUM_THREADS=8
time  ./tea_leaf &> run1_3.log

export OMP_NUM_THREADS=12
time  ./tea_leaf &> run1_4.log

export OMP_NUM_THREADS=16
time  ./tea_leaf &> run1_5.log

export OMP_NUM_THREADS=32
time  ./tea_leaf &> run1_6.log

echo "Attempt 2"
export OMP_NUM_THREADS=2
time  ./tea_leaf &> run2_1.log

export OMP_NUM_THREADS=4
time  ./tea_leaf &> run2_2.log

export OMP_NUM_THREADS=8
time  ./tea_leaf &> run2_3.log

export OMP_NUM_THREADS=12
time  ./tea_leaf &> run2_4.log

export OMP_NUM_THREADS=16
time  ./tea_leaf &> run2_5.log

export OMP_NUM_THREADS=32
time  ./tea_leaf &> run2_6.log


echo "Attempt 3"
export OMP_NUM_THREADS=2
time  ./tea_leaf &> run3_1.log

export OMP_NUM_THREADS=4
time  ./tea_leaf &> run3_2.log

export OMP_NUM_THREADS=8
time  ./tea_leaf &> run3_3.log

export OMP_NUM_THREADS=12
time  ./tea_leaf &> run3_4.log

export OMP_NUM_THREADS=16
time  ./tea_leaf &> run3_5.log

export OMP_NUM_THREADS=32
time  ./tea_leaf &> run3_6.log


echo "Attempt 4"
export OMP_NUM_THREADS=2
time  ./tea_leaf &> run4_1.log

export OMP_NUM_THREADS=4
time  ./tea_leaf &> run4_2.log

export OMP_NUM_THREADS=8
time  ./tea_leaf &> run4_3.log

export OMP_NUM_THREADS=12
time  ./tea_leaf &> run4_4.log

export OMP_NUM_THREADS=16
time  ./tea_leaf &> run4_5.log

export OMP_NUM_THREADS=32
time  ./tea_leaf &> run4_6.log


echo "Attempt 5"
export OMP_NUM_THREADS=2
time  ./tea_leaf &> run5_1.log

export OMP_NUM_THREADS=4
time  ./tea_leaf &> run5_2.log

export OMP_NUM_THREADS=8
time  ./tea_leaf &> run5_3.log

export OMP_NUM_THREADS=12
time  ./tea_leaf &> run5_4.log

export OMP_NUM_THREADS=16
time  ./tea_leaf &> run5_5.log

export OMP_NUM_THREADS=32
time  ./tea_leaf &> run5_6.log


echo "Attempt 6"
export OMP_NUM_THREADS=2
time  ./tea_leaf &> run6_000.log

export OMP_NUM_THREADS=4
time  ./tea_leaf &> run6_000.log

export OMP_NUM_THREADS=8
time  ./tea_leaf &> run6_000.log

export OMP_NUM_THREADS=12
time  ./tea_leaf &> run6_000.log

export OMP_NUM_THREADS=16
time  ./tea_leaf &> run6_000.log

export OMP_NUM_THREADS=32
time  ./tea_leaf &> run6_000.log


echo "Attempt 7"
export OMP_NUM_THREADS=2
time  ./tea_leaf &> run6_000.log

export OMP_NUM_THREADS=4
time  ./tea_leaf &> run6_000.log

export OMP_NUM_THREADS=8
time  ./tea_leaf &> run6_000.log

export OMP_NUM_THREADS=12
time  ./tea_leaf &> run6_000.log

export OMP_NUM_THREADS=16
time  ./tea_leaf &> run6_000.log

export OMP_NUM_THREADS=32
time  ./tea_leaf &> run6_000.log


echo "Attempt 8"
export OMP_NUM_THREADS=2
time  ./tea_leaf &> run6_000.log

export OMP_NUM_THREADS=4
time  ./tea_leaf &> run6_000.log

export OMP_NUM_THREADS=8
time  ./tea_leaf &> run6_000.log

export OMP_NUM_THREADS=12
time  ./tea_leaf &> run6_000.log

export OMP_NUM_THREADS=16
time  ./tea_leaf &> run6_000.log

export OMP_NUM_THREADS=32
time  ./tea_leaf &> run6_000.log


echo "Attempt 9"
export OMP_NUM_THREADS=2
time  ./tea_leaf &> run6_000.log

export OMP_NUM_THREADS=4
time  ./tea_leaf &> run6_000.log

export OMP_NUM_THREADS=8
time  ./tea_leaf &> run6_000.log

export OMP_NUM_THREADS=12
time  ./tea_leaf &> run6_000.log

export OMP_NUM_THREADS=16
time  ./tea_leaf &> run6_000.log

export OMP_NUM_THREADS=32
time  ./tea_leaf &> run6_000.log

echo "Attempt 10"
export OMP_NUM_THREADS=2
time  ./tea_leaf &> run6_000.log

export OMP_NUM_THREADS=4
time  ./tea_leaf &> run6_000.log

export OMP_NUM_THREADS=8
time  ./tea_leaf &> run6_000.log

export OMP_NUM_THREADS=12
time  ./tea_leaf &> run6_000.log

export OMP_NUM_THREADS=16
time  ./tea_leaf &> run6_000.log

export OMP_NUM_THREADS=32
time  ./tea_leaf &> run6_000.log


