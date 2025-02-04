#!/bin/bash                                                                                                 
#                                                                                                           
# CODA python dependencies

module load python/3.10.15-gcc

export PYTHON_VERS=3.10

export PYTHONPATH=$PYTHONPATH:${CODA_DEPS}/pyLOM                                                            
export PYTHONPATH=$PYTHONPATH:${CODA_DEPS}/mpi4py/build/lib.linux-x86_64-cpython-310
