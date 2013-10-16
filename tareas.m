function varargout = tareas(varargin)
% TAREAS MATLAB code for tareas.fig
%      TAREAS, by itself, creates a new TAREAS or raises the existing
%      singleton*.
%
%      H = TAREAS returns the handle to a new TAREAS or the handle to
%      the existing singleton*.
%
%      TAREAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TAREAS.M with the given input arguments.
%
%      TAREAS('Property','Value',...) creates a new TAREAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tareas_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tareas_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tareas

% Last Modified by GUIDE v2.5 12-Oct-2013 16:41:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tareas_OpeningFcn, ...
                   'gui_OutputFcn',  @tareas_OutputFcn, ...
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


% --- Executes just before tareas is made visible.
function tareas_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tareas (see VARARGIN)

% Choose default command line output for tareas
handles.output = hObject;

global data;
global data_str;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tareas wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tareas_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function e_data_Callback(hObject, eventdata, handles)
% hObject    handle to e_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_data as text
%        str2double(get(hObject,'String')) returns contents of e_data as a double


% --- Executes during object creation, after setting all properties.
function e_data_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in b_start.
function b_start_Callback(hObject, eventdata, handles)
% hObject    handle to b_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data;
global data_str;
data_str = get(handles.e_data,'String');

data = parse_data(data_str);

if (length(data) == 1)
    msgbox('Data must be a string of 1s and 0s with 4 to 32 bits length');
else
    stairs(handles.ax_data,[data data(end)]);
    set(handles.ax_data,'YLim',[-0.1 1.1],'XLim',[1 length(data)+1],'XTick',1:length(data)+1,'YTick',[0 1],'XGrid','on');
    
    set(handles.pu_cod,'Enable','on');
    set(handles.b_codify,'Enable','on');
end

% --- Executes on button press in b_codify.
function b_codify_Callback(hObject, eventdata, handles)
% hObject    handle to b_codify (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data;
T1;


% --- Executes on selection change in pu_cod.
function pu_cod_Callback(hObject, eventdata, handles)
% hObject    handle to pu_cod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pu_cod contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pu_cod


% --- Executes during object creation, after setting all properties.
function pu_cod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pu_cod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
