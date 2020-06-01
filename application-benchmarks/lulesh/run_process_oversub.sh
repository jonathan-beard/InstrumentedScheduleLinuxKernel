#!/bin/bash

echo "Hello and welcome!"


threadnum_var=1

echo "Threads "
echo $threadnum_var

(printf "runtest_threads_%s.log" "$threadnum_var" | /custom_home/scytheb//Projects/scripts/python_scripts/process_single_file.py& ) &> post_process_results_threads_$threadnum_var.log

(( threadnum_var=threadnum_var*2 ))


echo "Threads "
echo $threadnum_var

(printf "runtest_threads_%s.log" "$threadnum_var" | /custom_home/scytheb//Projects/scripts/python_scripts/process_single_file.py& ) &> post_process_results_threads_$threadnum_var.log

(( threadnum_var=threadnum_var*2 ))


echo "Threads "
echo $threadnum_var

(printf "runtest_threads_%s.log" "$threadnum_var" | /custom_home/scytheb//Projects/scripts/python_scripts/process_single_file.py& ) &> post_process_results_threads_$threadnum_var.log

(( threadnum_var=threadnum_var*2 ))


echo "Threads "
echo $threadnum_var

(printf "runtest_threads_%s.log" "$threadnum_var" | /custom_home/scytheb//Projects/scripts/python_scripts/process_single_file.py& ) &> post_process_results_threads_$threadnum_var.log

(( threadnum_var=threadnum_var*2 ))


echo "Threads "
echo $threadnum_var

(printf "runtest_threads_%s.log" "$threadnum_var" | /custom_home/scytheb//Projects/scripts/python_scripts/process_single_file.py& ) &> post_process_results_threads_$threadnum_var.log

(( threadnum_var=threadnum_var*2 ))


echo "Threads "
echo $threadnum_var

(printf "runtest_threads_%s.log" "$threadnum_var" | /custom_home/scytheb//Projects/scripts/python_scripts/process_single_file.py& ) &> post_process_results_threads_$threadnum_var.log

(( threadnum_var=threadnum_var*2 ))


echo "Threads "
echo $threadnum_var

(printf "runtest_threads_%s.log" "$threadnum_var" | /custom_home/scytheb//Projects/scripts/python_scripts/process_single_file.py& ) &> post_process_results_threads_$threadnum_var.log

(( threadnum_var=threadnum_var*2 ))


echo "Threads "
echo $threadnum_var

(printf "runtest_threads_%s.log" "$threadnum_var" | /custom_home/scytheb//Projects/scripts/python_scripts/process_single_file.py& ) &> post_process_results_threads_$threadnum_var.log

(( threadnum_var=threadnum_var*2 ))


echo "Threads "
echo $threadnum_var

(printf "runtest_threads_%s.log" "$threadnum_var" | /custom_home/scytheb//Projects/scripts/python_scripts/process_single_file.py& ) &> post_process_results_threads_$threadnum_var.log

(( threadnum_var=threadnum_var*2 ))


echo "Threads "
echo $threadnum_var

(printf "runtest_threads_%s.log" "$threadnum_var" | /custom_home/scytheb//Projects/scripts/python_scripts/process_single_file.py& ) &> post_process_results_threads_$threadnum_var.log

(( threadnum_var=threadnum_var*2 ))


echo "Threads "
echo $threadnum_var

(printf "runtest_threads_%s.log" "$threadnum_var" | /custom_home/scytheb//Projects/scripts/python_scripts/process_single_file.py& ) &> post_process_results_threads_$threadnum_var.log

wait

echo "DONE! :) !"
