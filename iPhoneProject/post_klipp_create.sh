#!/bin/bash

set -e
rm post_klipp_create.sh

cd XXPRODUCT_NAMEXX
chmod +x run_command_line_unit_tests.sh
pod install
./run_command_line_unit_tests.sh
cd ..