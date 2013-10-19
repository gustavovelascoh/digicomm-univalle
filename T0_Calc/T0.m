function varargout = T0(varargin)
% T0 M-file for T0.fig
%      T0, by itself, creates a new T0 or raises the existing
%      singleton*.
%
%      H = T0 returns the handle to a new T0 or the handle to
%      the existing singleton*.
%
%      T0('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in T0.M with the given input arguments.
%
%      T0('Property','Value',...) creates a new T0 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before T0_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to T0_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help T0

% Last Modified by GUIDE v2.5 14-Sep-2013 11:26:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @T0_OpeningFcn, ...
                   'gui_OutputFcn',  @T0_OutputFcn, ...
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


% --- Executes just before T0 is made visible.
function T0_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to T0 (see VARARGIN)

% Choose default command line output for T0
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes T0 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = T0_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in b4.
function b4_Callback(hObject, eventdata, handles)
% hObject    handle to b4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.text1,'String');
textString=strcat(textString,'4');
set(handles.text1,'String',textString)


% --- Executes on button press in b5.
function b5_Callback(hObject, eventdata, handles)
% hObject    handle to b5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.text1,'String');
textString=strcat(textString,'5');
set(handles.text1,'String',textString)

% --- Executes on button press in b6.
function b6_Callback(hObject, eventdata, handles)
% hObject    handle to b6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.text1,'String');
textString=strcat(textString,'6');
set(handles.text1,'String',textString)


% --- Executes on button press in b7.
function b7_Callback(hObject, eventdata, handles)
% hObject    handle to b7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.text1,'String');
textString=strcat(textString,'7');
set(handles.text1,'String',textString)


% --- Executes on button press in b8.
function b8_Callback(hObject, eventdata, handles)
% hObject    handle to b8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.text1,'String');
textString=strcat(textString,'8');
set(handles.text1,'String',textString)

% --- Executes on button press in b9.
function b9_Callback(hObject, eventdata, handles)
% hObject    handle to b9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.text1,'String');
textString=strcat(textString,'9');
set(handles.text1,'String',textString)


% --- Executes on button press in b0.
function b0_Callback(hObject, eventdata, handles)
% hObject    handle to b0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.text1,'String');
textString=strcat(textString,'0');
set(handles.text1,'String',textString)


% --- Executes on button press in bsuma.
function bsuma_Callback(hObject, eventdata, handles)
% hObject    handle to bsuma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.text1,'String');
textString=strcat(textString,'+');
set(handles.text1,'String',textString)

% --- Executes on button press in bresta.
function bresta_Callback(hObject, eventdata, handles)
% hObject    handle to bresta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.text1,'String');
textString=strcat(textString,'-');
set(handles.text1,'String',textString)

% --- Executes on button press in bmult.
function bmult_Callback(hObject, eventdata, handles)
% hObject    handle to bmult (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.text1,'String');
textString=strcat(textString,'*');
set(handles.text1,'String',textString)

% --- Executes on button press in bdiv.
function bdiv_Callback(hObject, eventdata, handles)
% hObject    handle to bdiv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.text1,'String');
textString=strcat(textString,'/');
set(handles.text1,'String',textString)

% --- Executes on button press in bigual.
function bigual_Callback(hObject, eventdata, handles)
% hObject    handle to bigual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.text1,'String');
textString=eval(textString,'1');
set(handles.text1,'String',textString)

% --- Executes on button press in b1.
function b1_Callback(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.text1,'String');
textString=strcat(textString,'1');
set(handles.text1,'String',textString)

% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.text1,'String');
textString=strcat(textString,'2');
set(handles.text1,'String',textString)

% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.text1,'String');
textString=strcat(textString,'3');
set(handles.text1,'String',textString)

% --- Executes on button press in bac.
function bac_Callback(hObject, eventdata, handles)
% hObject    handle to bac (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text1,'String','')

% --- Executes on button press in bad.
function bad_Callback(hObject, eventdata, handles)
% hObject    handle to bad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('Calculadora Sencilla. Por: Gustavo Velasco. Comunicación digital. Univalle - 2013','Acerca de');



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text1 as text
%        str2double(get(hObject,'String')) returns contents of text1 as a double


% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bsqrt.
function bsqrt_Callback(hObject, eventdata, handles)
% hObject    handle to bsqrt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.text1,'String');
textString=strcat('sqrt(', textString,')');
set(handles.text1,'String',textString)

% --- Executes on button press in bexp.
function bexp_Callback(hObject, eventdata, handles)
% hObject    handle to bexp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.text1,'String');
textString=strcat('exp(', textString,')');
set(handles.text1,'String',textString)


% --- Executes on button press in bclear.
function bclear_Callback(hObject, eventdata, handles)
% hObject    handle to bclear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.text1,'String');
set(handles.text1,'String',textString(1:end-1))

% --- Executes on button press in bsin.
function bsin_Callback(hObject, eventdata, handles)
% hObject    handle to bsin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.text1,'String');
textString=strcat('sin(', textString,')');
set(handles.text1,'String',textString)


% --- Executes on button press in bcos.
function bcos_Callback(hObject, eventdata, handles)
% hObject    handle to bcos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.text1,'String');
textString=strcat('cos(', textString,')');
set(handles.text1,'String',textString)
