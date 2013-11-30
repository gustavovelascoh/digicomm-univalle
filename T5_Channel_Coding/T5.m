function varargout = T5(varargin)
% T5 MATLAB code for T5.fig
%      T5, by itself, creates a new T5 or raises the existing
%      singleton*.
%
%      H = T5 returns the handle to a new T5 or the handle to
%      the existing singleton*.
%
%      T5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in T5.M with the given input arguments.
%
%      T5('Property','Value',...) creates a new T5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before T5_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to T5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help T5

% Last Modified by GUIDE v2.5 30-Nov-2013 11:56:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @T5_OpeningFcn, ...
                   'gui_OutputFcn',  @T5_OutputFcn, ...
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


% --- Executes just before T5 is made visible.
function T5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to T5 (see VARARGIN)

% Choose default command line output for T5
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes T5 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

im = imread('eq.png');

image(im,'parent',handles.axes1);
set(handles.axes1,'XTick',[],'YTick',[]);


% --- Outputs from this function are returned to the command line.
function varargout = T5_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function data_e_Callback(hObject, eventdata, handles)
% hObject    handle to data_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of data_e as text
%        str2double(get(hObject,'String')) returns contents of data_e as a double


% --- Executes during object creation, after setting all properties.
function data_e_CreateFcn(hObject, eventdata, handles)
% hObject    handle to data_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in addp_b.
function addp_b_Callback(hObject, eventdata, handles)
% hObject    handle to addp_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data_e = get(handles.data_e,'String');
x = parse_data(data_e);

if length(x) > 1
    ppd  = add_parity_bit(x);
    set(handles.ppd_e,'String',strrep(num2str(ppd),' ',''));
else
    msgbox('bla','error');
end



function ppd_e_Callback(hObject, eventdata, handles)
% hObject    handle to ppd_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ppd_e as text
%        str2double(get(hObject,'String')) returns contents of ppd_e as a double


% --- Executes during object creation, after setting all properties.
function ppd_e_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ppd_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n = str2num(get(handles.edit4,'string'));
p = str2double(get(handles.edit3,'string'));

if (mod(n,2))
    l = (n-1)/2;
else
    l = n/2;
end

per = 0;

for i=1:l
    per = per + prob_err(n,2*i,p);
end

set(handles.text_per,'string',per);
