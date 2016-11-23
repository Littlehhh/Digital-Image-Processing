#include "opencv2/core/core.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"
#include <iostream>
using namespace cv;
using namespace std;

class myDFT {
private:
	Mat srcImage, complexI;
public:
	explicit myDFT(const String &filename) {
		srcImage = imread(filename, 0);//灰度模式
		if (!srcImage.data) 
			cout << "读取图片错误，请确定目录下是否有imread函数指定图片存在~！ ";
		}
	~myDFT() {
		}
		void Transform();
		void srcImageShow() {
			imshow("原始图片", srcImage);
			waitKey(1);
		}
		void resultShow();		
};
void myDFT::Transform()
{
	int m = getOptimalDFTSize(srcImage.rows);
	int n = getOptimalDFTSize(srcImage.cols);
	//扩展合适边界方便FFT执行
	Mat padded;
	copyMakeBorder(srcImage, padded, 0, m - srcImage.rows, 0, n - srcImage.cols, BORDER_CONSTANT, Scalar::all(0));
	//傅立叶变换的结果(实部和虚部)分配存储空间。
	//将planes数组组合合并成一个多通道的数组complexI
	Mat planes[] = { Mat_<float>(padded), Mat::zeros(padded.size(), CV_32F) };
	merge(planes, 2, complexI);
	//进行离散傅里叶变换
	dft(complexI, complexI);

}
void myDFT::resultShow()
{
	Mat planes[2];
	//将复数转换为幅值，即=> log(1 + sqrt(Re(DFT(I))^2 + Im(DFT(I))^2))
	split(complexI, planes); // 将多通道数组complexI分离成几个单通道数组，planes[0] = Re(DFT(I), planes[1] = Im(DFT(I))
	magnitude(planes[0], planes[1], planes[0]);// planes[0] = magnitude  
	Mat magnitudeImage = planes[0];

	//进行对数尺度(logarithmic scale)缩放
	magnitudeImage += Scalar::all(1);
	log(magnitudeImage, magnitudeImage);//求自然对数

	//剪切和重分布幅度图象限
	//若有奇数行或奇数列，进行频谱裁剪         @@@@一个有趣的长知识的地方  a&-2 = 小于a的整数 有意思
	magnitudeImage = magnitudeImage(Rect(0, 0, magnitudeImage.cols & -2, magnitudeImage.rows & -2));
	//重新排列傅立叶图像中的象限，使得原点位于图像中心  
	int cx = magnitudeImage.cols / 2;
	int cy = magnitudeImage.rows / 2;
	Mat q0(magnitudeImage, Rect(0, 0, cx, cy));   // ROI区域的左上
	Mat q1(magnitudeImage, Rect(cx, 0, cx, cy));  // ROI区域的右上
	Mat q2(magnitudeImage, Rect(0, cy, cx, cy));  // ROI区域的左下
	Mat q3(magnitudeImage, Rect(cx, cy, cx, cy)); // ROI区域的右下
	 //交换象限（左上与右下进行交换）
	Mat tmp;
	q0.copyTo(tmp);
	q3.copyTo(q0);
	tmp.copyTo(q3);
	//交换象限（右上与左下进行交换）
	q1.copyTo(tmp);
	q2.copyTo(q1);
	tmp.copyTo(q2);
	//归一化，用0到1之间的浮点值将矩阵变换为可视的图像格式
	normalize(magnitudeImage, magnitudeImage, 0, 1, NORM_MINMAX);
	imshow("频谱幅值", magnitudeImage);
	waitKey(0);
}


int main()
{
	myDFT a("lena.jpg");
	a.srcImageShow();
	a.Transform();
	a.resultShow();
	return 0;
}
