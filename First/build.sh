#!/bin/bash
SOURCE_DIR=$(cd $(dirname ${BASH_SOURCE:-0}) && pwd)
cd ${SOURCE_DIR}

###########
# manually
###########
# compile source files to object files（main.o, hello.o)
g++ -c main.cpp hello.cpp
# link object files to executable file(main) which default name is "a.out"
g++ -o main main.o hello.o

# make the executable file without object files
g++ main.cpp hello.cpp -o main

# check current directory files
ls -la

# execute
./main
ls *.o | xargs rm ; rm main

#################
# CMakeLists.txt
#################
# build sources in "build" directory
mkdir -p ${SOURCE_DIR}/build && cd ${SOURCE_DIR}/build
cmake .. && make

# check current directory files
ls -la

# execute
./a.out

cd ${SOURCE_DIR} && rm -rf build