#!/bin/bash
SOURCE_DIR=$(cd $(dirname ${BASH_SOURCE:-0}) && pwd)
cd ${SOURCE_DIR}

BLUE="\033[34m"
END="\033[0m"

##########################################
# manually build Static Link library
##########################################
echo -e "${BLUE}manually build Static Link library${END}"
cd ${SOURCE_DIR}/src
# make object files
g++ -c hello.cpp good_morning.cpp -I../include
# make static library with object files
# r -> add member , v -> verbose s -> add index to archive
ar rvs libgreetings.a hello.o good_morning.o
cd ${SOURCE_DIR}/test
# g++ main.cpp -I path to "include" directory -L path to "static library" -l the file name of static library
g++ main.cpp -I../include -L../src -lgreetings -Xlinker -rpath -Xlinker ../src
./a.out

ls ${SOURCE_DIR}/src/*.o | xargs rm -f
ls ${SOURCE_DIR}/src/*.a | xargs rm -f
ls ${SOURCE_DIR}/test/*.out | xargs rm -f

##########################################
# manually build Shared (Dynamic) Link library
##########################################
echo -e "${BLUE}manually build Shared (Dynamic) Link library${END}"
cd ${SOURCE_DIR}/src
# make object files
g++ -fPIC -c hello.cpp good_morning.cpp -I../include
# make shared libraries with object files
g++ -shared *.o -o libgreetings.so
cd ${SOURCE_DIR}/test

# g++ main.cpp -I path to "include" directory -L path to "static library" -l the file name of static library
g++ main.cpp -I../include -L../src -lgreetings -Xlinker -rpath -Xlinker ../src
./a.out

ls ${SOURCE_DIR}/src/*.o | xargs rm -f
ls ${SOURCE_DIR}/src/*.so | xargs rm -f
ls ${SOURCE_DIR}/test/*.out | xargs rm -f


########################################
# Static Link library with CMakeLists.txt
########################################
echo -e "${BLUE}Static Link library CMakeLists.txt${END}"
mkdir -p ${SOURCE_DIR}/build
cd ${SOURCE_DIR}/build
cmake -DGREETINGS_BUILD_SHARED_LIBS=OFF .. && make

./test/main
cd ${SOURCE_DIR}
rm -r ${SOURCE_DIR}/build

##########################################
# Shared (Dynamic) Link library with CMakeLists.txt
##########################################
echo -e "${BLUE}Shared (Dynamic) Link library CMakeLists.txt${END}"
mkdir -p ${SOURCE_DIR}/build
cd ${SOURCE_DIR}/build
cmake -DGREETINGS_BUILD_SHARED_LIBS=ON .. && make

./test/main
cd ${SOURCE_DIR} && rm -r ${SOURCE_DIR}/build