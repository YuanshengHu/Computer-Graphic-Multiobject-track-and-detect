

function varargout = test(varargin)
% TEST MATLAB code for test.fig
%      TEST, by itself, creates a new TEST or raises the existing
%      singleton*.
%
%      H = TEST returns the handle to a new TEST or the handle to
%      the existing singleton*.
%
%      TEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST.M with the given input arguments.
%
%      TEST('Property','Value',...) creates a new TEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help test

% Last Modified by GUIDE v2.5 09-Jan-2016 23:15:25
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test_OpeningFcn, ...
                   'gui_OutputFcn',  @test_OutputFcn, ...
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


% --- Executes just before test is made visible.
function test_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test (see VARARGIN)

% Choose default command line output for test
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global status;
status = 0;
filename = 'open.jpg';
axes1=imread(filename); 
imshow(axes1, 'parent', handles.axes1);
imshow(axes1, 'parent', handles.axes2);
% UIWAIT makes test wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = test_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% hObject handle to pushbutton1 (see GCBO)
% eventdata reserved - to be defined in a future version of MATLAB
% handles structure with handles and user data (see GUIDATA)
global status;
if(status~=3)
    msgbox('请先处理视频');
else
    global num_of_frames;
    color = ['r', 'g', 'b', 'c', 'm', 'y', 'k'];
    i = 1;
    for q=1:num_of_frames
        filename = strcat('.\Results\output\Tracking_Results_',num2str(q,'%04d'));
        filename = strcat(filename,'.jpg');
        axes1=imread(filename); 
        imshow(axes1, 'parent', handles.axes1);
        
        [imgh,imgw, a]=size(axes1);
        fp = fopen(strcat('Results\pos\', num2str(q), '.txt'), 'r');
        while ~feof(fp)
            line = fgetl(fp);
            if (line == -1)
                break;
            end
            tmp = regexp(line, '\t', 'split');
            xpos = str2num(char(tmp(2)));
            ypos = str2num(char(tmp(3)));
            
            plot(handles.axes2, xpos, imgh-ypos, '.', 'color', color(mod(str2num(char(tmp(1))), 7) + 1));
            hold on;
            axis(handles.axes2, [0 imgw 0 imgh]);
            i = i + 1;
        end
        fclose(fp);
        pause(0.01);
    end
end
    
function update(hObject, eventdata, handles)
global dynamic;
global process_cur;
global drawing_cur;
global cutting_cur;
global detect_cur;
global status;
if(status==1)
    set(handles.text3,'string',[sprintf('目前正在处理第%d帧',process_cur)]);
end
if(status==2)
    set(handles.text3,'string',[sprintf('目前正在绘制第%d帧',drawing_cur)]);
    set(handles.text2,'string',[sprintf('检测到了%d个人',dynamic)]);
end
if(status==3)
    set(handles.text3,'string',[sprintf('完成处理')]);
end
if(status==4)
    set(handles.text3,'string',[sprintf('正在裁制第%d帧',cutting_cur)]);
end
if(status==5)
    set(handles.text3,'string',[sprintf('正在检测第%d帧',detect_cur)]);
end
if(status==6)
    set(handles.text3,'string',[sprintf('选择视频')]);
end
if(status==7)
    set(handles.text3,'string',[sprintf('完成预处理')]);
end
pause(0);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global status;
global username;
if(status==0)
    msgbox('请先选择视频');
else
    status = 0;
    set(handles.text3,'string','读取数据文件');
    global dynamic;
    dynamic = 0;
    set(handles.text2,'string','动态人数计数');
    set(handles.text1,'string','最终人数计数');

    result = tracking_demo();
    set(handles.text1,'string',[sprintf('总共检测到%d个人',result)]);
    set(handles.text3,'string','done');
    
    d = dir(strcat('history\', username));
    mkdir(strcat('history\', username, '\', num2str(length(d) - 2 + 1)));
    
    global num_of_frames;
    for q=1:num_of_frames
        filename = strcat('.\Results\output\Tracking_Results_',num2str(q,'%04d'));
        filename = strcat(filename,'.jpg');
        copyfile(filename, strcat('history\', username, '\', num2str(length(d) - 2 + 1), '\', num2str(q,'%04d'), '.jpg'));
    end
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t=timer('TimerFcn',{@update,handles},'ExecutionMode', 'fixedRate', 'Period', 0.1);
start(t);
global status;
status = 6;
mkdir('Sequences\source');
mkdir('Det');
mkdir('Results\output');
mkdir('Results\pos');
videofilename=uigetfile('*.*','open');
global num_of_frames;
num_of_frames = camera(videofilename);
detecting();
global img_path;
img_path = '.\Sequences\source\';
global img_List;
img_List = dir(strcat(img_path,'*.png'));
disp(sprintf('select done'));
status = 7;


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global status;
if(status==0)
    msgbox('请先选择视频');
else
    disp(sprintf('play the original video'));
    global img_path;
    global num_of_frames;
    for q=1:num_of_frames
        filename = strcat(img_path,num2str(q,'%04d'));
        filename = strcat(filename,'.png');
        disp(filename);
        axes1=imread(filename); 
        imshow(axes1);
        pause(0.01);
    end
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
close(gcf);
history();
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function text4_CreateFcn(hObject, eventdata, handles)
global username;
set(hObject,'string',username);
% hObject    handle to text4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

