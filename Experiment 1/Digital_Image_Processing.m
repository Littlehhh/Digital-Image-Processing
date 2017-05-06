% 1.数字图像的基本读写、显示与保存；五类图形显示方法
% 2.读取图像并显示灰度图像、索引图像、RGB图像、二进制图像、多帧图像；进行图像类型转化
% 3.编程实现最近邻法、双线性内插法、双三次内插法的图像放大


% 2016.10.07

function varargout = Digital_Image_Processing(varargin)
% DIGITAL_IMAGE_PROCESSING MATLAB code for Digital_Image_Processing.fig
%      DIGITAL_IMAGE_PROCESSING, by itself, creates a new DIGITAL_IMAGE_PROCESSING or raises the existing
%      singleton*.
%
%      H = DIGITAL_IMAGE_PROCESSING returns the handle to a new DIGITAL_IMAGE_PROCESSING or the handle to
%      the existing singleton*.
%
%      DIGITAL_IMAGE_PROCESSING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIGITAL_IMAGE_PROCESSING.M with the given input arguments.
%
%      DIGITAL_IMAGE_PROCESSING('Property','Value',...) creates a new DIGITAL_IMAGE_PROCESSING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Digital_Image_Processing_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Digital_Image_Processing_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Digital_Image_Processing

% Last Modified by GUIDE v2.5 09-Oct-2016 23:29:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Digital_Image_Processing_OpeningFcn, ...
                   'gui_OutputFcn',  @Digital_Image_Processing_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Digital_Image_Processing is made visible.
function Digital_Image_Processing_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Digital_Image_Processing (see VARARGIN)
set(handles.length,'String','2');
set(handles.width,'String','2');
% Choose default command line output for Digital_Image_Processing
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Digital_Image_Processing wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Digital_Image_Processing_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in select.
function select_Callback(hObject, eventdata, handles)
% hObject    handle to select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Input = InputPicture();
guidata(hObject,handles); %更新 handles ！！勿忘记


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
OutputPicture(handles.Output);
guidata(hObject,handles); %更新 handles ！！勿忘记


% --- Executes on button press in nearest.
function nearest_Callback(hObject, eventdata, handles)
% hObject    handle to nearest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
H=str2double(get(handles.length,'String'));
W=str2double(get(handles.width,'String'));
handles.Output = resizeNEAREST(H,W,handles.Input);
title('最近邻插值法放缩所得图像')
guidata(hObject,handles);

% --- Executes on button press in linear.
function linear_Callback(hObject, eventdata, handles)
% hObject    handle to linear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
H=str2double(get(handles.length,'String'));
W=str2double(get(handles.width,'String'));
handles.Output = resizeLINEAR(H,W,handles.Input);
title('双线性内插法放缩所得图像')
guidata(hObject,handles);


function length_Callback(hObject, eventdata, handles)
% hObject    handle to length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of length as text
%        str2double(get(hObject,'String')) returns contents of length as a double


% --- Executes during object creation, after setting all properties.
function length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function width_Callback(hObject, eventdata, handles)
% hObject    handle to width (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of width as text
%        str2double(get(hObject,'String')) returns contents of width as a double


% --- Executes during object creation, after setting all properties.
function width_CreateFcn(hObject, eventdata, handles)
% hObject    handle to width (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bicubic.
function bicubic_Callback(hObject, eventdata, handles)
% hObject    handle to bicubic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
H=str2double(get(handles.length,'String'));
W=str2double(get(handles.width,'String'));
handles.Output = resizeBicubic(H,W,handles.Input);
title('双三次插值法放缩所得图像')
guidata(hObject,handles);


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 将RGB图像转化为索引图像
Input = handles.Input;
[B1,map1]=rgb2ind(Input,64);
[B2,map2]=rgb2ind(Input,0.2);
map3=colorcube(128);
B3=rgb2ind(Input,map3);
B1 = uint8(B1);B2 = uint8(B2);B3 = uint8(B3);
figure,
subplot(131),imshow(B1,map1);title('最小方差法');%最小方差法
subplot(132),imshow(B2,map2);title('均匀量化法');%均匀量化法
subplot(133),imshow(B3,map3);title('颜色近似法');%颜色近似法


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Input = handles.Input;
A=rgb2gray(Input);
figure;
imshow(A);%转成灰度图


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Input = handles.Input;
% 转成二值图
A=rgb2gray(Input);
M1=dither(A);%图像抖动
M2=im2bw(Input,0.5);%设定阈值
figure,
subplot(121),imshow(M1);title('dither图像抖动');
subplot(122),imshow(M2);title('im2bw设定阈值');
