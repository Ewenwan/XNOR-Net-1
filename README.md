# XNOR-Net (The best training effect of AlexNet-Xnor is around 40%, 4% lower than the paper).

# 准备数据集  CIFAR-10  图片分类数据集
    该数据集共有60000张彩色图像，这些图像是32*32，分为10个类，每类6000张图。
    
    这里面有50000张用于训练，构成了5个训练批，每一批10000张图；
    另外10000用于测试，单独构成一批。
    
    测试批的数据里，取自10类中的每一类，每一类随机取1000张。
    抽剩下的就随机排列组成了训练批。
    注意一个训练批中的各类图像并不一定数量相同，
    总的来看训练批，每一类都有5000张图。
    
    飞机、汽车、鸟、猫、鹿、狗、青蛙、马、船舶、火车
``` 
  cd $CAFFE_ROOT
  ./data/cifar10/get_cifar10.sh         // 下载数据集
```

# 处理数据集 数据集格式转换  

./examples/cifar10/create_cifar10.sh  // 转换成caffe需要的 leveldb数据库格式
可以得到：

 `./cifar10-leveldb`,  leveldb数据库格式 文件
 `./mean.binaryproto`. 数据集 图像 各通道均值
 
 
 #  训练模型  提供网络定义文件 和 训练参数文件
```
cd $CAFFE_ROOT
./examples/cifar10/train_quick.sh   训练脚本
```

载入模型时的显示：

    载入模型文件  显示每一层的输入输出信息
        I0317 21:52:48.945710 2008298256 net.cpp:74] Creating Layer conv1
        I0317 21:52:48.945716 2008298256 net.cpp:84] conv1 <- data
        I0317 21:52:48.945725 2008298256 net.cpp:110] conv1 -> conv1
        I0317 21:52:49.298691 2008298256 net.cpp:125] Top shape: 100 32 32 32 (3276800)
        I0317 21:52:49.298719 2008298256 net.cpp:151] conv1 needs backward computation.
        
网络初始化完成：

    I0317 21:52:49.309370 2008298256 net.cpp:166] Network initialization done.
    I0317 21:52:49.309376 2008298256 net.cpp:167] Memory required for Data 23790808
    I0317 21:52:49.309422 2008298256 solver.cpp:36] Solver scaffolding done.
    I0317 21:52:49.309447 2008298256 solver.cpp:47] Solving CIFAR10_quick_train
    
训练记录- loss lr学习率：


    I0317 21:53:12.179772 2008298256 solver.cpp:208] Iteration 100, lr = 0.001       学习率
    I0317 21:53:12.185698 2008298256 solver.cpp:65] Iteration 100, loss = 1.73643   损失
    ...
    I0317 21:54:41.150030 2008298256 solver.cpp:87] Iteration 500, Testing net
    I0317 21:54:47.129461 2008298256 solver.cpp:114] Test score #0: 0.5504         测试准确率
    I0317 21:54:47.129500 2008298256 solver.cpp:114] Test score #1: 1.27805        测试损失
    
训练完成：

    I0317 22:12:19.666914 2008298256 solver.cpp:87] Iteration 5000, Testing net
    I0317 22:12:25.580330 2008298256 solver.cpp:114] Test score #0: 0.7533
    I0317 22:12:25.580379 2008298256 solver.cpp:114] Test score #1: 0.739837
    I0317 22:12:25.587262 2008298256 solver.cpp:130] Snapshotting to cifar10_quick_iter_5000
    I0317 22:12:25.590215 2008298256 solver.cpp:137] Snapshotting solver state to cifar10_quick_iter_5000.solverstate
    I0317 22:12:25.592813 2008298256 solver.cpp:81] Optimization Done.
    
    
    
