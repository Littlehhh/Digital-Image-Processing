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
	cout << "\t\t\t\t   1 ��˹��������" << endl;
	cout << "\t\t\t\t   2 ������������" << endl;
	cout << "\t\t\t\t   3 Laplacianͼ����ǿ" << endl;
	cout << "\t\t\t\t   4 Sobel��Ե��ȡ" << endl;
	cout << "һ��С���⣺ÿ��ѡ��ѡ���ͼ֮�����Ȱ���������߽�����ͼ�ر�֮���ٽ�������Ĳ���" << endl;

}
void mySobel(Mat &src);



int main()
{			//����Mat����󲢶���ͼƬ
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
		{	//��ʾͼƬ
		case 1:	imshow("��˹����ԭͼ��", input_gaussian); 
			blur(input_gaussian, outImg_ave, Size(5, 5));
			medianBlur(input_gaussian, outImg_median, 5);
			GaussianBlur(input_gaussian, outImg_gaussian, Size(5, 5),0,0);
			imshow("��˹������ֵ�˲�����ͼ��", outImg_ave);
			imshow("��˹������ֵ�˲�����ͼ��", outImg_median);
			imshow("��˹������˹�˲�����ͼ��", outImg_gaussian); waitKey(0); break;
		case 2:	imshow("��������ԭͼ��", input_salt); 
			blur(input_salt, outImg_ave, Size(3, 3));
			medianBlur(input_salt, outImg_median, 3);
			imshow("����������ֵ�˲�����ͼ��", outImg_ave);
			imshow("����������ֵ�˲�����ͼ��", outImg_median);waitKey(0);break;
		case 3: imshow("������˹���Ӵ���ԭʼͼ", input_laplacian);
			Laplacian(input_laplacian, output_laplacian,CV_16S, 3, 1, 0, BORDER_DEFAULT);
			convertScaleAbs(output_laplacian, output_laplacian);// �������ֵ���������ת����8λ
			output_laplacian += input_laplacian;
			imshow("������˹ͼ����ǿ", output_laplacian); waitKey(0); break;
		case 4:mySobel(input_sobel);
		default: cout << "Please Enter 1 ~ 4 ." << endl;break;
			
			//while (char(waitKey(1)) != 'q') {}
		}

		

	}
}	

void mySobel(Mat &src)
{
	//���� grad_x �� grad_y ����
	Mat grad_x, grad_y;
	Mat abs_grad_x, abs_grad_y, dst;
	imshow("��ԭʼͼ��sobel��Ե���", src);
	//�� X�����ݶ�
	Sobel(src, grad_x, CV_16S, 1, 0, 3, 1, 1, BORDER_DEFAULT);
	convertScaleAbs(grad_x, abs_grad_x);
	imshow("��Ч��ͼ�� X����Sobel", abs_grad_x);

	//��Y�����ݶ�
	Sobel(src, grad_y, CV_16S, 0, 1, 3, 1, 1, BORDER_DEFAULT);
	convertScaleAbs(grad_y, abs_grad_y);
	imshow("��Ч��ͼ��Y����Sobel", abs_grad_y);

	//�ϲ��ݶ�(����)
	dst = abs_grad_x + abs_grad_y;
	//addWeighted(abs_grad_x, 0.5, abs_grad_y, 0.5, 0, dst);
	imshow("��Ч��ͼ�����巽��Sobel", dst);

	waitKey(0);
}

//	//CV_EXPORTS_W void imshow(const String& winname, InputArray mat);
//
//	//��ֵ�˲�  �������־���
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
//	//��ֵ�˲�
//	medianBlur(input_gaussian, outImg_median, 3);
//	//CV_EXPORTS_W void medianBlur(InputArray src, OutputArray dst, int ksize);
//
//	//��˹�˲�
//	GaussianBlur(input_gaussian, outImg_median, Size(3,3), 0);
//	//CV_EXPORTS_W void GaussianBlur(InputArray src, OutputArray dst, Size ksize,
//	//	double sigmaX, double sigmaY = 0,
//	//	int borderType = BORDER_DEFAULT);
//
//	imshow("����������ֵ�˲�����ͼ��", outImg_median);
//	imshow("����������ֵ�˲�����ͼ��", outImg_ave);
//	
//	
//	//imshow("��˹����ԭͼ��", input_gaussian);
//	//���ִ��� ������˳�
//	waitKey(0);




