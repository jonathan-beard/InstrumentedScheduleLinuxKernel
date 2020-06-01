//------------------------------------------------------------------------------------------------------------------------------
// Copyright Notice 
//------------------------------------------------------------------------------------------------------------------------------
// HPGMG, Copyright (c) 2014, The Regents of the University of
// California, through Lawrence Berkeley National Laboratory (subject to
// receipt of any required approvals from the U.S. Dept. of Energy).  All
// rights reserved.
// 
// If you have questions about your rights to use or distribute this
// software, please contact Berkeley Lab's Technology Transfer Department
// at  TTD@lbl.gov.
// 
// NOTICE.  This software is owned by the U.S. Department of Energy.  As
// such, the U.S. Government has been granted for itself and others
// acting on its behalf a paid-up, nonexclusive, irrevocable, worldwide
// license in the Software to reproduce, prepare derivative works, and
// perform publicly and display publicly.  Beginning five (5) years after
// the date permission to assert copyright is obtained from the U.S.
// Department of Energy, and subject to any subsequent five (5) year
// renewals, the U.S. Government is granted for itself and others acting
// on its behalf a paid-up, nonexclusive, irrevocable, worldwide license
// in the Software to reproduce, prepare derivative works, distribute
// copies to the public, perform publicly and display publicly, and to
// permit others to do so.
//------------------------------------------------------------------------------------------------------------------------------
// Samuel Williams
// SWWilliams@lbl.gov
// Lawrence Berkeley National Lab
//------------------------------------------------------------------------------------------------------------------------------
#define _GNU_SOURCE

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
//------------------------------------------------------------------------------------------------------------------------------
#ifdef USE_MPI
#include <mpi.h>
#endif
#ifdef _OPENMP
#include <omp.h>
#endif
//------------------------------------------------------------------------------------------------------------------------------
#include "timers.h"
#include "defines.h"
#include "level.h"
#include "mg.h"
#include "operators.h"
#include "solvers.h"
//------------------------------------------------------------------------------------------------------------------------------



/* MODIFICATIONS for instru ********************************************/
//#define __NR_hello 399

	
char input; 

#define __NR_get 293
#define __NR_set 292
#include <linux/kernel.h>
#include <sys/syscall.h>
#include <unistd.h>
#include <sys/types.h>
#include <errno.h>
//#include <assert.h>
#include <sys/time.h>
#include <time.h>


#include <sched.h> //for changing priorities and scheduler options

volatile unsigned int kappa = 0;

long hello_syscall(void)
{
	pid_t tid = syscall(SYS_gettid);
	return syscall(__NR_get, tid, &kappa);
}


float __attribute__ ((noinline)) dummy(float a){
	return (a+2.2);
}

void print_migrations(int offset){
	//PRINT OUTPUT
	int c;
	FILE *file;

	pid_t tid = syscall(SYS_gettid);

	char str[80];
	char num_str[80];
	strcpy(str, "/proc/");
	//  strcat(str, itoa(tid, num_str, 10));
	sprintf(num_str,"%d", tid + offset);
	strcat (str, num_str);
	strcat(str, "/migrations");
	printf ("Resulting string: %s", str);
	file = fopen(str, "r");
	if (file) {
		while ((c = getc(file)) != EOF)
			putchar(c);
		fclose(file);
	}
}

/*
   void migrate_me_around(unsigned int num){

   cpu_set_t cpu_mask;
   CPU_ZERO(&cpu_mask);
   CPU_SET(num, &cpu_mask);
   int err = sched_setaffinity(0, sizeof(cpu_set_t), &cpu_mask);
   assert(!err);
   }
   */





void bench_hpgmg(mg_type *all_grids, int onLevel, double a, double b, double rtol){
	int     doTiming;
	int    minSolves = 10; // do at least minSolves MGSolves
	double timePerSolve = 0;

	for(doTiming=0;doTiming<=1;doTiming++){ // first pass warms up, second pass times

#ifdef USE_HPM // IBM performance counters for BGQ...
		if( (doTiming==1) && (onLevel==0) )HPM_Start("FMGSolve()");
#endif

#ifdef USE_MPI
		double minTime   = 60.0; // minimum time in seconds that the benchmark should run
		double startTime = MPI_Wtime();
		if(doTiming==1){
			if((minTime/timePerSolve)>minSolves)minSolves=(minTime/timePerSolve); // if one needs to do more than minSolves to run for minTime, change minSolves
		}
#endif

		if(all_grids->levels[onLevel]->my_rank==0){
			if(doTiming==0){fprintf(stdout,"\n\n===== Warming up by running %d solves ==========================================\n",minSolves);}
			else{fprintf(stdout,"\n\n===== Running %d solves ========================================================\n",minSolves);}
			fflush(stdout);
		}

		int numSolves =  0; // solves completed
		MGResetTimers(all_grids);

		/* ROI  START*/
		/* LULESH INSTRUMENT MODIFICATIONS ************* */
		if(doTiming==1){ 
			

			if (input == 'R' ){

				/* MODIFICATIONS FOR SCHED FIFO PR HIGH RT */
				int policy = SCHED_FIFO;
				const int success = 0 ;
				/* schedule can be inherited so lets do it here for all */
				errno = success;
				//const auto priority( sched_get_priority_max( policy ) );
				int priority = sched_get_priority_max(policy);
				printf ("priority max (should be 99?)= %d\n\n", priority);

				const struct sched_param sp = { .sched_priority = priority };

				int sch_ret_val = sched_setscheduler(0, policy, &sp);

				//auto sch_ret_val( sched_setscheduler(0x0 /* this */, policy, &sp ) );

				if( sch_ret_val != success )
				{
					perror( "Failed to set scheduler\n" );
					exit( EXIT_FAILURE );
				}


				/* on error, return -1 and set errno */
				int my_current_sched = sched_getscheduler(0);
				printf ("my_current_sched= %d and schedfifo = %d\n\n", my_current_sched, SCHED_FIFO);

				exit(-1);
				/* MODIFICATIONS FOR SCHED FIFO PR HIGH RT */
			}
			if (input == 'y'){  
				long int a = hello_syscall();
				printf("System call returned %ld, and kappa is %d \n", a, kappa);
				pid_t tid = syscall(SYS_gettid);
				kappa = 1;
				syscall(__NR_set, tid, kappa);
				a = hello_syscall();
				perror("Error: ");
				printf("System call returned %ld, and kappa is %d for tid %d \n", a, kappa, tid);

				kappa = 1010;
				syscall(__NR_set, tid, kappa);
				/* This should enable system wide */
				printf ("System wide enabled \n");

			}

			if (input == 's'){   
				long int a = hello_syscall();
				printf("System call returned %ld, and kappa is %d \n", a, kappa);
				pid_t tid = syscall(SYS_gettid);
				kappa = 1;
				syscall(__NR_set, tid, kappa);
				a = hello_syscall();
				perror("Error: ");
				printf("System call returned %ld, and kappa is %d for tid %d \n", a, kappa, tid);
				// kappa = 1010;
				// syscall(__NR_set, tid, kappa);
				//  //This should enable system wide 
				printf ("System wide disabled \n");
				kappa = 1;
			}
		}
		/* LULESH INSTRUMENT MODIFICATIONS ************************************************************* */

		// BEGIN timestep to solution */
		struct timeval start;
		gettimeofday(&start, NULL) ;

		while( (numSolves<minSolves) ){
			zero_vector(all_grids->levels[onLevel],VECTOR_U);
#ifdef USE_FCYCLES
			FMGSolve(all_grids,onLevel,VECTOR_U,VECTOR_F,a,b,rtol);
#else
			MGSolve(all_grids,onLevel,VECTOR_U,VECTOR_F,a,b,rtol);
#endif
			numSolves++;
		}

		/* ROI STOP  */
		// Use reduced max elapsed time
		double elapsed_time;
		struct timeval end;
		gettimeofday(&end, NULL) ;


		if(doTiming==1){ 
			/* LULESH INSTRUMENT MODIFICATIONS ************************************************************* */
			kappa = 0;
			pid_t tid = syscall(SYS_gettid);
			syscall(__NR_set, tid, kappa);
			printf("Should be deactivated now.\n");

			float elapsedTime = (end.tv_sec - start.tv_sec) * 1000.0;      // sec to ms
			elapsedTime += (end.tv_usec - start.tv_usec) / 1000.0;   // us to ms
			printf ("\n elapsedTime %f ms \n", elapsedTime) ;


			kappa = 5; // 6 is DISABLE PRINT LARGE LOG
			tid = syscall(SYS_gettid);
			syscall(__NR_set, tid, kappa);

			print_migrations(0); //PRINT LARGE FOR THE FIRST ONE

			printf(" Large print finished. Disable large print log for the remainder of the threads, as we got a full copy \n");


			unsigned int max_thread_num = omp_get_max_threads();

			kappa = 6; // 6 is DISABLE PRINT LARGE LOG
			tid = syscall(SYS_gettid);
			syscall(__NR_set, tid, kappa);

			for (int i=1; i < max_thread_num; i++){
				print_migrations(i);
			}

			kappa = 2; /* Destroy stuff */
			syscall(__NR_set, tid, kappa);
			printf("Stuff should be deleted.\n");

			/* LULESH INSTRUMENT MODIFICATIONS ************************************************************* */


		}
#ifdef USE_MPI
		if(doTiming==0){
			double endTime = MPI_Wtime();
			timePerSolve = (endTime-startTime)/numSolves;
			MPI_Bcast(&timePerSolve,1,MPI_DOUBLE,0,MPI_COMM_WORLD); // after warmup, process 0 broadcasts the average time per solve (consensus)
		}
#endif

#ifdef USE_HPM // IBM performance counters for BGQ...
		if( (doTiming==1) && (onLevel==0) )HPM_Stop("FMGSolve()");
#endif
	}
}


//------------------------------------------------------------------------------------------------------------------------------
int main(int argc, char **argv){
	int my_rank=0;
	int num_tasks=1;
	int OMP_Threads = 1;

	//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
#ifdef _OPENMP
#pragma omp parallel 
	{
#pragma omp master
		{
			OMP_Threads = omp_get_num_threads();
		}
	}
#endif


	//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
	// initialize MPI and HPM
#ifdef USE_MPI
	int    actual_threading_model = -1;
	int requested_threading_model = -1;
	requested_threading_model = MPI_THREAD_SINGLE;
	//requested_threading_model = MPI_THREAD_FUNNELED;
	//requested_threading_model = MPI_THREAD_SERIALIZED;
	//requested_threading_model = MPI_THREAD_MULTIPLE;
#ifdef _OPENMP
	requested_threading_model = MPI_THREAD_FUNNELED;
	//requested_threading_model = MPI_THREAD_SERIALIZED;
	//requested_threading_model = MPI_THREAD_MULTIPLE;
#endif
	MPI_Init_thread(&argc, &argv, requested_threading_model, &actual_threading_model);
	MPI_Comm_size(MPI_COMM_WORLD, &num_tasks);
	MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);
#ifdef USE_HPM // IBM HPM counters for BGQ...
	HPM_Init();
#endif
#endif // USE_MPI


	//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
	// parse the arguments...
	int     log2_box_dim           =  6; // 64^3
	int     target_boxes_per_rank  =  1;
	//int64_t target_memory_per_rank = -1; // not specified
	int64_t box_dim                = -1;
	int64_t boxes_in_i             = -1;
	int64_t target_boxes           = -1;

	if(argc==3){
		log2_box_dim=atoi(argv[1]);
		target_boxes_per_rank=atoi(argv[2]);

		if(log2_box_dim>9){
			// NOTE, in order to use 32b int's for array indexing, box volumes must be less than 2^31 doubles
			if(my_rank==0){fprintf(stderr,"log2_box_dim must be less than 10\n");}
#ifdef USE_MPI
			MPI_Finalize();
#endif
			exit(0);
		}

		if(log2_box_dim<4){
			if(my_rank==0){fprintf(stderr,"log2_box_dim must be at least 4\n");}
#ifdef USE_MPI
			MPI_Finalize();
#endif
			exit(0);
		}

		if(target_boxes_per_rank<1){
			if(my_rank==0){fprintf(stderr,"target_boxes_per_rank must be at least 1\n");}
#ifdef USE_MPI
			MPI_Finalize();
#endif
			exit(0);
		}

#ifndef MAX_COARSE_DIM
#define MAX_COARSE_DIM 11
#endif
		box_dim=1<<log2_box_dim;
		target_boxes = (int64_t)target_boxes_per_rank*(int64_t)num_tasks;
		boxes_in_i = -1;
		int64_t bi;
		for(bi=1;bi<1000;bi++){ // search all possible problem sizes to find acceptable boxes_in_i
			int64_t total_boxes = bi*bi*bi;
			if(total_boxes<=target_boxes){
				int64_t coarse_grid_dim = box_dim*bi;
				while( (coarse_grid_dim%2) == 0){coarse_grid_dim=coarse_grid_dim/2;}
				if(coarse_grid_dim<=MAX_COARSE_DIM){
					boxes_in_i = bi;
				}
			}
		}
		if(boxes_in_i<1){
			if(my_rank==0){fprintf(stderr,"failed to find an acceptable problem size\n");}
#ifdef USE_MPI
			MPI_Finalize();
#endif
			exit(0);
		}
	} // argc==3

#if 0
	else if(argc==2){ // interpret argv[1] as target_memory_per_rank
		char *ptr = argv[1];
		char *tmp;
		target_memory_per_rank = strtol(ptr,&ptr,10);
		if(target_memory_per_rank<1){
			if(my_rank==0){fprintf(stderr,"unrecognized target_memory_per_rank... '%s'\n",argv[1]);}
#ifdef USE_MPI
			MPI_Finalize();
#endif
			exit(0);
		}
		tmp=strstr(ptr,"TB");if(tmp){ptr=tmp+2;target_memory_per_rank *= (uint64_t)(1<<30)*(1<<10);}
		tmp=strstr(ptr,"GB");if(tmp){ptr=tmp+2;target_memory_per_rank *= (uint64_t)(1<<30);}
		tmp=strstr(ptr,"MB");if(tmp){ptr=tmp+2;target_memory_per_rank *= (uint64_t)(1<<20);}
		tmp=strstr(ptr,"tb");if(tmp){ptr=tmp+2;target_memory_per_rank *= (uint64_t)(1<<30)*(1<<10);}
		tmp=strstr(ptr,"gb");if(tmp){ptr=tmp+2;target_memory_per_rank *= (uint64_t)(1<<30);}
		tmp=strstr(ptr,"mb");if(tmp){ptr=tmp+2;target_memory_per_rank *= (uint64_t)(1<<20);}
		if( (ptr) && (*ptr != '\0') ){
			if(my_rank==0){fprintf(stderr,"unrecognized units... '%s'\n",ptr);}
#ifdef USE_MPI
			MPI_Finalize();
#endif
			exit(0);
		}
		// FIX, now search for an 'acceptable' box_dim and boxes_in_i constrained by target_memory_per_rank, num_tasks, and MAX_COARSE_DIM
	} // argc==2
#endif


	else{
		if(my_rank==0){fprintf(stderr,"usage: ./hpgmg-fv  [log2_box_dim]  [target_boxes_per_rank]\n");}
		//fprintf(stderr,"       ./hpgmg-fv  [target_memory_per_rank[MB,GB,TB]]\n");}
#ifdef USE_MPI
	MPI_Finalize();
#endif
	exit(0);
}




//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
if(my_rank==0){
	fprintf(stdout,"\n\n");
	fprintf(stdout,"********************************************************************************\n");
	fprintf(stdout,"***                            HPGMG-FV Benchmark                            ***\n");
	fprintf(stdout,"********************************************************************************\n");
#ifdef USE_MPI
	if(requested_threading_model == MPI_THREAD_MULTIPLE  )fprintf(stdout,"Requested MPI_THREAD_MULTIPLE, ");
	else if(requested_threading_model == MPI_THREAD_SINGLE    )fprintf(stdout,"Requested MPI_THREAD_SINGLE, ");
	else if(requested_threading_model == MPI_THREAD_FUNNELED  )fprintf(stdout,"Requested MPI_THREAD_FUNNELED, ");
	else if(requested_threading_model == MPI_THREAD_SERIALIZED)fprintf(stdout,"Requested MPI_THREAD_SERIALIZED, ");
	else if(requested_threading_model == MPI_THREAD_MULTIPLE  )fprintf(stdout,"Requested MPI_THREAD_MULTIPLE, ");
	else                                                       fprintf(stdout,"Requested Unknown MPI Threading Model (%d), ",requested_threading_model);
	if(actual_threading_model    == MPI_THREAD_MULTIPLE  )fprintf(stdout,"got MPI_THREAD_MULTIPLE\n");
	else if(actual_threading_model    == MPI_THREAD_SINGLE    )fprintf(stdout,"got MPI_THREAD_SINGLE\n");
	else if(actual_threading_model    == MPI_THREAD_FUNNELED  )fprintf(stdout,"got MPI_THREAD_FUNNELED\n");
	else if(actual_threading_model    == MPI_THREAD_SERIALIZED)fprintf(stdout,"got MPI_THREAD_SERIALIZED\n");
	else if(actual_threading_model    == MPI_THREAD_MULTIPLE  )fprintf(stdout,"got MPI_THREAD_MULTIPLE\n");
	else                                                       fprintf(stdout,"got Unknown MPI Threading Model (%d)\n",actual_threading_model);
#endif
	fprintf(stdout,"%d MPI Tasks of %d threads\n",num_tasks,OMP_Threads);
	fprintf(stdout,"\n\n===== Benchmark setup ==========================================================\n");
}


//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// create the fine level...
#ifdef USE_PERIODIC_BC
int bc = BC_PERIODIC;
int minCoarseDim = 2; // avoid problems with black box calculation of D^{-1} for poisson with periodic BC's on a 1^3 grid
#else
int bc = BC_DIRICHLET;
int minCoarseDim = 1; // assumes you can drop order on the boundaries
#endif
level_type level_h;
int ghosts=stencil_get_radius();
create_level(&level_h,boxes_in_i,box_dim,ghosts,VECTORS_RESERVED,bc,my_rank,num_tasks);
#ifdef USE_HELMHOLTZ
double a=1.0;double b=1.0; // Helmholtz
if(my_rank==0)fprintf(stdout,"  Creating Helmholtz (a=%f, b=%f) test problem\n",a,b);
#else
double a=0.0;double b=1.0; // Poisson
if(my_rank==0)fprintf(stdout,"  Creating Poisson (a=%f, b=%f) test problem\n",a,b);
#endif
double h=1.0/( (double)boxes_in_i*(double)box_dim );  // [0,1]^3 problem
initialize_problem(&level_h,h,a,b);                   // initialize VECTOR_ALPHA, VECTOR_BETA*, and VECTOR_F
rebuild_operator(&level_h,NULL,a,b);                  // calculate Dinv and lambda_max
if(level_h.boundary_condition.type == BC_PERIODIC){   // remove any constants from the RHS for periodic problems
	double average_value_of_f = mean(&level_h,VECTOR_F);
	if(average_value_of_f!=0.0){
		if(my_rank==0){fprintf(stderr,"  WARNING... Periodic boundary conditions, but f does not sum to zero... mean(f)=%e\n",average_value_of_f);}
		shift_vector(&level_h,VECTOR_F,VECTOR_F,-average_value_of_f);
	}
}


//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// create the MG hierarchy...
mg_type MG_h;
MGBuild(&MG_h,&level_h,a,b,minCoarseDim);             // build the Multigrid Hierarchy 


//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// HPGMG-500 benchmark proper
// evaluate performance on problem sizes of h, 2h, and 4h
// (i.e. examine dynamic range for problem sizes N, N/8, and N/64)
double rtol=1e-10; // converged if ||b-Ax|| / ||b|| < rtol
int l;
#ifndef TEST_ERROR

// run at least 3 problem sizes with the caveat that the smallest is at least 16^3.
#define DYNAMIC_RANGE 3
double AverageSolveTime[DYNAMIC_RANGE];

printf("Turn migration REO on? (y/n/d/R/s (s = solely my PIDs, d = turn jumping off, R=realtime prio))\n");
	input = getc(stdin);
	printf ("read %c \n", input);
	if ( (input!='y') && (input!='d')  && (input!='R') && (input!='n') && (input!='s')){
		printf("\nim dead\n");
//		exit(-1);
	}

for(l=0;l<DYNAMIC_RANGE;l++){
	// if(problem size too small)break;
	if(l>0)restriction(MG_h.levels[l],VECTOR_F,MG_h.levels[l-1],VECTOR_F,RESTRICT_CELL);
	bench_hpgmg(&MG_h,l,a,b,rtol);
	AverageSolveTime[l] = (double)MG_h.timers.MGSolve / (double)MG_h.MGSolves_performed;
	if(my_rank==0){fprintf(stdout,"\n\n===== Timing Breakdown =========================================================\n");}
	MGPrintTiming(&MG_h,l);
}

if(my_rank==0){
#ifdef CALIBRATE_TIMER
	double _timeStart=getTime();sleep(1);double _timeEnd=getTime();
	double SecondsPerCycle = (double)1.0/(double)(_timeEnd-_timeStart);
#else
	double SecondsPerCycle = 1.0;
#endif
	fprintf(stdout,"\n\n===== Performance Summary ======================================================\n");
	for(l=0;l<DYNAMIC_RANGE;l++){
		// if(problem size too small)break;
		double DOF = (double)MG_h.levels[l]->dim.i*(double)MG_h.levels[l]->dim.j*(double)MG_h.levels[l]->dim.k;
		double seconds = SecondsPerCycle*(double)AverageSolveTime[l];
		double DOFs = DOF / seconds;
		fprintf(stdout,"  h=%0.15e  DOF=%0.15e  time=%0.6f  DOF/s=%0.3e  MPI=%d  OMP=%d\n",MG_h.levels[l]->h,DOF,seconds,DOFs,num_tasks,OMP_Threads);
	}
}

#endif // TEST_ERROR not defined

//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
if(my_rank==0){fprintf(stdout,"\n\n===== Richardson error analysis ================================================\n");}
// solve A^h u^h = f^h
// solve A^2h u^2h = f^2h
// solve A^4h u^4h = f^4h
// error analysis...
MGResetTimers(&MG_h);
for(l=0;l<3;l++){
	if(l>0)restriction(MG_h.levels[l],VECTOR_F,MG_h.levels[l-1],VECTOR_F,RESTRICT_CELL);
	zero_vector(MG_h.levels[l],VECTOR_U);
#ifdef USE_FCYCLES
	FMGSolve(&MG_h,l,VECTOR_U,VECTOR_F,a,b,rtol);
#else
	MGSolve(&MG_h,l,VECTOR_U,VECTOR_F,a,b,rtol);
#endif
}
richardson_error(&MG_h,0,VECTOR_U);


//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
if(my_rank==0){fprintf(stdout,"\n\n===== Deallocating memory ======================================================\n");}
MGDestroy(&MG_h);
destroy_level(&level_h);


//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
if(my_rank==0){fprintf(stdout,"\n\n===== Done =====================================================================\n");}

#ifdef USE_MPI
#ifdef USE_HPM // IBM performance counters for BGQ...
HPM_Print();
#endif
MPI_Finalize();
#endif
return(0);
//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}
