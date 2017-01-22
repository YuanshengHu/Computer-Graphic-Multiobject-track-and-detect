

function varargout = historyVideo(varargin)
% HISTORYVIDEO MATLAB code for historyVideo.fig
%      HISTORYVIDEO, by itself, creates a new HISTORYVIDEO or raises the existing
%      singleton*.
%
%      H = HISTORYVIDEO returns the handle to a new HISTORYVIDEO or the handle to
%      the existing singleton*.
%
%      HISTORYVIDEO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HISTORYVIDEO.M with the given input arguments.
%
%      HISTORYVIDEO('Property','Value',...) creates a new HISTORYVIDEO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before historyVideo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to historyVideo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help historyVideo

% Last Modified by GUIDE v2.5 10-Jan-2016 01:57:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @historyVideo_OpeningFcn, ...
                   'gui_OutputFcn',  @historyVideo_OutputFcn, ...
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


% --- Executes just before historyVideo is made visible.
function historyVideo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to historyVideo (see VARARGIN)

% Choose default command line output for historyVideo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes historyVideo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = historyVideo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
global selectedHistoryFiles;
global username;
filename = strcat('history\', username, '\', num2str(selectedHistoryFiles), '\0001.jpg');
axes2=imread(filename); 
p2 = imshow(axes2);
set(p2, 'ButtonDownFcn', {@p2Callback, handles});

% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes on mouse press over axes background.
function p2Callback(hObject, eventdata, handles)
global selectedHistoryFiles;
global username;
frames = dir(strcat('history\', username, '\', num2str(selectedHistoryFiles)));
l = length(frames) - 2;
for i=1:l
     filename = strcat('history\', username, '\', num2str(selectedHistoryFiles),'\' ,num2str(i,'%04d'), '.jpg');
     axes1=imread(filename); 
     imshow(axes1);
     pause(0.01);
end
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
