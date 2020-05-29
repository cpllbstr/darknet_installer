#!/bin/bash
git clone https://github.com/AlexeyAB/darknet
cd ./darknet
sed 's/GPU=0/GPU=1/' ./Makefile
sed 's/CUDNN=0/CUDNN=1/' ./Makefile
sed 's/LIBSO=0/LIBSO=1/' ./Makefile
make -j4
sudo cp libdarknet.so /usr/lib/libdarknet.so && sudo cp include/darknet.h /usr/local/include/darknet.h