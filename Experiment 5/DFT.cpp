#include "DFT.h"
#include <QDebug>


myDFT::myDFT()
{

}

myDFT::myDFT(Mat &srcImg)
    :srcImage(srcImg)
{
		
}
void myDFT::getsrcImage(Mat &Image)
{
    this->srcImage = Image;

}

myDFT::myDFT(const String &filename) {
		srcImage = imread(filename, 0);//灰度模式
		if (!srcImage.data) 
			cout << "读取图片错误，请确定目录下是否有imread函数指定图片存在~！ ";
}
void myDFT::srcImageShow() 
{
	imshow("原始图片", srcImage);
	waitKey(1);
}
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
    normalize(magnitudeImage, dst, 0, 1, NORM_MINMAX);
    //qDebug()<<dst.type()<<dst.channels();
    //namedWindow("test");
    //imshow("test", dst);
    //waitKey(10);
}

Mat &myDFT:: getdst()
{
    return dst;
}

Mat &myDFT:: getfilter()
{
    return filter;
}
Mat &myDFT:: getfilter_result()
{
    return filter_result;
}
void myDFT::Filter_mask(int type,int size)
{
    //滤波器生成函数
    filter = Mat::zeros(dst.size(), CV_32F);


	switch (type)
	{

    case 0://Ideal LP
        if(size != 0)
            circle(filter, Point(filter.rows / 2, filter.cols / 2), size, Scalar(1), -1);
        break;//imshow("mask", filt); waitKey(1);
    case 1://Ideal HP
        if(size != 0)
            circle(filter, Point(filter.rows / 2, filter.cols / 2), size, Scalar(1), -1);
        filter = 1 - filter;
        break;
    case 2://ButterWorth LP
        if(size != 0)
        {
            float D;
            for(int i=0;i<filter.rows;++i)
            {
                float* data= filter.ptr<float>(i);
                for(int j=0;j<filter.cols;++j)
                {
                    int j_,i_;
                    if(i>filter.rows/2)
                        i_ = i-filter.rows;
                    else
                        i_ = i;
                    if(j>filter.cols/2)
                        j_ = j-filter.cols;
                    else
                        j_ = j;
                    D = sqrt(pow(i_,2) + pow(j_,2));
                    data[j] = 1/(1+pow(D/size,4));
                }
            }
            {
                int cx = filter.cols / 2;
                int cy = filter.rows / 2;
                Mat q0(filter, Rect(0, 0, cx, cy));   // ROI区域的左上
                Mat q1(filter, Rect(cx, 0, cx, cy));  // ROI区域的右上
                Mat q2(filter, Rect(0, cy, cx, cy));  // ROI区域的左下
                Mat q3(filter, Rect(cx, cy, cx, cy)); // ROI区域的右下
                 //交换象限（左上与右下进行交换）
                Mat tmp;
                q0.copyTo(tmp);
                q3.copyTo(q0);
                tmp.copyTo(q3);
                //交换象限（右上与左下进行交换）
                q1.copyTo(tmp);
                q2.copyTo(q1);
                tmp.copyTo(q2);
            }
         }

            break;
    case 3://ButterWorth HP
        if(size != 0)
        {
            float D;
            for(int i=0;i<filter.rows;++i)
            {
                float* data= filter.ptr<float>(i);
                for(int j=0;j<filter.cols;++j)
                {
                    int j_,i_;
                    if(i>filter.rows/2)
                        i_ = i-filter.rows;
                    else
                        i_ = i;
                    if(j>filter.cols/2)
                        j_ = j-filter.cols;
                    else
                        j_ = j;
                    D = sqrt(pow(i_,2) + pow(j_,2));
                    data[j] = 1/(1+pow(D/size,4));
                }
            }
            {
                int cx = filter.cols / 2;
                int cy = filter.rows / 2;
                Mat q0(filter, Rect(0, 0, cx, cy));   // ROI区域的左上
                Mat q1(filter, Rect(cx, 0, cx, cy));  // ROI区域的右上
                Mat q2(filter, Rect(0, cy, cx, cy));  // ROI区域的左下
                Mat q3(filter, Rect(cx, cy, cx, cy)); // ROI区域的右下
                 //交换象限（左上与右下进行交换）
                Mat tmp;
                q0.copyTo(tmp);
                q3.copyTo(q0);
                tmp.copyTo(q3);
                //交换象限（右上与左下进行交换）
                q1.copyTo(tmp);
                q2.copyTo(q1);
                tmp.copyTo(q2);
            }
        }
        filter = 1 - filter;
            break;
    case 4://Gaussian LP
        if(size != 0)
        {
            float D;
            for(int i=0;i<filter.rows;++i)
            {
                float* data= filter.ptr<float>(i);
                for(int j=0;j<filter.cols;++j)
                {
                    int j_,i_;
                    if(i>filter.rows/2)
                        i_ = i-filter.rows;
                    else
                        i_ = i;
                    if(j>filter.cols/2)
                        j_ = j-filter.cols;
                    else
                        j_ = j;
                    D = sqrt(pow(i_,2) + pow(j_,2));
                    data[j] = exp(-pow(D,2)/(2*pow(size,2)));
                }
            }
            {
                int cx = filter.cols / 2;
                int cy = filter.rows / 2;
                Mat q0(filter, Rect(0, 0, cx, cy));   // ROI区域的左上
                Mat q1(filter, Rect(cx, 0, cx, cy));  // ROI区域的右上
                Mat q2(filter, Rect(0, cy, cx, cy));  // ROI区域的左下
                Mat q3(filter, Rect(cx, cy, cx, cy)); // ROI区域的右下
                 //交换象限（左上与右下进行交换）
                Mat tmp;
                q0.copyTo(tmp);
                q3.copyTo(q0);
                tmp.copyTo(q3);
                //交换象限（右上与左下进行交换）
                q1.copyTo(tmp);
                q2.copyTo(q1);
                tmp.copyTo(q2);
            }
         }
        break;
    case 5://Gaussian HP
        if(size != 0)
        {
            float D;
            for(int i=0;i<filter.rows;++i)
            {
                float* data= filter.ptr<float>(i);
                for(int j=0;j<filter.cols;++j)
                {
                    int j_,i_;
                    if(i>filter.rows/2)
                        i_ = i-filter.rows;
                    else
                        i_ = i;
                    if(j>filter.cols/2)
                        j_ = j-filter.cols;
                    else
                        j_ = j;
                    D = sqrt(pow(i_,2) + pow(j_,2));
                    data[j] = exp(-pow(D,2)/(2*pow(size,2)));
                }
            }
            {
                int cx = filter.cols / 2;
                int cy = filter.rows / 2;
                Mat q0(filter, Rect(0, 0, cx, cy));   // ROI区域的左上
                Mat q1(filter, Rect(cx, 0, cx, cy));  // ROI区域的右上
                Mat q2(filter, Rect(0, cy, cx, cy));  // ROI区域的左下
                Mat q3(filter, Rect(cx, cy, cx, cy)); // ROI区域的右下
                 //交换象限（左上与右下进行交换）
                Mat tmp;
                q0.copyTo(tmp);
                q3.copyTo(q0);
                tmp.copyTo(q3);
                //交换象限（右上与左下进行交换）
                q1.copyTo(tmp);
                q2.copyTo(q1);
                tmp.copyTo(q2);
            }
         }
        filter = 1 - filter;
        break;
    case 6://理想带通
        if(size != 0)
            circle(filter, Point(filter.rows / 2, filter.cols / 2), size, Scalar(1), 5);
        break;
    case 7://理想带阻
        if(size != 0)
            circle(filter, Point(filter.rows / 2, filter.cols / 2), size, Scalar(1), 5);
        filter = 1-filter;
        break;
	default:;

    }


}

void myDFT::Filter()
{
    //滤波函数
    filter_result = filter;
    int cx = filter_result.cols / 2;
    int cy = filter_result.rows / 2;
    Mat q0(filter_result, Rect(0, 0, cx, cy));   // ROI区域的左上
    Mat q1(filter_result, Rect(cx, 0, cx, cy));  // ROI区域的右上
    Mat q2(filter_result, Rect(0, cy, cx, cy));  // ROI区域的左下
    Mat q3(filter_result, Rect(cx, cy, cx, cy)); // ROI区域的右下
     //交换象限（左上与右下进行交换）
    Mat tmp;
    q0.copyTo(tmp);
    q3.copyTo(q0);
    tmp.copyTo(q3);
    //交换象限（右上与左下进行交换）
    q1.copyTo(tmp);
    q2.copyTo(q1);
    tmp.copyTo(q2);

    Mat planes[2];
    //将复数转换为幅值，即=> log(1 + sqrt(Re(DFT(I))^2 + Im(DFT(I))^2))
    split(complexI, planes); // 将多通道数组complexI分离成几个单通道数组，planes[0] = Re(DFT(I), planes[1] = Im(DFT(I))
    planes[0] = planes[0].mul(filter_result);
    planes[1] = planes[1].mul(filter_result);
    Mat IcomplexI;
    merge(planes,2,IcomplexI);
    idft(IcomplexI,IcomplexI);//,DFT_REAL_OUTPUT
    split(IcomplexI, planes);
    magnitude(planes[0], planes[1], planes[0]);// planes[0] = magnitude
    filter_result = planes[0];

    normalize(filter_result, filter_result, 0, 1, NORM_MINMAX);
}
