#! /bin/bash

echo "Running GRAPH500"

#echo "Single Threaded"
#export OMP_NUM_THREADS=1
#time ./omp-csr -s 20 -e 22 -V &>benchmark_1

echo "Attempt 1"
export OMP_NUM_THREADS=2
time ./omp-csr -s 20 -e 22 &> run1_1.log

export OMP_NUM_THREADS=4
time ./omp-csr -s 20 -e 22 &> run1_2.log

export OMP_NUM_THREADS=8
time ./omp-csr -s 20 -e 22 &> run1_3.log

export OMP_NUM_THREADS=12
time ./omp-csr -s 20 -e 22 &> run1_4.log

export OMP_NUM_THREADS=16
time ./omp-csr -s 20 -e 22 &> run1_5.log

export OMP_NUM_THREADS=32
time ./omp-csr -s 20 -e 22 &> run1_6.log

echo "Attempt 2"
export OMP_NUM_THREADS=2
time ./omp-csr -s 20 -e 22 &> run2_1.log

export OMP_NUM_THREADS=4
time ./omp-csr -s 20 -e 22 &> run2_2.log

export OMP_NUM_THREADS=8
time ./omp-csr -s 20 -e 22 &> run2_3.log

export OMP_NUM_THREADS=12
time ./omp-csr -s 20 -e 22 &> run2_4.log

export OMP_NUM_THREADS=16
time ./omp-csr -s 20 -e 22 &> run2_5.log

export OMP_NUM_THREADS=32
time ./omp-csr -s 20 -e 22 &> run2_6.log


echo "Attempt 3"
export OMP_NUM_THREADS=2
time ./omp-csr -s 20 -e 22 &> run3_1.log

export OMP_NUM_THREADS=4
time ./omp-csr -s 20 -e 22 &> run3_2.log

export OMP_NUM_THREADS=8
time ./omp-csr -s 20 -e 22 &> run3_3.log

export OMP_NUM_THREADS=12
time ./omp-csr -s 20 -e 22 &> run3_4.log

export OMP_NUM_THREADS=16
time ./omp-csr -s 20 -e 22 &> run3_5.log

export OMP_NUM_THREADS=32
time ./omp-csr -s 20 -e 22 &> run3_6.log


echo "Attempt 4"
export OMP_NUM_THREADS=2
time ./omp-csr -s 20 -e 22 &> run4_1.log

export OMP_NUM_THREADS=4
time ./omp-csr -s 20 -e 22 &> run4_2.log

export OMP_NUM_THREADS=8
time ./omp-csr -s 20 -e 22 &> run4_3.log

export OMP_NUM_THREADS=12
time ./omp-csr -s 20 -e 22 &> run4_4.log

export OMP_NUM_THREADS=16
time ./omp-csr -s 20 -e 22 &> run4_5.log

export OMP_NUM_THREADS=32
time ./omp-csr -s 20 -e 22 &> run4_6.log


echo "Attempt 5"
export OMP_NUM_THREADS=2
time ./omp-csr -s 20 -e 22 &> run5_1.log

export OMP_NUM_THREADS=4
time ./omp-csr -s 20 -e 22 &> run5_2.log

export OMP_NUM_THREADS=8
time ./omp-csr -s 20 -e 22 &> run5_3.log

export OMP_NUM_THREADS=12
time ./omp-csr -s 20 -e 22 &> run5_4.log

export OMP_NUM_THREADS=16
time ./omp-csr -s 20 -e 22 &> run5_5.log

export OMP_NUM_THREADS=32
time ./omp-csr -s 20 -e 22 &> run5_6.log


echo "Attempt 6"
export OMP_NUM_THREADS=2
time ./omp-csr -s 20 -e 22 &> run6_000.log

export OMP_NUM_THREADS=4
time ./omp-csr -s 20 -e 22 &> run6_000.log

export OMP_NUM_THREADS=8
time ./omp-csr -s 20 -e 22 &> run6_000.log

export OMP_NUM_THREADS=12
time ./omp-csr -s 20 -e 22 &> run6_000.log

export OMP_NUM_THREADS=16
time ./omp-csr -s 20 -e 22 &> run6_000.log

export OMP_NUM_THREADS=32
time ./omp-csr -s 20 -e 22 &> run6_000.log


echo "Attempt 7"
export OMP_NUM_THREADS=2
time ./omp-csr -s 20 -e 22 &> run6_000.log

export OMP_NUM_THREADS=4
time ./omp-csr -s 20 -e 22 &> run6_000.log

export OMP_NUM_THREADS=8
time ./omp-csr -s 20 -e 22 &> run6_000.log

export OMP_NUM_THREADS=12
time ./omp-csr -s 20 -e 22 &> run6_000.log

export OMP_NUM_THREADS=16
time ./omp-csr -s 20 -e 22 &> run6_000.log

export OMP_NUM_THREADS=32
time ./omp-csr -s 20 -e 22 &> run6_000.log


echo "Attempt 8"
export OMP_NUM_THREADS=2
time ./omp-csr -s 20 -e 22 &> run6_000.log

export OMP_NUM_THREADS=4
time ./omp-csr -s 20 -e 22 &> run6_000.log

export OMP_NUM_THREADS=8
time ./omp-csr -s 20 -e 22 &> run6_000.log

export OMP_NUM_THREADS=12
time ./omp-csr -s 20 -e 22 &> run6_000.log

export OMP_NUM_THREADS=16
time ./omp-csr -s 20 -e 22 &> run6_000.log

export OMP_NUM_THREADS=32
time ./omp-csr -s 20 -e 22 &> run6_000.log


echo "Attempt 9"
export OMP_NUM_THREADS=2
time ./omp-csr -s 20 -e 22 &> run6_000.log

export OMP_NUM_THREADS=4
time ./omp-csr -s 20 -e 22 &> run6_000.log

export OMP_NUM_THREADS=8
time ./omp-csr -s 20 -e 22 &> run6_000.log

export OMP_NUM_THREADS=12
time ./omp-csr -s 20 -e 22 &> run6_000.log

export OMP_NUM_THREADS=16
time ./omp-csr -s 20 -e 22 &> run6_000.log

export OMP_NUM_THREADS=32
time ./omp-csr -s 20 -e 22 &> run6_000.log

echo "Attempt 10"
export OMP_NUM_THREADS=2
time ./omp-csr -s 20 -e 22 &> run6_000.log

export OMP_NUM_THREADS=4
time ./omp-csr -s 20 -e 22 &> run6_000.log

export OMP_NUM_THREADS=8
time ./omp-csr -s 20 -e 22 &> run6_000.log

export OMP_NUM_THREADS=12
time ./omp-csr -s 20 -e 22 &> run6_000.log

export OMP_NUM_THREADS=16
time ./omp-csr -s 20 -e 22 &> run6_000.log

export OMP_NUM_THREADS=32
time ./omp-csr -s 20 -e 22 &> run6_000.log

