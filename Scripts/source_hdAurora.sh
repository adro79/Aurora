#!/bin/bash

# get the directory of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# get the parent dir of SCRIPT_DIR
INSTALL_DIR="$(dirname "${SCRIPT_DIR}")"/install

export PXR_Dir="${INSTALL_DIR}/USD"
export PXR_ROOT="${INSTALL_DIR}/USD"
export PATH="${INSTALL_DIR}/USD/bin:${PATH}"
export PYTHONPATH="${INSTALL_DIR}/USD/lib/python:${PYTHONPATH}"
export LD_LIBRARY_PATH="${INSTALL_DIR}/USD/lib:${LD_LIBRARY_PATH}"
