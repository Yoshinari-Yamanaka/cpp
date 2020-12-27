#!/bin/bash

SOURCE_DIR=$(cd $(dirname ${BASH_SOURCE:-0}) && pwd)

# build
mkdir -p build && cd build
cmake .. && make

# copy sample.xml
if [ $? -eq 0 ] ; then
    cp ${SOURCE_DIR}/test/sample.xml ${SOURCE_DIR}/build/test
fi