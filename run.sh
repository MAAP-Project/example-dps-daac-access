#!/bin/bash

# script for DPS algorithm

basedir=$( cd "$(dirname "$0")" ; pwd -P)

python ${basedir}/src.py $1
