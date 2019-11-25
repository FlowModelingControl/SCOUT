function varargout = List(varargin)
% LIST MATLAB code for List.fig
%      LIST, by itself, creates a new LIST or raises the existing
%      singleton*.
%
%      H = LIST returns the handle to a new LIST or the handle to
%      the existing singleton*.
%
%      LIST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LIST.M with the given input arguments.
%
%      LIST('Property','Value',...) creates a new LIST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before List_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to List_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help List

% Last Modified by GUIDE v2.5 25-Oct-2017 21:41:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @List_OpeningFcn, ...
                   'gui_OutputFcn',  @List_OutputFcn, ...
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


% --- Executes just before List is made visible.
function List_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to List (see VARARGIN)
clc;
vars = evalin('base','who');
set(handles.listbox1,'String',vars);

% Choose default command line output for List
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes List wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = List_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in importButton.
function importButton_Callback(hObject, eventdata, handles)
% hObject    handle to importButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
varnames   = get(handles.listbox1,'String'); %get variable names;
sel        = get(handles.listbox1,'Value'); %get selected variable;
myVarName  = varnames{sel}; %get name of selected variable;
myVarVal = evalin('base',myVarName);
if length(myVarVal) < 2
    errordlg('Data being imported is not a vector','Importing failed');    
    return;
end
setappdata(0,'SharedName',myVarName);
close(List);

function figure1_CloseRequestFcn(hObject, eventdata, handles)

delete(hObject);
