#!/bin/bash

basedir=$( cd "$(dirname "$0")" ; pwd -P)

python -m venv ${basedir}/.venv
source ${basedir}/.venv/bin/activate
pip install -r ${basedir}/requirements.txt