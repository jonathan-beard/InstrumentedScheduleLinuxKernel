#! /bin/bash

echo "Running Lulesh then COMD then Graph500 then hpgmg-fv for 10 runs with instrumentation. Assume all in suite folder"

./run_threading.sh
dmesg > dmesg_dump_latest
pwd
cd ../CoMD/
pwd
./run_threading.sh
dmesg > dmesg_dump_latest
cd ../graph500/omp-csr
pwd
./run_benchmark.sh
dmesg > dmesg_dump_latest
cd ../../hpgmg/aarch64/bin
pwd
./run_threading.sh
dmesg > dmesg_dump_latest
