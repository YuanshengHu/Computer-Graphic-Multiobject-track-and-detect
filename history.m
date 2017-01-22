
function varargout = history(varargin)
% HISTORY MATLAB code for history.fig
%      HISTORY, by itself, creates a new HISTORY or raises the existing
%      singleton*.
%
%      H = HISTORY returns the handle to a new HISTORY or the handle to
%      the existing singleton*.
%
%      HISTORY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HISTORY.M with the given input arguments.
%
%      HISTORY('Property','Value',...) creates a new HISTORY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before history_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to history_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help history

% Last Modified by GUIDE v2.5 10-Jan-2016 01:17:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @history_OpeningFcn, ...
                   'gui_OutputFcn',  @history_OutputFcn, ...
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


% --- Executes just before history is made visible.
function history_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to history (see VARARGIN)

% Choose default command line output for history
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% UIWAIT makes history wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = history_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
close(gcf);
test();
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
global numberOfHistoryFiles;
global username;
d = dir(strcat('history\', username));
numberOfHistoryFiles = length(d) - 2;
if (numberOfHistoryFiles > 0)
    filename = strcat('history\', username, '\', num2str(numberOfHistoryFiles), '\0001.jpg');
    axes2=imread(filename); 
    p2 = imshow(axes2);
    set(p2, 'ButtonDownFcn', {@p2Callback, handles});
end
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
global numberOfHistoryFiles;
global username;
if (numberOfHistoryFiles - 1 > 0)
    filename = strcat('history\', username, '\', num2str(numberOfHistoryFiles - 1), '\0001.jpg');
    axes3=imread(filename); 
    p3 = imshow(axes3);
    set(p3, 'ButtonDownFcn', {@p3Callback, handles});
end
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3


% --- Executes during object creation, after setting all properties.
function axes4_CreateFcn(hObject, eventdata, handles)
global numberOfHistoryFiles;
global username;
if (numberOfHistoryFiles - 2 > 0)
    filename = strcat('history\', username, '\', num2str(numberOfHistoryFiles - 2), '\0001.jpg');
    axes4=imread(filename); 
    p4 = imshow(axes4);
    set(p4, 'ButtonDownFcn', {@p4Callback, handles});
end
% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes4


% --- Executes during object creation, after setting all properties.
function axes5_CreateFcn(hObject, eventdata, handles)
global numberOfHistoryFiles;
global username;
if (numberOfHistoryFiles - 3 > 0)
    filename = strcat('history\', username, '\', num2str(numberOfHistoryFiles - 3), '\0001.jpg');
    axes5=imread(filename); 
   p5 =  imshow(axes5);
   set(p5, 'ButtonDownFcn', {@p5Callback, handles});
end
% hObject    handle to axes5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes5


% --- Executes during object creation, after setting all properties.
function axes6_CreateFcn(hObject, eventdata, handles)
global numberOfHistoryFiles;
global username;
if (numberOfHistoryFiles - 4 > 0)
    filename = strcat('history\', username, '\', num2str(numberOfHistoryFiles - 4), '\0001.jpg');
    axes6=imread(filename); 
    p6 = imshow(axes6);
    set(p6, 'ButtonDownFcn', {@p6Callback, handles});
end
% hObject    handle to axes6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes6


% --- Executes during object creation, after setting all properties.
function axes7_CreateFcn(hObject, eventdata, handles)
global numberOfHistoryFiles;
global username;
if (numberOfHistoryFiles - 5 > 0)
    filename = strcat('history\', username, '\', num2str(numberOfHistoryFiles - 5), '\0001.jpg');
    axes7=imread(filename); 
    p7 = imshow(axes7);
    set(p7, 'ButtonDownFcn', {@p7Callback, handles});
end
% hObject    handle to axes7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes7


% --- Executes on mouse press over axes background.
function p2Callback(hObject, eventdata, handles)
global numberOfHistoryFiles;
global selectedHistoryFiles;
if (numberOfHistoryFiles > 0)
    selectedHistoryFiles = numberOfHistoryFiles;
    historyVideo();
end

% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function p3Callback(hObject, eventdata, handles)
global numberOfHistoryFiles;
global selectedHistoryFiles;
if (numberOfHistoryFiles - 1 > 0)
    selectedHistoryFiles = numberOfHistoryFiles - 1;
    historyVideo();
end
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function p4Callback(hObject, eventdata, handles)
global numberOfHistoryFiles;
global selectedHistoryFiles;
if (numberOfHistoryFiles - 2 > 0)
    selectedHistoryFiles = numberOfHistoryFiles - 2;
    historyVideo();
end
% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function p5Callback(hObject, eventdata, handles)
global numberOfHistoryFiles;
global selectedHistoryFiles;
if (numberOfHistoryFiles -3 > 0)
    selectedHistoryFiles = numberOfHistoryFiles - 3;
    historyVideo();
end
% hObject    handle to axes5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function p6Callback(hObject, eventdata, handles)
global numberOfHistoryFiles;
global selectedHistoryFiles;
if (numberOfHistoryFiles - 4 > 0)
    selectedHistoryFiles = numberOfHistoryFiles - 4;
    historyVideo();
end
% hObject    handle to axes6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function p7Callback(hObject, eventdata, handles)
global numberOfHistoryFiles;
global selectedHistoryFiles;
if (numberOfHistoryFiles - 5 > 0)
    selectedHistoryFiles = numberOfHistoryFiles - 5;
    historyVideo();
end
% hObject    handle to axes7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
