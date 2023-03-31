#!/bin/bash

# get the directory of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# get the parent dir of SCRIPT_DIR
REPO_DIR="$(dirname "${SCRIPT_DIR}")"
PARENT_DIR="$(dirname "${REPO_DIR}")"

# use clang-12
export CC=/usr/bin/clang-12
export CXX=/usr/bin/clang++-12


# build externals
# rm -rf ${REPO_DIR}/externals
python "${REPO_DIR}/Scripts/installExternals.py"  --build-variant Release -j 12 ${PARENT_DIR}/aurora_externals_root

# rm -rf ${REPO_DIR}/build
python "${REPO_DIR}/Scripts/deployHdAurora.py" \
                "--aurora_root=${REPO_DIR}" \
                "--externals_folder${PARENT_DIR}/aurora_externals_root \
                "--build_folder=${PARENT_DIR}/aurora_build" \
                "--config=Release" \
                "--build" \
                "${PARENT_DIR}/aurora_install/USD"
