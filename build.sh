#!/bin/bash

if [ -z $HARMONY_NDK_HOME ]; then
    echo "HARMONY_NDK_HOME is not set"
    exit 1
fi

build_arch() {
    ARCH=$1
    $HARMONY_NDK_HOME/build-tools/cmake/bin/cmake \
        -DOHOS_STL=c++_shared \
        -DOHOS_ARCH=$ARCH \
        -DOHOS_PLATFORM=OHOS \
        -DCMAKE_TOOLCHAIN_FILE=$HARMONY_NDK_HOME/build/cmake/ohos.toolchain.cmake \
        -B build/$ARCH
    make -C build/$ARCH
}

build_arch arm64-v8a
build_arch x86_64
