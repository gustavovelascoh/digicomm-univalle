function varargout = T2(varargin)
%T2 M-file for T2.fig
%      T2, by itself, creates a new T2 or raises the existing
%      singleton*.
%
%      H = T2 returns the handle to a new T2 or the handle to
%      the existing singleton*.
%
%      T2('Property','Value',...) creates a new T2 using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to T2_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      T2('CALLBACK') and T2('CALLBACK',hObject,...) call the
%      local function named CALLBACK in T2.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help T2

% Last Modified by GUIDE v2.5 16-Oct-2013 11:23:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @T2_OpeningFcn, ...
                   'gui_OutputFcn',  @T2_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before T2 is made visible.
function T2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for T2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% UIWAIT makes T2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = T2_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

title(handles.axes,'Data');
title(handles.axes2,'Noise');
title(handles.axes4,'Correlation');
title(handles.axes3,'Data + Noise');
title(handles.axes5,'Matched Filter Output');
title(handles.axes6,'Output resampled');


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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global xpn sps t

sps = 50;
data_str = get(handles.edit_data,'String');

if (regexp(data_str,'^[01]{4,16}$'))
    
    data_arr = split_str(data_str);
    
    x = resample(data_arr,sps);
    xpn = awgn(x,20);
    noise = xpn - x;
    n_std = std(noise);
    l = length(x);
    t = 0+1/sps:1/sps:l/sps;
    
    plot(handles.axes,t,x);
    set(handles.axes,'XLim',[0 t(end)],'YLim', [min(x)-0.2 max(x)+0.2]);
    plot(handles.axes2,t,noise);
    set(handles.axes2,'XLim',[0 t(end)],'YLim', [min(noise)-0.1 max(noise)+0.1]);
    plot(handles.axes3,t,[xpn;x]');
    set(handles.axes3,'XLim',[0 t(end)],'YLim', [min(xpn)-0.1 max(xpn)+0.1]);
    set(handles.std_text,'String',strcat('std = ',num2str(n_std)));
    
    s_corr = xcorr(x,xpn);
    
    plot(handles.axes4,[-l+1:l-1],s_corr);
    set(handles.axes4,'YLim', [min(s_corr)-10 max(s_corr)+10],'YGrid','on','XGrid','on');
    title(handles.axes,'Data');
    title(handles.axes2,'Noise');
    title(handles.axes4,'Correlation');
    title(handles.axes3,'Data + Noise');
    
    
    %set(handles.axes4,'YLim', [min(s_corr)-10 max(s_corr)+10],'YGrid','on','XGrid','on');
end


% --- Executes on button press in filter_b.
function filter_b_Callback(hObject, eventdata, handles)
% hObject    handle to filter_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global xpn sps t

l = length(xpn);
s = [ones(1,sps)];
y = matched(xpn,s,sps);
yf = zeros(1,l);

for i=1:l/sps;
    rsmp = y(sps*i);

    if rsmp > 0.8*sps
        yf(sps*(i-1)+1:sps*i) = s;
    end    
end


plot(handles.axes5,t,y);
set(handles.axes5,'XLim',[0 t(end)],'YLim', [min(y)-0.2 max(y)+0.2]);
plot(handles.axes6,t,yf);
set(handles.axes6,'XLim',[0 t(end)],'YLim', [min(yf)-0.2 max(yf)+0.2]);
title(handles.axes5,'Matched Filter Output');
title(handles.axes6,'Output resampled');
