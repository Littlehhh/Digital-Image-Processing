#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <opencv2/opencv.hpp>
#include "DFT.h"
#include <QDebug>
#include <QFileDialog>
#include <QMessageBox>
#include <QTextCodec>

using namespace cv;
using namespace std;
namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();
    void display(cv::Mat mat);
private slots:
    void on_pushButton_clicked();
    void on_comboBox_currentIndexChanged(int index);
    void on_filter_clicked();
    void on_horizontalSlider_valueChanged();

private:
    Ui::MainWindow *ui;
    cv::Mat image;
    QImage img;
    myDFT dft;
    int filterType;

};



#endif // MAINWINDOW_H
