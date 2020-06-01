#This is the first attempt at standardizing the Benchmark Suite that we run on the softirons, mostly using OpenMP for threading with some benchmarks using MPI as well.


#GENERAL BUILD FLAGS  

#GCC:   
CXXFLAGS = -march=armv8-a+fp+simd -O3 -mcpu=cortex-a57 -fopenmp -I. -Wall   
LDFLAGS = -march=armv8-a+fp+simd -O3 -mcpu=cortex-a57 -fopenmp   
                                                                      

#Lulesh Flags    -----------------------------------------------------------   
Makefile modified to use OMP version with Threads
export / setenv OMP_NUM_THREADS 4/8/16 to change parallelism levels
QuickTest: -p -s 40 -i 20 
LongTest -p -s 40 -i 200  
Large problem Size: -s 180 -i 10 

  
#CoMD    -------------------------------------------------------------------   
CoMD/examples$ ../bin/CoMD-openmp-mpi -e -x 32 -y 32 -z 32 -N 20 - T 4000   
 -e -x 40 -y 40 -z 40 -N 20 - T 4000   
#Scale CoMD to more processors   
- mpirun -np 8 ../bin/CoMD-openmp-mpi -e -i 2 -j 2 -k 2 -x 40 -y 40 -z 40  
- or use OMP only version, with OMP_NUM THREADS 
   
#HPCG   --------------------------------------------------------------------   
#Build   
CXXFLAGS     = -march=armv8-a+fp+simd -mcpu=cortex-a57 -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -fopenmp   
#Build with MPI enabled.   
#Build with OpenMP enabled.   
   
#Input flags   
HPCG benchmark input file   
Sandia National Laboratories; University of Tennessee, Knoxville   
32 24 16   
60   
   
#Cloverleaf  --------------------------------------------------------------   
#Build    
-funroll-loops -march=armv8-a+fp+simd -O3 -mcpu=cortex-a57 -fopenmp   
export OMP_NUM_THREADS=8   
#Input   
*clover   
   
 state 1 density=0.2 energy=1.0   
 state 2 density=1.0 energy=2.5 geometry=rectangle xmin=0.0 xmax=5.0 ymin=0.0 ymax=2.0   
   
 x_cells=960   
 y_cells=960   
   
 xmin=0.0   
 ymin=0.0   
 xmax=10.0   
 ymax=10.0   
   
 initial_timestep=0.04   
 timestep_rise=1.5   
 max_timestep=0.04   
 end_step=87   
 test_problem 2   
   
*endclover   
   
   
#HPL (High performance Linpack)  ----------------------------------------   
Guide to build and required tools in list for benchmarks file   
#inputs (with mpirun -np 8)   
HPLinpack benchmark input file   
Innovative Computing Laboratory, University of Tennessee   
HPL.out      output file name (if any)   
6            device out (6=stdout,7=stderr,file)   
1            # of problems sizes (N)   
25040         Ns   
1            # of NBs   
128          NBs   
0            PMAP process mapping (0=Row-,1=Column-major)   
1            # of process grids (P x Q)   
2            Ps   
4            Qs   
16.0         threshold   
1            # of panel fact  
2            PFACTs (0=left, 1=Crout, 2=Right)  
1            # of recursive stopping criterium  
4            NBMINs (>= 1)  
1            # of panels in recursion  
2            NDIVs  
1            # of recursive panel fact.  
1            RFACTs (0=left, 1=Crout, 2=Right)  
1            # of broadcast  
1            BCASTs (0=1rg,1=1rM,2=2rg,3=2rM,4=Lng,5=LnM)  
1            # of lookahead depth  
1            DEPTHs (>=0)  
2            SWAP (0=bin-exch,1=long,2=mix)  
64           swapping threshold  
0            L1 in (0=transposed,1=no-transposed) form  
0            U  in (0=transposed,1=no-transposed) form  
1            Equilibration (0=no,1=yes)  
8            memory alignment in double (> 0)  
  
#PARSEC SUITE   
#Compiled: x264(pthreads) blackscholes(omp4) dedup(omp4) facesim(omp4) ferret(omp4) fluidanimate(omp4) freqmine(omp4)   
#to run: export ROOT= <pwd>  
./<BENCH>/bench/run.sh <mode (e.g. omp4)> native 8 (dataset and number of threads)  
  
#graph500
#build flags
CFLAGS = -g -std=c99 -Wall -O3 -march=armv8-a+fp+simd -mcpu=cortex-a57
LDLIBS = -lm -lrt
BUILD_OPENMP = Yes
CFLAGS_OPENMP = -fopenmp
#Input:
./omp-csr -s 19 -e 22 -V
#when using export and sudo, use -E flag to copy environment
e.g. sudo -E perf stat -B ./omp-csr -s 18 -V 

#HPGMG Benchmark

#built with
./configure --arch aarch64 --CC gcc --CFLAGS '-march=armv8-a+fp+simd -O3 -mcpu=cortex-a57 -fopenmpi -g' 
+Manually disable MPI from Makefile by removing define

#Run with 
./hpgmg-fv 6 40

