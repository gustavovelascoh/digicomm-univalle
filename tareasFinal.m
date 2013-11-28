function varargout = tareasFinal(varargin)
% TAREASFINAL MATLAB code for tareasFinal.fig
%      TAREASFINAL, by itself, creates a new TAREASFINAL or raises the existing
%      singleton*.
%
%      H = TAREASFINAL returns the handle to a new TAREASFINAL or the handle to
%      the existing singleton*.
%
%      TAREASFINAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TAREASFINAL.M with the given input arguments.
%
%      TAREASFINAL('Property','Value',...) creates a new TAREASFINAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tareasFinal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tareasFinal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tareasFinal

% Last Modified by GUIDE v2.5 24-Nov-2013 15:23:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tareasFinal_OpeningFcn, ...
                   'gui_OutputFcn',  @tareasFinal_OutputFcn, ...
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


% --- Executes just before tareasFinal is made visible.
function tareasFinal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tareasFinal (see VARARGIN)

% Choose default command line output for tareasFinal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tareasFinal wait for user response (see UIRESUME)
% uiwait(handles.figure1);

global item

item = 1;


% --- Outputs from this function are returned to the command line.
function varargout = tareasFinal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
global item
item = get(hObject,'Value');
text = {'Tareas del Curso "Comunicación Digital"', 'Universidad del Valle','Gustavo Velasco-Hernández. 2013'};

switch item
    case 1
        text = {'Calculadora Ficticia para aprender a manejar el GUIDE'};
    case 2
        text = {'Codificación de Pulsos. Incluye las codificaciones:',
            '* NRZ-L',
            '* NRZ-M',
            '* NRZ-S',
            '* Unipolar RZ',
            '* Bipolar RZ',
            '* RZ-AMI',
            '* Bi-%phi-L',
            '* BI-%phi-M',
            '* BI-%phi-S',
            '* Delay Modulation',
            '* Dicode NRZ',
            '* Dicode RZ'};
    case 3
        text = {'Ruido y filtro Matched. Adición de ruido a una señal binaria, y recuperación mediante el uso de un filtro matched'};
    case 4
        text = {'Modulación. Modulación de señales en Amplitud (ASK), frecuencia (FSK), Fase (PSK) y Amplitud-Fase (APK)'};
    case 5
        text = {'Calculadora para el presupuesto de enlace'};
    case 6
        text = {'Codificación de Canal','','Cálculo de la probabilidad de error de bit usando bits de paridad'};
    case 7
        text = {'Codificación de Canal','','Detección y corrección de errores en transmisión'};
    otherwise
end

set(handles.text1,'String',text);


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

text = {'Tareas del Curso "Comunicación Digital"', 'Universidad del Valle','Gustavo Velasco-Hernández. 2013'};
set(hObject,'String',text);


% --- Executes on button press in abrirb.
function abrirb_Callback(hObject, eventdata, handles)
% hObject    handle to abrirb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global item

switch item
    case 1
        T0;
    case 2
        T1;
    case 3;
        T2;
    case 4
        T3;
    case 5
        T4;
    case 6
        T5;
    case 7
        msgbox('Not Found','Not Found');
end
