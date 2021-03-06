function varargout = T1(varargin)
% T1 M-file for T1.fig
%      T1, by itself, creates a new T1 or raises the existing
%      singleton*.
%
%      H = T1 returns the handle to a new T1 or the handle to
%      the existing singleton*.
%
%      T1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in T1.M with the given input arguments.
%
%      T1('Property','Value',...) creates a new T1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before T1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to T1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help T1

% Last Modified by GUIDE v2.5 21-Sep-2013 12:02:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @T1_OpeningFcn, ...
                   'gui_OutputFcn',  @T1_OutputFcn, ...
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


% --- Executes just before T1 is made visible.
function T1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to T1 (see VARARGIN)

% Choose default command line output for T1
handles.output = hObject;
global data;
global data_str;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes T1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = T1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_data_Callback(hObject, eventdata, handles)
% hObject    handle to edit_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_data as text
%        str2double(get(hObject,'String')) returns contents of edit_data as a double


% --- Executes during object creation, after setting all properties.
function edit_data_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


global data_str;
if length(data_str) > 3
    set(hObject,'String',data_str);
end


% --- Executes on selection change in waveform.
function waveform_Callback(hObject, eventdata, handles)
% hObject    handle to waveform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns waveform contents as cell array
%        contents{get(hObject,'Value')} returns selected item from waveform


% --- Executes during object creation, after setting all properties.
function waveform_CreateFcn(hObject, eventdata, handles)
% hObject    handle to waveform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data_raw = get(handles.edit_data,'String');
data_str = data_raw;

if (regexp(data_str,'^[01]{4,16}$'))
    set(handles.message,'Visible','off');
    
    waveform = get(handles.waveform,'Value');
    
    l = length(data_str);
    data_arr = split_str(data_str);
    
    switch waveform
        case 1
            out = nrz(data_arr);
            resample_f = 4;
        case 2
            out = nrz_m(data_arr,0);
            resample_f = 4;
        case 3
            out = nrz_m(data_arr,1);
            resample_f = 4;
        case 4
            out = polar_rz(data_arr,0);
            resample_f = 2;
        case 5
            out = polar_rz(data_arr,1);
            resample_f = 2;
        case 6
            out = rz_ami(data_arr);
            resample_f = 1;
        case 7
            out = bi(data_arr,0);
            resample_f = 2;
        case 8
            out = bi(data_arr,1);
            resample_f = 2;
        case 9
            out = bi(data_arr,2);
            resample_f = 2;
        case 11            
            out = dicode(data_arr,0);
            resample_f = 4;
        case 12
            out = dicode(data_arr,1);
            resample_f = 2;
        otherwise
            out = data_arr;
            resample_f = 4;
    end
    
    out = resample(out,resample_f);
    stairs(handles.axes1,0:0.25:l,[out out(end)]),axis([0 l+1.5 -1.25 1.25]);
    set(handles.axes1,'XGrid','on');
    
else
    set(handles.message,'String','Data must be a string of 1s and 0s with 4 to 32 bits length'); 
    set(handles.message,'Visible','on'); 
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over message.
function message_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to message (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in helpb.
function helpb_Callback(hObject, eventdata, handles)
% hObject    handle to helpb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

msgbox({'TODO','Gustavo Velasco.','Comunicación digital. Univalle.','2013'},'Info');
