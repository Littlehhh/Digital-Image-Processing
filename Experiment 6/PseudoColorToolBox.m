function varargout = PseudoColorToolBox(varargin)
% PSEUDOCOLORTOOLBOX MATLAB code for PseudoColorToolBox.fig
%      PSEUDOCOLORTOOLBOX, by itself, creates a new PSEUDOCOLORTOOLBOX or raises the existing
%      singleton*.
%
%      H = PSEUDOCOLORTOOLBOX returns the handle to a new PSEUDOCOLORTOOLBOX or the handle to
%      the existing singleton*.
%
%      PSEUDOCOLORTOOLBOX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PSEUDOCOLORTOOLBOX.M with the given input arguments.
%
%      PSEUDOCOLORTOOLBOX('Property','Value',...) creates a new PSEUDOCOLORTOOLBOX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PseudoColorToolBox_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PseudoColorToolBox_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PseudoColorToolBox

% Last Modified by GUIDE v2.5 17-Dec-2016 18:32:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PseudoColorToolBox_OpeningFcn, ...
                   'gui_OutputFcn',  @PseudoColorToolBox_OutputFcn, ...
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


% --- Executes just before PseudoColorToolBox is made visible.
function PseudoColorToolBox_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PseudoColorToolBox (see VARARGIN)


% Choose default command line output for PseudoColorToolBox
handles.output = hObject;
set(handles.process,'Enable','off');
set(handles.Save,'Enable','off');
set(handles.range,'String',0.05);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PseudoColorToolBox wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PseudoColorToolBox_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in SelectImage.
function SelectImage_Callback(hObject, eventdata, handles)
% hObject    handle to SelectImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% gray = im2double(imread('Fig0309(a)(washed_out_aerial_image).tif'));
handles.gray = im2double(InputPicture());
R = handles.gray;
G = handles.gray;
B = handles.gray;
% RGB = cat(3,histeq(R),histeq(G),histeq(B));
handles.RGB = cat(3,R,G,B);

global fig;
fig = figure;
% axes('Parent',handles.fig)
% axes(handles.axes1)
% imshow(handles.RGB);
imshow(handles.RGB);
set(handles.process,'Enable','on');
set(handles.Save,'Enable','on');
guidata(hObject, handles);


function range_Callback(hObject, eventdata, handles)
% hObject    handle to range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of range as text
%        str2double(get(hObject,'String')) returns contents of range as a double


% --- Executes during object creation, after setting all properties.
function range_CreateFcn(hObject, eventdata, handles)
% hObject    handle to range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





% --- Executes on button press in Save.
function Save_Callback(hObject, eventdata, handles)
% hObject    handle to Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
OutputPicture(handles.RGB);

% --- Executes on button press in process.
function process_Callback(hObject, eventdata, handles)
% hObject    handle to process (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fig;
% ishandle(fig)
if ~ishandle(fig)
    fig = figure;
    imshow(handles.RGB);
end
% axes('Parent',fig)
% axis off
% imshow(handles.RGB);
dcm_obj = datacursormode(fig);
set(dcm_obj,'DisplayStyle','datatip','SnapToDataVertex','on','Enable','on');
pause
c_info = getCursorInfo(dcm_obj);
X = c_info.Position(2);
Y = c_info.Position(1);
value = handles.gray(X,Y);
neibor = str2double(get(handles.range,'String'));
[X,Y] = find(handles.gray > value-neibor/2 & handles.gray < value+neibor/2);
color = uisetcolor();

for i = 1:length(X)
    handles.RGB(X(i),Y(i),:) = color; 
end
imshow(handles.RGB)
guidata(hObject, handles);
