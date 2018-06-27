#!/usr/bin/env sh
# This script converts the cifar data into leveldb format.

EXAMPLE=examples/cifar10         # 需要存放转换后文件的地址
DATA=data/cifar-10-batches-bin   # 源数据集地址
DBTYPE=lmdb                      # 转换后的格式

echo "Creating $DBTYPE..."
# 删除原来的
rm -rf $EXAMPLE/cifar10_train_$DBTYPE $EXAMPLE/cifar10_test_$DBTYPE
# 转换
./build/examples/cifar10/convert_cifar_data.bin $DATA $EXAMPLE $DBTYPE

echo "Computing image mean..."
# 计算均值
./build/tools/compute_image_mean -backend=$DBTYPE \
  $EXAMPLE/cifar10_train_$DBTYPE $EXAMPLE/mean.binaryproto

echo "Done."
