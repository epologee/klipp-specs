#!/bin/bash

set -e

# wldir=`pwd`
# cd ../../
# 
# git submodule update --init --recursive
# 
# cd "$wldir"

chmod +x run_command_line_unit_tests.sh

bundle install
pod install

rm post_klipp_create.sh

./run_command_line_unit_tests.sh