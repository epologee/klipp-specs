#!/bin/bash

set -e

rm post_klipp_create.sh

# wldir=`pwd`
# cd ../../
# 
# git submodule update --init --recursive
# 
# cd "$wldir"

chmod +x run_command_line_unit_tests.sh

bundle install

cd XXPRODUCT_NAMEXX
pod install
sh run_command_line_unit_tests.sh
cd ..

