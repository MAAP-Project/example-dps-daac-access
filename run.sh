#!/bin/bash

# script for DPS algorithm.  
basedir=$( cd "$(dirname "$0")" ; pwd -P)

# create directory for the output. Used by src.py. 
makedir -p "${PWD}/output"

# Expects a .venv folder with a virtual environment and deps installed for src.py to run.  
source ${basedir}/.venv/bin/activate

python ${basedir}/src.py $1
