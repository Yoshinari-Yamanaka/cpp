#!/bin/bash

cmake --version
if [ $? -eq 0 ] ; then
    cd ~
    wget https://downloads.apache.org//xerces/c/3/sources/xerces-c-3.2.3.tar.gz
    tar xvzf xerces-c-3.2.3.tar.gz
    cd xerces-c-3.2.3
    ./configure && make && sudo make install

    ldconfig
fi