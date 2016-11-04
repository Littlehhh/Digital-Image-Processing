#include<opencv2/opencv.hpp>
#include<iostream>
using namespace cv;
using namespace std;
void Menu()
{
	cout << endl;
	cout << endl;
	
	cout << "\t\tPowered by OpenCV" << endl;
	cout << endl;
	cout << "\t\t\t\t   1 高斯噪声处理" << endl;
	cout << "\t\t\t\t   2 椒盐噪声处理" << endl;
	cout << "\t\t\t\t   3 Laplacian图像增强" << endl;
	cout << "\t\t\t\t   4 Sobel边缘提取" << endl;
	cout << "一个小问题：每次选完选项看到图之后请先按任意键或者将所有图关闭之后再进行下面的操作" << endl;

}
void mySobel(Mat &src);



int main()
{			//定义Mat类对象并读入图片
	system("cls");
	Mat input_salt = imread("circuitboardNoise-salt.tif");
	Mat input_gaussian = imread("circuitboardNoise-gaussian.tif");
	Mat input_laplacian = imread("moon.tif");
	Mat input_sobel = imread("lena.jpg");
	Mat outImg_ave,outImg_median,outImg_gaussian, output_laplacian;
	//CV_EXPORTS_W Mat imread(const String& filename, int flags = IMREAD_COLOR);
	Menu();
	int select;
	
	while (1)
	{
		cin >> select;
		switch (select)
		{	//显示图片
		case 1:	imshow("高斯噪声原图像", input_gaussian); 
			blur(input_gaussian, outImg_ave, Size(5, 5));
			medianBlur(input_gaussian, outImg_median, 5);
			GaussianBlur(input_gaussian, outImg_gaussian, Size(5, 5),0,0);
			imshow("高斯噪声均值滤波处理图像", outImg_ave);
			imshow("高斯噪声中值滤波处理图像", outImg_median);
			imshow("高斯噪声高斯滤波处理图像", outImg_gaussian); waitKey(0); break;
		case 2:	imshow("椒盐噪声原图像", input_salt); 
			blur(input_salt, outImg_ave, Size(3, 3));
			medianBlur(input_salt, outImg_median, 3);
			imshow("椒盐噪声均值滤波处理图像", outImg_ave);
			imshow("椒盐噪声中值滤波处理图像", outImg_median);waitKey(0);break;
		case 3: imshow("拉普拉斯算子处理原始图", input_laplacian);
			Laplacian(input_laplacian, output_laplacian,CV_16S, 3, 1, 0, BORDER_DEFAULT);
			convertScaleAbs(output_laplacian, output_laplacian);// 计算绝对值，并将结果转换成8位
			output_laplacian += input_laplacian;
			imshow("拉普拉斯图像增强", output_laplacian); waitKey(0); break;
		case 4:mySobel(input_sobel);
		default: cout << "Please Enter 1 ~ 4 ." << endl;break;
			
			//while (char(waitKey(1)) != 'q') {}
		}

		

	}
}	

void mySobel(Mat &src)
{
	//创建 grad_x 和 grad_y 矩阵
	Mat grad_x, grad_y;
	Mat abs_grad_x, abs_grad_y, dst;
	imshow("【原始图】sobel边缘检测", src);
	//求 X方向梯度
	Sobel(src, grad_x, CV_16S, 1, 0, 3, 1, 1, BORDER_DEFAULT);
	convertScaleAbs(grad_x, abs_grad_x);
	imshow("【效果图】 X方向Sobel", abs_grad_x);

	//求Y方向梯度
	Sobel(src, grad_y, CV_16S, 0, 1, 3, 1, 1, BORDER_DEFAULT);
	convertScaleAbs(grad_y, abs_grad_y);
	imshow("【效果图】Y方向Sobel", abs_grad_y);

	//合并梯度(近似)
	dst = abs_grad_x + abs_grad_y;
	//addWeighted(abs_grad_x, 0.5, abs_grad_y, 0.5, 0, dst);
	imshow("【效果图】整体方向Sobel", dst);

	waitKey(0);
}

//	//CV_EXPORTS_W void imshow(const String& winname, InputArray mat);
//
//	//均值滤波  以下两种均可
////	boxFilter(input_gaussian, outImg_ave, input_gaussian.depth(), Size(3,3),Point(-1,-1),true);
//	blur(input_gaussian, outImg_ave, Size(3, 3));
//	//CV_EXPORTS_W void boxFilter(InputArray src, OutputArray dst, int ddepth,
//	//	Size ksize, Point anchor = Point(-1, -1),
//	//	bool normalize = true,
//	//	int borderType = BORDER_DEFAULT);
//	//CV_EXPORTS_W void blur(InputArray src, OutputArray dst,
//	//	Size ksize, Point anchor = Point(-1, -1),
//	//	int borderType = BORDER_DEFAULT);
//
//	//中值滤波
//	medianBlur(input_gaussian, outImg_median, 3);
//	//CV_EXPORTS_W void medianBlur(InputArray src, OutputArray dst, int ksize);
//
//	//高斯滤波
//	GaussianBlur(input_gaussian, outImg_median, Size(3,3), 0);
//	//CV_EXPORTS_W void GaussianBlur(InputArray src, OutputArray dst, Size ksize,
//	//	double sigmaX, double sigmaY = 0,
//	//	int borderType = BORDER_DEFAULT);
//
//	imshow("椒盐噪声中值滤波处理图像", outImg_median);
//	imshow("椒盐噪声均值滤波处理图像", outImg_ave);
//	
//	
//	//imshow("高斯噪声原图像", input_gaussian);
//	//保持窗口 任意键退出
//	waitKey(0);




