#!/usr/bin/env sh

TOOLS=../../build/tools

$TOOLS/caffe train \
    --gpu=6,7 \
    --solver=./cifar10_conv2.solver \
    --weights=../cifar10/cifar10_full_iter_40000.caffemodel
