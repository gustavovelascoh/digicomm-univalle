function varargout = T3(varargin)
% T3 MATLAB code for T3.fig
%      T3, by itself, creates a new T3 or raises the existing
%      singleton*.
%
%      H = T3 returns the handle to a new T3 or the handle to
%      the existing singleton*.
%
%      T3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in T3.M with the given input arguments.
%
%      T3('Property','Value',...) creates a new T3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before T3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to T3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help T3

% Last Modified by GUIDE v2.5 19-Oct-2013 12:40:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @T3_OpeningFcn, ...
                   'gui_OutputFcn',  @T3_OutputFcn, ...
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


% --- Executes just before T3 is made visible.
function T3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to T3 (see VARARGIN)

% Choose default command line output for T3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global mod_type

mod_type = 'FSK';

% UIWAIT makes T3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = T3_OutputFcn(hObject, eventdata, handles) 
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



function freq_e_Callback(hObject, eventdata, handles)
% hObject    handle to freq_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freq_e as text
%        str2double(get(hObject,'String')) returns contents of freq_e as a double


% --- Executes during object creation, after setting all properties.
function freq_e_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in mod_b.
function mod_b_Callback(hObject, eventdata, handles)
% hObject    handle to mod_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mod_type

data_e = get(handles.data_e,'String');
x = parse_data(data_e{1});
M = 2;

if length(x) > 1
    switch mod_type
        case 'PSK'
            y = psk_mod(x,M);
        case 'FSK'
            y = fsk_mod(x,M,6);
        case 'ASK'
            y = ask_mod(x,M);
        case 'APK'
            y = apk_mod(x,M);
    end
    
    plot(handles.axes1,y);
else
    msgbox('bla','error');
end


% --- Executes when selected object is changed in uipanel3.
function uipanel3_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel3 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

global mod_type

mod_type = get(hObject,'String');
