% C1535277

function varargout = main(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
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


function main_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
handles.circles = [];
handles.lines = [];
plot(0, 0);
guidata(hObject,handles);

function varargout = main_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function pushbutton1_Callback(hObject, eventdata, handles) % Reset button
handles.circles = [];
handles.lines = [];
plot(0, 0);
guidata(hObject,handles);

function pushbutton3_Callback(hObject, eventdata, handles) % New Line button
inputs = inputdlg({'X1        (first x co-ordinate)', 'Y1        (first y co-ordinate)',...
                    'X2      (second x co-ordinate)',  'Y2      (second y co-ordinate)'},...
                    'Line', [1 1 1 1]);
z = [];
for i = 1:size(inputs, 1)
    z = [z, str2num(cell2mat(inputs(i)))];
end    
disp('Line Created');
handles.lines = [handles.lines; z];
guidata(hObject,handles);

function pushbutton4_Callback(hObject, eventdata, handles) % New Circle button
inputs = inputdlg({'           X centre co-ordinate', '           Y centre co-ordinate',...
                    '                      Radius'}, 'Circle', [1 1 1]);
z = [];
for i = 1:size(inputs, 1)
    z = [z, str2num(cell2mat(inputs(i)))];
end

disp('Circle Created');
handles.circles = [handles.circles; z];
guidata(hObject,handles);

function pushbutton5_Callback(hObject, eventdata, handles) % Plot button
if isempty(handles.lines) == 0 || isempty(handles.circles) == 0
    plotAll(handles.lines, handles.circles);
end
