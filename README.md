Digital Image Processing
======
It's some Matlab codes for Digital Image Processing.

****
### Author: Hui Wang
****

## Contents & Mainly functions of these codes
* Experiment1
  * Mainly functions
    * 数字图像的基本读写、显示与保存；五类图形显示方法
    * 读取图像并显示灰度图像、索引图像、RGB图像、二进制图像、多帧图像；进行图像类型转化
    * 编程实现最近邻法、双线性内插法（及它的改进方法）、双三次内插法的图像放大(全部考虑到RGB图而不光是适用于灰度图)
  * Problems
    * 双三次内插法的核函数是否有更好的形式?
* Experiment2
  * Mainly functions
    * 图像的直方图均衡
    * 图像的直方图规定化（匹配）
    * 局部直方图均衡
  * Problems
    * 如何客观评价直方图均衡及规定化的好坏？
* Experiment3
  * Mainly functions
    * 对图像添加椒盐噪声以及高斯噪声
    * 实现对图像的均值滤波、高斯滤波、中值滤波
    * 实现laplacian算子对图像的增强、Sobel算子对图像边缘提取
    * 使用均方误差和交叉熵对图像去噪效果进行了量化评价（客观评价）  
    ![公式](https://github.com/Littlehhh/Digital-Image-Processing/raw/master/Experiment%203/%E5%85%AC%E5%BC%8F.bmp)
    * 初步接触OpenCV库，用OpenCV库实现
      1. 高斯噪声处理
      2. 椒盐噪声处理
      3. Laplacian图像增强
      4. Sobel边缘提取
  * Problems
    * 个人感觉OpenCV的`WaitKey()`函数存在一些问题，也许是不懂吧
* Experiment4
  * Mainly functions
    * 充分利用matlab快速矩阵相乘实现`离散傅里叶变换`
    * 实现三种`快速傅里叶变换`（FFT）以及相应的逆变换包括一维变换及二维变换
      1. 时域抽取基-2FFT算法（递归版）
      2. 时域抽取基-2FFT算法（迭代版）  
      [蝴蝶算法](http://baike.baidu.com/link?url=j8vckQPUi1nJQ6DOKdfzX2b6bkKY_k5OoysXmvPi3UtLZh79xUwv22Ql-jYtK3N92ZVIx4IazVqktz6y8uDmlINQBxADuyutcel6PrM0g4LovLLHCIT1tYX_-Uhv2rrE5yQhVwcboqF0YvxVmaMq9niilwuITWyqgWogEE2s4BK)  
      ![蝴蝶算法](https://github.com/Littlehhh/Digital-Image-Processing/raw/master/Experiment%204/%E5%85%AC%E5%BC%8F.bmp)
      3. 基于稀疏矩阵分解的FFT  
      [参考书：快速傅里叶变换：算法与应用](http://baike.baidu.com/link?url=eOVkAB4fxqUbWyOtwALgyRGu1dxbt5YvCST0RTyzN616fo_64R2GKRHo05Ng9wcMF_JuEemPqGDT2v6HgbNal9Ee-7vgPeL2E-QePH5ujk5RaWLoFxnQR7MbBBzPhbiy1EvxcLtu2vFPPsD_dT_DPL7yxrR08Ns8Rnno-rRY7jPOTWwME5_iIq0o40WoBg9ROhx5qxXVhYG0KjkGIxHIeLHdOMQJlyRa6_CZJ5m-8YS)
      4. 对算法进行了运行时间测试并与Matlab自带fft进行了比较
    * 利用`FFT2()`实现二维高斯光束的菲涅尔衍射和夫琅禾费衍射
    * 使用C++ & OpenCV实现了基本的快速傅里叶变换类`class myDFT()`
  * Problems
    * Matlab申请内存空间的函数实在是太慢了，严重拖慢FFT的运行速度，而它的矩阵运算是真的快，这种时候C/C++的优势就体现出来了
  * Extra  
  ![fftw-logo](http://www.fftw.org/fftw-logo-med.gif)
    * [一个著名的开源FFT库:fftw](http://www.fftw.org/) （Matlab的fft的底层库）
* Experiment5
  * Mainly functions
    * 编程实现了图像的理想低通、高斯低通 、布特沃斯低通滤波及相应的高通滤波
    * 实现陷波（带阻、带通）滤波器对图像进行滤波
    * 对一幅图像进行运动模糊并加高斯噪声，然后对图像进行逆滤波、维纳滤波进行图像复原
    * 初步接触QT框架，利用C++ & OpenCV & QTcreator实现了一个频域滤波GUI小软件（可打包单独运行）  
    ![软件截图](https://github.com/Littlehhh/Digital-Image-Processing/raw/master/Experiment%205/%E6%88%AA%E5%9B%BE.bmp)
  * Problems
    * 限波滤波器对图像进行滤波只能以人机交互的方式，没有普适性，是个遗憾
* Experiment6
  * Mainly functions
    * 实现将`RGB`图像转为`HSI`三分量的程序
    * 实现将`HSI`图像转为`RGB`三分量的程序
    * 实现彩色图像直方图均衡
    * 编写用户交互的自定义伪彩色处理小软件  
    ![软件截图](https://github.com/Littlehhh/Digital-Image-Processing/raw/master/Experiment%206/%E6%88%AA%E5%9B%BE.bmp)
* Experiment7
  * Mainly functions
    * 实现图像基本形态学处理（腐蚀、膨胀、开运算、闭运算）
    * 实现提取给定图像不同形状的结构元素特征（使用形态学开运算和闭运算）
    * 实现对酵母细胞以及酵母细胞核的图像分割
      1. Otus方法
      2. 拉普拉斯为基础的边缘信息改进  冈萨雷斯数字图像处理p485
* FP（指纹识别）
