#!/usr/bin/python
import os,sys
from argparse import Namespace
sys.path.insert(0, os.path.abspath('.'))
import hpgmgconf
hpgmgconf.configure(Namespace(CC='gcc', CFLAGS='-march=armv8-a+fp+simd -O3 -mcpu=cortex-a57 -fopenmp -g', CPPFLAGS='', LDFLAGS='', LDLIBS='', arch='aarch64', fe=False, fv=True, fv_coarse_solver='bicgstab', fv_cycle='F', fv_mpi=True, fv_smoother='gsrb', fv_subcomm=True, petsc_arch='', petsc_dir='', with_hpm=None))