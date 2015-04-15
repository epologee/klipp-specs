#!/bin/bash

set -e
rm post_klipp_create.sh

cd XXPOD_NAMEXX/Example
chmod +x run_command_line_unit_tests.sh
pod install
cd ../..