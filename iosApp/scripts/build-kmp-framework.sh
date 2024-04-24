#!/bin/bash

# Usage: ./build_kmp_framework.sh BUILD(Debug/Release)

SCRIPT_PATH=${0}
BUILD=${1}

cd "$(dirname $SCRIPT_PATH)/../../"

./gradlew shared:assembleShared${BUILD}XCFramework

mkdir -p "./iosApp/CorePackage/build"
cp -r "shared/build/XCFrameworks/$BUILD/shared.xcframework" "./iosApp/CorePackage/build"
