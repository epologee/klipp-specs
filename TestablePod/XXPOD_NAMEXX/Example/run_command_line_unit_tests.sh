#!/bin/sh

# http://9elements.com/io/index.php/continuous-integration-of-ios-projects-using-jenkins-cocoapods-and-kiwi/

xcodebuild 	-sdk iphonesimulator \
			-workspace XXPOD_NAMEXX.xcworkspace \
			-scheme CommandLineUnitTests \
			-configuration Debug RUN_APPLICATION_TESTS_WITH_IOS_SIM=YES ONLY_ACTIVE_ARCH=NO clean build \
			2>&1 | bundle exec ocunit2junit