#!/bin/bash

set -e

rm post_klipp_create.sh

# wldir=`pwd`
# cd ../../
# 
# git submodule update --init --recursive
# 
# cd "$wldir"

cd XXPRODUCT_NAMEXX
bundle install
chmod +x run_command_line_unit_tests.sh
pod install
./run_command_line_unit_tests.sh
cd ..

# x=`/usr/bin/osascript <<EOT
# tell application "Finder"
#   activate
#   set myReply to button returned of (display dialog "Open workspace in Xcode?")
# end tell
# EOT`
# if [[ $x = "OK" ]]; then 
#   open XXPRODUCT_NAMEXX/XXPRODUCT_NAMEXX.xcworkspace
# fi
# 
# echo ""