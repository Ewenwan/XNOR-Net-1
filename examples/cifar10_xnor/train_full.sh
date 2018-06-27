#!/usr/bin/env sh

TOOLS=../../build/tools

GLOG_log_dir=./log $TOOLS/caffe train \
    --gpu 6,7 \
    --solver=./cifar10_full.solver \
    --weights=../cifar10/cifar10_full_iter_40000.caffemodel
