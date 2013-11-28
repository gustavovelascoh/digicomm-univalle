function varargout = T4(varargin)
% T4 MATLAB code for T4.fig
%      T4, by itself, creates a new T4 or raises the existing
%      singleton*.
%
%      H = T4 returns the handle to a new T4 or the handle to
%      the existing singleton*.
%
%      T4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in T4.M with the given input arguments.
%
%      T4('Property','Value',...) creates a new T4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before T4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to T4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help T4

% Last Modified by GUIDE v2.5 27-Nov-2013 20:57:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @T4_OpeningFcn, ...
                   'gui_OutputFcn',  @T4_OutputFcn, ...
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


% --- Executes just before T4 is made visible.
function T4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to T4 (see VARARGIN)

% Choose default command line output for T4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes T4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

global eirp gr t ebno r ls lo m

eirp = str2num(get(handles.edit_eirp,'String'));
gr = str2num(get(handles.edit_gr,'String'));
t = str2num(get(handles.edit_t,'String'));
ebno = str2num(get(handles.edit_ebno,'String'));
r = str2num(get(handles.edit_r,'String'));
ls = str2num(get(handles.edit_ls,'String'));
lo = str2num(get(handles.edit_lo,'String'));

m = update_m(eirp,gr,t,ebno,r,ls,lo);
set(handles.edit_m,'string',m);




% --- Outputs from this function are returned to the command line.
function varargout = T4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_m_Callback(hObject, eventdata, handles)
% hObject    handle to edit_m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_m as text
%        str2double(get(hObject,'String')) returns contents of edit_m as a double


% --- Executes during object creation, after setting all properties.
function edit_m_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_eirp_Callback(hObject, eventdata, handles)
% hObject    handle to edit_eirp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_eirp as text
%        str2double(get(hObject,'String')) returns contents of edit_eirp as a double

global eirp gr t ebno r ls lo m

eirp = str2num(get(handles.edit_eirp,'String'));

m = update_m(eirp,gr,t,ebno,r,ls,lo);
set(handles.edit_m,'string',m);

% --- Executes during object creation, after setting all properties.
function edit_eirp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_eirp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_gr_Callback(hObject, eventdata, handles)
% hObject    handle to edit_gr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_gr as text
%        str2double(get(hObject,'String')) returns contents of edit_gr as a double

global eirp gr t ebno r ls lo m

gr = str2num(get(handles.edit_gr,'String'));

m = update_m(eirp,gr,t,ebno,r,ls,lo);
set(handles.edit_m,'string',m);

% --- Executes during object creation, after setting all properties.
function edit_gr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_gr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_t_Callback(hObject, eventdata, handles)
% hObject    handle to edit_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_t as text
%        str2double(get(hObject,'String')) returns contents of edit_t as a double

global eirp gr t ebno r ls lo m

t = str2num(get(handles.edit_t,'String'));

m = update_m(eirp,gr,t,ebno,r,ls,lo);
set(handles.edit_m,'string',m);

% --- Executes during object creation, after setting all properties.
function edit_t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_ebno_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ebno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ebno as text
%        str2double(get(hObject,'String')) returns contents of edit_ebno as a double

global eirp gr t ebno r ls lo m

ebno = str2num(get(handles.edit_ebno,'String'));

m = update_m(eirp,gr,t,ebno,r,ls,lo);
set(handles.edit_m,'string',m);


% --- Executes during object creation, after setting all properties.
function edit_ebno_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ebno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_r_Callback(hObject, eventdata, handles)
% hObject    handle to edit_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_r as text
%        str2double(get(hObject,'String')) returns contents of edit_r as a double

global eirp gr t ebno r ls lo m

r = str2num(get(handles.edit_r,'String'));

m = update_m(eirp,gr,t,ebno,r,ls,lo);
set(handles.edit_m,'string',m);

% --- Executes during object creation, after setting all properties.
function edit_r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_ls_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ls (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ls as text
%        str2double(get(hObject,'String')) returns contents of edit_ls as a double

global eirp gr t ebno r ls lo m

ls = str2num(get(handles.edit_ls,'String'));

m = update_m(eirp,gr,t,ebno,r,ls,lo);
set(handles.edit_m,'string',m);


% --- Executes during object creation, after setting all properties.
function edit_ls_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ls (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_lo_Callback(hObject, eventdata, handles)
% hObject    handle to edit_lo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_lo as text
%        str2double(get(hObject,'String')) returns contents of edit_lo as a double

global eirp gr t ebno r ls lo m

lo = str2num(get(handles.edit_lo,'String'));

m = update_m(eirp,gr,t,ebno,r,ls,lo);
set(handles.edit_m,'string',m);

% --- Executes during object creation, after setting all properties.
function edit_lo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_lo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
