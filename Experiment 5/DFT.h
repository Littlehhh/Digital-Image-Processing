#ifndef DFT_H_
#define	DFT_H_

#include "opencv2/opencv.hpp"

#include <iostream>
using namespace cv;
using namespace std;

class myDFT {
private:
    Mat srcImage, complexI, dst, filter, filter_result;
public:
        myDFT();
    explicit myDFT(const String &filename);
	explicit myDFT(Mat &srcImg);
        void getsrcImage(Mat &Image);
		void Transform();
		void srcImageShow();
		void resultShow();		
        void Filter_mask(int type,int size);
        void Filter();
        Mat& getdst();
        Mat& getfilter();
        Mat& getfilter_result();
};

#endif
