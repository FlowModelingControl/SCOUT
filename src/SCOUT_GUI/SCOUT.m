function varargout = SCOUT(varargin)
% SCOUT MATLAB code for SCOUT.fig
%      SCOUT, by itself, creates a new SCOUT or raises the existing
%      singleton*.
%
%      H = SCOUT returns the handle to a new SCOUT or the handle to
%      the existing singleton*.
%
%      SCOUT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SCOUT.M with the given input arguments.
%
%      SCOUT('Property','Value',...) creates a new SCOUT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SCOUT_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SCOUT_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SCOUT

% Last Modified by GUIDE v2.5 15-Aug-2019 11:20:56

% Begin initialization code - DO NOT EDIT


gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @SCOUT_OpeningFcn, ...
    'gui_OutputFcn',  @SCOUT_OutputFcn, ...
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


% --- Executes just before SCOUT is made visible.
function SCOUT_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SCOUT (see VARARGIN)
cla;
clc;
if ~isempty(varargin)
    handles.closeFigure = true;
end
% Clearing temporary data stored which was stored while running the app
% after the app is opened
if ~isnan(getappdata(0,'SharedName'))
    rmappdata(0,'SharedName')
end
if ~isnan(getappdata(0,'set_u1'))
    rmappdata(0,'set_u1')
end
if ~isnan(getappdata(0,'set_t1'))
    rmappdata(0,'set_t1')
end
if ~isnan(getappdata(0,'set_u2'))
    rmappdata(0,'set_u2')
end
if ~isnan(getappdata(0,'set_t2'))
    rmappdata(0,'set_t2')
end
if ~isnan(getappdata(0,'set_u3'))
    rmappdata(0,'set_u3')
end
if ~isnan(getappdata(0,'set_t3'))
    rmappdata(0,'set_t3')
end
if ~isnan(getappdata(0,'set_u4'))
    rmappdata(0,'set_u4')
end
if ~isnan(getappdata(0,'set_t4'))
    rmappdata(0,'set_t4')
end
if ~isnan(getappdata(0,'set_u5'))
    rmappdata(0,'set_u5')
end
if ~isnan(getappdata(0,'set_t5'))
    rmappdata(0,'set_t5')
end
if ~isnan(getappdata(0,'temp_T'))
    rmappdata(0,'temp_T')
end
if ~isnan(getappdata(0,'temp_t'))
    rmappdata(0,'temp_t')
end
if ~isnan(getappdata(0,'temp_f'))
    rmappdata(0,'temp_f')
end
if ~isnan(getappdata(0,'temp_u'))
    rmappdata(0,'temp_u')
end
if ~isnan(getappdata(0,'temp_u_2'))
    rmappdata(0,'temp_u_2')
end
if ~isnan(getappdata(0,'temp_new_u'))
    rmappdata(0,'temp_new_u')
end
if ~isnan(getappdata(0,'temp_new_u_poly'))
    rmappdata(0,'temp_new_u_poly')
end
if ~isnan(getappdata(0,'set_dev'))
    rmappdata(0,'set_dev')
end
if ~isnan(getappdata(0,'set_pos'))
    rmappdata(0,'set_pos')
end
if ~isnan(getappdata(0,'set_vec'))
    rmappdata(0,'set_vec')
end
if ~isnan(getappdata(0,'set_final'))
    rmappdata(0,'set_final')
end
if ~isnan(getappdata(0,'temp_high'))
    rmappdata(0,'temp_high')
end
if ~isnan(getappdata(0,'temp_low'))
    rmappdata(0,'temp_low')
end
if ~isnan(getappdata(0,'temp_order'))
    rmappdata(0,'temp_order')
end
if ~isnan(getappdata(0,'temp_hdb'))
    rmappdata(0,'temp_hdb')
end
if ~isnan(getappdata(0,'set_filter'))
    rmappdata(0,'set_filter')
end
if ~isnan(getappdata(0,'set_p1'))
    rmappdata(0,'set_p1')
end
if ~isnan(getappdata(0,'set_p2'))
    rmappdata(0,'set_p2')
end
if ~isnan(getappdata(0,'set_f1'))
    rmappdata(0,'set_f1')
end
if ~isnan(getappdata(0,'set_f2'))
    rmappdata(0,'set_f2')
end
if ~isnan(getappdata(0,'norm_t1'))
    rmappdata(0,'norm_t1')
end
if ~isnan(getappdata(0,'norm_t2'))
    rmappdata(0,'norm_t2')
end
if ~isnan(getappdata(0,'norm_t3'))
    rmappdata(0,'norm_t3')
end
if ~isnan(getappdata(0,'norm_t4'))
    rmappdata(0,'norm_t4')
end
if ~isnan(getappdata(0,'norm_t5'))
    rmappdata(0,'norm_t5')
end
% Creating Summary1 struct
Summary1 = SummaryFunc(1);
% Creating Result struct for uncertainty analysis output
UncertaintySummary = struct('TotalMeanUncert','Not Performed','ExpandedMeanUncert','Not Performed','TotalSystematicUncert',...
    'Not Performed','IntegralTimeScale','Not Performed','Std',struct('SampleRecord','Not Performed','Mean',...
    'Not Performed'),'Neff','Not Performed','SecondOrderUncert',struct('NormDist','Not Performed',...
    'Formula','Not Performed'),'ThirdOrderUncert',struct('NormDist','Not Performed','Formula','Not Performed'),...
    'FourthOrderUncert',struct('NormDist','Not Performed','Formula','Not Performed'),'AutocorrelationCoefficient',...
    struct('Rho','Not Performed','Tau','Not Performed'));
% Adding Result and Summary1 struct to the object handles
% So that it can be accessed and updated from all the functions
handles.UncertaintySummary = UncertaintySummary;
handles.Summary1 = Summary1;
handles.output = hObject;
% Clearing all the text fields
array1 = [handles.sampling1Input,handles.data1Display,handles.sampling2Input,handles.data2Display,...
    handles.sampling3Input,handles.data3Display,handles.sampling4Input,handles.data4Display,...
    handles.sampling5Input,handles.data5Display];
set(array1,'String','');
% HTML for highlighting the menu option
text1 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid green;padding: 2px;}</style><center><div>Import</div></center><html>';
set(handles.import,'label',text1);
text2 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Stationarity analysis</div></center><html>';
set(handles.stationaryAnalysis,'label',text2);
text3 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Spurious samples</div></center><html>';
set(handles.noiseRemoval,'label',text3);
text4 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Normality</div></center><html>';
set(handles.normality,'label',text4);
text5 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Periodicity</div></center><html>';
set(handles.periodicity,'label',text5);
text6 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Spectral analysis</div></center><html>';
set(handles.spectralAnalysis,'label',text6);
text7 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Uncertainty analysis</div></center><html>';
set(handles.uncertainty,'label',text7);
% Setting signal 1 Plot button as unmarked
set(handles.data1PlotButton,'Value',0)
% HTML function for coloring the first column of the signal 1 Summary table
colorgen = @(color,text) ['<html><table border=0 width=400 bgcolor=',color,'><TR><TD>',text,'</TD></TR> </table></html>'];
% Setting the color  of the first column and second column as empty for all
% 5 data
data = {colorgen('#F0F0F0','Stationary'), ''
    colorgen('#F0F0F0','No. of spurious samples'), ''
    colorgen('#F0F0F0','Normal distribution'), ''
    colorgen('#F0F0F0','Periodic'), ''
    colorgen('#F0F0F0','Peak frequency'), ''
    colorgen('#F0F0F0','Integral time scale'), ''
    };
set(handles.data1SummaryTable,'Data',data);
set(handles.data2SummaryTable,'Data',data);
set(handles.data3SummaryTable,'Data',data);
set(handles.data4SummaryTable,'Data',data);
set(handles.data5SummaryTable,'Data',data);
% Update handles structure
guidata(hObject, handles);
% For uploading from workspace
setappdata(0,'HandleMainGUI',hObject);

% UIWAIT makes SCOUT wait for user response (see UIRESUME)
% uiwait(handles.SCOUT);


% --- Outputs from this function are returned to the command line.
function varargout = SCOUT_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes when SCOUT is resized.
function SCOUT_SizeChangedFcn(~, ~, ~)
% hObject    handle to SCOUT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
% Import menu function. It clears the data that is visible during this function,
% makes irrelevant objects invible and relevant objects visible
function import_Callback(~, ~, handles)
% hObject    handle to import (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% HTML for highlighting the Import menu
text1 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid green;padding: 2px;}</style><center><div>Import</div></center><html>';
set(handles.import,'label',text1);
% Removing the highlights from other menu options
text2 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Stationarity analysis</div></center><html>';
set(handles.stationaryAnalysis,'label',text2);
text3 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Spurious samples</div></center><html>';
set(handles.noiseRemoval,'label',text3);
text4 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Normality</div></center><html>';
set(handles.normality,'label',text4);
text5 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Periodicity</div></center><html>';
set(handles.periodicity,'label',text5);
text6 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Spectral analysis</div></center><html>';
set(handles.spectralAnalysis,'label',text6);
text7 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Uncertainty analysis</div></center><html>';
set(handles.uncertainty,'label',text7);
% Clearing the axes
arrayfun(@cla,findall(0,'type','axes'));
legend(handles.stationaryaxes,'off');
legend(handles.noiseaxes1,'off');
legend(handles.noiseaxes2,'off');
legend(handles.normalityaxes1,'off');
legend(handles.normalityaxes2,'off');
legend(handles.periodicaxes1,'off');
legend(handles.periodicaxes2,'off');
legend(handles.spectralaxes1,'Off');
legend(handles.spectralaxes2,'Off');
% Clearing statistics table
set(handles.statisticsTable, 'Data', cell(size(get(handles.statisticsTable,'Data'))));
set(handles.statisticsPanel,'Title','Signal statistics');
% Setting objects visible on
handleArray1 = [handles.originalaxes,handles.inputPanel,handles.plotDataGroup,handles.resultDisplayPanel,...
    handles.plotPanel,handles.statisticsPanel];
set(handleArray1, 'Visible', 'on');
% Setting objects visible off
handleArray2 = [handles.stationaryaxes,handles.inputStationaryPanel,handles.plotStationarityPanel,...
    handles.data1SummaryPanel,handles.noiseaxes1,handles.noiseaxes2,handles.inputNoisePanel,...
    handles.noisePlotCheckPanel,handles.noisePlotCheckPanel2,handles.normalityaxes1,handles.removePeriodicityGroup...
    handles.inputNormPanel,handles.normPlotCheckPanel1,handles.normPlotCheckPanel2,handles.integrationText...
    handles.normalityaxes2,handles.inputPeriodicPanel,handles.periodicPlotCheckPanel,handles.uncertaintyPlotPanel...
    handles.spectralPlotCheckPanel,handles.periodicaxes1,handles.periodicaxes2,handles.inputSpectralPanel,...
    handles.integralSpectralPanel,handles.spectralSlider,handles.spectrumDistriPlotCheckPanel,handles.spectralaxes1,...
    handles.spectralaxes2,handles.autoPlotCheckPanel,handles.uncertaintyOutputPanel,handles.uncertaintyInputPanel];
set(handles.resultDisplay,'String','');
set(handleArray2,'Visible','off');

% --------------------------------------------------------------------
function stationaryAnalysis_Callback(~, ~, handles)
% hObject    handle to stationaryAnalysis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% HTML for highlighting the Stationarity analysis menu
text2 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid green;padding: 2px;}</style><center><div>Stationarity analysis</div></center><html>';
set(handles.stationaryAnalysis,'label',text2);
% Removing the highlights from other menu options
text1 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Import</div></center><html>';
set(handles.import,'label',text1);
text3 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Spurious samples</div></center><html>';
set(handles.noiseRemoval,'label',text3);
text4 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Normality</div></center><html>';
set(handles.normality,'label',text4);
text5 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Periodicity</div></center><html>';
set(handles.periodicity,'label',text5);
text6 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Spectral analysis</div></center><html>';
set(handles.spectralAnalysis,'label',text6);
text7 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Uncertainty analysis</div></center><html>';
set(handles.uncertainty,'label',text7);
% Clearing all the axes
arrayfun(@cla,findall(0,'type','axes'));
legend(handles.stationaryaxes,'off');
legend(handles.noiseaxes1,'off');
legend(handles.noiseaxes2,'off');
legend(handles.normalityaxes1,'off');
legend(handles.normalityaxes2,'off');
legend(handles.periodicaxes1,'off');
legend(handles.periodicaxes2,'off');
legend(handles.spectralaxes1,'Off');
legend(handles.spectralaxes2,'Off');
% Clearing statistics table
set(handles.statisticsTable, 'Data', cell(size(get(handles.statisticsTable,'Data'))));
set(handles.statisticsPanel,'Title','Signal statistics');
% Setting objects visible off
handleArray1 = [handles.originalaxes,handles.inputPanel,handles.plotDataGroup,handles.noiseaxes1,handles.integrationText...
    handles.noiseaxes2,handles.inputNoisePanel,handles.noisePlotCheckPanel,handles.noisePlotCheckPanel2,...
    handles.normalityaxes1,handles.inputNormPanel,handles.normPlotCheckPanel1,handles.uncertaintyPlotPanel...
    handles.normPlotCheckPanel2,handles.normalityaxes2,handles.inputPeriodicPanel,handles.periodicPlotCheckPanel,...
    handles.spectralPlotCheckPanel,handles.periodicaxes1,handles.periodicaxes2,handles.inputSpectralPanel,...
    handles.integralSpectralPanel,handles.spectralSlider,handles.spectrumDistriPlotCheckPanel,handles.spectralaxes1,...
    handles.spectralaxes2,handles.autoPlotCheckPanel,handles.uncertaintyOutputPanel,handles.uncertaintyInputPanel,...
    handles.removePeriodicityGroup];
set(handleArray1, 'Visible', 'Off');
% Setting objects visible on
handleArray2 = [handles.stationaryaxes,handles.inputStationaryPanel,handles.plotStationarityPanel,...
    handles.data1SummaryPanel,handles.resultDisplayPanel,handles.plotPanel,handles.statisticsPanel];
set(handleArray2,'Visible','On');
handleArray3 = [handles.originalDataStationaryCheck];
set(handles.resultDisplay,'String','');
set(handleArray3,'Enable','Off');
set(handles.selectDataStationaryPopup, 'Enable','On')
set(handles.noStationarityRadio,'Value',0);
set(handles.yesStationarityRadio,'Value',0);
set(handles.wantStationarityPopup,'Value',1);
array2 = [handles.noStationarityRadio,handles.yesStationarityRadio,handles.wantStationarityPopup];
set(array2,'Enable','Off')
array1 = [handles.stationaryDataStationaryCheck,handles.stationaryDataPolyCheck,...
    handles.polynomialStationaryCheck,handles.originalDataStationaryCheck];
set(array1,'Enable','Off');
set(array1,'Value',0);
set(array1,'Visible','Off');
cla(handles.stationaryaxes,'reset');
set(handles.statisticsTable, 'Data', cell(size(get(handles.statisticsTable,'Data'))));
set(handles.statisticsPanel,'title','Signal statistics');
array = [handles.originalDataStationaryCheck,handles.stationaryDataStationaryCheck,handles.stationaryDataPolyCheck,...
    handles.polynomialStationaryCheck];
set(array,'Visible','Off');
set(handles.stationarySubsizeInput,'String','100');
set(handles.stationarySubsizeInput,'Enable','Off');


% --------------------------------------------------------------------
function noiseRemoval_Callback(~, ~, handles)
% hObject    handle to noiseRemoval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% HTML for highlighting the Noise Removal menu
text3 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid green;padding: 2px;}</style><center><div>Spurious samples</div></center><html>';
set(handles.noiseRemoval,'label',text3);
% Removing the highlights from other menu options
text1 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Import</div></center><html>';
set(handles.import,'label',text1);
text2 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Stationarity analysis</div></center><html>';
set(handles.stationaryAnalysis,'label',text2);
text4 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Normality</div></center><html>';
set(handles.normality,'label',text4);
text5 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Periodicity</div></center><html>';
set(handles.periodicity,'label',text5);
text6 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Spectral analysis</div></center><html>';
set(handles.spectralAnalysis,'label',text6);
text7 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Uncertainty analysis</div></center><html>';
set(handles.uncertainty,'label',text7);
% Clearing all the axes
arrayfun(@cla,findall(0,'type','axes'));
legend(handles.stationaryaxes,'off');
legend(handles.noiseaxes1,'off');
legend(handles.noiseaxes2,'off');
legend(handles.normalityaxes1,'off');
legend(handles.normalityaxes2,'off');
legend(handles.periodicaxes1,'off');
legend(handles.periodicaxes2,'off');
legend(handles.spectralaxes1,'Off');
legend(handles.spectralaxes2,'Off');
% Clearing statistics table
set(handles.statisticsTable, 'Data', cell(size(get(handles.statisticsTable,'Data'))));
set(handles.statisticsPanel,'Title','Signal statistics');
% Setting objects visible off
handleArray1 = [handles.originalaxes,handles.inputPanel,handles.plotDataGroup,handles.stationaryaxes,...
    handles.inputStationaryPanel,handles.plotStationarityPanel,handles.uncertaintyPlotPanel,...
    handles.normalityaxes1,handles.inputNormPanel,handles.normPlotCheckPanel1,handles.normPlotCheckPanel2,...
    handles.normalityaxes2,handles.inputPeriodicPanel,handles.periodicPlotCheckPanel,handles.spectralPlotCheckPanel,...
    handles.periodicaxes1,handles.periodicaxes2,handles.inputSpectralPanel,handles.integralSpectralPanel,...
    handles.spectralSlider,handles.spectrumDistriPlotCheckPanel,handles.spectralaxes1,handles.spectralaxes2,...
    handles.autoPlotCheckPanel,handles.uncertaintyOutputPanel,handles.uncertaintyInputPanel,handles.integrationText,...
    handles.removePeriodicityGroup];
set(handleArray1, 'Visible', 'Off');
% Setting objects visible on
handleArray2 = [handles.noiseaxes1,handles.inputNoisePanel,handles.data1SummaryPanel,...
    handles.noisePlotCheckPanel,handles.noisePlotCheckPanel2,handles.noiseaxes2,handles.resultDisplayPanel,...
    handles.plotPanel,handles.statisticsPanel];
set(handles.resultDisplay,'String','');
set(handles.histogramBinInput,'String','20');
set(handleArray2,'Visible','On');
handle = [handles.chauvenetRadio,handles.histogramRadio,handles.defaultChauvenetRadio,handles.otherChauvenetRadio,...
    handles.defaultHistogramRadio,handles.otherHistogramRadio,handles.removalRadio,handles.replacementRadio];
set(handle,'Value',0);
set(handles.histogramBinInput,'String','');
set(handles.chauvenetDeviationInput,'String','');
array = [handles.defaultChauvenetRadio,handles.otherChauvenetRadio,handles.chauvenetDeviationInput,...
    handles.defaultHistogramRadio,handles.otherHistogramRadio,handles.histogramBinInput,handles.removalRadio,...
    handles.replacementRadio,];
set(array,'Enable','Off');
check = [handles.stationaryDetrendNoiseCheck,handles.stationaryPolyNoiseCheck];
set(check,'Enable','On');
set(check,'Value',0);
set(handles.originalDataPopup,'Enable','On');
array2 = [handles.selectedDataNoiseCheck,handles.noiselessRemoCheck,handles.noiselessSubsCheck,...
    handles.selectedHistoCheck,handles.noiselessRemoHistoCheck,handles.noiselessSubsHistoCheck];
set(array2,'Visible','Off');

% --------------------------------------------------------------------
function normality_Callback(~, ~, handles)
% hObject    handle to normality (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% HTML for highlighting the Normality menu
text4 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid green;padding: 2px;}</style><center><div>Normality</div></center><html>';
set(handles.normality,'label',text4);
% Removing the highlights from other menu options
text1 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Import</div></center><html>';
set(handles.import,'label',text1);
text2 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Stationarity analysis</div></center><html>';
set(handles.stationaryAnalysis,'label',text2);
text3 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Spurious samples</div></center><html>';
set(handles.noiseRemoval,'label',text3);
text5 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Periodicity</div></center><html>';
set(handles.periodicity,'label',text5);
text6 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Spectral analysis</div></center><html>';
set(handles.spectralAnalysis,'label',text6);
text7 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Uncertainty analysis</div></center><html>';
set(handles.uncertainty,'label',text7);
% Clearing all the axes
arrayfun(@cla,findall(0,'type','axes'));
legend(handles.stationaryaxes,'off');
legend(handles.noiseaxes1,'off');
legend(handles.noiseaxes2,'off');
legend(handles.normalityaxes1,'off');
legend(handles.normalityaxes2,'off');
legend(handles.periodicaxes1,'off');
legend(handles.periodicaxes2,'off');
legend(handles.spectralaxes1,'Off');
legend(handles.spectralaxes2,'Off');
% Clearing statistics table
set(handles.statisticsTable, 'Data', cell(size(get(handles.statisticsTable,'Data'))));
set(handles.statisticsPanel,'Title','Signal statistics');
% Setting objects visible off
handleArray1 = [handles.originalaxes,handles.inputPanel,handles.plotDataGroup,handles.stationaryaxes,...
    handles.inputStationaryPanel,handles.plotStationarityPanel,handles.noisePlotCheckPanel2,...
    handles.noiseaxes1,handles.inputNoisePanel,handles.noisePlotCheckPanel,handles.uncertaintyPlotPanel...
    handles.noiseaxes2,handles.inputPeriodicPanel,handles.periodicPlotCheckPanel,handles.spectralPlotCheckPanel,...
    handles.periodicaxes1,handles.periodicaxes2,handles.inputSpectralPanel,handles.integralSpectralPanel,...
    handles.spectralSlider,handles.spectrumDistriPlotCheckPanel,handles.spectralaxes1,handles.spectralaxes2,...
    handles.autoPlotCheckPanel,handles.uncertaintyOutputPanel,handles.uncertaintyInputPanel,handles.integrationText,...
    handles.removePeriodicityGroup];
set(handleArray1, 'Visible', 'Off');
% Setting objects visible on
handleArray2 = [handles.normalityaxes1,handles.inputNormPanel,handles.data1SummaryPanel,...
    handles.normPlotCheckPanel1,handles.normPlotCheckPanel2,handles.normalityaxes2,handles.resultDisplayPanel,...
    handles.plotPanel,handles.statisticsPanel];
set(handles.resultDisplay,'String','');
set(handles.binSizeNormInput,'Enable','Off');
set(handles.binSizeNormInput,'String','');
set(handleArray2,'Visible','On');
handle = [handles.otherBinNormRadio,handles.significanceNormInput,handles.otherBinNormRadio,...
    handles.otherSignificanceRadio];
set(handle,'Value',0);
set(handles.significanceNormInput,'Enable','Off');
set(handles.significanceNormInput,'String','0.95');
check = [handles.stationaryPolyNormCheck,handles.stationaryDetrendNormCheck,handles.chauNormCheck,...
    handles.histoNormCheck,handles.replacedNormCheck,handles.removedNormCheck,handles.defaultBinNormRadio];
set(check,'Enable','On');
set(check,'Value',0);
set(handles.defaultSignificanceRadio,'Value',1);
set(handles.originalDataNormPopup,'Enable','On');
array2 = [handles.selectedDataNormCheck,handles.selectedNormHistoCheck,handles.selectedNormFitCheck];
set(array2,'Visible','Off');



% --------------------------------------------------------------------
function periodicity_Callback( ~, ~, handles)
% hObject    handle to periodicity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% HTML for highlighting the Periodicty menu
text5 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid green;padding: 2px;}</style><center><div>Periodicity</div></center><html>';
set(handles.periodicity,'label',text5);
% Removing the highlights from other menu options
text1 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Import</div></center><html>';
set(handles.import,'label',text1);
text2 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Stationarity analysis</div></center><html>';
set(handles.stationaryAnalysis,'label',text2);
text3 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Spurious samples</div></center><html>';
set(handles.noiseRemoval,'label',text3);
text4 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Normality</div></center><html>';
set(handles.normality,'label',text4);
text6 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Spectral analysis</div></center><html>';
set(handles.spectralAnalysis,'label',text6);
text7 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Uncertainty analysis</div></center><html>';
set(handles.uncertainty,'label',text7);
% Clearing all the axes
arrayfun(@cla,findall(0,'type','axes'));
legend(handles.stationaryaxes,'off');
legend(handles.noiseaxes1,'off');
legend(handles.noiseaxes2,'off');
legend(handles.normalityaxes1,'off');
legend(handles.normalityaxes2,'off');
legend(handles.periodicaxes1,'Off');
legend(handles.periodicaxes2,'Off');
legend(handles.spectralaxes1,'Off');
legend(handles.spectralaxes2,'Off');
% Clearing statistics table
set(handles.statisticsTable, 'Data', cell(size(get(handles.statisticsTable,'Data'))));
set(handles.statisticsPanel,'Title','Signal statistics');
% Setting objects visible off
handleArray1 = [handles.originalaxes,handles.inputPanel,handles.plotDataGroup,handles.stationaryaxes,...
    handles.inputStationaryPanel,handles.plotStationarityPanel,handles.noisePlotCheckPanel2,handles.uncertaintyPlotPanel...
    handles.noiseaxes1,handles.inputNoisePanel,handles.data1SummaryPanel,handles.noisePlotCheckPanel,...
    handles.noiseaxes2,handles.normalityaxes1,handles.inputNormPanel,handles.uncertaintyInputPanel,...
    handles.normPlotCheckPanel1,handles.normPlotCheckPanel2,handles.normalityaxes2,handles.inputSpectralPanel,...
    handles.integralSpectralPanel,handles.spectralSlider,handles.spectrumDistriPlotCheckPanel,handles.integrationText...
    handles.spectralaxes1,handles.spectralaxes2,handles.autoPlotCheckPanel,handles.uncertaintyOutputPanel];
set(handleArray1, 'Visible', 'Off');
% Setting objects visible on
handleArray2 = [handles.inputPeriodicPanel,handles.periodicPlotCheckPanel,handles.data1SummaryPanel,...
    handles.spectralPlotCheckPanel,handles.periodicaxes1,handles.periodicaxes2,handles.resultDisplayPanel,handles.plotPanel,...
    handles.statisticsPanel,handles.removePeriodicityGroup];
set(handles.resultDisplay,'String','');
set(handleArray2,'Visible','On');
array2 = [handles.selectedDataPeriodicCheck,handles.nonPeriodicCheck,...
    handles.selectedSpectrumCheck,handles.peakRemovedSpectrumCheck];
set(array2,'Visible','Off');
check = [handles.stationaryPolyPeriodicCheck,handles.stationaryDetrendPeriodicCheck,handles.noiselessChauPeriodicCheck,...
    handles.noiselessHistoPeriodicCheck];
set(check,'Enable','On');
set(check,'Value',0);
set(handles.originalDataPeriodicPopup,'Enable','On');
set(handles.divPeriodicInput,'String','8');
set(handles.overPeriodicInput,'String','0.5');
set(handles.discretePeriodicInput,'String','');
set(handles.divPeriodicInput,'Enable','Off');
set(handles.overPeriodicInput,'Enable','Off');
set(handles.discretePeriodicInput,'Enable','Off');
array1 = [handles.defaultDivPeriodicRadio,handles.defaultOverRadio];
set(array1,'Value',1);
set(handles.defaultDiscreteRadio,'Value',0);
array2 = [handles.yesRemovePerioButton,handles.noRemovePerioButton];
set(array2,'Enable','Off');
set(array2,'Value',0);
array3 = [handles.scalePeriodicityInput,handles.minlimitPeriodicityInput,...
    handles.maxlimitPeriodicityInput,handles.appendPeriodicityInput];
set(array3,'Enable','Off');
set(array3,'String','');

% --------------------------------------------------------------------
function spectralAnalysis_Callback(~, ~, handles)
% hObject    handle to spectralAnalysis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% HTML for highlighting the Spectral Analysis menu
text6 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid green;padding: 2px;}</style><center><div>Spectral analysis</div></center><html>';
set(handles.spectralAnalysis,'label',text6);
% Removing the highlights from other menu options
text1 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Import</div></center><html>';
set(handles.import,'label',text1);
text2 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Stationarity analysis</div></center><html>';
set(handles.stationaryAnalysis,'label',text2);
text3 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Spurious samples</div></center><html>';
set(handles.noiseRemoval,'label',text3);
text4 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Normality</div></center><html>';
set(handles.normality,'label',text4);
text5 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Periodicity</div></center><html>';
set(handles.periodicity,'label',text5);
text7 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Uncertainty analysis</div></center><html>';
set(handles.uncertainty,'label',text7);
% Clearing all the axes
arrayfun(@cla,findall(0,'type','axes'));
legend(handles.stationaryaxes,'off');
legend(handles.noiseaxes1,'off');
legend(handles.noiseaxes2,'off');
legend(handles.normalityaxes1,'off');
legend(handles.normalityaxes2,'off');
legend(handles.periodicaxes1,'Off');
legend(handles.periodicaxes2,'Off');
legend(handles.spectralaxes1,'Off');
legend(handles.spectralaxes2,'Off');
% Clearing statistics table
set(handles.statisticsTable, 'Data', cell(size(get(handles.statisticsTable,'Data'))));
set(handles.statisticsPanel,'Title','Signal statistics');
% Setting objects visible off
handleArray1 = [handles.originalaxes,handles.inputPanel,handles.plotDataGroup,handles.stationaryaxes,...
    handles.inputStationaryPanel,handles.plotStationarityPanel,handles.noisePlotCheckPanel2,...
    handles.noiseaxes1,handles.inputNoisePanel,handles.noisePlotCheckPanel,handles.removePeriodicityGroup...
    handles.noiseaxes2,handles.normalityaxes1,handles.inputNormPanel,handles.uncertaintyPlotPanel...
    handles.normPlotCheckPanel1,handles.normPlotCheckPanel2,handles.normalityaxes2,...
    handles.inputPeriodicPanel,handles.periodicPlotCheckPanel,handles.uncertaintyInputPanel,...
    handles.uncertaintyOutputPanel,handles.spectralPlotCheckPanel,handles.periodicaxes1,handles.periodicaxes2];
set(handleArray1, 'Visible', 'Off');
% Setting objects visible on
handleArray2 = [handles.inputSpectralPanel,handles.integralSpectralPanel,handles.spectralSlider,...
    handles.spectrumDistriPlotCheckPanel,handles.spectralaxes1,handles.spectralaxes2,...
    handles.autoPlotCheckPanel,handles.data1SummaryPanel,handles.resultDisplayPanel,handles.plotPanel,...
    handles.statisticsPanel,handles.integrationText];
set(handles.resultDisplay,'String','');
set(handleArray2,'Visible','On');
array2 = [handles.spectralDistriPlotCheck,handles.autoPlotCheck,handles.integralTimeText,handles.integralTimeDisplay,...
    handles.integralTimeUnit,handles.integralTimeScaleUnit,handles.integralText,handles.integralDisplay,handles.integralHover];
set(array2,'Visible','Off');
set(handles.spectrumDistriPlotCheckPanel,'Title','Spectrum distribution checkbox');
set(handles.autoPlotCheckPanel,'Title','Autocorrelation coefficient checkbox');
check = [handles.stationaryPolySpectralCheck,handles.stationaryDetrendSpectralCheck,handles.noiselessChauSpectralCheck,...
    handles.noiselessHistoSpectralCheck,handles.nonperiodicSpectralCheck];
set(check,'Enable','On');
set(check,'Value',0);
handle = [handles.autoDefaultSpectralButton,handles.autoOtherSpectralButton];
set(handle,'Value',0);
set(handles.autoSpectralInput,'Enable','Off');
set(handles.autoSpectralInput,'String','');
set(handles.originalDataSpectralPopup,'Enable','On');
set(handles.divisionSpectralInput,'String','8');
set(handles.overSpectralInput,'String','0.5');
set(handles.discreteSpectralInput,'String','');
set(handles.divisionSpectralInput,'Enable','Off');
set(handles.overSpectralInput,'Enable','Off');
set(handles.discreteSpectralInput,'Enable','Off');
array1 = [handles.defaultDivSpectralButton,handles.defaultOverSpectralButton];
set(array1,'Value',1);
set([handles.defaultDiscSpectralButton,handles.otherDiscSpectralButton],'Value',0);
set(handles.integrationText,'String',{'Total','time','shift'});

% --------------------------------------------------------------------
function uncertainty_Callback(~, ~, handles)
% hObject    handle to uncertainty (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% HTML for highlighting the Uncertainty menu
text7 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid green;padding: 2px;}</style><center><div>Uncertainty analysis</div></center><html>';
set(handles.uncertainty,'label',text7);
% Removing the highlights from other menu options
text1 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Import</div></center><html>';
set(handles.import,'label',text1);
text2 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Stationarity analysis</div></center><html>';
set(handles.stationaryAnalysis,'label',text2);
text3 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Spurious samples</div></center><html>';
set(handles.noiseRemoval,'label',text3);
text4 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Normality</div></center><html>';
set(handles.normality,'label',text4);
text5 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Periodicity</div></center><html>';
set(handles.periodicity,'label',text5);
text6 = '<html><style>div{background-color:lightgrey;width:90px;border:2px solid white;padding: 2px;}</style><center><div>Spectral analysis</div></center><html>';
set(handles.spectralAnalysis,'label',text6);
% Clearing all the axes
arrayfun(@cla,findall(0,'type','axes'));
% Setting objects visible off
handleArray1 = [handles.originalaxes,handles.inputPanel,handles.plotDataGroup,handles.stationaryaxes,...
    handles.inputStationaryPanel,handles.plotStationarityPanel,handles.noisePlotCheckPanel2,...
    handles.noiseaxes1,handles.inputNoisePanel,handles.data1SummaryPanel,handles.noisePlotCheckPanel,...
    handles.noiseaxes2,handles.normalityaxes1,handles.inputNormPanel,handles.statisticsPanel...
    handles.normPlotCheckPanel1,handles.normPlotCheckPanel2,handles.normalityaxes2,handles.removePeriodicityGroup...
    handles.inputPeriodicPanel,handles.periodicPlotCheckPanel,handles.spectralPlotCheckPanel,...
    handles.periodicaxes1,handles.periodicaxes2,handles.inputSpectralPanel,handles.integralSpectralPanel,...
    handles.spectralSlider,handles.spectrumDistriPlotCheckPanel,handles.spectralaxes1,handles.spectralaxes2,...
    handles.autoPlotCheckPanel,handles.resultDisplayPanel,handles.plotPanel,handles.data2SummaryPanel,...
    handles.data3SummaryPanel,handles.data4SummaryPanel,handles.data5SummaryPanel];
set(handleArray1, 'Visible', 'Off');
% Setting objects visible off
handlearray2 = [handles.uncertaintyInputPanel,handles.uncertaintyOutputPanel,handles.uncertaintyPlotPanel];
set(handlearray2,'Visible','On');
array1 = [handles.normalSecondRadio,handles.normalThirdRadio,handles.normalFourthRadio,handles.formulaSecondRadio,...
    handles.formulaThirdRadio,handles.formulaFourthRadio];
set(array1,'Value',0);
set(array1,'Enable','Off');
array2 = [handles.secondUncertaintyDisplay,handles.thirdUncertaintyDisplay,handles.fourthUncertaintyDisplay,...
    handles.timeScaleUncertaintyDisplay,handles.expandedUncertaintyDisplay,handles.combinedUncertaintyDisplay,...
    handles.systematicUncertaintyDisplay,handles.constantDisplay,handles.term1Display,handles.term2Display,...
    handles.term3Display,handles.term4Display,handles.term5Display,handles.term1ExponentDisplay,...
    handles.term2ExponentDisplay,handles.term3ExponentDisplay,handles.term4ExponentDisplay,handles.term5ExponentDisplay,...
    handles.meanOutput,handles.uncertaintyOutput];
set(array2,'String','');
handle = [handles.autoDefaultUncertaintyButton,handles.autoOtherUncertaintyButton];
set(handle,'Value',0);
set(handles.autoUncertaintyInput,'Enable','Off');
set(handles.autoUncertaintyInput,'String','');
set(handles.randomUncertaintyTable,'Data',cell(size(get(handles.randomUncertaintyTable,'Data'))));
set(handles.uncertaintySlider,'Enable','Off');
set(handles.integrationUncertaintyText,'String',{'Total','time','shift'});
% check = [handles.noiselessHistoUncertainty1Check,handles.stationaryDetrendUncertainty1Check,handles.noiselessHistoUncertainty1Check,...
%     handles.stationaryPolyUncertainty1Check,handles.nonperiodicUncertainty1Check];
% set(check,'Enable','On');
% set(check,'Value',0);


function sampling1Input_Callback(~, ~, ~)
% hObject    handle to sampling1Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of sampling1Input as text
%        str2double(get(hObject,'String')) returns contents of sampling1Input as a double


% --- Executes during object creation, after setting all properties.
function sampling1Input_CreateFcn(hObject, ~, ~)
% hObject    handle to sampling1Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in data1Push.
function data1Push_Callback(~, ~, handles)
% hObject    handle to data1Push (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Getting the selected string from the popup
str = get(handles.data1Popup, 'String');
var = get(handles.data1Popup,'Value');
switch str{var}
    case 'Workspace'
        % Calling list figure for uploading the data from workspace
        uiwait(List);
        % Getting the Selected signal from workspace stored in 'SharedName'
        var1 = getappdata(0,'SharedName');
        if ~isempty(var1)
            var = evalin('base',var1);
            set(handles.data1Display,'string',var1);
            % Transforming column vector to row vector
            if iscolumn(var)
                var = var';
            end
            % Creating temporary variable to access it in another funtion
            % for plotting
            setappdata(0,'set_u1',var);
        end
        % Assigning the data to workspace
        assignin('base','Signal1',var);
    case 'Drive'
        % Calling the Drive function to upload data from drive
        [field,struct,ret] = Drive();
        % ret = 1 implies nothing was uploaded
        if ret == 1
            return;
        end
        % Field has the variable name of the data
        set(handles.data1Display, 'String', field);
        b = table2array(struct2cell(struct));
        if iscolumn(b)
            b = b';
        end
        setappdata(0,'set_u1',b);
        assignin('base','Signal1',b);
end

% Function for uploading data from drive
function [out1,out2,ret] = Drive()
ret = 0;
defaultFilePath = fullfile('pwd', '*.mat');
[baseFileName, folder] = uigetfile(defaultFilePath, 'Select a mat file');
if baseFileName == 0
    ret = 1;
    out1 = 1;
    out2 = 1;
    % User clicked the Cancel button.
    return;
end
fullFileName = fullfile(folder, baseFileName);
% Loading data
out2 = load(fullFileName);
out1 = fieldnames(out2);



% --- Executes on selection change in data1Popup.
function data1Popup_Callback(~, ~, ~)
% hObject    handle to data1Popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns data1Popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from data1Popup


% --- Executes during object creation, after setting all properties.
function data1Popup_CreateFcn(hObject, ~, ~)
% hObject    handle to data1Popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sampling2Input_Callback(~, ~, ~)
% hObject    handle to sampling2Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sampling2Input as text
%        str2double(get(hObject,'String')) returns contents of sampling2Input as a double


% --- Executes during object creation, after setting all properties.
function sampling2Input_CreateFcn(hObject, ~, ~)
% hObject    handle to sampling2Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in data2Push.
function data2Push_Callback(~, ~, handles)
% hObject    handle to data2Push (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(handles.data2Popup, 'String');
var = get(handles.data2Popup,'Value');
switch str{var}
    case 'Workspace'
        uiwait(List);
        var1 = getappdata(0,'SharedName');
        if ~isempty(var1)
            var = evalin('base',var1);
            set(handles.data2Display,'string',var1);
            if iscolumn(var)
                var = var';
            end
            setappdata(0,'set_u2',var);
        end
        assignin('base','Signal2',var);
    case 'Drive'
        
        [field,struct,ret] = Drive();
        if ret == 1
            return;
        end
        set(handles.data2Display, 'String', field);
        a = struct2cell(struct);
        b = table2array(a);
        if iscolumn(b)
            b = b';
        end
        setappdata(0,'set_u2',b);
        assignin('base','Signal2',b);
end

% --- Executes on selection change in data2Popup.
function data2Popup_Callback(~, ~, ~)
% hObject    handle to data2Popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns data2Popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from data2Popup


% --- Executes during object creation, after setting all properties.
function data2Popup_CreateFcn(hObject, ~, ~)
% hObject    handle to data2Popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sampling3Input_Callback(~, ~, ~)
% hObject    handle to sampling3Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sampling3Input as text
%        str2double(get(hObject,'String')) returns contents of sampling3Input as a double


% --- Executes during object creation, after setting all properties.
function sampling3Input_CreateFcn(hObject, ~, ~)
% hObject    handle to sampling3Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in data3Push.
function data3Push_Callback(~, ~, handles)
% hObject    handle to data3Push (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(handles.data3Popup, 'String');
var = get(handles.data3Popup,'Value');
switch str{var}
    case 'Workspace'
        uiwait(List);
        var1 = getappdata(0,'SharedName');
        if ~isempty(var1)
            var = evalin('base',var1);
            set(handles.data3Display,'string',var1);
            if iscolumn(var)
                var = var';
            end
            setappdata(0,'set_u3',var);
        end
        assignin('base','Signal3',var);
    case 'Drive'
        
        [field,struct,ret] = Drive();
        if ret == 1
            return;
        end
        set(handles.data3Display, 'String', field);
        a = struct2cell(struct);
        b = table2array(a);
        if iscolumn(b)
            b = b';
        end
        setappdata(0,'set_u3',b);
        assignin('base','Signal3',b);
end

% --- Executes on selection change in data3Popup.
function data3Popup_Callback(~, ~, ~)
% hObject    handle to data3Popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns data3Popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from data3Popup


% --- Executes during object creation, after setting all properties.
function data3Popup_CreateFcn(hObject, ~, ~)
% hObject    handle to data3Popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function sampling4Input_Callback(~, ~, ~)
% hObject    handle to sampling4Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sampling4Input as text
%        str2double(get(hObject,'String')) returns contents of sampling4Input as a double


% --- Executes during object creation, after setting all properties.
function sampling4Input_CreateFcn(hObject, ~, ~)
% hObject    handle to sampling4Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in data4Push.
function data4Push_Callback(~, ~, handles)
% hObject    handle to data4Push (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(handles.data4Popup, 'String');
var = get(handles.data4Popup,'Value');
switch str{var}
    case 'Workspace'
        uiwait(List);
        var1 = getappdata(0,'SharedName');
        if ~isempty(var1)
            var = evalin('base',var1);
            set(handles.data4Display,'string',var1);
            if iscolumn(var)
                var = var';
            end
            setappdata(0,'set_u4',var);
        end
        assignin('base','Signal4',var);
    case 'Drive'
        
        [field,struct,ret] = Drive();
        if ret == 1
            return;
        end
        set(handles.data4Display, 'String', field);
        a = struct2cell(struct);
        b = table2array(a);
        if iscolumn(b)
            b = b';
        end
        setappdata(0,'set_u4',b);
        assignin('base','Signal4',b);
end

% --- Executes on selection change in data4Popup.
function data4Popup_Callback(~, ~, ~)
% hObject    handle to data4Popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns data4Popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from data4Popup


% --- Executes during object creation, after setting all properties.
function data4Popup_CreateFcn(hObject, ~, ~)
% hObject    handle to data4Popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sampling5Input_Callback(~, ~, ~)
% hObject    handle to sampling5Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sampling5Input as text
%        str2double(get(hObject,'String')) returns contents of sampling5Input as a double


% --- Executes during object creation, after setting all properties.
function sampling5Input_CreateFcn(hObject, ~, ~)
% hObject    handle to sampling5Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in data5Push.
function data5Push_Callback(~, ~, handles)
% hObject    handle to data5Push (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(handles.data5Popup, 'String');
var = get(handles.data5Popup,'Value');
switch str{var}
    case 'Workspace'
        uiwait(List);
        var1 = getappdata(0,'SharedName');
        if ~isempty(var1)
            var = evalin('base',var1);
            set(handles.data5Display,'string',var1);
            if iscolumn(var)
                var = var';
            end
            setappdata(0,'set_u5',var);
        end
        assignin('base','Signal5',var);
    case 'Drive'
        
        [field,struct,ret] = Drive();
        if ret == 1
            return;
        end
        set(handles.data5Display, 'String', field);
        a = struct2cell(struct);
        b = table2array(a);
        if iscolumn(b)
            b = b';
        end
        setappdata(0,'set_u5',b);
        assignin('base','Signal5',b);
end

% --- Executes on selection change in data5Popup.
function data5Popup_Callback(~, ~, ~)
% hObject    handle to data5Popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns data5Popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from data5Popup


% --- Executes during object creation, after setting all properties.
function data5Popup_CreateFcn(hObject, ~, ~)
% hObject    handle to data5Popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --------------------------------------------------------------------
% Running tool for all performing all the analysis
function runTool_ClickedCallback(hObject, ~, handles)
% hObject    handle to runTool (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting signal 1 stored in temporary variable
u1 = getappdata(0,'set_u1');
% Getting Sampling frequency of signal 1
fs1 = str2double(get(handles.sampling1Input,'String'));
% Calling Error function for checking if signal and frequecy have been
% imported
out = Errormsg(u1,fs1);
if out == 1
    return;
end

% Running Import menu option
if convert(get(handles.originalaxes, 'Visible'))
    %  Creating time vector, computing mean and std of signal 2 if selected
    if convert(get(handles.data2PlotButton, 'Visible'))
        u2 = getappdata(0,'set_u2');
        fs2 = str2double(get(handles.sampling2Input,'String'));
        out = Errormsg(u2,fs2);
        if out == 1
            return;
        end
        N2 = length(u2);    % Number of values
        dt2 = 1/fs2;        % Time step
        t2 = linspace(0,(N2-1)*dt2,N2); % Time vector
        setappdata(0,'set_t2',t2); % Creating temporary time vector of signal 2
        set(handles.data2PlotButton,'Enable','On')
        % Saving mean and std in Summary2 struct
        handles.Summary2.Mean.Signal2 = mean(u2);
        handles.Summary2.Std.SampleRecord.Signal2 = std(u2);
    end
    %  Creating time vector, computing mean and std of signal 3 if selected
    if convert(get(handles.data3PlotButton, 'Visible'))
        u3 = getappdata(0,'set_u3');
        fs3 = str2double(get(handles.sampling3Input,'String'));
        out = Errormsg(u3,fs3);
        if out == 1
            return;
        end
        N3 = length(u3);    % Number of values
        dt3 = 1/fs3;        % Time step
        t3 = linspace(0,(N3-1)*dt3,N3); % Time vector
        setappdata(0,'set_t3',t3);
        set(handles.data3PlotButton,'Enable','On')
        handles.Summary3.Mean.Signal3 = mean(u3);
        handles.Summary3.Std.SampleRecord.Signal3 = std(u3);
    end
    %  Creating time vector, computing mean and std of signal 4 if selected
    if convert(get(handles.data4PlotButton, 'Visible'))
        u4 = getappdata(0,'set_u4');
        fs4 = str2double(get(handles.sampling4Input,'String'));
        out = Errormsg(u4,fs4);
        if out == 1
            return;
        end
        N4 = length(u4);    % Number of values
        dt4 = 1/fs4;        % Time step
        t4 = linspace(0,(N4-1)*dt4,N4); % Time vector
        setappdata(0,'set_t4',t4);
        set(handles.data4PlotButton,'Enable','On');
        handles.Summary4.Mean.Signal4 = mean(u4);
        handles.Summary4.Std.SampleRecord.Signal4 = std(u4);
    end
    %  Creating time vector, computing mean and std of signal 5 if selected
    if convert(get(handles.data5PlotButton, 'Visible'))
        u5 = getappdata(0,'set_u5');
        fs5 = str2double(get(handles.sampling5Input,'String'));
        out = Errormsg(u5,fs5);
        if out == 1
            return;
        end
        N5 = length(u5);    % Number of values
        dt5 = 1/fs5;        % Time step
        t5 = linspace(0,(N5-1)*dt5,N5); % Time vector
        setappdata(0,'set_t5',t5);
        set(handles.data5PlotButton,'Enable','On');
        handles.Summary5.Mean.Signal5 = mean(u5);
        handles.Summary5.Std.SampleRecord.Signal5 = std(u5);
    end
    
    set(handles.data1PlotButton,'Value',1)
    N1 = length(u1);    % Number of values
    dt1 = 1/fs1;        % Time step
    t1 = linspace(0,(N1-1)*dt1,N1); % Time vector
    setappdata(0,'set_t1',t1);
    % Setting the axes on which plotting is required
    axes(handles.originalaxes);
    cla reset;
    plot(t1,u1);
    % Latex for positioning the x and y labels
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
    title('Signal 1','FontName','Times');
    set(handles.data1PlotButton,'Enable','On')
    colorgen = @(color,text) ['<html><table border=0 width=400 bgcolor=',color,'><TR><TD>',text,'</TD></TR> </table></html>'];
    data = { colorgen('#F0F0F0','Mean'), num2str(mean(u1))
        colorgen('#F0F0F0','Std Dev.'), num2str(std(u1))
        };
    % Setting the signal in statistics table
    set(handles.statisticsTable,'Data',data);
    % Renaming the statistics panel
    set(handles.statisticsPanel,'Title','Original signal 1 statistics');
    handles.Summary1.Mean.Signal1 = mean(u1);
    handles.Summary1.Std.SampleRecord.Signal1 = std(u1);
    
    
    % Make Stationary
    % Running Stationarity analysis to make non-stationary signal stationary
elseif convert(get(handles.stationaryaxes, 'Visible')) && convert(get(handles.wantStationarityPopup, 'Enable'))
    % Getting the input subsize
    n = get(handles.stationarySubsizeInput,'string');
    if isempty(n)
        errordlg('Subsize not provided','Plotting denied');
        return;
    end
    n = str2double(n);
    % Getting selected signal and its time vector that was stored while checking if the signal is stationary
    t = getappdata(0,'temp_t');
    u = getappdata(0,'temp_u');
    str = get(handles.wantStationarityPopup, 'String');
    val = get(handles.wantStationarityPopup,'Value');
    
    switch str{val}
        case 'Select'
            errordlg('No Method selected. Could not detrend the data','Detrending unsucessful');
            return;
            % This case will be run if Inbuilt detrend function is selected
        case 'Inbuilt Detrend'
            det_u = detrend(u); % Using inbuilt detrend command
            mean_u = mean(u);
            new_u = det_u + mean_u;
            z_u = zscore(new_u,n); % Using zscore function
            set(handles.originalaxes,'Visible','Off')
            set(handles.stationaryaxes,'Visible','On')
            colorgen = @(color,text) ['<html><table border=0 width=400 bgcolor=',color,'><TR><TD>',text,'</TD></TR> </table></html>'];
            data = {colorgen('#F0F0F0','Zscore'), colorgen('#CCFFFF',num2str(z_u))
                colorgen('#F0F0F0','Mean'), num2str(mean(new_u))
                colorgen('#F0F0F0','Std Dev.'), num2str(std(new_u))
                };
            set(handles.statisticsTable,'Data',data);
            set(handles.statisticsPanel,'Title','Statistics of Stationary signal with Detrend');
            % Enabling required check boxes
            set(handles.stationaryDataStationaryCheck,'Enable','On');
            set(handles.originalDataStationaryCheck,'Enable','On');
            set(handles.originalDataStationaryCheck,'Value',0);
            set(handles.stationaryDataStationaryCheck,'Value',1); % Since this graph will be plotted
            set(handles.stationaryDataStationaryCheck,'Visible','On');
            set(handles.polynomialStationaryCheck,'Value',0);
            set(handles.stationaryDataPolyCheck,'Value',0);
            axes(handles.stationaryaxes);
            cla reset;
            plot(t,new_u);
            title('Selected signal','FontName','Times');
            xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
            ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
            set(handles.resultDisplay,'String','');
            % Displaying
            if (z_u<=1.96 && z_u>=-1.96)
                set(handles.resultDisplay,'String','Detrended signal is stationary with 95% confidence after using Detrend Command');
            else
                set(handles.resultDisplay,'String','Detrended signal remains non-stationary with 95% confidence after using Detrend Command');
            end
            % Creating temporary variable for accessing it in plot panel
            % checkbox function
            setappdata(0,'temp_new_u',new_u);
            str1 = get(handles.selectDataStationaryPopup, 'String');
            val1 = get(handles.selectDataStationaryPopup,'Value');
            % Saving the data,updating the summary table and updating the struct of the selected data
            if strcmp(str1,'Signal 1') % String compare if only one signal is selected
                assignin('base','Signal1_sDetr',new_u);
                array = [handles.data2SummaryPanel,handles.data3SummaryPanel,handles.data4SummaryPanel,...
                    handles.data5SummaryPanel];
                set(array,'Visible','Off');
                set(handles.data1SummaryPanel,'Visible','On');
                handles.Summary1.Mean.Signal1_sDetr = mean(new_u);
                handles.Summary1.Std.SampleRecord.Signal1_sDetr = std(new_u);
                handles.Summary1.zScore.Signal1_sDetr = z_u;
                if (z_u<=1.96 && z_u>=-1.96)
                    handles.Summary1.IsStationary.Signal1_sDetr = 'Yes';
                    % Extracting signal from Summary table
                    data = get(handles.data1SummaryTable,'Data');
                    % Extracting the column
                    dataCol = cellstr(data(:,2));
                    % Updating the column
                    dataCol(1) = cellstr('Yes');
                    % Replacing the column from the data
                    data(:,2) = dataCol;
                    set(handles.data1SummaryTable,'Data',data);
                else
                    handles.Summary1.IsStationary.Signal1_sDetr = 'No';
                    data = get(handles.data1SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(1) = cellstr('No');
                    data(:,2) = dataCol;
                    set(handles.data1SummaryTable,'Data',data);
                end
                
            else
                switch str1{val1} %Switch case if more than 2 signal selected
                    case 'Signal 1'
                        array = [handles.data2SummaryPanel,handles.data3SummaryPanel,handles.data4SummaryPanel,...
                            handles.data5SummaryPanel];
                        set(array,'Visible','Off');
                        set(handles.data1SummaryPanel,'Visible','On');
                        assignin('base','Signal1_sDetr',new_u);
                        handles.Summary1.Mean.Signal1_sDetr = mean(new_u);
                        handles.Summary1.Std.SampleRecord.Signal1_sDetr = std(new_u);
                        handles.Summary1.zScore.Signal1_sDetr = z_u;
                        if (z_u<=1.96 && z_u>=-1.96)
                            handles.Summary1.IsStationary.Signal1_sDetr = 'Yes';
                            data = get(handles.data1SummaryTable,'Data');
                            dataCol = cellstr(data(:,2));
                            dataCol(1) = cellstr('Yes');
                            data(:,2) = dataCol;
                            set(handles.data1SummaryTable,'Data',data);
                        else
                            handles.Summary1.IsStationary.Signal1_sDetr = 'No';
                            data = get(handles.data1SummaryTable,'Data');
                            dataCol = cellstr(data(:,2));
                            dataCol(1) = cellstr('No');
                            data(:,2) = dataCol;
                            set(handles.data1SummaryTable,'Data',data);
                        end
                    case 'Signal 2'
                        assignin('base','Signal2_sDetr',new_u);
                        handles.Summary2.Mean.Signal2_sDetr = mean(new_u);
                        handles.Summary2.Std.SampleRecord.Signal2_sDetr = std(new_u);
                        handles.Summary2.zScore.Signal2_sDetr = z_u;
                        if (z_u<=1.96 && z_u>=-1.96)
                            handles.Summary2.IsStationary.Signal2_sDetr = 'Yes';
                            data = get(handles.data2SummaryTable,'Data');
                            dataCol = cellstr(data(:,2));
                            dataCol(1) = cellstr('Yes');
                            data(:,2) = dataCol;
                            set(handles.data2SummaryTable,'Data',data);
                        else
                            handles.Summary2.IsStationary.Signal2_sDetr = 'No';
                            data = get(handles.data2SummaryTable,'Data');
                            dataCol = cellstr(data(:,2));
                            dataCol(1) = cellstr('No');
                            data(:,2) = dataCol;
                            set(handles.data2SummaryTable,'Data',data);
                        end
                    case 'Signal 3'
                        assignin('base','Signal3_sDetr',new_u);
                        handles.Summary3.Mean.Signal3_sDetr = mean(new_u);
                        handles.Summary3.Std.SampleRecord.Signal3_sDetr = std(new_u);
                        handles.Summary3.zScore.Signal3_sDetr = z_u;
                        if (z_u<=1.96 && z_u>=-1.96)
                            handles.Summary3.IsStationary.Signal3_sDetr = 'Yes';
                            data = get(handles.data3SummaryTable,'Data');
                            dataCol = cellstr(data(:,2));
                            dataCol(1) = cellstr('Yes');
                            data(:,2) = dataCol;
                            set(handles.data3SummaryTable,'Data',data);
                        else
                            handles.Summary3.IsStationary.Signal3_sDetr = 'No';
                            data = get(handles.data3SummaryTable,'Data');
                            dataCol = cellstr(data(:,2));
                            dataCol(1) = cellstr('No');
                            data(:,2) = dataCol;
                            set(handles.data3SummaryTable,'Data',data);
                        end
                    case 'Signal 4'
                        assignin('base','Signal4_sDetr',new_u);
                        handles.Summary4.Mean.Signal4_sDetr = mean(new_u);
                        handles.Summary4.Std.SampleRecord.Signal4_sDetr = std(new_u);
                        handles.Summary4.zScore.Signal4_sDetr = z_u;
                        if (z_u<=1.96 && z_u>=-1.96)
                            handles.Summary4.IsStationary.Signal4_sDetr = 'Yes';
                            data = get(handles.data4SummaryTable,'Data');
                            dataCol = cellstr(data(:,2));
                            dataCol(1) = cellstr('Yes');
                            data(:,2) = dataCol;
                            set(handles.data4SummaryTable,'Data',data);
                        else
                            handles.Summary4.IsStationary.Signal4_sDetr = 'No';
                            data = get(handles.data4SummaryTable,'Data');
                            dataCol = cellstr(data(:,2));
                            dataCol(1) = cellstr('No');
                            data(:,2) = dataCol;
                            set(handles.data4SummaryTable,'Data',data);
                        end
                    case 'Signal 5'
                        assignin('base','Signal5_sDetr',new_u);
                        handles.Summary5.Mean.Signal5_sDetr = mean(new_u);
                        handles.Summary5.Std.SampleRecord.Signal5_sDetr = std(new_u);
                        handles.Summary5.zScore.Signal5_sDetr = z_u;
                        if (z_u<=1.96 && z_u>=-1.96)
                            handles.Summary5.IsStationary.Signal5_sDetr = 'Yes';
                            data = get(handles.data5SummaryTable,'Data');
                            dataCol = cellstr(data(:,2));
                            dataCol(1) = cellstr('Yes');
                            data(:,2) = dataCol;
                            set(handles.data5SummaryTable,'Data',data);
                        else
                            handles.Summary5.IsStationary.Signal5_sDetr = 'No';
                            data = get(handles.data5SummaryTable,'Data');
                            dataCol = cellstr(data(:,2));
                            dataCol(1) = cellstr('No');
                            data(:,2) = dataCol;
                            set(handles.data5SummaryTable,'Data',data);
                        end
                end
            end
            
            
        case 'Polynomial Fit'
            
            fit = DetPolyOrder(t,u);
            p = polyfit(t,u,fit);% Using polyfit command for fitting the data
            u_2 = polyval(p,t);% Generating the polynomial of 'fit' order
            % Saving the polynomial in temporary variable for accessing it
            % in plotting checkbox panel
            setappdata(0,'temp_u_2',u_2);
            new_u = (u - u_2) + mean(u);
            z_u = zscore(new_u,n);
            set(handles.originalaxes,'Visible','Off')
            set(handles.stationaryaxes,'Visible','On')
            colorgen = @(color,text) ['<html><table border=0 width=400 bgcolor=',color,'><TR><TD>',text,'</TD></TR> </table></html>'];
            data = {colorgen('#F0F0F0','Zscore'), colorgen('#CCFFFF',num2str(z_u))
                colorgen('#F0F0F0','Order of Poly'), colorgen('#CCFFFF',num2str(fit))
                colorgen('#F0F0F0','Mean'), num2str(mean(new_u))
                colorgen('#F0F0F0','Std Dev.'), num2str(std(new_u))
                };
            set(handles.statisticsTable,'Data',data);
            array1 = [handles.stationaryDataPolyCheck,handles.polynomialStationaryCheck,handles.originalDataStationaryCheck];
            set(array1,'Enable','On');
            set(array1,'Visible','On');
            set(handles.statisticsPanel,'Title','Statistics of Stationary signal with Poly');
            set(handles.originalDataStationaryCheck,'Value',0);
            set(handles.stationaryDataStationaryCheck,'Value',0);
            set(handles.polynomialStationaryCheck,'Value',0);
            set(handles.stationaryDataPolyCheck,'Value',1);% Checking this checkbox since this signal is plotted
            axes(handles.stationaryaxes);
            cla reset;
            plot(t,new_u);
            title('Selected signal','FontName','Times');
            xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
            ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
            set(handles.resultDisplay,'String','');
            if (z_u<=1.96 && z_u>=-1.96)
                set(handles.resultDisplay,'String','Detrended signal is stationary with 95% confidence after using Polynomial Fit');
            else
                set(handles.resultDisplay,'String','Detrended signal remains non-stationary with 95% confidence after using Polynomial Fit');
            end
            str1 = get(handles.selectDataStationaryPopup, 'String');
            val1 = get(handles.selectDataStationaryPopup,'Value');
            % Creating temporary variable to save detrended signal using
            % Polynomial fit method
            setappdata(0,'temp_new_u_poly',new_u);
            % Saving data, checking zscore, updating the summary table
            % and updating the struct of the selected data
            if strcmp(str1,'Signal 1') % If only signal 1 is selected
                array = [handles.data2SummaryPanel,handles.data3SummaryPanel,handles.data4SummaryPanel,...
                    handles.data5SummaryPanel];
                set(array,'Visible','Off');
                set(handles.data1SummaryPanel,'Visible','On');
                assignin('base','Signal1_sPoly',new_u);
                handles.Summary1.Mean.Signal1_sPoly = mean(new_u);
                handles.Summary1.Std.SampleRecord.Signal1_sPoly = std(new_u);
                handles.Summary1.zScore.Signal1_sPoly = z_u;
                if (z_u<=1.96 && z_u>=-1.96)
                    handles.Summary1.IsStationary.Signal1_sPoly = 'Yes';
                    data = get(handles.data1SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(1) = cellstr('Yes');
                    data(:,2) = dataCol;
                    set(handles.data1SummaryTable,'Data',data);
                else
                    handles.Summary1.IsStationary.Signal1_sPoly = 'No';
                    data = get(handles.data1SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(1) = cellstr('No');
                    data(:,2) = dataCol;
                    set(handles.data1SummaryTable,'Data',data);
                end
            else
                switch str1{val1} % Switch case if more than 1 signal selected
                    case 'Signal 1'
                        array = [handles.data2SummaryPanel,handles.data3SummaryPanel,handles.data4SummaryPanel,...
                            handles.data5SummaryPanel];
                        set(array,'Visible','Off');
                        set(handles.data1SummaryPanel,'Visible','On');
                        assignin('base','Signal1_sPoly',new_u);
                        handles.Summary1.Mean.Signal1_sPoly = mean(new_u);
                        handles.Summary1.Std.SampleRecord.Signal1_sPoly = std(new_u);
                        handles.Summary1.zScore.Signal1_sPoly = z_u;
                        if (z_u<=1.96 && z_u>=-1.96)
                            handles.Summary1.IsStationary.Signal1_sPoly = 'Yes';
                            data = get(handles.data1SummaryTable,'Data');
                            dataCol = cellstr(data(:,2));
                            dataCol(1) = cellstr('Yes');
                            data(:,2) = dataCol;
                            set(handles.data1SummaryTable,'Data',data);
                        else
                            handles.Summary1.IsStationary.Signal1_sPoly = 'No';
                            data = get(handles.data1SummaryTable,'Data');
                            dataCol = cellstr(data(:,2));
                            dataCol(1) = cellstr('No');
                            data(:,2) = dataCol;
                            set(handles.data1SummaryTable,'Data',data);
                        end
                    case 'Signal 2'
                        assignin('base','Signal2_sPoly',new_u);
                        handles.Summary2.Mean.Signal2_sPoly = mean(new_u);
                        handles.Summary2.Std.SampleRecord.Signal2_sPoly = std(new_u);
                        handles.Summary2.zScore.Signal2_sPoly = z_u;
                        if (z_u<=1.96 && z_u>=-1.96)
                            handles.Summary2.IsStationary.Signal2_sPoly = 'Yes';
                            data = get(handles.data2SummaryTable,'Data');
                            dataCol = cellstr(data(:,2));
                            dataCol(1) = cellstr('Yes');
                            data(:,2) = dataCol;
                            set(handles.data2SummaryTable,'Data',data);
                        else
                            handles.Summary2.IsStationary.Signal2_sPoly = 'No';
                            data = get(handles.data2SummaryTable,'Data');
                            dataCol = cellstr(data(:,2));
                            dataCol(1) = cellstr('No');
                            data(:,2) = dataCol;
                            set(handles.data2SummaryTable,'Data',data);
                        end
                    case 'Signal 3'
                        assignin('base','Signal3_sPoly',new_u);
                        handles.Summary3.Mean.Signal3_sPoly = mean(new_u);
                        handles.Summary3.Std.SampleRecord.Signal3_sPoly = std(new_u);
                        handles.Summary3.zScore.Signal3_sPoly = z_u;
                        if (z_u<=1.96 && z_u>=-1.96)
                            handles.Summary3.IsStationary.Signal3_sPoly = 'Yes';
                            data = get(handles.data3SummaryTable,'Data');
                            dataCol = cellstr(data(:,2));
                            dataCol(1) = cellstr('Yes');
                            data(:,2) = dataCol;
                            set(handles.data3SummaryTable,'Data',data);
                        else
                            handles.Summary3.IsStationary.Signal3_sPoly = 'No';
                            data = get(handles.data3SummaryTable,'Data');
                            dataCol = cellstr(data(:,2));
                            dataCol(1) = cellstr('No');
                            data(:,2) = dataCol;
                            set(handles.data3SummaryTable,'Data',data);
                        end
                    case 'Signal 4'
                        assignin('base','Signal4_sPoly',new_u);
                        handles.Summary4.Mean.Signal4_sPoly = mean(new_u);
                        handles.Summary4.Std.SampleRecord.Signal4_sPoly = std(new_u);
                        handles.Summary4.zScore.Signal4_sPoly = z_u;
                        if (z_u<=1.96 && z_u>=-1.96)
                            handles.Summary4.IsStationary.Signal4_sPoly = 'Yes';
                            data = get(handles.data4SummaryTable,'Data');
                            dataCol = cellstr(data(:,2));
                            dataCol(1) = cellstr('Yes');
                            data(:,2) = dataCol;
                            set(handles.data4SummaryTable,'Data',data);
                        else
                            handles.Summary4.IsStationary.Signal4_sPoly = 'No';
                            data = get(handles.data4SummaryTable,'Data');
                            dataCol = cellstr(data(:,2));
                            dataCol(1) = cellstr('No');
                            data(:,2) = dataCol;
                            set(handles.data4SummaryTable,'Data',data);
                        end
                    case 'Signal 5'
                        assignin('base','Signal5_sPoly',new_u);
                        handles.Summary5.Mean.Signal5_sPoly = mean(new_u);
                        handles.Summary5.Std.SampleRecord.Signal5_sPoly = std(new_u);
                        handles.Summary5.zScore.Signal5_sPoly = z_u;
                        if (z_u<=1.96 && z_u>=-1.96)
                            handles.Summary5.IsStationary.Signal5_sPoly = 'Yes';
                            data = get(handles.data5SummaryTable,'Data');
                            dataCol = cellstr(data(:,2));
                            dataCol(1) = cellstr('Yes');
                            data(:,2) = dataCol;
                            set(handles.data5SummaryTable,'Data',data);
                        else
                            handles.Summary5.IsStationary.Signal5_sPoly = 'No';
                            data = get(handles.data5SummaryTable,'Data');
                            dataCol = cellstr(data(:,2));
                            dataCol(1) = cellstr('No');
                            data(:,2) = dataCol;
                            set(handles.data5SummaryTable,'Data',data);
                        end
                end
            end
            
    end
    
    % Checking the stationarity of the selected data
    % Stationary check
elseif convert(get(handles.stationaryaxes, 'Visible')) && ~convert(get(handles.wantStationarityPopup, 'Enable'))
    
    n = get(handles.stationarySubsizeInput,'string');
    if isempty(n)
        errordlg('Subsize not provided','Plotting denied');
        return;
    end
    str1 = get(handles.selectDataStationaryPopup, 'String');
    val1 = get(handles.selectDataStationaryPopup,'Value');
    % Getting the selected data and time vector stored in temporary
    % variable and updating the struct
    if strcmp(str1,'Signal 1') % String compare if only one signal is selected
        array1 = [handles.data5SummaryPanel,handles.data2SummaryPanel,handles.data3SummaryPanel,...
            handles.data4SummaryPanel];
        set(array1,'Visible','Off');
        set(handles.data1SummaryPanel,'Visible','On');
        u = getappdata(0,'set_u1');
        t = getappdata(0,'set_t1');
        set(handles.statisticsPanel,'Title','Original signal 1 statistics');
        axes(handles.stationaryaxes);
        ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
    else
        switch str1{val1} % Switch case if more than one signal is selected
            case 'Signal 1'
                array1 = [handles.data5SummaryPanel,handles.data2SummaryPanel,handles.data3SummaryPanel,...
                    handles.data4SummaryPanel];
                set(array1,'Visible','Off');
                set(handles.data1SummaryPanel,'Visible','On');
                u = getappdata(0,'set_u1');
                t = getappdata(0,'set_t1');
                set(handles.statisticsPanel,'Title','Original signal 1 statistics');
            case 'Signal 2'
                array1 = [handles.data1SummaryPanel,handles.data5SummaryPanel,handles.data3SummaryPanel,...
                    handles.data4SummaryPanel];
                set(array1,'Visible','Off');
                set(handles.data2SummaryPanel,'Visible','On');
                u = getappdata(0,'set_u2');
                t = getappdata(0,'set_t2');
                set(handles.statisticsPanel,'Title','Original signal 2 statistics');
            case 'Signal 3'
                array1 = [handles.data1SummaryPanel,handles.data2SummaryPanel,handles.data5SummaryPanel,...
                    handles.data4SummaryPanel];
                set(array1,'Visible','Off');
                set(handles.data3SummaryPanel,'Visible','On');
                u = getappdata(0,'set_u3');
                t = getappdata(0,'set_t3');
                set(handles.statisticsPanel,'Title','Original signal 3 statistics');
            case 'Signal 4'
                array1 = [handles.data1SummaryPanel,handles.data2SummaryPanel,handles.data3SummaryPanel,...
                    handles.data5SummaryPanel];
                set(array1,'Visible','Off');
                set(handles.data4SummaryPanel,'Visible','On');
                u = getappdata(0,'set_u4');
                t = getappdata(0,'set_t4');
                set(handles.statisticsPanel,'Title','Original signal 4 statistics');
            case 'Signal 5'
                array1 = [handles.data1SummaryPanel,handles.data2SummaryPanel,handles.data3SummaryPanel,...
                    handles.data4SummaryPanel];
                set(array1,'Visible','Off');
                set(handles.data5SummaryPanel,'Visible','On');
                u = getappdata(0,'set_u5');
                t = getappdata(0,'set_t5');
                set(handles.statisticsPanel,'Title','Original signal 5 statistics');
                
        end
    end
    set(handles.selectDataStationaryPopup, 'Enable','Off')
    n = str2double(n);
    % Storing the signal in temporary variable which is used in plotting
    % checkbox panel function
    setappdata(0,'temp_u',u);
    setappdata(0,'temp_t',t);
    z_u = zscore(u,n);
    colorgen = @(color,text) ['<html><table border=0 width=400 bgcolor=',color,'><TR><TD>',text,'</TD></TR> </table></html>'];
    data = {colorgen('#F0F0F0','Zscore'), colorgen('#CCFFFF',num2str(z_u))
        colorgen('#F0F0F0','Mean'), num2str(mean(u))
        colorgen('#F0F0F0','Std Dev.'), num2str(std(u))
        };
    set(handles.statisticsTable,'Data',data);
    array1 = [handles.stationaryDataStationaryCheck,handles.stationaryDataPolyCheck,...
        handles.polynomialStationaryCheck];
    set(array1,'Enable','Off');
    set(array1,'Visible','Off');
    set(handles.originalDataStationaryCheck,'Value',1);
    set(handles.originalDataStationaryCheck,'Visible','On');
    set(handles.stationaryDataStationaryCheck,'Value',0);
    set(handles.polynomialStationaryCheck,'Value',0);
    set(handles.stationaryDataPolyCheck,'Value',0);
    axes(handles.stationaryaxes);
    cla reset;
    plot(t,u);
    title('Selected signal','FontName','Times');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
    set(handles.originalDataStationaryCheck,'Value',1)
    if (z_u<=1.96 && z_u>=-1.96)
        set(handles.resultDisplay,'String','Selected signal is stationary with 95% confidence');
        string1 = get(handles.selectDataStationaryPopup, 'String');
        value1 = get(handles.selectDataStationaryPopup,'Value');
        % Updating summary table, struct
        if strcmp(string1,'Signal 1')
            handles.Summary1.IsStationary.Signal1 = 'Yes';
            handles.Summary1.zScore.Signal1 = z_u;
            data = get(handles.data1SummaryTable,'Data');
            dataCol = data(:,2);
            dataCol(1) = cellstr('Yes');
            data(:,2) = dataCol;
            set(handles.data1SummaryTable,'Data',data);
        else
            switch string1{value1}
                case 'Signal 1'
                    handles.Summary1.IsStationary.Signal1 = 'Yes';
                    handles.Summary1.zScore.Signal1 = z_u;
                    data = get(handles.data1SummaryTable,'Data');
                    dataCol = data(:,2);
                    dataCol(1) = cellstr('Yes');
                    data(:,2) = dataCol;
                    set(handles.data1SummaryTable,'Data',data);
                case 'Signal 2'
                    handles.Summary2.IsStationary.Signal2 = 'Yes';
                    handles.Summary2.zScore.Signal2 = z_u;
                    data = get(handles.data2SummaryTable,'Data');
                    dataCol = data(:,2);
                    dataCol(1) = cellstr('Yes');
                    data(:,2) = dataCol;
                    set(handles.data2SummaryTable,'Data',data);
                case 'Signal 3'
                    handles.Summary3.IsStationary.Signal3 = 'Yes';
                    handles.Summary3.zScore.Signal3 = z_u;
                    data = get(handles.data3SummaryTable,'Data');
                    dataCol = data(:,2);
                    dataCol(1) = cellstr('Yes');
                    data(:,2) = dataCol;
                    set(handles.data3SummaryTable,'Data',data);
                case 'Signal 4'
                    handles.Summary4.IsStationary.Signal4 = 'Yes';
                    handles.Summary4.zScore.Signal4 = z_u;
                    data = get(handles.data4SummaryTable,'Data');
                    dataCol = data(:,2);
                    dataCol(1) = cellstr('Yes');
                    data(:,2) = dataCol;
                    set(handles.data4SummaryTable,'Data',data);
                case 'Signal 5'
                    handles.Summary5.IsStationary.Signal5 = 'Yes';
                    handles.Summary5.zScore.Signal5 = z_u;
                    data = get(handles.data5SummaryTable,'Data');
                    dataCol = data(:,2);
                    dataCol(1) = cellstr('Yes');
                    data(:,2) = dataCol;
                    set(handles.data5SummaryTable,'Data',data);
            end
        end
    else
        set(handles.resultDisplay,'String','Selected signal is non-stationary with 95% confidence');
        string1 = get(handles.selectDataStationaryPopup, 'String');
        value1 = get(handles.selectDataStationaryPopup,'Value');
        if strcmp(string1,'Signal 1')
            handles.Summary1.IsStationary.Signal1 = 'No';
            handles.Summary1.zScore.Signal1 = z_u;
            data = get(handles.data1SummaryTable,'Data');
            dataCol = cellstr(data(:,2));
            dataCol(1) = cellstr('No');
            data(:,2) = dataCol;
            set(handles.data1SummaryTable,'Data',data);
        else
            switch string1{value1}
                case 'Signal 1'
                    handles.Summary1.IsStationary.Signal1 = 'No';
                    handles.Summary1.zScore.Signal1 = z_u;
                    data = get(handles.data1SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(1) = cellstr('No');
                    data(:,2) = dataCol;
                    set(handles.data1SummaryTable,'Data',data);
                case 'Signal 2'
                    handles.Summary2.IsStationary.Signal2 = 'No';
                    handles.Summary2.zScore.Signal2 = z_u;
                    data = get(handles.data2SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(1) = cellstr('No');
                    data(:,2) = dataCol;
                    set(handles.data2SummaryTable,'Data',data);
                case 'Signal 3'
                    handles.Summary3.IsStationary.Signal3 = 'No';
                    handles.Summary3.zScore.Signal3 = z_u;
                    data = get(handles.data3SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(1) = cellstr('No');
                    data(:,2) = dataCol;
                    set(handles.data3SummaryTable,'Data',data);
                case 'Signal 4'
                    handles.Summary4.IsStationary.Signal4 = 'No';
                    handles.Summary4.zScore.Signal4 = z_u;
                    data = get(handles.data4SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(1) = cellstr('No');
                    data(:,2) = dataCol;
                    set(handles.data4SummaryTable,'Data',data);
                case 'Signal 5'
                    handles.Summary5.IsStationary.Signal5 = 'No';
                    handles.Summary5.zScore.Signal5 = z_u;
                    data = get(handles.data5SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(1) = cellstr('No');
                    data(:,2) = dataCol;
                    set(handles.data5SummaryTable,'Data',data);
            end
        end
        array = [handles.noStationarityRadio,handles.yesStationarityRadio];
        set(array,'Enable','On');
    end
    
    % Noise Removal, Runs when noise removal menu is selected
elseif convert(get(handles.noiseaxes1, 'Visible')) || convert(get(handles.noiseaxes2, 'Visible'))
    
    if get(handles.stationaryPolyNoiseCheck,'Value')&&get(handles.stationaryDetrendNoiseCheck,'Value')
        axes(handles.noiseaxes2);
        cla reset;
        axes(handles.noiseaxes1);
        cla reset;
        legend(handles.noiseaxes1,'Off');
        legend(handles.noiseaxes2,'Off');
        set(handles.resultDisplay,'String','');
        errordlg('Select either stationary data obtained from Detrend or obtained from polynomial fit',...
            'Computation failed');
        return;
    end
    % When Chauvenet is selected
    if (get(handles.chauvenetRadio,'Value'))
        % Getting the signal and the corresponding time vector which was
        % stored while selecting the method 'Chauvenet'
        t = getappdata(0,'temp_t');
        new_u = getappdata(0,'temp_u');
        set(handles.statisticsPanel,'Title','Selected signal statistics');
        colorgen = @(color,text) ['<html><table border=0 width=400 bgcolor=',color,'><TR><TD>',text,'</TD></TR> </table></html>'];
        data = {colorgen('#F0F0F0','Mean'), num2str(mean(new_u))
            colorgen('#F0F0F0','Std Dev.'), num2str(std(new_u))
            colorgen('#F0F0F0','Kurtosis'), num2str(kurtosis(new_u))
            colorgen('#F0F0F0','Skewness'), num2str(skewness(new_u))
            };
        set(handles.statisticsTable,'Data',data);
        new_u = new_u - mean(new_u);
        array1 =[handles.noiselessSubsCheck,handles.noiselessRemoCheck];
        set(array1,'Visible','off');
        n = get(handles.chauvenetDeviationInput,'String');
        if isempty(n)
            errordlg('Value empty','Plotting denied');
            return;
        end
        n = str2double(n);
        cal_u = n*std(new_u);
        mean_n = mean(new_u);
        % Finding the positions of the spurious signal to get the time of
        % that signal from time vector
        pos = (new_u > (mean_n + cal_u))|((new_u < (mean_n - cal_u)));
        % Finding values of the signal which lies beyond the limit
        a = new_u(pos);
        % If 'a' has any values Replacement and Removal opptions are enabled
        if ~isempty(a)
            array2 = [handles.removalRadio,handles.replacementRadio];
            set(array2,'Enable','On');
            set(array2,'Value',0);
        end
        
        time = t(pos);
        axes(handles.noiseaxes1);
        cla reset;
        plot(t,new_u);
        title('Selected signal','FontName','Times');
        xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
        ylabel('\hspace{10em}\normalfont\bf{Signal}','interpreter','latex');
        hold on;
        plot(time,a,'*');
        axes(handles.noiseaxes2);
        cla reset;
        h = histogram(new_u,20);
        title('Histogram distribution','FontName','Times');
        xlabel('\hspace{30em}\normalfont\bf{Bins}','interpreter','latex');
        ylabel('\hspace{10em}\normalfont\bf{pdf}','interpreter','latex');
        hold on
        vec = [];
        count = 0;
        % For finding the bin edges in the histogram for the spurious data
        for i=1:20
            for j=1:length(a)
                if a(j)>h.BinEdges(i)&&a(j)<h.BinEdges(i+1)
                    count = count+1;
                    vec(count) = i;
                end
            end
        end
        vec = unique(vec);% Repeated binedges are removed
        % Storing the 'pos' and 'vec' in temporary variable to be able to
        % access them in plotting check box panel
        setappdata(0,'set_vec',vec);
        setappdata(0,'set_pos',pos);
        % For drawing horizontal lines on the outliers
        for i=1:length(vec)
            x = h.BinEdges(vec(i):vec(i)+1);
            h1 = line([x(1) x(1)],[0 max(h.Values)]);
            h2 = line([x(2) x(2)],[0 max(h.Values)]);
            set([h1 h2],'Color','r');
        end
        set(handles.selectedDataNoiseCheck,'Visible','On');
        set(handles.selectedDataNoiseCheck,'Enable','On');
        set(handles.selectedHistoCheck,'Visible','On');
        set(handles.selectedHistoCheck,'Enable','On');
        set(handles.selectedDataNoiseCheck,'Value',1);
        set(handles.selectedHistoCheck,'Value',1);
        array1 = [handles.noiselessSubsCheck,handles.noiselessRemoCheck];
        set(array1,'Visible','off');
        array2 = [handles.noiselessSubsHistoCheck,handles.noiselessRemoHistoCheck];
        set(array2,'Visible','Off');
        
        string1 = get(handles.originalDataPopup, 'String');
        value1 = get(handles.originalDataPopup,'Value');
        % Updating the summary table and the struct
        if strcmp(string1,'Signal 1')
            array1 = [handles.data5SummaryPanel,handles.data2SummaryPanel,handles.data3SummaryPanel,...
                handles.data4SummaryPanel];
            set(array1,'Visible','Off');
            set(handles.data1SummaryPanel,'Visible','On');
            data = get(handles.data1SummaryTable,'Data');
            dataCol = cellstr(data(:,2));
            dataCol(2) = cellstr(num2str(length(a)));
            data(:,2) = dataCol;
            set(handles.data1SummaryTable,'Data',data);
            handles.Summary1.SpuriousIndex.Chauvenet = find(pos);
        else
            switch string1{value1}
                case 'Signal 1'
                    array1 = [handles.data2SummaryPanel,handles.data5SummaryPanel,handles.data3SummaryPanel,...
                        handles.data4SummaryPanel];
                    set(array1,'Visible','Off');
                    set(handles.data1SummaryPanel,'Visible','On');
                    data = get(handles.data1SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(2) = cellstr(num2str(length(a)));
                    data(:,2) = dataCol;
                    set(handles.data1SummaryTable,'Data',data);
                    handles.Summary1.SpuriousIndex.Chauvenet = find(pos);
                case 'Signal 2'
                    array1 = [handles.data1SummaryPanel,handles.data5SummaryPanel,handles.data3SummaryPanel,...
                        handles.data4SummaryPanel];
                    set(array1,'Visible','Off');
                    set(handles.data2SummaryPanel,'Visible','On');
                    data = get(handles.data2SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(2) = cellstr(num2str(length(a)));
                    data(:,2) = dataCol;
                    set(handles.data2SummaryTable,'Data',data);
                    handles.Summary2.SpuriousIndex.Chauvenet = find(pos);
                case 'Signal 3'
                    array1 = [handles.data1SummaryPanel,handles.data5SummaryPanel,handles.data2SummaryPanel,...
                        handles.data4SummaryPanel];
                    set(array1,'Visible','Off');
                    set(handles.data3SummaryPanel,'Visible','On');
                    data = get(handles.data3SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(2) = cellstr(num2str(length(a)));
                    data(:,2) = dataCol;
                    set(handles.data3SummaryTable,'Data',data);
                    handles.Summary3.SpuriousIndex.Chauvenet = find(pos);
                case 'Signal 4'
                    array1 = [handles.data1SummaryPanel,handles.data5SummaryPanel,handles.data3SummaryPanel,...
                        handles.data2SummaryPanel];
                    set(array1,'Visible','Off');
                    set(handles.data4SummaryPanel,'Visible','On');
                    data = get(handles.data4SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(2) = cellstr(num2str(length(a)));
                    data(:,2) = dataCol;
                    set(handles.data4SummaryTable,'Data',data);
                    handles.Summary4.SpuriousIndex.Chauvenet = find(pos);
                case 'Signal 5'
                    array1 = [handles.data1SummaryPanel,handles.data2SummaryPanel,handles.data3SummaryPanel,...
                        handles.data4SummaryPanel];
                    set(array1,'Visible','Off');
                    set(handles.data5SummaryPanel,'Visible','On');
                    data = get(handles.data5SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(2) = cellstr(num2str(length(a)));
                    data(:,2) = dataCol;
                    set(handles.data5SummaryTable,'Data',data);
                    handles.Summary5.SpuriousIndex.Chauvenet = find(pos);
            end
        end
        
        % When Histogram is selected
    elseif get(handles.histogramRadio,'Value')
        % Getting the signal and the corresponding time vector which was
        % stored while selecting the method 'Histogram'
        t = getappdata(0,'temp_t');
        new_u = getappdata(0,'temp_u');
        set(handles.statisticsPanel,'Title','Selected signal statistics');
        colorgen = @(color,text) ['<html><table border=0 width=400 bgcolor=',color,'><TR><TD>',text,'</TD></TR> </table></html>'];
        data = {colorgen('#F0F0F0','Mean'), num2str(mean(new_u))
            colorgen('#F0F0F0','Std Dev.'), num2str(std(new_u))
            colorgen('#F0F0F0','Kurtosis'), num2str(kurtosis(new_u))
            colorgen('#F0F0F0','Skewness'), num2str(skewness(new_u))
            };
        set(handles.statisticsTable,'Data',data);
        new_u = new_u - mean(new_u);
        array1 = [handles.noiselessSubsCheck,handles.noiselessRemoCheck];
        set(array1,'Visible','off');
        array2 = [handles.noiselessSubsHistoCheck,handles.noiselessRemoHistoCheck];
        set(array2,'Visible','Off');
        k = get(handles.histogramBinInput,'String');
        if isempty(k)
            errordlg('Value empty','Plotting denied');
            return;
        end
        k = str2double(k);
        axes(handles.noiseaxes2);
        cla reset;
        h = histogram(new_u,k);
        title('Histogram distribution','FontName','Times');
        xlabel('\hspace{30em}\normalfont\bf{Bins}','interpreter','latex');
        ylabel('\hspace{10em}\normalfont\bf{pdf}','interpreter','latex');
        hold on
        count = 0;
        % Identifying the bins which are isolated
        vec = [];
        for i=1:k
            if round(i<k/2) && (h.Values(i+1)==0) && (h.Values(i)~=0)
                for j=i:-1:1
                    count = count + 1;
                    vec(count) = j;
                    if j~=1 && (h.Values(i-1)==0)
                        break;
                    end
                end
            else if (i>k/2) && (h.Values(i-1)==0) && (h.Values(i)~=0)
                    count = count + 1;
                    vec(count) = i;
                end
            end
        end
        % Drawing vertical line on the identified bin edges
        for i=1:length(vec)
            x = h.BinEdges(vec(i):vec(i)+1);
            h1 = line([x(1) x(1)],[0 max(h.Values)]);
            h2 = line([x(2) x(2)],[0 max(h.Values)]);
            set([h1 h2],'Color','r')
        end
        pos = [];
        % Finding the position of the spurious signal in those identified bins
        for i=1:length(vec)
            x = h.BinEdges(vec(i):vec(i)+1);
            pos = [pos,find((new_u > x(1))&(new_u < x(2)))];
        end
        setappdata(0,'set_vec',vec);
        setappdata(0,'set_pos',pos);
        axes(handles.noiseaxes1);
        cla reset;
        plot(t,new_u);
        title('Selected signal','FontName','Times');
        xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
        ylabel('\hspace{10em}\normalfont\bf{Signal}','interpreter','latex');
        hold on
        a = new_u(pos); % Getting the spurious data
        plot(t(pos),new_u(pos),'*');
        setappdata(0,'set_pos',pos);
        if ~isempty(vec)
            array4 = [handles.removalRadio,handles.replacementRadio];
            set(array4,'Enable','On');
            set(array4,'Value',0);
        end
        set(handles.selectedDataNoiseCheck,'Visible','On');
        set(handles.selectedDataNoiseCheck,'Enable','On');
        set(handles.selectedHistoCheck,'Visible','On');
        set(handles.selectedHistoCheck,'Enable','On');
        set(handles.selectedDataNoiseCheck,'Value',1);
        set(handles.selectedHistoCheck,'Value',1);
        
        string1 = get(handles.originalDataPopup, 'String');
        value1 = get(handles.originalDataPopup,'Value');
        % Updating summary table and struct
        if strcmp(string1,'Signal 1')
            array1 = [handles.data5SummaryPanel,handles.data2SummaryPanel,handles.data3SummaryPanel,...
                handles.data4SummaryPanel];
            set(array1,'Visible','Off');
            set(handles.data1SummaryPanel,'Visible','On');
            data = get(handles.data1SummaryTable,'Data');
            dataCol = cellstr(data(:,2));
            dataCol(2) = cellstr(num2str(length(a)));
            data(:,2) = dataCol;
            set(handles.data1SummaryTable,'Data',data);
            handles.Summary1.SpuriousIndex.Histogram = pos;
        else
            switch string1{value1}
                case 'Signal 1'
                    array1 = [handles.data5SummaryPanel,handles.data2SummaryPanel,handles.data3SummaryPanel,...
                        handles.data4SummaryPanel];
                    set(array1,'Visible','Off');
                    set(handles.data1SummaryPanel,'Visible','On');
                    data = get(handles.data1SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(2) = cellstr(num2str(length(a)));
                    data(:,2) = dataCol;
                    set(handles.data1SummaryTable,'Data',data);
                    handles.Summary1.SpuriousIndex.Histogram = pos;
                case 'Signal 2'
                    array1 = [handles.data1SummaryPanel,handles.data5SummaryPanel,handles.data3SummaryPanel,...
                        handles.data4SummaryPanel];
                    set(array1,'Visible','Off');
                    set(handles.data2SummaryPanel,'Visible','On');
                    data = get(handles.data2SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(2) = cellstr(num2str(length(a)));
                    data(:,2) = dataCol;
                    set(handles.data2SummaryTable,'Data',data);
                    handles.Summary2.SpuriousIndex.Histogram = pos;
                case 'Signal 3'
                    array1 = [handles.data1SummaryPanel,handles.data2SummaryPanel,handles.data5SummaryPanel,...
                        handles.data4SummaryPanel];
                    set(array1,'Visible','Off');
                    set(handles.data3SummaryPanel,'Visible','On');
                    data = get(handles.data3SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(2) = cellstr(num2str(length(a)));
                    data(:,2) = dataCol;
                    set(handles.data3SummaryTable,'Data',data);
                    handles.Summary3.SpuriousIndex.Histogram = pos;
                case 'Signal 4'
                    array1 = [handles.data1SummaryPanel,handles.data2SummaryPanel,handles.data3SummaryPanel,...
                        handles.data5SummaryPanel];
                    set(array1,'Visible','Off');
                    set(handles.data4SummaryPanel,'Visible','On');
                    data = get(handles.data4SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(2) = cellstr(num2str(length(a)));
                    data(:,2) = dataCol;
                    set(handles.data4SummaryTable,'Data',data);
                    handles.Summary4.SpuriousIndex.Histogram = pos;
                case 'Signal 5'
                    array1 = [handles.data1SummaryPanel,handles.data2SummaryPanel,handles.data3SummaryPanel,...
                        handles.data4SummaryPanel];
                    set(array1,'Visible','Off');
                    set(handles.data5SummaryPanel,'Visible','On');
                    data = get(handles.data5SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(2) = cellstr(num2str(length(a)));
                    data(:,2) = dataCol;
                    set(handles.data5SummaryTable,'Data',data);
                    handles.Summary5.SpuriousIndex.Histogram = pos;
            end
        end
    else
        errordlg('Please select a spurious detection method','Computation failed');
        return;
    end
    
    % Runs when normality menu is selected
elseif convert(get(handles.normalityaxes1,'Visible'))
    if get(handles.stationaryPolyNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')
        axes(handles.normalityaxes2);
        cla reset;
        axes(handles.normalityaxes1);
        cla reset;
        legend(handles.normalityaxes1,'Off');
        legend(handles.normalityaxes2,'Off');
        set(handles.resultDisplay,'String','');
        errordlg('Select either stationary data obtained from Detrend or obtained from polynomial fit',...
            'Computation failed');
        return;
    end
    if get(handles.chauNormCheck,'Value')&&get(handles.histoNormCheck,'Value')
        axes(handles.normalityaxes2);
        cla reset;
        axes(handles.normalityaxes1);
        cla reset;
        legend(handles.normalityaxes1,'Off');
        legend(handles.normalityaxes2,'Off');
        set(handles.resultDisplay,'String','');
        errordlg('Select either clean data obtained from Chauvenet or obtained from histogram substitution',...
            'Computation failed');
        return;
    end
    if get(handles.replacedNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
        axes(handles.normalityaxes2);
        cla reset;
        axes(handles.normalityaxes1);
        cla reset;
        legend(handles.normalityaxes1,'Off');
        legend(handles.normalityaxes2,'Off');
        set(handles.resultDisplay,'String','');
        errordlg('Select either clean data obtained by ''removal'' or obtained by ''replacement'' method',...
            'Computation failed');
        return;
    end
    if (get(handles.replacedNormCheck,'Value')||get(handles.removedNormCheck,'Value'))
        if ~(get(handles.chauNormCheck,'Value')||get(handles.histoNormCheck,'Value'))
            axes(handles.normalityaxes2);
            cla reset;
            axes(handles.normalityaxes1);
            cla reset;
            legend(handles.normalityaxes1,'Off');
            legend(handles.normalityaxes2,'Off');
            set(handles.resultDisplay,'String','');
            errordlg('Select one of the clean data obtained from Chauvenet or obtained from histogram substitution',...
                'Computation failed');
            return;
        end
    end
    if (get(handles.chauNormCheck,'Value')||get(handles.histoNormCheck,'Value'))
        if ~(get(handles.removedNormCheck,'Value')||get(handles.replacedNormCheck,'Value'))
            axes(handles.normalityaxes2);
            cla reset;
            axes(handles.normalityaxes1);
            cla reset;
            legend(handles.normalityaxes1,'Off');
            legend(handles.normalityaxes2,'Off');
            set(handles.resultDisplay,'String','');
            errordlg('Select one of the clean data obtained by ''removal'' or obtained by ''replacement'' method',...
                'Computation failed');
            return;
        end
    end
    
    final_u = getappdata(0,'temp_u');
    t = getappdata(0,'temp_t');
    nbins = get(handles.binSizeNormInput,'String'); % Bin size
    if isempty(nbins)
        errordlg('Enter number of bins','Plotting Denied');
        return;
    end
    % Confidence level
    alpha = get(handles.significanceNormInput,'String');
    alpha = str2double(alpha);
    if isnan(alpha)||alpha<0||alpha>1
        errordlg('Enter confidence level between 0 and 1','Computation Failed');
        return;
    end
    nbins = str2double(nbins);
    check = [handles.stationaryPolyNormCheck,handles.stationaryDetrendNormCheck,handles.chauNormCheck,...
        handles.histoNormCheck,handles.replacedNormCheck,handles.removedNormCheck];
    set(check,'Enable','Off');
    set(handles.originalDataNormPopup,'Enable','Off');
    set(handles.statisticsPanel,'Title','Selected signal statistics');
    colorgen = @(color,text) ['<html><table border=0 width=400 bgcolor=',color,'><TR><TD>',text,'</TD></TR> </table></html>'];
    data = {colorgen('#F0F0F0','Mean'), num2str(mean(final_u))
        colorgen('#F0F0F0','Std Dev.'), num2str(std(final_u))
        colorgen('#F0F0F0','Kurtosis'), num2str(kurtosis(final_u))
        colorgen('#F0F0F0','Skewness'), num2str(skewness(final_u))
        };
    set(handles.statisticsTable,'Data',data);
    final_u = final_u - mean(final_u);
    setappdata(0,'temp_u',final_u);
    axes(handles.normalityaxes1);
    cla reset;
    plot(t,final_u);
    title('Selected signal','FontName','Times');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{Signal}','interpreter','latex');
    % Fitted normal using 'fitdist'
    pd = fitdist(final_u','Normal');
    step = (max(final_u)-min(final_u))/200;
    x_pdf = (min(final_u):step:max(final_u));
    y = pdf(pd,x_pdf);
    axes(handles.normalityaxes2);
    cla reset;
    histogram(final_u,'Normalization','pdf','NumBins',nbins);
    xlabel('\hspace{30em}\normalfont\bf{Bins}','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{pdf}','interpreter','latex');
    title('Histogram distribution','FontName','Times');
    hold on
    plot(x_pdf,y,'linewidth',1.2);
    array = [handles.selectedDataNormCheck,handles.selectedNormHistoCheck,handles.selectedNormFitCheck];
    set(array,'Visible','On');
    set(array,'Enable','On');
    set(array,'Value',1);
    set(handles.statisticsPanel,'Title','Selected signal statistics');
    alpha = 1 - alpha; % Finding levelof significance
    NBins = str2double(get(handles.binSizeNormInput,'String'));
    Chi_u = chi2gof(final_u,'alpha',alpha,'NBins',NBins);
    % Updating the struct, summary table and displaying message
    if (Chi_u==0)
        conf = 100*(1-alpha);
        handles.message = sprintf('The selected signal is normally distributed with %2.2f%% confidence',conf);
        set(handles.resultDisplay,'String',handles.message);
        str1 = get(handles.originalDataNormPopup, 'String');
        val1 = get(handles.originalDataNormPopup,'Value');
        if strcmp(str1,'Signal 1')
            data = get(handles.data1SummaryTable,'Data');
            dataCol = cellstr(data(:,2));
            dataCol(3) = cellstr('Yes');
            data(:,2) = dataCol;
            set(handles.data1SummaryTable,'Data',data);
            
            if get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                handles.Summary1.Normality.Signal1_sPoly_nChauRemo = 'Normally Distributed';
            elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                handles.Summary1.Normality.Signal1_sDetr_nChauRemo = 'Normally Distributed';
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                handles.Summary1.Normality.Signal1_sPoly_nHistRemo = 'Normally Distributed';
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                handles.Summary1.Normality.Signal1_sDetr_nHistRemo = 'Normally Distributed';
            elseif get(handles.histoNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                handles.Summary1.Normality.Signal1_nHistRemo = 'Normally Distributed';
            elseif get(handles.chauNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                handles.Summary1.Normality.Signal1_nChauRemo = 'Normally Distributed';
            elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                handles.Summary1.Normality.Signal1_sPoly_nChau = 'Normally Distributed';
            elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                handles.Summary1.Normality.Signal1_sDetr_nChau = 'Normally Distributed';
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                handles.Summary1.Normality.Signal1_sPoly_nHist = 'Normally Distributed';
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                handles.Summary1.Normality.Signal1_sDetr_nHist = 'Normally Distributed';
            elseif get(handles.histoNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                handles.Summary1.Normality.Signal1_nHist = 'Normally Distributed';
            elseif get(handles.chauNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                handles.Summary1.Normality.Signal1_nChau = 'Normally Distributed';
            elseif get(handles.stationaryPolyNormCheck,'Value')
                handles.Summary1.Normality.Signal1_sPoly = 'Normally Distributed';
            elseif get(handles.stationaryDetrendNormCheck,'Value')
                handles.Summary1.Normality.Signal1_sDetr = 'Normally Distributed';
            else
                handles.Summary1.Normality.Signal1 = 'Normally Distributed';
            end
            
        else
            switch str1{val1}
                case 'Signal 1'
                    data = get(handles.data1SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(3) = cellstr('Yes');
                    data(:,2) = dataCol;
                    set(handles.data1SummaryTable,'Data',data);
                    
                    if get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_sPoly_nChauRemo = 'Normally Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_sDetr_nChauRemo = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_sPoly_nHistRemo = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_sDetr_nHistRemo = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_nHistRemo = 'Normally Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_nChauRemo = 'Normally Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_sPoly_nChau = 'Normally Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_sDetr_nChau = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_sPoly_nHist = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_sDetr_nHist = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_nHist = 'Normally Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_nChau = 'Normally Distributed';
                    elseif get(handles.stationaryPolyNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_sPoly = 'Normally Distributed';
                    elseif get(handles.stationaryDetrendNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_sDetr = 'Normally Distributed';
                    else
                        handles.Summary1.Normality.Signal1 = 'Normally Distributed';
                    end
                    
                case 'Signal 2'
                    data = get(handles.data2SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(3) = cellstr('Yes');
                    data(:,2) = dataCol;
                    set(handles.data2SummaryTable,'Data',data);
                    
                    if get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_sPoly_nChauRemo = 'Normally Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_sDetr_nChauRemo = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_sPoly_nHistRemo = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_sDetr_nHistRemo = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_nHistRemo = 'Normally Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_nChauRemo = 'Normally Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_sPoly_nChau = 'Normally Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_sDetr_nChau = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_sPoly_nHist = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_sDetr_nHist = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_nHist = 'Normally Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_nChau = 'Normally Distributed';
                    elseif get(handles.stationaryPolyNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_sPoly = 'Normally Distributed';
                    elseif get(handles.stationaryDetrendNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_sDetr = 'Normally Distributed';
                    else
                        handles.Summary2.Normality.Signal2 = 'Normally Distributed';
                    end
                case 'Signal 3'
                    data = get(handles.data3SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(3) = cellstr('Yes');
                    data(:,2) = dataCol;
                    set(handles.data3SummaryTable,'Data',data);
                    
                    if get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_sPoly_nChauRemo = 'Normally Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_sDetr_nChauRemo = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_sPoly_nHistRemo = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_sDetr_nHistRemo = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_nHistRemo = 'Normally Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_nChauRemo = 'Normally Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_sPoly_nChau = 'Normally Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_sDetr_nChau = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_sPoly_nHist = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_sDetr_nHist = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_nHist = 'Normally Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_nChau = 'Normally Distributed';
                    elseif get(handles.stationaryPolyNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_sPoly = 'Normally Distributed';
                    elseif get(handles.stationaryDetrendNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_sDetr = 'Normally Distributed';
                    else
                        handles.Summary3.Normality.Signal3 = 'Normally Distributed';
                    end
                case 'Signal 4'
                    data = get(handles.data4SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(3) = cellstr('Yes');
                    data(:,2) = dataCol;
                    set(handles.data4SummaryTable,'Data',data);
                    
                    if get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_sPoly_nChauRemo = 'Normally Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_sDetr_nChauRemo = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_sPoly_nHistRemo = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_sDetr_nHistRemo = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_nHistRemo = 'Normally Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_nChauRemo = 'Normally Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_sPoly_nChau = 'Normally Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_sDetr_nChau = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_sPoly_nHist = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_sDetr_nHist = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_nHist = 'Normally Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_nChau = 'Normally Distributed';
                    elseif get(handles.stationaryPolyNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_sPoly = 'Normally Distributed';
                    elseif get(handles.stationaryDetrendNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_sDetr = 'Normally Distributed';
                    else
                        handles.Summary4.Normality.Signal4 = 'Normally Distributed';
                    end
                case 'Signal 5'
                    data = get(handles.data5SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(3) = cellstr('Yes');
                    data(:,2) = dataCol;
                    set(handles.data5SummaryTable,'Data',data);
                    
                    if get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_sPoly_nChauRemo = 'Normally Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_sDetr_nChauRemo = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_sPoly_nHistRemo = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_sDetr_nHistRemo = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_nHistRemo = 'Normally Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_nChauRemo = 'Normally Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_sPoly_nChau = 'Normally Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_sDetr_nChau = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_sPoly_nHist = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_sDetr_nHist = 'Normally Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_nHist = 'Normally Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_nChau = 'Normally Distributed';
                    elseif get(handles.stationaryPolyNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_sPoly = 'Normally Distributed';
                    elseif get(handles.stationaryDetrendNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_sDetr = 'Normally Distributed';
                    else
                        handles.Summary5.Normality.Signal5 = 'Normally Distributed';
                    end
            end
        end
    else
        conf = 100*(1-alpha);
        handles.message = sprintf('The selected signal is not normally distributed with %2.2f%% confidence',conf);
        set(handles.resultDisplay,'String',handles.message);
        str1 = get(handles.originalDataNormPopup, 'String');
        val1 = get(handles.originalDataNormPopup,'Value');
        if strcmp(str1,'Signal 1')
            data = get(handles.data1SummaryTable,'Data');
            dataCol = cellstr(data(:,2));
            dataCol(3) = cellstr('No');
            data(:,2) = dataCol;
            set(handles.data1SummaryTable,'Data',data);
            
            if get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                handles.Summary1.Normality.Signal1_sPoly_nChauRemo = 'Normally Not Distributed';
            elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                handles.Summary1.Normality.Signal1_sDetr_nChauRemo = 'Normally Not Distributed';
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                handles.Summary1.Normality.Signal1_sPoly_nHistRemo = 'Normally Not Distributed';
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                handles.Summary1.Normality.Signal1_sDetr_nHistRemo = 'Normally Not Distributed';
            elseif get(handles.histoNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                handles.Summary1.Normality.Signal1_nHistRemo = 'Normally Not Distributed';
            elseif get(handles.chauNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                handles.Summary1.Normality.Signal1_nChauRemo = 'Normally Not Distributed';
            elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                handles.Summary1.Normality.Signal1_sPoly_nChau = 'Normally Not Distributed';
            elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                handles.Summary1.Normality.Signal1_sDetr_nChau = 'Normally Not Distributed';
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                handles.Summary1.Normality.Signal1_sPoly_nHist = 'Normally Not Distributed';
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                handles.Summary1.Normality.Signal1_sDetr_nHist = 'Normally Not Distributed';
            elseif get(handles.histoNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                handles.Summary1.Normality.Signal1_nHist = 'Normally Not Distributed';
            elseif get(handles.chauNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                handles.Summary1.Normality.Signal1_nChau = 'Normally Not Distributed';
            elseif get(handles.stationaryPolyNormCheck,'Value')
                handles.Summary1.Normality.Signal1_sPoly = 'Normally Not Distributed';
            elseif get(handles.stationaryDetrendNormCheck,'Value')
                handles.Summary1.Normality.Signal1_sDetr = 'Normally Not Distributed';
            else
                handles.Summary1.Normality.Signal1 = 'Normally Not Distributed';
            end
            
        else
            switch str1{val1}
                case 'Signal 1'
                    data = get(handles.data1SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(3) = cellstr('No');
                    data(:,2) = dataCol;
                    set(handles.data1SummaryTable,'Data',data);
                    
                    if get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_sPoly_nChauRemo = 'Normally Not Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_sDetr_nChauRemo = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_sPoly_nHistRemo = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_sDetr_nHistRemo = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_nHistRemo = 'Normally Not Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_nChauRemo = 'Normally Not Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_sPoly_nChau = 'Normally Not Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_sDetr_nChau = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_sPoly_nHist = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_sDetr_nHist = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_nHist = 'Normally Not Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_nChau = 'Normally Not Distributed';
                    elseif get(handles.stationaryPolyNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_sPoly = 'Normally Not Distributed';
                    elseif get(handles.stationaryDetrendNormCheck,'Value')
                        handles.Summary1.Normality.Signal1_sDetr = 'Normally Not Distributed';
                    else
                        handles.Summary1.Normality.Signal1 = 'Normally Not Distributed';
                    end
                    
                case 'Signal 2'
                    data = get(handles.data2SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(3) = cellstr('No');
                    data(:,2) = dataCol;
                    set(handles.data2SummaryTable,'Data',data);
                    
                    if get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_sPoly_nChauRemo = 'Normally Not Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_sDetr_nChauRemo = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_sPoly_nHistRemo = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_sDetr_nHistRemo = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_nHistRemo = 'Normally Not Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_nChauRemo = 'Normally Not Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_sPoly_nChau = 'Normally Not Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_sDetr_nChau = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_sPoly_nHist = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_sDetr_nHist = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_nHist = 'Normally Not Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_nChau = 'Normally Not Distributed';
                    elseif get(handles.stationaryPolyNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_sPoly = 'Normally Not Distributed';
                    elseif get(handles.stationaryDetrendNormCheck,'Value')
                        handles.Summary2.Normality.Signal2_sDetr = 'Normally Not Distributed';
                    else
                        handles.Summary2.Normality.Signal2 = 'Normally Not Distributed';
                    end
                    
                case 'Signal 3'
                    data = get(handles.data3SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(3) = cellstr('No');
                    data(:,2) = dataCol;
                    set(handles.data3SummaryTable,'Data',data);
                    
                    if get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_sPoly_nChauRemo = 'Normally Not Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_sDetr_nChauRemo = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_sPoly_nHistRemo = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_sDetr_nHistRemo = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_nHistRemo = 'Normally Not Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_nChauRemo = 'Normally Not Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_sPoly_nChau = 'Normally Not Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_sDetr_nChau = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_sPoly_nHist = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_sDetr_nHist = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_nHist = 'Normally Not Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_nChau = 'Normally Not Distributed';
                    elseif get(handles.stationaryPolyNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_sPoly = 'Normally Not Distributed';
                    elseif get(handles.stationaryDetrendNormCheck,'Value')
                        handles.Summary3.Normality.Signal3_sDetr = 'Normally Not Distributed';
                    else
                        handles.Summary3.Normality.Signal3 = 'Normally Not Distributed';
                    end
                    
                case 'Signal 4'
                    data = get(handles.data4SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(3) = cellstr('No');
                    data(:,2) = dataCol;
                    set(handles.data4SummaryTable,'Data',data);
                    
                    if get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_sPoly_nChauRemo = 'Normally Not Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_sDetr_nChauRemo = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_sPoly_nHistRemo = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_sDetr_nHistRemo = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_nHistRemo = 'Normally Not Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_nChauRemo = 'Normally Not Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_sPoly_nChau = 'Normally Not Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_sDetr_nChau = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_sPoly_nHist = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_sDetr_nHist = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_nHist = 'Normally Not Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_nChau = 'Normally Not Distributed';
                    elseif get(handles.stationaryPolyNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_sPoly = 'Normally Not Distributed';
                    elseif get(handles.stationaryDetrendNormCheck,'Value')
                        handles.Summary4.Normality.Signal4_sDetr = 'Normally Not Distributed';
                    else
                        handles.Summary4.Normality.Signal4 = 'Normally Not Distributed';
                    end
                    
                case 'Signal 5'
                    data = get(handles.data5SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(3) = cellstr('No');
                    data(:,2) = dataCol;
                    set(handles.data5SummaryTable,'Data',data);
                    
                    if get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_sPoly_nChauRemo = 'Normally Not Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_sDetr_nChauRemo = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_sPoly_nHistRemo = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.removedNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_sDetr_nHistRemo = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_nHistRemo = 'Normally Not Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_nChauRemo = 'Normally Not Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_sPoly_nChau = 'Normally Not Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_sDetr_nChau = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_sPoly_nHist = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                            &&get(handles.replacedNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_sDetr_nHist = 'Normally Not Distributed';
                    elseif get(handles.histoNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_nHist = 'Normally Not Distributed';
                    elseif get(handles.chauNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_nChau = 'Normally Not Distributed';
                    elseif get(handles.stationaryPolyNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_sPoly = 'Normally Not Distributed';
                    elseif get(handles.stationaryDetrendNormCheck,'Value')
                        handles.Summary5.Normality.Signal5_sDetr = 'Normally Not Distributed';
                    else
                        handles.Summary5.Normality.Signal5 = 'Normally Not Distributed';
                    end
            end
        end
    end
    
    % Runs when Periodicity menu is selected
elseif convert(get(handles.periodicaxes1,'Visible'))
    s = rng(0,'v5uniform');
    str1 = get(handles.originalDataPeriodicPopup, 'String');
    val1 = get(handles.originalDataPeriodicPopup,'Value');
    if get(handles.stationaryPolyPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
        axes(handles.periodicaxes2);
        cla reset;
        axes(handles.periodicaxes1);
        cla reset;
        legend(handles.periodicaxes1,'Off');
        legend(handles.periodicaxes2,'Off');
        set(handles.resultDisplay,'String','');
        errordlg('Select either stationary data obtained from Detrend or obtained from polynomial fit',...
            'Computation failed');
        return;
    end
    if get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.noiselessHistoPeriodicCheck,'Value')
        axes(handles.periodicaxes2);
        cla reset;
        axes(handles.periodicaxes1);
        cla reset;
        legend(handles.periodicaxes1,'Off');
        legend(handles.periodicaxes2,'Off');
        set(handles.resultDisplay,'String','');
        errordlg('Select either noiseless data obtained from Chauvenet or obtained from histogram substitution',...
            'Computation failed');
        return;
    end
    % Getting the selected data,its time vector and its sampling frequency
    % from the temporary variable
    if strcmp(str1,'Signal 1')
        array1 = [handles.data5SummaryPanel,handles.data2SummaryPanel,handles.data3SummaryPanel,...
            handles.data4SummaryPanel];
        set(array1,'Visible','Off');
        set(handles.data1SummaryPanel,'Visible','On');
        fs = str2double(get(handles.sampling1Input,'String'));
        
    else
        switch str1{val1}
            case 'Signal 1'
                array1 = [handles.data5SummaryPanel,handles.data2SummaryPanel,handles.data3SummaryPanel,...
                    handles.data4SummaryPanel];
                set(array1,'Visible','Off');
                set(handles.data1SummaryPanel,'Visible','On');
                fs = str2double(get(handles.sampling1Input,'String'));
                
            case 'Signal 2'
                array1 = [handles.data1SummaryPanel,handles.data5SummaryPanel,handles.data3SummaryPanel,...
                    handles.data4SummaryPanel];
                set(array1,'Visible','Off');
                set(handles.data2SummaryPanel,'Visible','On');
                fs = str2double(get(handles.sampling2Input,'String'));
                
            case 'Signal 3'
                array1 = [handles.data1SummaryPanel,handles.data2SummaryPanel,handles.data5SummaryPanel,...
                    handles.data4SummaryPanel];
                set(array1,'Visible','Off');
                set(handles.data3SummaryPanel,'Visible','On');
                fs = str2double(get(handles.sampling3Input,'String'));
                
            case 'Signal 4'
                array1 = [handles.data1SummaryPanel,handles.data2SummaryPanel,handles.data3SummaryPanel,...
                    handles.data5SummaryPanel];
                set(array1,'Visible','Off');
                set(handles.data4SummaryPanel,'Visible','On');
                fs = str2double(get(handles.sampling4Input,'String'));
                
            case 'Signal 5'
                array1 = [handles.data1SummaryPanel,handles.data2SummaryPanel,handles.data3SummaryPanel,...
                    handles.data4SummaryPanel];
                set(array1,'Visible','Off');
                set(handles.data5SummaryPanel,'Visible','On');
                fs = str2double(get(handles.sampling5Input,'String'));
                
        end
    end
    setappdata(0,'temp_fs',fs);
    na = get(handles.divPeriodicInput,'String'); % No. of division for pwelch
    p = get(handles.overPeriodicInput,'String'); % Overlap for pwelch
    nfft = get(handles.discretePeriodicInput,'String');
    if isempty(na)
        errordlg('Enter number of division of the signal','Plotting Denied');
        return;
    end
    if isempty(p)
        errordlg('Enter fraction of overlap between division','Plotting Denied');
        return;
    end
    
    if str2double(p)>=1||str2double(p)<=0
        errordlg('The fraction should be between 0 and 1','Plotting Denied');
        return;
    end
    if isempty(nfft)
        errordlg('Enter number of discrete Fourier transform','Plotting Denied');
        return;
    end
    check = [handles.stationaryPolyPeriodicCheck,handles.stationaryDetrendPeriodicCheck,...
        handles.noiselessChauPeriodicCheck,handles.noiselessHistoPeriodicCheck];
    set(check,'Enable','Off');
    set(handles.originalDataPeriodicPopup,'Enable','Off');
    
    final_u = getappdata(0,'temp_u');
    t = getappdata(0,'temp_t');
    t1 = t;
    
    if isempty(get(handles.appendPeriodicityInput,'String'))
        NR = ceil(0.003*length(final_u));
    else
        NR = str2double(get(handles.appendPeriodicityInput,'String'));
    end
    
    x1 = flipud(final_u(2:NR+1));  % maintain continuity in level and slope
    x2 = flipud(final_u(end-NR:end-1));
    xn = [x1,final_u,x2];
    
    mean_x = mean(xn);
    xn = xn - mean_x;
    N1 = length(xn);
    
    mean_f = mean(final_u);
    final_u = final_u - mean_f;
    N = length(final_u);
    
    % Storing the selected data and time vector in temporary variable which
    % will be used in plotting check box panel
    p = str2double(p);
    nfft = str2double(nfft);
    na = str2double(na);
    % Formula for computing the input needed for pwelch
    temp = 2*(1-p)+(na-1)*p+(1-2*p)*(na-2);
    n = floor(N1/temp);
    
    Stri = get(handles.windowPopup, 'String');
    Vari = get(handles.windowPopup,'Value');
    % Performimg pwelch depending upon the type of window selected
    switch Stri{Vari}
        case 'hamming'
            [pxx,f1] = pwelch(xn,hamming(n),floor(p*n),nfft,fs);
        case 'hann'
            [pxx,f1] = pwelch(xn,hanning(n),floor(p*n),nfft,fs);
        case 'rectwin'
            [pxx,f1] = pwelch(xn,rectwin(n),floor(p*n),nfft,fs);
        case 'chebwin'
            [pxx,f1] = pwelch(xn,chebwin(n),floor(p*n),nfft,fs);
        case 'gausswin'
            [pxx,f1] = pwelch(xn,gausswin(n),floor(p*n),nfft,fs);
        case 'triang'
            [pxx,f1] = pwelch(xn,triang(n),floor(p*n),nfft,fs);
    end
    % Locating the peaks using 'PeakSeek' function
    [loca,peaks] = PeakSeek((pxx),[],mean((pxx)));
    posit = peaks == max(peaks); % Position of the highest peak
    locs = loca(posit);
    handles.message = {sprintf('A peak of %f is detected at a frequency of %d Hz\n',max(peaks),f1(locs))};
    set(handles.resultDisplay,'String',handles.message);
    
    % Filtering
    sm = smooth(pxx,3);
    for i = locs:(length(f1)-1)
        if sm(i+1) > sm(i)
            indmax = i;
            break;
        end
        if i == length(f1) - 1
            indmax = length(f1);
        end
    end
    
    for j = locs:-1:2
        if sm(j-1) > sm(j)
            indmin = j;
            break;
        end
        if j == 2
            indmin = 1;
        end
    end
    indmin = max(indmin-2,1);
    indmax = min(indmax+2,length(f1));
    
    N1 = length(xn);
    
    if isempty(get(handles.minlimitPeriodicityInput,'String'))
        r1 = round(indmin*N1*2/(nfft+1));
    else
        freq = str2double(get(handles.minlimitPeriodicityInput,'String'));
        diff = abs(freq-f1);
        indmin = find(diff == min(diff));
        r1 = round(indmin*N1*2/(nfft+1));
    end
    
    if isempty(get(handles.maxlimitPeriodicityInput,'String'))
        r2 = round(indmax*N1*2/(nfft+1));
    else
        freq = str2double(get(handles.maxlimitPeriodicityInput,'String'));
        diff = abs(freq-f1);
        indmax = find(diff == min(diff));
        r2 = round(indmax*N1*2/(nfft+1));
    end
    
    r4 = 2*N1-r1+2;
    r3 = 2*N1-r2+2;
    
    xn1 = [xn zeros(1,N1)];
    x_f = (fft(xn1));
    
    y_f = abs(real(x_f));
    temp1 = real(x_f(1:r1-1));
    temp2 = real(x_f(r2+1:r3-1));
    temp3 = real(x_f(r4+1:end));
    
    y_fo = abs(imag(x_f));
    tempo1 = imag(x_f(1:r1-1));
    tempo2 = imag(x_f(r2+1:r3-1));
    tempo3 = imag(x_f(r4+1:end));
    
    
    a = 0;
    b = max(abs(real(x_f)));
    c = 0;
    d = max(abs(imag(x_f)));
    
    if isempty(get(handles.scalePeriodicityInput,'String'))
        scale = 0.2;
    else
        scale = str2double(get(handles.scalePeriodicityInput,'String'));
    end
    
    rng(s);
    j = 1;
    for i = r1:r2
        y_f(i) = (a + (b-a).*rand(1,1))*scale;
        y_f(r4-j+1) = y_f(i);
        y_fo(i) = (c + (d-c).*rand(1,1))*scale;
        y_fo(r4-j+1) = y_fo(i);
        j = j + 1;
    end
    
    y_f2 = [temp1,y_f(r1:r2),temp2,y_f(r3:r4),temp3];
    y_f3 = [tempo1,y_fo(r1:r2),tempo2,y_fo(r3:r4),tempo3];
    y_f4 = y_f2 + 1i*y_f3;
    
    y_t = (ifft(y_f4));
    filtered_u1 = real(y_t(1:N1));
    filtered_u = filtered_u1(NR+1:end-NR);
    
    setappdata(0,'temp_scale',scale);
    
    
    set(handles.statisticsPanel,'Title','Selected non-periodic signal statistics');
    setappdata(0,'set_filter',filtered_u);% Temporary variable to be used in plot check box panel
    %     filtered_u = filtered_u + mean_f;
    %     mean_fi = mean(filtered_u);
    %     filtered_u = filtered_u - mean_fi;
    Stri1 = get(handles.windowPopup, 'String');
    Vari1 = get(handles.windowPopup,'Value');
    
    % Performing pwelch on the non-periodic data
    switch Stri1{Vari1}
        case 'hamming'
            [pxx1,f2] = pwelch(filtered_u,hamming(n),floor(p*n),nfft,fs);
        case 'hann'
            [pxx1,f2] = pwelch(filtered_u,hanning(n),floor(p*n),nfft,fs);
        case 'rectwin'
            [pxx1,f2] = pwelch(filtered_u,rectwin(n),floor(p*n),nfft,fs);
        case 'chebwin'
            [pxx1,f2] = pwelch(filtered_u,chebwin(n),floor(p*n),nfft,fs);
        case 'gausswin'
            [pxx1,f2] = pwelch(filtered_u,gausswin(n),floor(p*n),nfft,fs);
        case 'triang'
            [pxx1,f2] = pwelch(filtered_u,triang(n),floor(p*n),nfft,fs);
    end
    
    axes(handles.periodicaxes2);
    cla reset;
    semilogy(f1,(pxx));
    title('Spectral Density','FontName','Times');
    hold on;
    xlabel('\hspace{30em}\normalfont\bf{f[Hz]}','interpreter','latex');
    legend('Selected signal spectrum');
    if get(handles.yesRemovePerioButton,'Value')
        semilogy(f2,pxx1);
        legend('Selected signal spectrum','Filtered signal spectrum');
    end
    semilogy(f1(locs),peaks(posit),'*','MarkerSize',5);
    
    % Temporary variable to be used in plot check box panel
    setappdata(0,'set_p1',pxx);
    setappdata(0,'set_p2',pxx1);
    setappdata(0,'set_f1',f1);
    setappdata(0,'set_f2',f2);
    
    array = [handles.selectedDataPeriodicCheck,handles.selectedSpectrumCheck];
    set(array,'Visible','On');
    set(array,'Enable','On');
    set(array,'Value',1);
    array1 = [handles.nonPeriodicCheck,handles.peakRemovedSpectrumCheck];
    set(array1,'Visible','Off');
    array2 = [handles.yesRemovePerioButton,handles.noRemovePerioButton];
    set(array2,'Enable','On');
    set(array2,'Value',0);
    
    if ~isempty(get(handles.scalePeriodicityInput,'String'))
        set(handles.yesRemovePerioButton,'Value',1)
    end
    axes(handles.periodicaxes1);
    cla reset;
    plot(t1,final_u);
    hold on
    title('Selected signal','FontName','Times');
    legend('Selected time trace');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{Signal}','interpreter','latex');
    if get(handles.yesRemovePerioButton,'Value')
        plot(t1,filtered_u);
        legend('Selected time trace','Filtered time trace');
        set(array1,'Visible','On');
        set(array1,'Value',1);
        
        filtered_u = filtered_u + mean_f;
        handles.message = {sprintf('A peak of %f is detected at a frequency of %d Hz\n',max(peaks),f1(locs))
            sprintf('A new signal is generated with periodicity removed at f = %d Hz',f1(locs))};
        set(handles.resultDisplay,'String',handles.message);
        
        % Saving the non-periodic data, updating struct and updating the
        % summary table
        string1 = get(handles.originalDataPeriodicPopup, 'String');
        value1 = get(handles.originalDataPeriodicPopup,'Value');
        if strcmp(string1,'Signal 1')
            data = get(handles.data1SummaryTable,'Data');
            dataCol = cellstr(data(:,2));
            dataCol(4) = cellstr('Yes');
            dataCol(5) = cellstr(num2str(f1(locs)));
            data(:,2) = dataCol;
            set(handles.data1SummaryTable,'Data',data);
            
            if get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                assignin('base','Signal1_sPoly_nChau_np',filtered_u);
                handles.Summary1.Mean.Signal1_sPoly_nChau_np = mean(filtered_u);
                handles.Summary1.Std.SampleRecord.Signal1_sPoly_nChau_np = std(filtered_u);
                handles.Summary1.PeakFrequency.Signal1_sPoly_nChau = f1(locs);
                handles.Summary1.PeakValue.Signal1_sPoly_nChau = max(peaks);
            elseif get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                assignin('base','Signal1_sDetr_nChau_np',filtered_u);
                handles.Summary1.Mean.Signal1_sDetr_nChau_np = mean(filtered_u);
                handles.Summary1.Std.SampleRecord.Signal1_sDetr_nChau_np = std(filtered_u);
                handles.Summary1.PeakFrequency.Signal1_sDetr_nChau = f1(locs);
                handles.Summary1.PeakValue.Signal1_sDetr_nChau = max(peaks);
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                assignin('base','Signal1_sPoly_nHist_np',filtered_u);
                handles.Summary1.Mean.Signal1_sPoly_nHist_np = mean(filtered_u);
                handles.Summary1.Std.SampleRecord.Signal1_sPoly_nHist_np = std(filtered_u);
                handles.Summary1.PeakFrequency.Signal1_sPoly_nHist = f1(locs);
                handles.Summary1.PeakValue.Signal1_sPoly_nHist = max(peaks);
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                assignin('base','Signal1_sDetr_nHist_np',filtered_u);
                handles.Summary1.Mean.Signal1_sDetr_nHist_np = mean(filtered_u);
                handles.Summary1.Std.SampleRecord.Signal1_sDetr_nHist_np = std(filtered_u);
                handles.Summary1.PeakFrequency.Signal1_sDetr_nHist = f1(locs);
                handles.Summary1.PeakValue.Signal1_sDetr_nHist = max(peaks);
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')
                assignin('base','Signal1_nHist_np',filtered_u);
                handles.Summary1.Mean.Signal1_nHist_np = mean(filtered_u);
                handles.Summary1.Std.SampleRecord.Signal1_nHist_np = std(filtered_u);
                handles.Summary1.PeakFrequency.Signal1_nHist = f1(locs);
                handles.Summary1.PeakValue.Signal1_nHist = max(peaks);
            elseif get(handles.noiselessChauPeriodicCheck,'Value')
                assignin('base','Signal1_nChau_np',filtered_u);
                handles.Summary1.Mean.Signal1_nChau_np = mean(filtered_u);
                handles.Summary1.Std.SampleRecord.Signal1_nChau_np = std(filtered_u);
                handles.Summary1.PeakFrequency.Signal1_nChau = f1(locs);
                handles.Summary1.PeakValue.Signal1_nChau = max(peaks);
            elseif get(handles.stationaryPolyPeriodicCheck,'Value')
                assignin('base','Signal1_sPoly_np',filtered_u);
                handles.Summary1.Mean.Signal1_sPoly_np = mean(filtered_u);
                handles.Summary1.Std.SampleRecord.Signal1_sPoly_np = std(filtered_u);
                handles.Summary1.PeakFrequency.Signal1_sPoly = f1(locs);
                handles.Summary1.PeakValue.Signal1_sPoly = max(peaks);
            elseif get(handles.stationaryDetrendPeriodicCheck,'Value')
                assignin('base','Signal1_sDetr_np',filtered_u);
                handles.Summary1.Mean.Signal1_sDetr_np = mean(filtered_u);
                handles.Summary1.Std.SampleRecord.Signal1_sDetr_np = std(filtered_u);
                handles.Summary1.PeakFrequency.Signal1_sDetr = f1(locs);
                handles.Summary1.PeakValue.Signal1_sDetr = max(peaks);
            else
                assignin('base','Signal1_np',filtered_u);
                handles.Summary1.Mean.Signal1_np = mean(filtered_u);
                handles.Summary1.Std.SampleRecord.Signal1_np = std(filtered_u);
                handles.Summary1.PeakFrequency.Signal1 = f1(locs);
                handles.Summary1.PeakValue.Signal1 = max(peaks);
            end
            
        else
            switch string1{value1}
                case 'Signal 1'
                    data = get(handles.data1SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(4) = cellstr('Yes');
                    dataCol(5) = cellstr(num2str(f1(locs)));
                    data(:,2) = dataCol;
                    set(handles.data1SummaryTable,'Data',data);
                    
                    if get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                        assignin('base','Signal1_sPoly_nChau_np',filtered_u);
                        handles.Summary1.Mean.Signal1_sPoly_nChau_np = mean(filtered_u);
                        handles.Summary1.Std.SampleRecord.Signal1_sPoly_nChau_np = std(filtered_u);
                        handles.Summary1.PeakFrequency.Signal1_sPoly_nChau = f1(locs);
                        handles.Summary1.PeakValue.Signal1_sPoly_nChau = max(peaks);
                    elseif get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                        assignin('base','Signal1_sDetr_nChau_np',filtered_u);
                        handles.Summary1.Mean.Signal1_sDetr_nChau_np = mean(filtered_u);
                        handles.Summary1.Std.SampleRecord.Signal1_sDetr_nChau_np = std(filtered_u);
                        handles.Summary1.PeakFrequency.Signal1_sDetr_nChau = f1(locs);
                        handles.Summary1.PeakValue.Signal1_sDetr_nChau = max(peaks);
                    elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                        assignin('base','Signal1_sPoly_nHist_np',filtered_u);
                        handles.Summary1.Mean.Signal1_sPoly_nHist_np = mean(filtered_u);
                        handles.Summary1.Std.SampleRecord.Signal1_sPoly_nHist_np = std(filtered_u);
                        handles.Summary1.PeakFrequency.Signal1_sPoly_nHist = f1(locs);
                        handles.Summary1.PeakValue.Signal1_sPoly_nHist = max(peaks);
                    elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                        assignin('base','Signal1_sDetr_nHist_np',filtered_u);
                        handles.Summary1.Mean.Signal1_sDetr_nHist_np = mean(filtered_u);
                        handles.Summary1.Std.SampleRecord.Signal1_sDetr_nHist_np = std(filtered_u);
                        handles.Summary1.PeakFrequency.Signal1_sDetr_nHist = f1(locs);
                        handles.Summary1.PeakValue.Signal1_sDetr_nHist = max(peaks);
                    elseif get(handles.noiselessHistoPeriodicCheck,'Value')
                        assignin('base','Signal1_nHist_np',filtered_u);
                        handles.Summary1.Mean.Signal1_nHist_np = mean(filtered_u);
                        handles.Summary1.Std.SampleRecord.Signal1_nHist_np = std(filtered_u);
                        handles.Summary1.PeakFrequency.Signal1_nHist = f1(locs);
                        handles.Summary1.PeakValue.Signal1_nHist = max(peaks);
                    elseif get(handles.noiselessChauPeriodicCheck,'Value')
                        assignin('base','Signal1_nChau_np',filtered_u);
                        handles.Summary1.Mean.Signal1_nChau_np = mean(filtered_u);
                        handles.Summary1.Std.SampleRecord.Signal1_nChau_np = std(filtered_u);
                        handles.Summary1.PeakFrequency.Signal1_nChau = f1(locs);
                        handles.Summary1.PeakValue.Signal1_nChau = max(peaks);
                    elseif get(handles.stationaryPolyPeriodicCheck,'Value')
                        assignin('base','Signal1_sPoly_np',filtered_u);
                        handles.Summary1.Mean.Signal1_sPoly_np = mean(filtered_u);
                        handles.Summary1.Std.SampleRecord.Signal1_sPoly_np = std(filtered_u);
                        handles.Summary1.PeakFrequency.Signal1_sPoly = f1(locs);
                        handles.Summary1.PeakValue.Signal1_sPoly = max(peaks);
                    elseif get(handles.stationaryDetrendPeriodicCheck,'Value')
                        assignin('base','Signal1_sDetr_np',filtered_u);
                        handles.Summary1.Mean.Signal1_sDetr_np = mean(filtered_u);
                        handles.Summary1.Std.SampleRecord.Signal1_sDetr_np = std(filtered_u);
                        handles.Summary1.PeakFrequency.Signal1_sDetr = f1(locs);
                        handles.Summary1.PeakValue.Signal1_sDetr = max(peaks);
                    else
                        assignin('base','Signal1_np',filtered_u);
                        handles.Summary1.Mean.Signal1_np = mean(filtered_u);
                        handles.Summary1.Std.SampleRecord.Signal1_np = std(filtered_u);
                        handles.Summary1.PeakFrequency.Signal1 = f1(locs);
                        handles.Summary1.PeakValue.Signal1 = max(peaks);
                    end
                    
                case 'Signal 2'
                    data = get(handles.data2SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(4) = cellstr('Yes');
                    dataCol(5) = cellstr(num2str(f1(locs)));
                    data(:,2) = dataCol;
                    set(handles.data2SummaryTable,'Data',data);
                    
                    if get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                        assignin('base','Signal2_sPoly_nChau_np',filtered_u);
                        handles.Summary2.Mean.Signal2_sPoly_nChau_np = mean(filtered_u);
                        handles.Summary2.Std.SampleRecord.Signal2_sPoly_nChau_np = std(filtered_u);
                        handles.Summary2.PeakFrequency.Signal2_sPoly_nChau = f1(locs);
                        handles.Summary2.PeakValue.Signal2_sPoly_nChau = max(peaks);
                    elseif get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                        assignin('base','Signal2_sDetr_nChau_np',filtered_u);
                        handles.Summary2.Mean.Signal2_sDetr_nChau_np = mean(filtered_u);
                        handles.Summary2.Std.SampleRecord.Signal2_sDetr_nChau_np = std(filtered_u);
                        handles.Summary2.PeakFrequency.Signal2_sDetr_nChau = f1(locs);
                        handles.Summary2.PeakValue.Signal2_sDetr_nChau = max(peaks);
                    elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                        assignin('base','Signal2_sPoly_nHist_np',filtered_u);
                        handles.Summary2.Mean.Signal2_sPoly_nHist_np = mean(filtered_u);
                        handles.Summary2.Std.SampleRecord.Signal2_sPoly_nHist_np = std(filtered_u);
                        handles.Summary2.PeakFrequency.Signal2_sPoly_nHist = f1(locs);
                        handles.Summary2.PeakValue.Signal2_sPoly_nHist = max(peaks);
                    elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                        assignin('base','Signal2_sDetr_nHist_np',filtered_u);
                        handles.Summary2.Mean.Signal2_sDetr_nHist_np = mean(filtered_u);
                        handles.Summary2.Std.SampleRecord.Signal2_sDetr_nHist_np = std(filtered_u);
                        handles.Summary2.PeakFrequency.Signal2_sDetr_nHist = f1(locs);
                        handles.Summary2.PeakValue.Signal2_sDetr_nHist = max(peaks);
                    elseif get(handles.noiselessHistoPeriodicCheck,'Value')
                        assignin('base','Signal2_nHist_np',filtered_u);
                        handles.Summary2.Mean.Signal2_nHist_np = mean(filtered_u);
                        handles.Summary2.Std.SampleRecord.Signal2_nHist_np = std(filtered_u);
                        handles.Summary2.PeakFrequency.Signal2_nHist = f1(locs);
                        handles.Summary2.PeakValue.Signal2_nHist = max(peaks);
                    elseif get(handles.noiselessChauPeriodicCheck,'Value')
                        assignin('base','Signal2_nChau_np',filtered_u);
                        handles.Summary2.Mean.Signal2_nChau_np = mean(filtered_u);
                        handles.Summary2.Std.SampleRecord.Signal2_nChau_np = std(filtered_u);
                        handles.Summary2.PeakFrequency.Signal2_nChau = f1(locs);
                        handles.Summary2.PeakValue.Signal2_nChau = max(peaks);
                    elseif get(handles.stationaryPolyPeriodicCheck,'Value')
                        assignin('base','Signal2_sPoly_np',filtered_u);
                        handles.Summary2.Mean.Signal2_sPoly_np = mean(filtered_u);
                        handles.Summary2.Std.SampleRecord.Signal2_sPoly_np = std(filtered_u);
                        handles.Summary2.PeakFrequency.Signal2_sPoly = f1(locs);
                        handles.Summary2.PeakValue.Signal2_sPoly = max(peaks);
                    elseif get(handles.stationaryDetrendPeriodicCheck,'Value')
                        assignin('base','Signal2_sDetr_np',filtered_u);
                        handles.Summary2.Mean.Signal2_sDetr_np = mean(filtered_u);
                        handles.Summary2.Std.SampleRecord.Signal2_sDetr_np = std(filtered_u);
                        handles.Summary2.PeakFrequency.Signal2_sDetr = f1(locs);
                        handles.Summary2.PeakValue.Signal2_sDetr = max(peaks);
                    else
                        assignin('base','Signal2_np',filtered_u);
                        handles.Summary2.Mean.Signal2_np = mean(filtered_u);
                        handles.Summary2.Std.SampleRecord.Signal2_np = std(filtered_u);
                        handles.Summary2.PeakFrequency.Signal2 = f1(locs);
                        handles.Summary2.PeakValue.Signal2 = max(peaks);
                    end
                    
                case 'Signal 3'
                    data = get(handles.data3SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(4) = cellstr('Yes');
                    dataCol(5) = cellstr(num2str(f1(locs)));
                    data(:,2) = dataCol;
                    set(handles.data3SummaryTable,'Data',data);
                    
                    if get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                        assignin('base','Signal3_sPoly_nChau_np',filtered_u);
                        handles.Summary3.Mean.Signal3_sPoly_nChau_np = mean(filtered_u);
                        handles.Summary3.Std.SampleRecord.Signal3_sPoly_nChau_np = std(filtered_u);
                        handles.Summary3.PeakFrequency.Signal3_sPoly_nChau = f1(locs);
                        handles.Summary3.PeakValue.Signal3_sPoly_nChau = max(peaks);
                    elseif get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                        assignin('base','Signal3_sDetr_nChau_np',filtered_u);
                        handles.Summary3.Mean.Signal3_sDetr_nChau_np = mean(filtered_u);
                        handles.Summary3.Std.SampleRecord.Signal3_sDetr_nChau_np = std(filtered_u);
                        handles.Summary3.PeakFrequency.Signal3_sDetr_nChau = f1(locs);
                        handles.Summary3.PeakValue.Signal3_sDetr_nChau = max(peaks);
                    elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                        assignin('base','Signal3_sPoly_nHist_np',filtered_u);
                        handles.Summary3.Mean.Signal3_sPoly_nHist_np = mean(filtered_u);
                        handles.Summary3.Std.SampleRecord.Signal3_sPoly_nHist_np = std(filtered_u);
                        handles.Summary3.PeakFrequency.Signal3_sPoly_nHist = f1(locs);
                        handles.Summary3.PeakValue.Signal3_sPoly_nHist = max(peaks);
                    elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                        assignin('base','Signal3_sDetr_nHist_np',filtered_u);
                        handles.Summary3.Mean.Signal3_sDetr_nHist_np = mean(filtered_u);
                        handles.Summary3.Std.SampleRecord.Signal3_sDetr_nHist_np = std(filtered_u);
                        handles.Summary3.PeakFrequency.Signal3_sDetr_nHist = f1(locs);
                        handles.Summary3.PeakValue.Signal3_sDetr_nHist = max(peaks);
                    elseif get(handles.noiselessHistoPeriodicCheck,'Value')
                        assignin('base','Signal3_nHist_np',filtered_u);
                        handles.Summary3.Mean.Signal3_nHist_np = mean(filtered_u);
                        handles.Summary3.Std.SampleRecord.Signal3_nHist_np = std(filtered_u);
                        handles.Summary3.PeakFrequency.Signal3_nHist = f1(locs);
                        handles.Summary3.PeakValue.Signal3_nHist = max(peaks);
                    elseif get(handles.noiselessChauPeriodicCheck,'Value')
                        assignin('base','Signal3_nChau_np',filtered_u);
                        handles.Summary3.Mean.Signal3_nChau_np = mean(filtered_u);
                        handles.Summary3.Std.SampleRecord.Signal3_nChau_np = std(filtered_u);
                        handles.Summary3.PeakFrequency.Signal3_nChau = f1(locs);
                        handles.Summary3.PeakValue.Signal3_nChau = max(peaks);
                    elseif get(handles.stationaryPolyPeriodicCheck,'Value')
                        assignin('base','Signal3_sPoly_np',filtered_u);
                        handles.Summary3.Mean.Signal3_sPoly_np = mean(filtered_u);
                        handles.Summary3.Std.SampleRecord.Signal3_sPoly_np = std(filtered_u);
                        handles.Summary3.PeakFrequency.Signal3_sPoly = f1(locs);
                        handles.Summary3.PeakValue.Signal3_sPoly = max(peaks);
                    elseif get(handles.stationaryDetrendPeriodicCheck,'Value')
                        assignin('base','Signal3_sDetr_np',filtered_u);
                        handles.Summary3.Mean.Signal3_sDetr_np = mean(filtered_u);
                        handles.Summary3.Std.SampleRecord.Signal3_sDetr_np = std(filtered_u);
                        handles.Summary3.PeakFrequency.Signal3_sDetr = f1(locs);
                        handles.Summary3.PeakValue.Signal3_sDetr = max(peaks);
                    else
                        assignin('base','Signal3_np',filtered_u);
                        handles.Summary3.Mean.Signal3_np = mean(filtered_u);
                        handles.Summary3.Std.SampleRecord.Signal3_np = std(filtered_u);
                        handles.Summary3.PeakFrequency.Signal3 = f1(locs);
                        handles.Summary3.PeakValue.Signal3 = max(peaks);
                    end
                    
                case 'Signal 4'
                    data = get(handles.data4SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(4) = cellstr('Yes');
                    dataCol(5) = cellstr(num2str(f1(locs)));
                    data(:,2) = dataCol;
                    set(handles.data4SummaryTable,'Data',data);
                    
                    if get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                        assignin('base','Signal4_sPoly_nChau_np',filtered_u);
                        handles.Summary4.Mean.Signal4_sPoly_nChau_np = mean(filtered_u);
                        handles.Summary4.Std.SampleRecord.Signal4_sPoly_nChau_np = std(filtered_u);
                        handles.Summary4.PeakFrequency.Signal4_sPoly_nChau = f1(locs);
                        handles.Summary4.PeakValue.Signal4_sPoly_nChau = max(peaks);
                    elseif get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                        assignin('base','Signal4_sDetr_nChau_np',filtered_u);
                        handles.Summary4.Mean.Signal4_sDetr_nChau_np = mean(filtered_u);
                        handles.Summary4.Std.SampleRecord.Signal4_sDetr_nChau_np = std(filtered_u);
                        handles.Summary4.PeakFrequency.Signal4_sDetr_nChau = f1(locs);
                        handles.Summary4.PeakValue.Signal4_sDetr_nChau = max(peaks);
                    elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                        assignin('base','Signal4_sPoly_nHist_np',filtered_u);
                        handles.Summary4.Mean.Signal4_sPoly_nHist_np = mean(filtered_u);
                        handles.Summary4.Std.SampleRecord.Signal4_sPoly_nHist_np = std(filtered_u);
                        handles.Summary4.PeakFrequency.Signal4_sPoly_nHist = f1(locs);
                        handles.Summary4.PeakValue.Signal4_sPoly_nHist = max(peaks);
                    elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                        assignin('base','Signal4_sDetr_nHist_np',filtered_u);
                        handles.Summary4.Mean.Signal4_sDetr_nHist_np = mean(filtered_u);
                        handles.Summary4.Std.SampleRecord.Signal4_sDetr_nHist_np = std(filtered_u);
                        handles.Summary4.PeakFrequency.Signal4_sDetr_nHist = f1(locs);
                        handles.Summary4.PeakValue.Signal4_sDetr_nHist = max(peaks);
                    elseif get(handles.noiselessHistoPeriodicCheck,'Value')
                        assignin('base','Signal4_nHist_np',filtered_u);
                        handles.Summary4.Mean.Signal4_nHist_np = mean(filtered_u);
                        handles.Summary4.Std.SampleRecord.Signal4_nHist_np = std(filtered_u);
                        handles.Summary4.PeakFrequency.Signal4_nHist = f1(locs);
                        handles.Summary4.PeakValue.Signal4_nHist = max(peaks);
                    elseif get(handles.noiselessChauPeriodicCheck,'Value')
                        assignin('base','Signal4_nChau_np',filtered_u);
                        handles.Summary4.Mean.Signal4_nChau_np = mean(filtered_u);
                        handles.Summary4.Std.SampleRecord.Signal4_nChau_np = std(filtered_u);
                        handles.Summary4.PeakFrequency.Signal4_nChau = f1(locs);
                        handles.Summary4.PeakValue.Signal4_nChau = max(peaks);
                    elseif get(handles.stationaryPolyPeriodicCheck,'Value')
                        assignin('base','Signal4_sPoly_np',filtered_u);
                        handles.Summary4.Mean.Signal4_sPoly_np = mean(filtered_u);
                        handles.Summary4.Std.SampleRecord.Signal4_sPoly_np = std(filtered_u);
                        handles.Summary4.PeakFrequency.Signal4_sPoly = f1(locs);
                        handles.Summary4.PeakValue.Signal4_sPoly = max(peaks);
                    elseif get(handles.stationaryDetrendPeriodicCheck,'Value')
                        assignin('base','Signal4_sDetr_np',filtered_u);
                        handles.Summary4.Mean.Signal4_sDetr_np = mean(filtered_u);
                        handles.Summary4.Std.SampleRecord.Signal4_sDetr_np = std(filtered_u);
                        handles.Summary4.PeakFrequency.Signal4_sDetr = f1(locs);
                        handles.Summary4.PeakValue.Signal4_sDetr = max(peaks);
                    else
                        assignin('base','Signal4_np',filtered_u);
                        handles.Summary4.Mean.Signal4_np = mean(filtered_u);
                        handles.Summary4.Std.SampleRecord.Signal4_np = std(filtered_u);
                        handles.Summary4.PeakFrequency.Signal4 = f1(locs);
                        handles.Summary4.PeakValue.Signal4 = max(peaks);
                    end
                    
                case 'Signal 5'
                    data = get(handles.data5SummaryTable,'Data');
                    dataCol = cellstr(data(:,2));
                    dataCol(4) = cellstr('Yes');
                    dataCol(5) = cellstr(num2str(f1(locs)));
                    data(:,2) = dataCol;
                    set(handles.data5SummaryTable,'Data',data);
                    
                    if get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                        assignin('base','Signal5_sPoly_nChau_np',filtered_u);
                        handles.Summary5.Mean.Signal5_sPoly_nChau_np = mean(filtered_u);
                        handles.Summary5.Std.SampleRecord.Signal5_sPoly_nChau_np = std(filtered_u);
                        handles.Summary5.PeakFrequency.Signal5_sPoly_nChau = f1(locs);
                        handles.Summary5.PeakValue.Signal5_sPoly_nChau = max(peaks);
                    elseif get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                        assignin('base','Signal5_sDetr_nChau_np',filtered_u);
                        handles.Summary5.Mean.Signal5_sDetr_nChau_np = mean(filtered_u);
                        handles.Summary5.Std.SampleRecord.Signal5_sDetr_nChau_np = std(filtered_u);
                        handles.Summary5.PeakFrequency.Signal5_sDetr_nChau = f1(locs);
                        handles.Summary5.PeakValue.Signal5_sDetr_nChau = max(peaks);
                    elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                        assignin('base','Signal5_sPoly_nHist_np',filtered_u);
                        handles.Summary5.Mean.Signal5_sPoly_nHist_np = mean(filtered_u);
                        handles.Summary5.Std.SampleRecord.Signal5_sPoly_nHist_np = std(filtered_u);
                        handles.Summary5.PeakFrequency.Signal5_sPoly_nHist = f1(locs);
                        handles.Summary5.PeakValue.Signal5_sPoly_nHist = max(peaks);
                    elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                        assignin('base','Signal5_sDetr_nHist_np',filtered_u);
                        handles.Summary5.Mean.Signal5_sDetr_nHist_np = mean(filtered_u);
                        handles.Summary5.Std.SampleRecord.Signal5_sDetr_nHist_np = std(filtered_u);
                        handles.Summary5.PeakFrequency.Signal5_sDetr_nHist = f1(locs);
                        handles.Summary5.PeakValue.Signal5_sDetr_nHist = max(peaks);
                    elseif get(handles.noiselessHistoPeriodicCheck,'Value')
                        assignin('base','Signal5_nHist_np',filtered_u);
                        handles.Summary5.Mean.Signal5_nHist_np = mean(filtered_u);
                        handles.Summary5.Std.SampleRecord.Signal5_nHist_np = std(filtered_u);
                        handles.Summary5.PeakFrequency.Signal5_nHist = f1(locs);
                        handles.Summary5.PeakValue.Signal5_nHist = max(peaks);
                    elseif get(handles.noiselessChauPeriodicCheck,'Value')
                        assignin('base','Signal5_nChau_np',filtered_u);
                        handles.Summary5.Mean.Signal5_nChau_np = mean(filtered_u);
                        handles.Summary5.Std.SampleRecord.Signal5_nChau_np = std(filtered_u);
                        handles.Summary5.PeakFrequency.Signal5_nChau = f1(locs);
                        handles.Summary5.PeakValue.Signal5_nChau = max(peaks);
                    elseif get(handles.stationaryPolyPeriodicCheck,'Value')
                        assignin('base','Signal5_sPoly_np',filtered_u);
                        handles.Summary5.Mean.Signal5_sPoly_np = mean(filtered_u);
                        handles.Summary5.Std.SampleRecord.Signal5_sPoly_np = std(filtered_u);
                        handles.Summary5.PeakFrequency.Signal5_sPoly = f1(locs);
                        handles.Summary5.PeakValue.Signal5_sPoly = max(peaks);
                    elseif get(handles.stationaryDetrendPeriodicCheck,'Value')
                        assignin('base','Signal5_sDetr_np',filtered_u);
                        handles.Summary5.Mean.Signal5_sDetr_np = mean(filtered_u);
                        handles.Summary5.Std.SampleRecord.Signal5_sDetr_np = std(filtered_u);
                        handles.Summary5.PeakFrequency.Signal5_sDetr = f1(locs);
                        handles.Summary5.PeakValue.Signal5_sDetr = max(peaks);
                    else
                        assignin('base','Signal5_np',filtered_u);
                        handles.Summary5.Mean.Signal5_np = mean(filtered_u);
                        handles.Summary5.Std.SampleRecord.Signal5_np = std(filtered_u);
                        handles.Summary5.PeakFrequency.Signal5 = f1(locs);
                        handles.Summary5.PeakValue.Signal5 = max(peaks);
                    end
                    
            end
        end
    end
    
    % Runs when the Sprectral analysis menu is selected
elseif convert(get(handles.spectralaxes1,'Visible'))
    
    check = str2double(get(handles.autoSpectralInput,'String'));
    if isnan(check)
        errordlg('No. of blocks not provided','Input Missing');
        return;
    end
    
    % Getting the stored signal
    filtered_u = getappdata(0,'temp_u');
    fs = getappdata(0,'temp_f');
    na = get(handles.divisionSpectralInput,'String');% No. of division for pwelch
    p = get(handles.overSpectralInput,'String');% Overlap for pwelch
    nfft = get(handles.discreteSpectralInput,'String');% Discrete fourier fequency
    if isempty(na)
        errordlg('Enter number of division of the signal','Plotting Denied');
        return;
    end
    if isempty(p)
        errordlg('Enter fraction of overlap between division','Plotting Denied');
        return;
    end
    
    if str2double(p)>=1||str2double(p)<=0
        errordlg('The fraction should be between 0 and 1','Plotting Denied');
        return;
    end
    if isempty(nfft)
        errordlg('Enter number of discrete Fourier transform','Plotting Denied');
        return;
    end
    check = [handles.stationaryPolySpectralCheck,handles.stationaryDetrendSpectralCheck,handles.noiselessChauSpectralCheck,...
        handles.noiselessHistoSpectralCheck,handles.nonperiodicSpectralCheck];
    set(check,'Enable','Off');
    set(handles.originalDataSpectralPopup,'Enable','Off');
    set(handles.statisticsPanel,'Title','Selected signal statistics');
    colorgen = @(color,text) ['<html><table border=0 width=400 bgcolor=',color,'><TR><TD>',text,'</TD></TR> </table></html>'];
    data = {colorgen('#F0F0F0','Mean'), num2str(mean(filtered_u))
        colorgen('#F0F0F0','Std Dev.'), num2str(std(filtered_u))
        colorgen('#F0F0F0','Kurtosis'), num2str(kurtosis(filtered_u))
        colorgen('#F0F0F0','Skewness'), num2str(skewness(filtered_u))
        };
    set(handles.statisticsTable,'Data',data);
    mean_fi = mean(filtered_u);
    filtered_u = filtered_u - mean_fi;
    N = length(filtered_u);
    
    p = str2double(p);
    nfft = str2double(nfft);
    na = str2double(na);
    % Formula for finding the input of pwelch
    temp = 2*(1-p)+(na-1)*p+(1-2*p)*(na-2);
    n = floor(N/temp);
    Stri = get(handles.windowSpectralPopup, 'String');
    Vari = get(handles.windowSpectralPopup,'Value');
    switch Stri{Vari}
        case 'hamming'
            [pxx,f1] = pwelch(filtered_u,hamming(n),floor(p*n),nfft,fs);
        case 'hann'
            [pxx,f1] = pwelch(filtered_u,hanning(n),floor(p*n),nfft,fs);
        case 'rectwin'
            [pxx,f1] = pwelch(filtered_u,rectwin(n),floor(p*n),nfft,fs);
        case 'chebwin'
            [pxx,f1] = pwelch(filtered_u,chebwin(n),floor(p*n),nfft,fs);
        case 'gausswin'
            [pxx,f1] = pwelch(filtered_u,gausswin(n),floor(p*n),nfft,fs);
        case 'triang'
            [pxx,f1] = pwelch(filtered_u,triang(n),floor(p*n),nfft,fs);
    end
    check = [handles.stationaryPolySpectralCheck,handles.stationaryDetrendSpectralCheck,handles.noiselessChauSpectralCheck,...
        handles.noiselessHistoSpectralCheck,handles.nonperiodicSpectralCheck];
    set(check,'Enable','Off');
    axes(handles.spectralaxes1);
    cla reset;
    semilogy(f1,(pxx));
    title('Spectral Density','FontName','Times');
    xlabel('\hspace{30em}\normalfont\bf{f[Hz]}','interpreter','latex');
    legend('Selected signal spectrum');
    
    % Finding nearest divisible
    if get(handles.autoOtherSpectralButton,'Value')
        N_block = str2double(get(handles.autoSpectralInput,'String'));
        if isnan(N_block)
            errordlg('No. of blocks not provided','Input Missing');
            return;
        end
        array = divisor(N);
        if length(array) == 2
            N_new = N -1;
            array = divisor(N_new);
        else 
            N_new = N;
        end
        L = floor(N_new/N_block);
        diff = abs(array - L);
        [~,pos] = min(diff);
        L_block = array(pos);
        if L_block == 1
            errordlg('Number of blocks cannot be more than half the length of the signal','Computation failed');
            return;
        end
        N_block = N_new/L_block;
        set(handles.autoSpectralInput,'String',num2str(N_block));
    else
        N_block = str2double(get(handles.autoSpectralInput,'String'));
        L_block = floor(N/N_block);
    end
    
    
    % Setting slider max, min and step value
    set(handles.spectralSlider, 'Min', 1);
    set(handles.spectralSlider, 'Max', L_block);
    set(handles.spectralSlider, 'Sliderstep', [1/(L_block-1), 1/(L_block-1)]);
    
    % Re-evaluating
    if length(filtered_u) ~= L_block*N_block
        filtered_u1 = filtered_u(1:end-1);
    else
        filtered_u1 = filtered_u;
    end
    x = reshape(filtered_u1,[L_block,N_block]);
    ts = 1/fs;
    xtemp=zeros(1,2*L_block);
    SxxAvg=zeros(1,2*L_block);
    for i = 1:N_block
        xtemp(1:L_block)= x(:,i);
        xtemp(L_block+1:2*L_block)=0;
        Xf = ts*fft(xtemp);
        Sxx=Xf.*conj(Xf)/(L_block*ts);
        SxxAvg=SxxAvg+Sxx;
    end
    SxxAvg=SxxAvg/N_block;
    
    % Now determine the Autocorrelation coefficient by inverting autospectral density
    % and scaling the results
    Rxx = (1/ts)*ifft(SxxAvg);
    Rxx = Rxx(1:L_block);
    for i = 1:L_block-1
        Rxx(i)=Rxx(i)*L_block/(L_block-i);
    end
    Rxx(L_block)=0;
    acor_new = Rxx/var(filtered_u1);
    lag = (1:L_block);
    acor_new = acor_new(1:L_block);
    
    setappdata(0,'set_acor_new',acor_new);
    setappdata(0,'set_lag',lag);
    %     % Checkng the zero crossing to compute the integral time scale
    %     if find(acor_new < 0,1,'first') ~= 0
    id1 = find(acor_new < 0,1,'first'); %first zero-crossing
    % If no first zero crossing take the entire vector and then
    % evaluate area under the curve to get integral time scale
    flag = 0;
    if isempty(id1)
        id3 = L_block;
        flag = 1;
    else
        id2 = find(acor_new(id1:end) > 0,1,'first');%second zero-crossing
        % If no second zero crossing take the entire vector and then
        % evaluate area under the curve to get integral time scale
        if isempty(id2)
            id3 = L_block;
            flag = 1;
        else
            id2 = id1 + id2 - 1;
            id3 = find(acor_new(id2:end) < 0,1,'first');%third zero-crossing
            % If no third zero crossing take the entire vector and then
            % evaluate area under the curve to get integral time scale
            if isempty(id3)
                id3 = L_block;
                flag = 1;
            else
                id3 = id2 + id3 - 1;
            end
        end
    end
    
    %     v = get(handles.integralTimeDisplay,'String');
    %     if convert(get(handles.integralTimeDisplay,'Visible')) && ~isempty(v)
    %         v = str2double(v);
    %         % If user enters some random time after the first computation
    %         % then index will take the nearest value from the time vector
    %         [~,index] = min(abs(lag-v));
    %         id3 = index + 1;
    %     end
    
    if flag == 0
        if abs(acor_new(id3)) > abs(acor_new(id3-1))
            id3 = id3 -1;
        end
    else
        id3 = id3 - 1;
    end
    
    tau = lag/fs;
    axes(handles.spectralaxes2);
    cla reset;
    plot(tau,acor_new);
    xlim([tau(1), tau(end)]);
    title('Autocorrelation coefficient','FontName','Times');
    hold on;
    grid on;
    % Drawing a vertical line from the axis to the time upto which
    % integral time scale needs to be evaluated
    h2 = line([tau(id3),tau(id3)],[0,acor_new(id3)]);
    set(h2,'Color','r')
    % Marker on the curve
    plot(tau(id3),acor_new(id3),'o','markersize',3);
    % Coloring the area under curve
    area(tau(1:id3),acor_new(1:id3),'Facecolor',[0 0.75 0.75]);
    xlabel('$$\hspace{30em}\normalfont\bf\tau{[s]}$$','interpreter','latex');
    set(handles.spectralSlider,'Value',(id3));
    Int2 = trapz(tau(1:id3),abs(acor_new(1:id3))); % Computing area using trapezoidal rule
    %     end
    
    filtered_u = filtered_u + mean_fi;
    Time = N/fs;
    dt = 1/fs;
    if dt < 2*Int2
        Neff = round(Time/(2*Int2));
    else
        Neff = N;
    end
    
    std_sample = std(filtered_u);
    std_mean = std_sample/sqrt(Neff);
    
    set(handles.integralDisplay,'String',num2str(Int2));
    set(handles.integralTimeDisplay,'String',num2str(tau(id3)));
    array = [handles.spectralDistriPlotCheck,handles.autoPlotCheck];
    set(array,'Visible','On');
    set(array,'Enable','Off');
    set(array,'Value',1);
    array2 = [handles.integralTimeText,handles.integralText,handles.integralTimeUnit,handles.integralTimeDisplay,...
        handles.integralDisplay,handles.integralHover,handles.integralTimeScaleUnit];
    set(array2,'Visible','On');
    % Updating struct and summary panel
    str1 = get(handles.originalDataSpectralPopup, 'String');
    val1 = get(handles.originalDataSpectralPopup,'Value');
    if strcmp(str1,'Signal 1')
        handles.Summary1.IntegralTimeScale = Int2;
        handles.Summary1.AutocorrelationCoefficient.Rho = acor_new;
        handles.Summary1.AutocorrelationCoefficient.Tau = tau;
        handles.Summary1.SpectralDensity.Sxx = pxx;
        handles.Summary1.SpectralDensity.Freq = f1;
        assignin('base','Signal1_Auto_Rho',acor_new);
        assignin('base','Signal1_Auto_Tau',tau);
        assignin('base','Signal1_Spectral_Sxx',pxx);
        assignin('base','Signal1_Spectral_Freq',f1);
        data = get(handles.data1SummaryTable,'Data');
        dataCol = cellstr(data(:,2));
        dataCol(6) = cellstr(num2str(Int2));
        data(:,2) = dataCol;
        set(handles.data1SummaryTable,'Data',data);
        
        if get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                get(handles.nonperiodicSpectralCheck,'Value')
            handles.Summary1.Std.Mean.Signal1_sPoly_nChau_np = std_mean;
        elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                get(handles.nonperiodicSpectralCheck,'Value')
            handles.Summary1.Std.Mean.Signal1_sDetr_nChau_np = std_mean;
        elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                get(handles.nonperiodicSpectralCheck,'Value')
            handles.Summary1.Std.Mean.Signal1_sPoly_nHisto_np = std_mean;
        elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                get(handles.nonperiodicSpectralCheck,'Value')
            handles.Summary1.Std.Mean.Signal1_sDetr_nHisto_np = std_mean;
        elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
            handles.Summary1.Std.Mean.Signal1_nHisto_np = std_mean;
        elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
            handles.Summary1.Std.Mean.Signal1_nChau_np = std_mean;
        elseif get(handles.stationaryPolySpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
            handles.Summary1.Std.Mean.Signal1_sPoly_np = std_mean;
        elseif get(handles.stationaryDetrendSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
            handles.Summary1.Std.Mean.Signal1_sDetr_np = std_mean;
        elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
            handles.Summary1.Std.Mean.Signal1_sPoly_nChau = std_mean;
        elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
            handles.Summary1.Std.Mean.Signal1_sDetr_nChau = std_mean;
        elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
            handles.Summary1.Std.Mean.Signal1_sPoly_nHisto = std_mean;
        elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
            handles.Summary1.Std.Mean.Signal1_sDetr_nHisto = std_mean;
        elseif get(handles.noiselessChauSpectralCheck,'Value')
            handles.Summary1.Std.Mean.Signal1_nChau = std_mean;
        elseif get(handles.noiselessHistoSpectralCheck,'Value')
            handles.Summary1.Std.Mean.Signal1_nHisto = std_mean;
        elseif get(handles.stationaryDetrendSpectralCheck,'Value')
            handles.Summary1.Std.Mean.Signal1_sDetr = std_mean;
        elseif get(handles.stationaryPolySpectralCheck,'Value')
            handles.Summary1.Std.Mean.Signal1_sPoly = std_mean;
        elseif get(handles.nonperiodicSpectralCheck,'Value')
            handles.Summary1.Std.Mean.Signal1_np = std_mean;
        else
            handles.Summary1.Std.Mean.Signal1 = std_mean;
        end
        
    else
        switch str1{val1}
            case 'Signal 1'
                handles.Summary1.IntegralTimeScale = Int2;
                handles.Summary1.AutocorrelationCoefficient.Rho = acor_new;
                handles.Summary1.AutocorrelationCoefficient.Tau = tau;
                handles.Summary1.SpectralDensity.Sxx = pxx;
                handles.Summary1.SpectralDensity.Freq = f1;
                assignin('base','Signal1_Auto_Rho',acor_new);
                assignin('base','Signal1_Auto_Tau',tau);
                assignin('base','Signal1_Spectral_Sxx',pxx);
                assignin('base','Signal1_Spectral_Freq',f1);
                data = get(handles.data1SummaryTable,'Data');
                dataCol = cellstr(data(:,2));
                dataCol(6) = cellstr(num2str(Int2));
                data(:,2) = dataCol;
                set(handles.data1SummaryTable,'Data',data);
                
                
                if get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                        get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary1.Std.Mean.Signal1_sPoly_nChau_np = std_mean;
                elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                        get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary1.Std.Mean.Signal1_sDetr_nChau_np = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                        get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary1.Std.Mean.Signal1_sPoly_nHisto_np = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                        get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary1.Std.Mean.Signal1_sDetr_nHisto_np = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary1.Std.Mean.Signal1_nHisto_np = std_mean;
                elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary1.Std.Mean.Signal1_nChau_np = std_mean;
                elseif get(handles.stationaryPolySpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary1.Std.Mean.Signal1_sPoly_np = std_mean;
                elseif get(handles.stationaryDetrendSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary1.Std.Mean.Signal1_sDetr_np = std_mean;
                elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                    handles.Summary1.Std.Mean.Signal1_sPoly_nChau = std_mean;
                elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                    handles.Summary1.Std.Mean.Signal1_sDetr_nChau = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                    handles.Summary1.Std.Mean.Signal1_sPoly_nHisto = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                    handles.Summary1.Std.Mean.Signal1_sDetr_nHisto = std_mean;
                elseif get(handles.noiselessChauSpectralCheck,'Value')
                    handles.Summary1.Std.Mean.Signal1_nChau = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')
                    handles.Summary1.Std.Mean.Signal1_nHisto = std_mean;
                elseif get(handles.stationaryDetrendSpectralCheck,'Value')
                    handles.Summary1.Std.Mean.Signal1_sDetr = std_mean;
                elseif get(handles.stationaryPolySpectralCheck,'Value')
                    handles.Summary1.Std.Mean.Signal1_sPoly = std_mean;
                elseif get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary1.Std.Mean.Signal1_np = std_mean;
                else
                    handles.Summary1.Std.Mean.Signal1 = std_mean;
                end
            case 'Signal 2'
                handles.Summary2.IntegralTimeScale = Int2;
                handles.Summary2.AutocorrelationCoefficient.Rho = acor_new;
                handles.Summary2.AutocorrelationCoefficient.Tau = tau;
                handles.Summary2.SpectralDensity.Sxx = pxx;
                handles.Summary2.SpectralDensity.Freq = f1;
                assignin('base','Signal2_Auto_Rho',acor_new);
                assignin('base','Signal2_Auto_Tau',tau);
                assignin('base','Signal2_Spectral_Sxx',pxx);
                assignin('base','Signal2_Spectral_Freq',f1);
                data = get(handles.data2SummaryTable,'Data');
                dataCol = cellstr(data(:,2));
                dataCol(6) = cellstr(num2str(Int2));
                data(:,2) = dataCol;
                set(handles.data2SummaryTable,'Data',data);
                
                if get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                        get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary2.Std.Mean.Signal2_sPoly_nChau_np = std_mean;
                elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                        get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary2.Std.Mean.Signal2_sDetr_nChau_np = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                        get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary2.Std.Mean.Signal2_sPoly_nHisto_np = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                        get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary2.Std.Mean.Signal2_sDetr_nHisto_np = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary2.Std.Mean.Signal2_nHisto_np = std_mean;
                elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary2.Std.Mean.Signal2_nChau_np = std_mean;
                elseif get(handles.stationaryPolySpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary2.Std.Mean.Signal2_sPoly_np = std_mean;
                elseif get(handles.stationaryDetrendSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary2.Std.Mean.Signal2_sDetr_np = std_mean;
                elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                    handles.Summary2.Std.Mean.Signal2_sPoly_nChau = std_mean;
                elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                    handles.Summary2.Std.Mean.Signal2_sDetr_nChau = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                    handles.Summary2.Std.Mean.Signal2_sPoly_nHisto = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                    handles.Summary2.Std.Mean.Signal2_sDetr_nHisto = std_mean;
                elseif get(handles.noiselessChauSpectralCheck,'Value')
                    handles.Summary2.Std.Mean.Signal2_nChau = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')
                    handles.Summary2.Std.Mean.Signal2_nHisto = std_mean;
                elseif get(handles.stationaryDetrendSpectralCheck,'Value')
                    handles.Summary2.Std.Mean.Signal2_sDetr = std_mean;
                elseif get(handles.stationaryPolySpectralCheck,'Value')
                    handles.Summary2.Std.Mean.Signal2_sPoly = std_mean;
                elseif get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary2.Std.Mean.Signal2_np = std_mean;
                else
                    handles.Summary2.Std.Mean.Signal2 = std_mean;
                end
                
            case 'Signal 3'
                handles.Summary3.IntegralTimeScale = Int2;
                handles.Summary3.AutocorrelationCoefficient.Rho = acor_new;
                handles.Summary3.AutocorrelationCoefficient.Tau = tau;
                handles.Summary3.SpectralDensity.Sxx = pxx;
                handles.Summary3.SpectralDensity.Freq = f1;
                assignin('base','Signal3_Auto_Rho',acor_new);
                assignin('base','Signal3_Auto_Tau',tau);
                assignin('base','Signal3_Spectral_Sxx',pxx);
                assignin('base','Signal3_Spectral_Freq',f1);
                data = get(handles.data3SummaryTable,'Data');
                dataCol = cellstr(data(:,2));
                dataCol(6) = cellstr(num2str(Int2));
                data(:,2) = dataCol;
                set(handles.data3SummaryTable,'Data',data);
                
                if get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                        get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary3.Std.Mean.Signal3_sPoly_nChau_np = std_mean;
                elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                        get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary3.Std.Mean.Signal3_sDetr_nChau_np = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                        get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary3.Std.Mean.Signal3_sPoly_nHisto_np = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                        get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary3.Std.Mean.Signal3_sDetr_nHisto_np = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary3.Std.Mean.Signal3_nHisto_np = std_mean;
                elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary3.Std.Mean.Signal3_nChau_np = std_mean;
                elseif get(handles.stationaryPolySpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary3.Std.Mean.Signal3_sPoly_np = std_mean;
                elseif get(handles.stationaryDetrendSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary3.Std.Mean.Signal3_sDetr_np = std_mean;
                elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                    handles.Summary3.Std.Mean.Signal3_sPoly_nChau = std_mean;
                elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                    handles.Summary3.Std.Mean.Signal3_sDetr_nChau = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                    handles.Summary3.Std.Mean.Signal3_sPoly_nHisto = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                    handles.Summary3.Std.Mean.Signal3_sDetr_nHisto = std_mean;
                elseif get(handles.noiselessChauSpectralCheck,'Value')
                    handles.Summary3.Std.Mean.Signal3_nChau = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')
                    handles.Summary3.Std.Mean.Signal3_nHisto = std_mean;
                elseif get(handles.stationaryDetrendSpectralCheck,'Value')
                    handles.Summary3.Std.Mean.Signal3_sDetr = std_mean;
                elseif get(handles.stationaryPolySpectralCheck,'Value')
                    handles.Summary3.Std.Mean.Signal3_sPoly = std_mean;
                elseif get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary3.Std.Mean.Signal3_np = std_mean;
                else
                    handles.Summary3.Std.Mean.Signal3 = std_mean;
                end
                
            case 'Signal 4'
                handles.Summary4.IntegralTimeScale = Int2;
                handles.Summary4.AutocorrelationCoefficient.Rho = acor_new;
                handles.Summary4.AutocorrelationCoefficient.Tau = tau;
                handles.Summary4.SpectralDensity.Sxx = pxx;
                handles.Summary4.SpectralDensity.Freq = f1;
                assignin('base','Signal4_Auto_Rho',acor_new);
                assignin('base','Signal4_Auto_Tau',tau);
                assignin('base','Signal4_Spectral_Sxx',pxx);
                assignin('base','Signal4_Spectral_Freq',f1);
                data = get(handles.data4SummaryTable,'Data');
                dataCol = cellstr(data(:,2));
                dataCol(6) = cellstr(num2str(Int2));
                data(:,2) = dataCol;
                set(handles.data4SummaryTable,'Data',data);
                
                if get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                        get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary4.Std.Mean.Signal4_sPoly_nChau_np = std_mean;
                elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                        get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary4.Std.Mean.Signal4_sDetr_nChau_np = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                        get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary4.Std.Mean.Signal4_sPoly_nHisto_np = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                        get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary4.Std.Mean.Signal4_sDetr_nHisto_np = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary4.Std.Mean.Signal4_nHisto_np = std_mean;
                elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary4.Std.Mean.Signal4_nChau_np = std_mean;
                elseif get(handles.stationaryPolySpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary4.Std.Mean.Signal4_sPoly_np = std_mean;
                elseif get(handles.stationaryDetrendSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary4.Std.Mean.Signal4_sDetr_np = std_mean;
                elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                    handles.Summary4.Std.Mean.Signal4_sPoly_nChau = std_mean;
                elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                    handles.Summary4.Std.Mean.Signal4_sDetr_nChau = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                    handles.Summary4.Std.Mean.Signal4_sPoly_nHisto = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                    handles.Summary4.Std.Mean.Signal4_sDetr_nHisto = std_mean;
                elseif get(handles.noiselessChauSpectralCheck,'Value')
                    handles.Summary4.Std.Mean.Signal4_nChau = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')
                    handles.Summary4.Std.Mean.Signal4_nHisto = std_mean;
                elseif get(handles.stationaryDetrendSpectralCheck,'Value')
                    handles.Summary4.Std.Mean.Signal4_sDetr = std_mean;
                elseif get(handles.stationaryPolySpectralCheck,'Value')
                    handles.Summary4.Std.Mean.Signal4_sPoly = std_mean;
                elseif get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary4.Std.Mean.Signal4_np = std_mean;
                else
                    handles.Summary4.Std.Mean.Signal4 = std_mean;
                end
                
                
            case 'Signal 5'
                handles.Summary5.IntegralTimeScale = Int2;
                handles.Summary5.AutocorrelationCoefficient.Rho = acor_new;
                handles.Summary5.AutocorrelationCoefficient.Tau = tau;
                handles.Summary5.SpectralDensity.Sxx = pxx;
                handles.Summary5.SpectralDensity.Freq = f1;
                assignin('base','Signal5_Auto_Rho',acor_new);
                assignin('base','Signal5_Auto_Tau',tau);
                assignin('base','Signal5_Spectral_Sxx',pxx);
                assignin('base','Signal5_Spectral_Freq',f1);
                data = get(handles.data5SummaryTable,'Data');
                dataCol = cellstr(data(:,2));
                dataCol(6) = cellstr(num2str(Int2));
                data(:,2) = dataCol;
                set(handles.data5SummaryTable,'Data',data);
                
                if get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                        get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary5.Std.Mean.Signal5_sPoly_nChau_np = std_mean;
                elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                        get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary5.Std.Mean.Signal5_sDetr_nChau_np = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                        get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary5.Std.Mean.Signal5_sPoly_nHisto_np = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                        get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary5.Std.Mean.Signal5_sDetr_nHisto_np = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary5.Std.Mean.Signal5_nHisto_np = std_mean;
                elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary5.Std.Mean.Signal5_nChau_np = std_mean;
                elseif get(handles.stationaryPolySpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary5.Std.Mean.Signal5_sPoly_np = std_mean;
                elseif get(handles.stationaryDetrendSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary5.Std.Mean.Signal5_sDetr_np = std_mean;
                elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                    handles.Summary5.Std.Mean.Signal5_sPoly_nChau = std_mean;
                elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                    handles.Summary5.Std.Mean.Signal5_sDetr_nChau = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                    handles.Summary5.Std.Mean.Signal5_sPoly_nHisto = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                    handles.Summary5.Std.Mean.Signal5_sDetr_nHisto = std_mean;
                elseif get(handles.noiselessChauSpectralCheck,'Value')
                    handles.Summary5.Std.Mean.Signal5_nChau = std_mean;
                elseif get(handles.noiselessHistoSpectralCheck,'Value')
                    handles.Summary5.Std.Mean.Signal5_nHisto = std_mean;
                elseif get(handles.stationaryDetrendSpectralCheck,'Value')
                    handles.Summary5.Std.Mean.Signal5_sDetr = std_mean;
                elseif get(handles.stationaryPolySpectralCheck,'Value')
                    handles.Summary5.Std.Mean.Signal5_sPoly = std_mean;
                elseif get(handles.nonperiodicSpectralCheck,'Value')
                    handles.Summary5.Std.Mean.Signal5_np = std_mean;
                else
                    handles.Summary5.Std.Mean.Signal5 = std_mean;
                end
        end
    end
    
    % Runs when uncertainty menu is selected
elseif convert(get(handles.uncertaintyPlotPanel,'Visible'))
    
    name1 = get(handles.data1VariableInput,'String');
    expo1 = get(handles.n1Input,'String');
    if get(handles.yesSysUncertaintyButton,'Value')
        sys1 = get(handles.data1RelUncertaintyInput,'String');
        if isempty(sys1)
            errordlg('Relative systematic uncertainty value in signal 1 is missing','Computation failed');
            return;
        end
        sys1 = str2double(sys1);
    end
    if isempty(name1)||isempty(expo1)
        errordlg('One or more fields of signal 1 is missing','Computation failed');
        return;
    end
    expo1 = str2double(expo1);
    
    % Displaying equation
    set(handles.constantDisplay,'String',get(handles.CInput,'String'));
    set(handles.term1Display,'String',get(handles.data1VariableInput,'String'));
    set(handles.term1ExponentDisplay,'String',get(handles.n1Input,'String'));
    colorgen = @(color,text) ['<html><table border=0 width=400 bgcolor=',color,'><TR><TD>',text,'</TD></TR> </table></html>'];
    
    if convert(get(handles.data2UncertaintyGroup,'Visible'))
        name2 = get(handles.data2VariableInput,'String');
        expo2 = get(handles.n2Input,'String');
        if get(handles.yesSysUncertaintyButton,'Value')
            sys2 = get(handles.data2RelUncertaintyInput,'String');
            if isempty(sys2)
                errordlg('Relative systematic uncertainty value in signal 2 is missing','Computation failed');
                return;
            end
            sys2 = str2double(sys2);
        end
        if isempty(name2)||isempty(expo2)
            errordlg('One or more fields in signal 2 is missing','Computation failed');
            return;
        end
        expo2 = str2double(expo2);
        % Displayig Equation
        set(handles.term2Display,'String',get(handles.data2VariableInput,'String'));
        set(handles.term2ExponentDisplay,'String',get(handles.n2Input,'String'));
    end
    
    if convert(get(handles.data3UncertaintyGroup,'Visible'))
        name3 = get(handles.data3VariableInput,'String');
        expo3 = get(handles.n3Input,'String');
        if get(handles.yesSysUncertaintyButton,'Value')
            sys3 = get(handles.data3RelUncertaintyInput,'String');
            if isempty(sys3)
                errordlg('Relative systematic uncertainty value in signal 3 is missing','Computation failed');
                return;
            end
            sys3 = str2double(sys3);
        end
        if isempty(name3)||isempty(expo3)
            errordlg('One or more fields in signal 3 is missing','Computation failed');
            return;
        end
        expo3 = str2double(expo3);
        % Displayig Equation
        set(handles.term3Display,'String',get(handles.data3VariableInput,'String'));
        set(handles.term3ExponentDisplay,'String',get(handles.n3Input,'String'));
    end
    
    if convert(get(handles.data4UncertaintyGroup,'Visible'))
        name4 = get(handles.data4VariableInput,'String');
        expo4 = get(handles.n4Input,'String');
        if get(handles.yesSysUncertaintyButton,'Value')
            sys4 = get(handles.data4RelUncertaintyInput,'String');
            if isempty(sys4)
                errordlg('Relative systematic uncertainty value in signal 4 is missing','Computation failed');
                return;
            end
            sys4 = str2double(sys4);
        end
        if isempty(name4)||isempty(expo4)
            errordlg('One or more fields in signal 4 is missing','Computation failed');
            return;
        end
        expo4 = str2double(expo4);
        % Displaying equation
        set(handles.term4Display,'String',get(handles.data4VariableInput,'String'));
        set(handles.term4ExponentDisplay,'String',get(handles.n4Input,'String'));
    end
    
    if convert(get(handles.data5UncertaintyGroup,'Visible'))
        name5 = get(handles.data5VariableInput,'String');
        expo5 = get(handles.n5Input,'String');
        if get(handles.yesSysUncertaintyButton,'Value')
            sys5 = get(handles.data5RelUncertaintyInput,'String');
            if isempty(sys5)
                errordlg('Relative systematic uncertainty value in signal 5 is missing','Computation failed');
                return;
            end
            sys5 = str2double(sys5);
        end
        if isempty(name5)||isempty(expo5)
            errordlg('One or more fields in signal 5 is missing','Computation failed');
            return;
        end
        expo5 = str2double(expo5);
        % Displaying equation
        set(handles.term5Display,'String',get(handles.data5VariableInput,'String'));
        set(handles.term5ExponentDisplay,'String',get(handles.n5Input,'String'));
    end
    
    variable = get(handles.numberOfDataGroup,'SelectedObject');
    selection = get(variable,'String');
    switch selection
        case '1'
            % Computing systematic uncertainty
            if get(handles.yesSysUncertaintyButton,'Value')
                temp = (expo1^2)*(sys1^2);
                out = sqrt(temp);
                set(handles.systematicUncertaintyDisplay,'String',num2str(out));
            else
                set(handles.systematicUncertaintyDisplay,'String','NA');
                set(handles.systematicUncertaintyDisplay,'Enable','Off');
            end
            std_mean1 = getappdata(0,'temp_std_mean1');
        case '2'
            % Computing systematic uncertainty
            if get(handles.yesSysUncertaintyButton,'Value')
                temp = (expo1^2)*(sys1^2)+(expo2^2)*(sys2^2);
                out = sqrt(temp);
                set(handles.systematicUncertaintyDisplay,'String',num2str(out));
            else
                set(handles.systematicUncertaintyDisplay,'String','NA');
                set(handles.systematicUncertaintyDisplay,'Enable','Off');
            end
            std_mean1 = getappdata(0,'temp_std_mean1');
            std_mean2 = getappdata(0,'temp_std_mean2');
        case '3'
            % Computing systematic uncertainty
            if get(handles.yesSysUncertaintyButton,'Value')
                temp = (expo1^2)*(sys1^2)+(expo2^2)*(sys2^2)+(expo3^2)*(sys3^2);
                out = sqrt(temp);
                set(handles.systematicUncertaintyDisplay,'String',num2str(out));
            else
                set(handles.systematicUncertaintyDisplay,'String','NA');
                set(handles.systematicUncertaintyDisplay,'Enable','Off');
            end
            std_mean1 = getappdata(0,'temp_std_mean1');
            std_mean2 = getappdata(0,'temp_std_mean2');
            std_mean3 = getappdata(0,'temp_std_mean3');
        case '4'
            % Computing systematic uncertainty
            if get(handles.yesSysUncertaintyButton,'Value')
                temp = (expo1^2)*(sys1^2)+(expo2^2)*(sys2^2)+(expo3^2)*(sys3^2)+(expo4^2)*(sys4^2);
                out = sqrt(temp);
                set(handles.systematicUncertaintyDisplay,'String',num2str(out));
            else
                set(handles.systematicUncertaintyDisplay,'String','NA');
                set(handles.systematicUncertaintyDisplay,'Enable','Off');
            end
            std_mean1 = getappdata(0,'temp_std_mean1');
            std_mean2 = getappdata(0,'temp_std_mean2');
            std_mean3 = getappdata(0,'temp_std_mean3');
            std_mean4 = getappdata(0,'temp_std_mean4');
        case '5'
            % Computing systematic uncertainty
            if get(handles.yesSysUncertaintyButton,'Value')
                temp = (expo1^2)*(sys1^2)+(expo2^2)*(sys2^2)+(expo3^2)*(sys3^2)+(expo4^2)*(sys4^2)+(expo5^2)*(sys5^2);
                out = sqrt(temp);
                set(handles.systematicUncertaintyDisplay,'String',num2str(out));
            else
                set(handles.systematicUncertaintyDisplay,'String','NA');
                set(handles.systematicUncertaintyDisplay,'Enable','Off');
            end
            std_mean1 = getappdata(0,'temp_std_mean1');
            std_mean2 = getappdata(0,'temp_std_mean2');
            std_mean3 = getappdata(0,'temp_std_mean3');
            std_mean4 = getappdata(0,'temp_std_mean4');
            std_mean5 = getappdata(0,'temp_std_mean5');
    end
    
    filtered_u =  getappdata(0,'temp_u');
    t = getappdata(0,'temp_t');
    f1 = getappdata(0,'temp_f');
    
    res = filtered_u;
    mean_fi = mean(filtered_u);
    filtered_u = filtered_u - mean_fi;
    
    axes(handles.uncertaintyaxes1);
    cla reset;
    plot(t,filtered_u);
    title('Output Data','FontName','Times');
    xlabel('$$\hspace{30em}\normalfont\bf{t[s]}$$','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{Signal}','interpreter','latex');
    N = length(filtered_u);
    
    check = str2double(get(handles.autoUncertaintyInput,'String'));
    if isnan(check)
        errordlg('No. of blocks not provided','Input Missing');
        return;
    end
    
    % Finding nearest divisible
    if get(handles.autoOtherUncertaintyButton,'Value')
        N_block = str2double(get(handles.autoUncertaintyInput,'String'));
        if isnan(N_block)
            errordlg('No. of blocks not provided','Input Missing');
            return;
        end
        array = divisor(N);
        if length(array) == 2
            N_new = N - 1;
            array = divisor(N_new);
        else
            N_new = N;
        end
        L = floor(N_new/N_block);
        diff = abs(array - L);
        [~,pos] = min(diff);
        L_block = array(pos);
        if L_block == 1
            errordlg('Number of blocks cannot be more than half the length of the signal','Computation failed');
            return;
        end
        N_block = N_new/L_block;
        set(handles.autoUncertaintyInput,'String',num2str(N_block));
    else
        N_block = str2double(get(handles.autoUncertaintyInput,'String'));
        L_block = floor(N/N_block);
    end
    
    
    % Setting slider max, min and step value
    set(handles.uncertaintySlider, 'Min', 1);
    set(handles.uncertaintySlider, 'Max', L_block);
    set(handles.uncertaintySlider, 'Sliderstep', [1/(L_block-1), 1/(L_block-1)]);
    
    % Re-evaluating
    if length(filtered_u) ~= L_block*N_block
        filtered_u1 = filtered_u(1:end-1);
    else
        filtered_u1 = filtered_u;
    end
    x = reshape(filtered_u1,[L_block,N_block]);
    ts = 1/f1;
    xtemp=zeros(1,2*L_block);
    SxxAvg=zeros(1,2*L_block);
    for i = 1:N_block
        xtemp(1:L_block)= x(:,i);
        xtemp(L_block+1:2*L_block)=0;
        Xf = ts*fft(xtemp);
        Sxx=Xf.*conj(Xf)/(L_block*ts);
        SxxAvg=SxxAvg+Sxx;
    end
    SxxAvg=SxxAvg/N_block;
    
    % Now determine the autocorrelation by inverting autospectral density
    % and scaling the results
    Rxx = (1/ts)*ifft(SxxAvg);
    Rxx = Rxx(1:L_block);
    for i = 1:L_block-1
        Rxx(i)=Rxx(i)*L_block/(L_block-i);
    end
    Rxx(L_block)=0;
    acor_new = Rxx/var(filtered_u);
    lag = (1:L_block);
    acor_new = acor_new(1:L_block);
    
    setappdata(0,'set_acor_new',acor_new);
    setappdata(0,'set_lag',lag);
    id1 = find(acor_new < 0,1,'first'); %first zero-crossing
    % If no first zero crossing take the entire vector and then
    % evaluate area under the curve to get integral time scale
    flag = 0;
    if isempty(id1)
        id3 = L_block;
        flag = 1;
    else
        id2 = find(acor_new(id1:end) > 0,1,'first');%second zero-crossing
        % If no second zero crossing take the entire vector and then
        % evaluate area under the curve to get integral time scale
        if isempty(id2)
            id3 = L_block;
            flag = 1;
        else
            id2 = id1 + id2 - 1;
            id3 = find(acor_new(id2:end) < 0,1,'first');%third zero-crossing
            % If no third zero crossing take the entire vector and then
            % evaluate area under the curve to get integral time scale
            if isempty(id3)
                id3 = L_block;
                flag = 1;
            else
                id3 = id2 + id3 - 1;
            end
        end
    end
    
    if flag == 0
        if abs(acor_new(id3)) > abs(acor_new(id3-1))
            id3 = id3 -1;
        end
    else
        id3 = id3 - 1;
    end
    
    tau = lag/f1;
    axes(handles.uncertaintyaxes2);
    cla reset;
    plot(tau,acor_new);
    xlim([tau(1), tau(end)]);
    title('Autocorrelation coefficient','FontName','Times');
    hold on;
    grid on;
    % Drawing a vertical line from the axis to the time upto which
    % integral time scale needs to be evaluated
    h2 = line([tau(id3),tau(id3)],[0,acor_new(id3)]);
    set(h2,'Color','r')
    % Marker on the curve
    plot(tau(id3),acor_new(id3),'o','markersize',3);
    % Coloring the area under curve
    area(tau(1:id3),acor_new(1:id3),'Facecolor',[0 0.75 0.75]);
    xlabel('$$\hspace{25em}\normalfont\bf\tau{[s]}$$','interpreter','latex');
    set(handles.uncertaintySlider,'Value',(id3));
    Int2 = trapz(tau(1:id3),abs(acor_new(1:id3))); % Computing area using trapezoidal rule
    handles.UncertaintySummary.AutocorrelationCoefficient.Rho = acor_new;
    handles.UncertaintySummary.AutocorrelationCoefficient.Tau = tau;
    assignin('base','Result_Auto_Rho',acor_new);
    assignin('base','Result_Auto_Tau',tau);
    std_sample = std(res);
    T1 = length(u1)/f1;
    dt = 1/f1;
    if dt < 2*Int2
        Neff = round(T1/(2*Int2));
    else
        Neff = length(u1);
    end
    std_mean = std_sample/sqrt(Neff);
    total = sqrt(out^2 + (std_mean)^2); % Combined uncertainty
    set(handles.combinedUncertaintyDisplay,'String',num2str(total,'%.5s'));
    expan = 2*total; % Expanded uncertainty
    set(handles.expandedUncertaintyDisplay,'String',num2str(expan,'%.5s'));
    set(handles.meanOutput,'String',num2str(mean(res),'%.5s'));
    set(handles.uncertaintyOutput,'String',num2str(expan,'%.5s'));
    
    set(handles.timeScaleUncertaintyDisplay,'String',num2str(Int2));
    set(handles.uncertaintySlider,'Enable','On');
    freq1 = str2double(get(handles.sampling1Input,'String'));
    if isnan(freq1)
        errordlg('Sampling frequency not provided','Input Missing');
        return;
    end
    
    
    setappdata(0,'temp_T',T1); % For using in higher order uncertainty panel
    second = sqrt(4*Int2/T1); % Second order uncertainty or result considering normal distribution
    third = 0; % Third order uncertainty or result considering normal distribution
    fourth = sqrt(22*Int2/T1);% Fourth order uncertainty or result considering normal distribution
    set(handles.secondUncertaintyDisplay,'String',num2str(second));
    set(handles.thirdUncertaintyDisplay,'String',num2str(third));
    set(handles.fourthUncertaintyDisplay,'String',num2str(fourth));
    array1 = [handles.normalSecondRadio,handles.normalThirdRadio,handles.normalFourthRadio,handles.formulaSecondRadio,...
        handles.formulaThirdRadio,handles.formulaFourthRadio];
    set(array1,'Enable','On');
    set(handles.normalSecondRadio,'Value',1);
    set(handles.normalThirdRadio,'Value',1);
    set(handles.normalFourthRadio,'Value',1);
    handles.UncertaintySummary.TotalMeanUncert = total;
    handles.UncertaintySummary.ExpandedMeanUncert = expan;
    handles.UncertaintySummary.Std.SampleRecord = std_sample;
    handles.UncertaintySummary.Std.Mean = std_mean;
    handles.UncertaintySummary.Neff = Neff;
    handles.UncertaintySummary.SecondOrderUncert.NormDist = second;
    handles.UncertaintySummary.ThirdOrderUncert.NormDist = third;
    handles.UncertaintySummary.FourthOrderUncert.NormDist = fourth;
    handles.UncertaintySummary.TotalSystematicUncert = out;
    handles.UncertaintySummary.IntegralTimeScale = Int2;
    
    switch selection
        case '1'
            data = { colorgen('#F0F0F0','Signal 1'), num2str(std_mean1)
                colorgen('#F0F0F0','Result mean'), num2str(std_mean,'%.5s')
                };
            set(handles.randomUncertaintyTable,'Data',data);
        case '2'
            data = { colorgen('#F0F0F0','Signal 1'), num2str(std_mean1)
                colorgen('#F0F0F0','Signal 2'), num2str(std_mean2)
                colorgen('#F0F0F0','Result mean'), num2str(std_mean,'%.5s')
                };
            set(handles.randomUncertaintyTable,'Data',data);
        case '3'
            data = { colorgen('#F0F0F0','Signal 1'), num2str(std_mean1)
                colorgen('#F0F0F0','Signal 2'), num2str(std_mean2)
                colorgen('#F0F0F0','Signal 3'), num2str(std_mean3)
                colorgen('#F0F0F0','Result mean'), num2str(std_mean,'%.5s')
                };
            set(handles.randomUncertaintyTable,'Data',data);
        case '4'
            data = { colorgen('#F0F0F0','Signal 1'), num2str(std_mean1)
                colorgen('#F0F0F0','Signal 2'), num2str(std_mean2)
                colorgen('#F0F0F0','Signal 3'), num2str(std_mean3)
                colorgen('#F0F0F0','Signal 4'), num2str(std_mean4)
                colorgen('#F0F0F0','Result mean'), num2str(std_mean,'%.5s')
                };
            set(handles.randomUncertaintyTable,'Data',data);
        case '5'
            data = { colorgen('#F0F0F0','Signal 1'), num2str(std_mean1)
                colorgen('#F0F0F0','Signal 2'), num2str(std_mean2)
                colorgen('#F0F0F0','Signal 3'), num2str(std_mean3)
                colorgen('#F0F0F0','Signal 4'), num2str(std_mean4)
                colorgen('#F0F0F0','Signal 5'), num2str(std_mean5)
                colorgen('#F0F0F0','Result mean'), num2str(std_mean,'%.5s')
                };
            set(handles.randomUncertaintyTable,'Data',data);
    end
end
guidata(hObject,handles); % Updating guidata objects


% --- Executes on button press in originalDataStationaryCheck.
function originalDataStationaryCheck_Callback(~, ~, handles)
% hObject    handle to originalDataStationaryCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting the data, stationary data obtained by detrend command, fitted polynomial
% and stationary data obtained by polynomial subtraction which was stored
% during the run execution in Staionary Menu. These datas are used for plotting depending
% upon which checkbox is checked and which is not.

t = getappdata(0,'temp_t');
u = getappdata(0,'temp_u');
u_2 = getappdata(0,'temp_u_2');
if isempty(u) | isnan(u)
    errordlg('File either not uploaded or is empty','Plotting denied');
    set(handles.originalDataStationaryCheck,'Value',0);
    return;
end
axes(handles.stationaryaxes);
if get(handles.originalDataStationaryCheck,'Value')&&get(handles.stationaryDataStationaryCheck,'Value')&&...
        get(handles.stationaryDataPolyCheck,'Value')&&get(handles.polynomialStationaryCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,u,t,new_u,t,new_u_poly,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Original signal','Stationary with detrend','Stationary with Polynomial Fit','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')&&get(handles.stationaryDataStationaryCheck,'Value')&&...
        get(handles.stationaryDataPolyCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,u,t,new_u,t,new_u_poly);
    title('Selected signal','FontName','Times');
    legend('Original signal','Stationary with detrend','Stationary with Polynomial Fit');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')&&...
        get(handles.stationaryDataPolyCheck,'Value')&&get(handles.polynomialStationaryCheck,'Value')
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,u,t,new_u_poly,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Original signal','Stationary with Polynomial Fit','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.stationaryDataStationaryCheck,'Value')&&...
        get(handles.stationaryDataPolyCheck,'Value')&&get(handles.polynomialStationaryCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,new_u,t,new_u_poly,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Stationary with detrend','Stationary with Polynomial Fit','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')&&get(handles.stationaryDataStationaryCheck,'Value')&&...
        get(handles.polynomialStationaryCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    plot(t,u,t,new_u,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Original signal','Stationary with detrend','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')&&get(handles.stationaryDataStationaryCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    plot(t,u,t,new_u);
    title('Selected signal','FontName','Times');
    legend('Original signal','Stationary with detrend');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')&&get(handles.stationaryDataPolyCheck,'Value')
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,u,t,new_u_poly);
    title('Selected signal','FontName','Times');
    legend('Original signal','Stationary with Polynomial Fit');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')&&get(handles.polynomialStationaryCheck,'Value')
    plot(t,u,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Original signal','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.stationaryDataStationaryCheck,'Value')&&get(handles.stationaryDataPolyCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,new_u,t,new_u_poly);
    title('Selected signal','FontName','Times');
    legend('Stationary with detrend','Stationary with Polynomial Fit');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.stationaryDataStationaryCheck,'Value')&&get(handles.polynomialStationaryCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    plot(t,new_u,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Stationary with detrend','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.stationaryDataPolyCheck,'Value')&&get(handles.polynomialStationaryCheck,'Value')
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,new_u_poly,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Stationary with Polynomial Fit','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')
    plot(t,u);
    legend('Original signal');
    title('Selected signal','FontName','Times');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.stationaryDataStationaryCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    plot(t,new_u);
    title('Selected signal','FontName','Times');
    legend('Stationary with detrend');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.stationaryDataPolyCheck,'Value')
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,new_u_poly);
    title('Selected signal','FontName','Times');
    legend('Stationary with Polynomial Fit');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.polynomialStationaryCheck,'Value')
    plot(t,u_2);
    title('Selected signal','FontName','Times');
    legend('Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
else
    cla reset; % If none is selected clearing the axes
end

% Hint: get(hObject,'Value') returns toggle state of originalDataStationaryCheck


% --- Executes on button press in polynomialStationaryCheck.
function polynomialStationaryCheck_Callback(~, ~, handles)
% hObject    handle to polynomialStationaryCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting the data, stationary data obtained by detrend command, fitted polynomial
% and stationary data obtained by polynomial subtraction which was stored
% during the run execution in Staionary Menu. These datas are used for plotting depending
% upon which checkbox is checked and which is not.

t = getappdata(0,'temp_t');
u = getappdata(0,'temp_u');
u_2 = getappdata(0,'temp_u_2');
if isempty(u) | isnan(u)
    errordlg('File either not uploaded or is empty','Plotting denied');
    set(handles.originalDataStationaryCheck,'Value',0);
    return;
end
axes(handles.stationaryaxes);
if get(handles.originalDataStationaryCheck,'Value')&&get(handles.stationaryDataStationaryCheck,'Value')&&...
        get(handles.stationaryDataPolyCheck,'Value')&&get(handles.polynomialStationaryCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,u,t,new_u,t,new_u_poly,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Original signal','Stationary with detrend','Stationary with Polynomial Fit','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')&&get(handles.stationaryDataStationaryCheck,'Value')&&...
        get(handles.stationaryDataPolyCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,u,t,new_u,t,new_u_poly);
    title('Selected signal','FontName','Times');
    legend('Original signal','Stationary with detrend','Stationary with Polynomial Fit');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')&&...
        get(handles.stationaryDataPolyCheck,'Value')&&get(handles.polynomialStationaryCheck,'Value')
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,u,t,new_u_poly,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Original signal','Stationary with Polynomial Fit','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.stationaryDataStationaryCheck,'Value')&&...
        get(handles.stationaryDataPolyCheck,'Value')&&get(handles.polynomialStationaryCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,new_u,t,new_u_poly,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Stationary with detrend','Stationary with Polynomial Fit','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')&&get(handles.stationaryDataStationaryCheck,'Value')&&...
        get(handles.polynomialStationaryCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    plot(t,u,t,new_u,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Original signal','Stationary with detrend','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')&&get(handles.stationaryDataStationaryCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    plot(t,u,t,new_u);
    title('Selected signal','FontName','Times');
    legend('Original signal','Stationary with detrend');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')&&get(handles.stationaryDataPolyCheck,'Value')
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,u,t,new_u_poly);
    title('Selected signal','FontName','Times');
    legend('Original signal','Stationary with Polynomial Fit');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')&&get(handles.polynomialStationaryCheck,'Value')
    plot(t,u,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Original signal','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.stationaryDataStationaryCheck,'Value')&&get(handles.stationaryDataPolyCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,new_u,t,new_u_poly);
    title('Selected signal','FontName','Times');
    legend('Stationary with detrend','Stationary with Polynomial Fit');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.stationaryDataStationaryCheck,'Value')&&get(handles.polynomialStationaryCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    plot(t,new_u,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Stationary with detrend','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.stationaryDataPolyCheck,'Value')&&get(handles.polynomialStationaryCheck,'Value')
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,new_u_poly,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Stationary with Polynomial Fit','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')
    plot(t,u);
    legend('Original signal');
    title('Selected signal','FontName','Times');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.stationaryDataStationaryCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    plot(t,new_u);
    title('Selected signal','FontName','Times');
    legend('Stationary with detrend');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.stationaryDataPolyCheck,'Value')
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,new_u_poly);
    title('Selected signal','FontName','Times');
    legend('Stationary with Polynomial Fit');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.polynomialStationaryCheck,'Value')
    plot(t,u_2);
    title('Selected signal','FontName','Times');
    legend('Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
else
    cla reset; % If none is checked, axes is cleared
end
% Hint: get(hObject,'Value') returns toggle state of polynomialStationaryCheck

% --- Executes on button press in stationaryDataPolynomialCheck.
function stationaryDataPolyCheck_Callback(~, ~, handles)
% hObject    handle to stationaryDataPolynomialCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting the data, stationary data obtained by detrend command, fitted polynomial
% and stationary data obtained by polynomial subtraction which was stored
% during the run execution in Staionary Menu. These datas are used for plotting depending
% upon which checkbox is checked and which is not.

t = getappdata(0,'temp_t');
u = getappdata(0,'temp_u');
u_2 = getappdata(0,'temp_u_2');
if isempty(u) | isnan(u)
    errordlg('File either not uploaded or is empty','Plotting denied');
    set(handles.originalDataStationaryCheck,'Value',0);
    return;
end
axes(handles.stationaryaxes);
if get(handles.originalDataStationaryCheck,'Value')&&get(handles.stationaryDataStationaryCheck,'Value')&&...
        get(handles.stationaryDataPolyCheck,'Value')&&get(handles.polynomialStationaryCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,u,t,new_u,t,new_u_poly,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Original signal','Stationary with detrend','Stationary with Polynomial Fit','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')&&get(handles.stationaryDataStationaryCheck,'Value')&&...
        get(handles.stationaryDataPolyCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,u,t,new_u,t,new_u_poly);
    title('Selected signal','FontName','Times');
    legend('Original signal','Stationary with detrend','Stationary with Polynomial Fit');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')&&...
        get(handles.stationaryDataPolyCheck,'Value')&&get(handles.polynomialStationaryCheck,'Value')
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,u,t,new_u_poly,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Original signal','Stationary with Polynomial Fit','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.stationaryDataStationaryCheck,'Value')&&...
        get(handles.stationaryDataPolyCheck,'Value')&&get(handles.polynomialStationaryCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,new_u,t,new_u_poly,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Stationary with detrend','Stationary with Polynomial Fit','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')&&get(handles.stationaryDataStationaryCheck,'Value')&&...
        get(handles.polynomialStationaryCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    plot(t,u,t,new_u,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Original signal','Stationary with detrend','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')&&get(handles.stationaryDataStationaryCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    plot(t,u,t,new_u);
    title('Selected signal','FontName','Times');
    legend('Original signal','Stationary with detrend');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')&&get(handles.stationaryDataPolyCheck,'Value')
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,u,t,new_u_poly);
    title('Selected signal','FontName','Times');
    legend('Original signal','Stationary with Polynomial Fit');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')&&get(handles.polynomialStationaryCheck,'Value')
    plot(t,u,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Original signal','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.stationaryDataStationaryCheck,'Value')&&get(handles.stationaryDataPolyCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,new_u,t,new_u_poly);
    title('Selected signal','FontName','Times');
    legend('Stationary with detrend','Stationary with Polynomial Fit');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.stationaryDataStationaryCheck,'Value')&&get(handles.polynomialStationaryCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    plot(t,new_u,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Stationary with detrend','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.stationaryDataPolyCheck,'Value')&&get(handles.polynomialStationaryCheck,'Value')
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,new_u_poly,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Stationary with Polynomial Fit','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')
    plot(t,u);
    title('Selected signal','FontName','Times');
    legend('Original signal');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.stationaryDataStationaryCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    plot(t,new_u);
    title('Selected signal','FontName','Times');
    legend('Stationary with detrend');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.stationaryDataPolyCheck,'Value')
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,new_u_poly);
    title('Selected signal','FontName','Times');
    legend('Stationary with Polynomial Fit');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.polynomialStationaryCheck,'Value')
    plot(t,u_2);
    title('Selected signal','FontName','Times');
    legend('Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
else
    cla reset; % If none is selected, axes is cleared
end
% Hint: get(hObject,'Value') returns toggle state of stationaryDataPolynomialCheck

% --- Executes on button press in stationaryDataStationaryCheck.
function stationaryDataStationaryCheck_Callback(~, ~, handles)
% hObject    handle to stationaryDataStationaryCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting the data, stationary data obtained by detrend command, fitted polynomial
% and stationary data obtained by polynomial subtraction which was stored
% during the run execution in Staionary Menu. These datas are used for plotting depending
% upon which checkbox is checked and which is not.

t = getappdata(0,'temp_t');
u = getappdata(0,'temp_u');
u_2 = getappdata(0,'temp_u_2');
if isempty(u) | isnan(u)
    errordlg('File either not uploaded or is empty','Plotting denied');
    set(handles.originalDataStationaryCheck,'Value',0);
    return;
end
axes(handles.stationaryaxes);
if get(handles.originalDataStationaryCheck,'Value')&&get(handles.stationaryDataStationaryCheck,'Value')&&...
        get(handles.stationaryDataPolyCheck,'Value')&&get(handles.polynomialStationaryCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,u,t,new_u,t,new_u_poly,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Original signal','Stationary with detrend','Stationary with Polynomial Fit','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')&&get(handles.stationaryDataStationaryCheck,'Value')&&...
        get(handles.stationaryDataPolyCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,u,t,new_u,t,new_u_poly);
    title('Selected signal','FontName','Times');
    legend('Original signal','Stationary with detrend','Stationary with Polynomial Fit');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')&&...
        get(handles.stationaryDataPolyCheck,'Value')&&get(handles.polynomialStationaryCheck,'Value')
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,u,t,new_u_poly,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Original signal','Stationary with Polynomial Fit','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.stationaryDataStationaryCheck,'Value')&&...
        get(handles.stationaryDataPolyCheck,'Value')&&get(handles.polynomialStationaryCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,new_u,t,new_u_poly,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Stationary with detrend','Stationary with Polynomial Fit','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')&&get(handles.stationaryDataStationaryCheck,'Value')&&...
        get(handles.polynomialStationaryCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    plot(t,u,t,new_u,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Original signal','Stationary with detrend','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')&&get(handles.stationaryDataStationaryCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    plot(t,u,t,new_u);
    title('Selected signal','FontName','Times');
    legend('Original signal','Stationary with detrend');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')&&get(handles.stationaryDataPolyCheck,'Value')
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,u,t,new_u_poly);
    title('Selected signal','FontName','Times');
    legend('Original signal','Stationary with Polynomial Fit');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')&&get(handles.polynomialStationaryCheck,'Value')
    plot(t,u,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Original signal','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.stationaryDataStationaryCheck,'Value')&&get(handles.stationaryDataPolyCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,new_u,t,new_u_poly);
    title('Selected signal','FontName','Times');
    legend('Stationary with detrend','Stationary with Polynomial Fit');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.stationaryDataStationaryCheck,'Value')&&get(handles.polynomialStationaryCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    plot(t,new_u,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Stationary with detrend','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.stationaryDataPolyCheck,'Value')&&get(handles.polynomialStationaryCheck,'Value')
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,new_u_poly,t,u_2);
    title('Selected signal','FontName','Times');
    legend('Stationary with Polynomial Fit','Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.originalDataStationaryCheck,'Value')
    plot(t,u);
    title('Selected signal','FontName','Times');
    legend('Original signal');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.stationaryDataStationaryCheck,'Value')
    new_u = getappdata(0,'temp_new_u');
    plot(t,new_u);
    title('Selected signal','FontName','Times');
    legend('Stationary with detrend');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.stationaryDataPolyCheck,'Value')
    new_u_poly = getappdata(0,'temp_new_u_poly');
    plot(t,new_u_poly);
    title('Selected signal','FontName','Times');
    legend('Stationary with Polynomial Fit');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.polynomialStationaryCheck,'Value')
    plot(t,u_2);
    title('Selected signal','FontName','Times');
    legend('Fitted Polynomial');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
else
    cla reset; % If none is checked, axes is cleared
end
% Hint: get(hObject,'Value') returns toggle state of stationaryDataStationaryCheck


% --- Executes during object creation, after setting all properties.
function data1SummaryTable_CreateFcn(hObject, ~, ~)
% hObject    handle to data1SummaryTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'ColumnWidth',{163,155});



function stationarySubsizeInput_Callback(~, ~, ~)
% hObject    handle to stationarySubsizeInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of stationarySubsizeInput as text
%        str2double(get(hObject,'String')) returns contents of stationarySubsizeInput as a double


% --- Executes when selected object is changed in selectSubsizeGroup.
function selectSubsizeGroup_SelectionChangedFcn(~, ~, handles)
% hObject    handle to the selected object in selectSubsizeGroup
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% This function checks whether which radio button is selected and performs
% related operations

var = get(handles.selectSubsizeGroup,'SelectedObject');
selection = get(var,'String');
switch selection
    case 'Default'
        set(handles.stationarySubsizeInput,'string','100');
        set(handles.stationarySubsizeInput,'Enable','Off')
        array = [handles.noStationarityRadio,handles.yesStationarityRadio];
        set(array,'Enable','Off');
        set(handles.yesStationarityRadio,'Value',0);
        set(handles.noStationarityRadio,'Value',1);
        set(handles.wantStationarityPopup,'Value',1);
        set(handles.wantStationarityPopup,'Enable','Off');
    case 'Other value'
        set(handles.stationarySubsizeInput,'Enable','On')
        array = [handles.noStationarityRadio,handles.yesStationarityRadio];
        set(array,'Enable','Off');
        set(handles.yesStationarityRadio,'Value',0);
        set(handles.noStationarityRadio,'Value',1);
        set(handles.wantStationarityPopup,'Value',1);
        set(handles.wantStationarityPopup,'Enable','Off');
end


% --- Executes when selected object is changed in wantStationarityGroup.
function wantStationarityGroup_SelectionChangedFcn(~, ~, handles)
% hObject    handle to the selected object in wantStationarityGroup
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% This function will be enabled if the data is non-stationary and user may
% select if he wants to make data stationary or not

var = get(handles.wantStationarityGroup,'SelectedObject');
selection = get(var,'String');
switch selection
    case 'Yes'
        set(handles.wantStationarityPopup,'Enable','On')
        set(handles.wantStationarityPopup,'String',{'Select';'Polynomial Fit';'Inbuilt Detrend'});
    case 'No'
        array = [handles.stationaryDataStationaryCheck,...
            handles.polynomialStationaryCheck,handles.stationaryDataPolyCheck];
        set(handles.originalDataStationaryCheck,'Enable','On');
        set(array,'Enable','Off');
        set(array,'Value',0);
        set(handles.statisticsPanel,'Visible','On')
        u = getappdata(0,'temp_u');
        t = getappdata(0,'temp_t');
        plot(t,u);
        title('Selected signal','FontName','Times');
        xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
        ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
        set(handles.originalDataStationaryCheck,'Value',1);
        set(handles.wantStationarityPopup,'Value',1);
        set(handles.wantStationarityPopup,'Enable','Off');
end

% --- Executes during object creation, after setting all properties.
function stationarySubsizeInput_CreateFcn(hObject, ~, ~)
% hObject    handle to stationarySubsizeInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function statisticsTable_CreateFcn(hObject, ~, ~)
% hObject    handle to statisticsTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'ColumnWidth',{152 97}); % Setting the column width of the statistics table


% --- Executes on button press in defaultStationaryRadio.
function defaultStationaryRadio_Callback(~, ~, ~)
% hObject    handle to defaultStationaryRadio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of defaultStationaryRadio


% --- Executes on button press in otherStationaryRadio.
function otherStationaryRadio_Callback(~, ~, ~)
% hObject    handle to otherStationaryRadio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of otherStationaryRadio


% --- Executes on button press in checkbox16.
function checkbox16_Callback(~, ~, ~)
% hObject    handle to checkbox16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox16


% --- Executes when user attempts to close SCOUT.
function SCOUT_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to SCOUT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% if (isfield(handles,'closeFigure') && handles.closeFigure)
%       delete(hObject);
% end
% Hint: delete(hObject) closes the figure
% All data stored in temporary variable will be removed once the guide is
% closed
if ~isnan(getappdata(0,'SharedName'))
    rmappdata(0,'SharedName')
end
if ~isnan(getappdata(0,'set_u1'))
    rmappdata(0,'set_u1')
end
if ~isnan(getappdata(0,'set_t1'))
    rmappdata(0,'set_t1')
end
if ~isnan(getappdata(0,'set_u2'))
    rmappdata(0,'set_u2')
end
if ~isnan(getappdata(0,'set_t2'))
    rmappdata(0,'set_t2')
end
if ~isnan(getappdata(0,'set_u3'))
    rmappdata(0,'set_u3')
end
if ~isnan(getappdata(0,'set_t3'))
    rmappdata(0,'set_t3')
end
if ~isnan(getappdata(0,'set_u4'))
    rmappdata(0,'set_u4')
end
if ~isnan(getappdata(0,'set_t4'))
    rmappdata(0,'set_t4')
end
if ~isnan(getappdata(0,'set_u5'))
    rmappdata(0,'set_u5')
end
if ~isnan(getappdata(0,'set_t5'))
    rmappdata(0,'set_t5')
end
if ~isnan(getappdata(0,'temp_T'))
    rmappdata(0,'temp_T')
end
if ~isnan(getappdata(0,'temp_t'))
    rmappdata(0,'temp_t')
end
if ~isnan(getappdata(0,'temp_f'))
    rmappdata(0,'temp_f')
end
if ~isnan(getappdata(0,'temp_u'))
    rmappdata(0,'temp_u')
end
if ~isnan(getappdata(0,'temp_u_2'))
    rmappdata(0,'temp_u_2')
end
if ~isnan(getappdata(0,'temp_new_u'))
    rmappdata(0,'temp_new_u')
end
if ~isnan(getappdata(0,'temp_new_u_poly'))
    rmappdata(0,'temp_new_u_poly')
end
if ~isnan(getappdata(0,'set_dev'))
    rmappdata(0,'set_dev')
end
if ~isnan(getappdata(0,'set_pos'))
    rmappdata(0,'set_pos')
end
if ~isnan(getappdata(0,'set_vec'))
    rmappdata(0,'set_vec')
end
if ~isnan(getappdata(0,'set_final'))
    rmappdata(0,'set_final')
end
if ~isnan(getappdata(0,'temp_high'))
    rmappdata(0,'temp_high')
end
if ~isnan(getappdata(0,'temp_low'))
    rmappdata(0,'temp_low')
end
if ~isnan(getappdata(0,'temp_order'))
    rmappdata(0,'temp_order')
end
if ~isnan(getappdata(0,'temp_hdb'))
    rmappdata(0,'temp_hdb')
end
if ~isnan(getappdata(0,'set_filter'))
    rmappdata(0,'set_filter')
end
if ~isnan(getappdata(0,'set_p1'))
    rmappdata(0,'set_p1')
end
if ~isnan(getappdata(0,'set_p2'))
    rmappdata(0,'set_p2')
end
if ~isnan(getappdata(0,'set_f1'))
    rmappdata(0,'set_f1')
end
if ~isnan(getappdata(0,'set_f2'))
    rmappdata(0,'set_f2')
end
if ~isnan(getappdata(0,'norm_t1'))
    rmappdata(0,'norm_t1')
end
if ~isnan(getappdata(0,'norm_t2'))
    rmappdata(0,'norm_t2')
end
if ~isnan(getappdata(0,'norm_t3'))
    rmappdata(0,'norm_t3')
end
if ~isnan(getappdata(0,'norm_t4'))
    rmappdata(0,'norm_t4')
end
if ~isnan(getappdata(0,'norm_t5'))
    rmappdata(0,'norm_t5')
end
delete(hObject);


% Function for converting visibility of a handle to 1 and 0
function out = convert(val)
if strcmp(val,'off')
    out = 0;
else if strcmp(val,'on')
        out = 1;
    else
        errdlg('Error in conversion','Error');
    end
end



% --- Executes on selection change in wantStationarityPopup.
function wantStationarityPopup_Callback(~, ~, ~)
% hObject    handle to wantStationarityPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns wantStationarityPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from wantStationarityPopup


% --- Executes during object creation, after setting all properties.
function wantStationarityPopup_CreateFcn(hObject, ~, ~)
% hObject    handle to wantStationarityPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in numberOfDataGroup.
function numberOfDataGroup_SelectionChangedFcn(hObject, ~, handles)
% hObject    handle to the selected object in numberOfDataGroup
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% This function checks the number of data group selected and enables required
% object and make required objects visible

variable = get(handles.numberOfDataGroup,'SelectedObject');
selection = get(variable,'String');
switch selection
    case '1'
        array1 = [handles.data1Panel,handles.data1PlotButton,handles.data1UncertaintyGroup];
        set(array1,'Visible','On');
        array2 = [handles.data2Panel,handles.data3Panel,handles.data4Panel,handles.data5Panel,...
            handles.data2PlotButton,handles.data3PlotButton,handles.data4PlotButton,handles.data5PlotButton,...
            handles.data2UncertaintyGroup,handles.data3UncertaintyGroup,handles.data4UncertaintyGroup,...
            handles.data5UncertaintyGroup,handles.data2Equation,handles.data3Equation,handles.data4Equation,...
            handles.data5Equation,handles.n2Equation,handles.n3Equation,handles.n4Equation,handles.n5Equation,...
            handles.n2Text,handles.n3Text,handles.n4Text,handles.n5Text,handles.n2Input,handles.n3Input,...
            handles.n4Input,handles.n5Input,handles.uData2,handles.uData3,handles.uData4,handles.uData5,...
            handles.xData2,handles.xData3,handles.xData4,handles.xData5,handles.dashData2,handles.dashData3,...
            handles.dashData4,handles.dashData5,handles.equalData2,handles.equalData3,handles.equalData4,...
            handles.equalData5,handles.data2RelUncertaintyInput,handles.data3RelUncertaintyInput,...
            handles.data4RelUncertaintyInput,handles.data5RelUncertaintyInput];
        set(array2,'Visible','Off');
        % Sets the Popup for all Analysis menu options
        set(handles.selectDataStationaryPopup,'String',{'Signal 1'});
        set(handles.originalDataPopup,'String',{'Signal 1'});
        set(handles.originalDataNormPopup,'String',{'Signal 1'});
        set(handles.originalDataPeriodicPopup,'String',{'Signal 1'});
        set(handles.originalDataSpectralPopup,'String',{'Signal 1'});
        
    case '2'
        array1 = [handles.data1Panel,handles.data2Panel,handles.data1PlotButton,handles.data2PlotButton,...
            handles.data1UncertaintyGroup,handles.data2UncertaintyGroup,handles.data2Equation,handles.n2Equation,...
            handles.n2Text,handles.n2Input,handles.uData2,handles.xData2,handles.dashData2,handles.equalData2,...
            handles.data2RelUncertaintyInput,];
        set(array1,'Visible','On');
        array2 = [handles.data3Panel,handles.data4Panel,handles.data5Panel,handles.data3PlotButton,...
            handles.data4PlotButton,handles.data5PlotButton,handles.data3UncertaintyGroup,handles.data4UncertaintyGroup,...
            handles.data5UncertaintyGroup,handles.data3Equation,handles.data4Equation,...
            handles.data5Equation,handles.n3Equation,handles.n4Equation,handles.n5Equation,...
            handles.n3Text,handles.n4Text,handles.n5Text,handles.n3Input,...
            handles.n4Input,handles.n5Input,handles.uData3,handles.uData4,handles.uData5,...
            handles.xData3,handles.xData4,handles.xData5,handles.dashData3,...
            handles.dashData4,handles.dashData5,handles.equalData3,handles.equalData4,...
            handles.equalData5,handles.data3RelUncertaintyInput,...
            handles.data4RelUncertaintyInput,handles.data5RelUncertaintyInput];
        set(array2,'Visible','Off');
        % Sets the Popup for all Analysis menu options
        set(handles.selectDataStationaryPopup,'String',{'Signal 1';'Signal 2'});
        set(handles.originalDataPopup,'String',{'Signal 1';'Signal 2'});
        set(handles.originalDataNormPopup,'String',{'Signal 1';'Signal 2'});
        set(handles.originalDataPeriodicPopup,'String',{'Signal 1';'Signal 2'});
        set(handles.originalDataSpectralPopup,'String',{'Signal 1';'Signal 2'});
        % Creates summary2 struct
        Summary2 = SummaryFunc(2);
        handles.Summary2 = Summary2;
    case '3'
        array1 = [handles.data1Panel,handles.data2Panel,handles.data3Panel,handles.data1PlotButton,...
            handles.data2PlotButton,handles.data3PlotButton,handles.data1UncertaintyGroup,handles.data2UncertaintyGroup,...
            handles.data3UncertaintyGroup,handles.data2Equation,handles.data3Equation,handles.n2Equation,...
            handles.n3Equation,handles.n2Text,handles.n3Text,handles.n2Input,handles.n3Input,handles.uData2,...
            handles.uData3,handles.dashData2,handles.dashData3,handles.equalData2,handles.equalData3,...
            handles.data2RelUncertaintyInput,handles.data3RelUncertaintyInput,handles.xData2,handles.xData3];
        set(array1,'Visible','On');
        array2 = [handles.data4Panel,handles.data5Panel,handles.data4PlotButton,handles.data5PlotButton,...
            handles.data4UncertaintyGroup,handles.data5UncertaintyGroup,handles.data4Equation,handles.data5Equation,...
            handles.n4Equation,handles.n5Equation,handles.n4Text,handles.n5Text,handles.n4Input,handles.n5Input,...
            handles.uData4,handles.uData5,handles.xData4,handles.xData5,handles.dashData4,handles.dashData5,...
            handles.equalData4,handles.equalData5,handles.data4RelUncertaintyInput,handles.data5RelUncertaintyInput];
        set(array2,'Visible','Off');
        % Sets the Popup for all Analysis menu options
        set(handles.selectDataStationaryPopup,'String',{'Signal 1';'Signal 2';'Signal 3'});
        set(handles.originalDataPopup,'String',{'Signal 1';'Signal 2';'Signal 3'});
        set(handles.originalDataNormPopup,'String',{'Signal 1';'Signal 2';'Signal 3'});
        set(handles.originalDataPeriodicPopup,'String',{'Signal 1';'Signal 2';'Signal 3'});
        set(handles.originalDataSpectralPopup,'String',{'Signal 1';'Signal 2';'Signal 3'});
        % Creating summary2 and 3 struct
        Summary2 = SummaryFunc(2);
        Summary3 = SummaryFunc(3);
        handles.Summary2 = Summary2;
        handles.Summary3 = Summary3;
    case '4'
        array1 = [handles.data5Panel,handles.data5PlotButton,handles.data5UncertaintyGroup,handles.data5RelUncertaintyInput,...
            handles.data5Equation,handles.n5Equation,handles.n5Text,handles.n5Input,handles.uData5,handles.xData5,...
            handles.dashData5,handles.equalData5];
        set(array1,'Visible','Off');
        array2 = [handles.data2Panel,handles.data3Panel,handles.data4Panel,handles.data1Panel,...
            handles.data3PlotButton,handles.data4PlotButton,handles.data1PlotButton,handles.data2PlotButton,...
            handles.data1UncertaintyGroup,handles.data2UncertaintyGroup,handles.data3UncertaintyGroup,...
            handles.data4UncertaintyGroup,handles.data2Equation,handles.data3Equation,handles.data4Equation,...
            handles.n2Equation,handles.n3Equation,handles.n4Equation,...
            handles.n2Text,handles.n3Text,handles.n4Text,handles.n2Input,handles.n3Input,...
            handles.n4Input,handles.uData2,handles.uData3,handles.uData4,...
            handles.xData2,handles.xData3,handles.xData4,handles.dashData2,handles.dashData3,...
            handles.dashData4,handles.equalData2,handles.equalData3,handles.equalData4,...
            handles.data2RelUncertaintyInput,handles.data3RelUncertaintyInput,...
            handles.data4RelUncertaintyInput];
        set(array2,'Visible','On');
        % Sets the Popup for all Analysis menu options
        set(handles.selectDataStationaryPopup,'String',{'Signal 1';'Signal 2';'Signal 3';'Signal 4'});
        set(handles.originalDataPopup,'String',{'Signal 1';'Signal 2';'Signal 3';'Signal 4'});
        set(handles.originalDataNormPopup,'String',{'Signal 1';'Signal 2';'Signal 3';'Signal 4'});
        set(handles.originalDataPeriodicPopup,'String',{'Signal 1';'Signal 2';'Signal 3';'Signal 4'});
        set(handles.originalDataSpectralPopup,'String',{'Signal 1';'Signal 2';'Signal 3';'Signal 4'});
        % Creating summary 2,3 and 4 struct
        Summary2 = SummaryFunc(2);
        Summary3 = SummaryFunc(3);
        Summary4 = SummaryFunc(4);
        handles.Summary2 = Summary2;
        handles.Summary3 = Summary3;
        handles.Summary4 = Summary4;
    case '5'
        array2 = [handles.data1Panel,handles.data2Panel,handles.data3Panel,handles.data4Panel,handles.data5Panel,...
            handles.data1PlotButton,handles.data2PlotButton,handles.data3PlotButton,handles.data4PlotButton,...
            handles.data5PlotButton,handles.data1UncertaintyGroup,handles.data2UncertaintyGroup,...
            handles.data3UncertaintyGroup,handles.data4UncertaintyGroup,handles.data5UncertaintyGroup,...
            handles.data2Equation,handles.data3Equation,handles.data4Equation,...
            handles.data5Equation,handles.n2Equation,handles.n3Equation,handles.n4Equation,handles.n5Equation,...
            handles.n2Text,handles.n3Text,handles.n4Text,handles.n5Text,handles.n2Input,handles.n3Input,...
            handles.n4Input,handles.n5Input,handles.uData2,handles.uData3,handles.uData4,handles.uData5,...
            handles.xData2,handles.xData3,handles.xData4,handles.xData5,handles.dashData2,handles.dashData3,...
            handles.dashData4,handles.dashData5,handles.equalData2,handles.equalData3,handles.equalData4,...
            handles.equalData5,handles.data2RelUncertaintyInput,handles.data3RelUncertaintyInput,...
            handles.data4RelUncertaintyInput,handles.data5RelUncertaintyInput];
        set(array2,'Visible','On');
        % Sets the Popup for all Analysis menu options
        set(handles.selectDataStationaryPopup,'String',{'Signal 1';'Signal 2';'Signal 3';'Signal 4';'Signal 5'});
        set(handles.originalDataPopup,'String',{'Signal 1';'Signal 2';'Signal 3';'Signal 4';'Signal 5'});
        set(handles.originalDataNormPopup,'String',{'Signal 1';'Signal 2';'Signal 3';'Signal 4';'Signal 5'});
        set(handles.originalDataPeriodicPopup,'String',{'Signal 1';'Signal 2';'Signal 3';'Signal 4';'Signal 5'});
        set(handles.originalDataSpectralPopup,'String',{'Signal 1';'Signal 2';'Signal 3';'Signal 4';'Signal 5'});
        % Creating Summary5 struct
        Summary2 = SummaryFunc(2);
        Summary3 = SummaryFunc(3);
        Summary4 = SummaryFunc(4);
        Summary5 = SummaryFunc(5);
        handles.Summary2 = Summary2;
        handles.Summary3 = Summary3;
        handles.Summary4 = Summary4;
        handles.Summary5 = Summary5;
end
guidata(hObject, handles); % Updating all the object and all the handles

% Function for displaying error message during Import menu
function out = Errormsg(data,frequency)
out = 0;
if isnan(frequency)
    errordlg('Sampling frequency not provided','Input Missing');
    out = 1;
    return;
end
if isempty(data)
    errordlg('File either not uploaded or is empty','Input Missing');
    out = 1;
    return;
end


% --- Executes when entered signal in editable cell(s) in statisticsTable.
function statisticsTable_CellEditCallback(~, ~, ~)
% hObject    handle to statisticsTable (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when plotDataGroup is resized.
function plotDataGroup_SizeChangedFcn(~, ~, ~)
% hObject    handle to plotDataGroup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected object is changed in plotDataGroup.
function plotDataGroup_SelectionChangedFcn(~, ~, handles)
% hObject    handle to the selected object in plotDataGroup
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Plotting group of Import menu. Plots the data whose button is clicked
vari = get(handles.plotDataGroup,'SelectedObject');
selection = get(vari,'String');
switch selection
    case 'Signal 1'
        u1 = getappdata(0,'set_u1');
        t1 = getappdata(0,'set_t1');
        colorgen = @(color,text) ['<html><table border=0 width=400 bgcolor=',color,'><TR><TD>',text,'</TD></TR> </table></html>'];
        set(handles.statisticsTable,'Data',[]);
        data = { colorgen('#F0F0F0','Mean'), num2str(mean(u1))
            colorgen('#F0F0F0','Std Dev.'), num2str(std(u1))
            };
        
        set(handles.statisticsTable,'Data',data);
        set(handles.statisticsPanel,'Title','Original signal 1 statistics');
        cla(handles.originalaxes,'reset');
        axes(handles.originalaxes)
        plot(t1,u1);
        xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
        ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
        title('Signal 1','FontName','Times');
    case 'Signal 2'
        u2 = getappdata(0,'set_u2');
        t2 = getappdata(0,'set_t2');
        colorgen = @(color,text) ['<html><table border=0 width=400 bgcolor=',color,'><TR><TD>',text,'</TD></TR> </table></html>'];
        set(handles.statisticsTable,'Data',[]);
        data = { colorgen('#F0F0F0','Mean'), num2str(mean(u2))
            colorgen('#F0F0F0','Std Dev.'), num2str(std(u2))
            };
        set(handles.statisticsTable,'Data',data);
        set(handles.statisticsPanel,'Title','Original signal 2 statistics');
        cla(handles.originalaxes,'reset');
        axes(handles.originalaxes)
        plot(t2,u2);
        xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
        ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
        title('Signal 2','FontName','Times');
    case 'Signal 3'
        u3 = getappdata(0,'set_u3');
        t3 = getappdata(0,'set_t3');
        colorgen = @(color,text) ['<html><table border=0 width=400 bgcolor=',color,'><TR><TD>',text,'</TD></TR> </table></html>'];
        set(handles.statisticsTable,'Data',[]);
        data = { colorgen('#F0F0F0','Mean'), num2str(mean(u3))
            colorgen('#F0F0F0','Std Dev.'), num2str(std(u3))
            };
        set(handles.statisticsTable,'Data',data);
        set(handles.statisticsPanel,'Title','Original signal 3 statistics');
        cla(handles.originalaxes,'reset');
        axes(handles.originalaxes)
        plot(t3,u3);
        xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
        ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
        title('Signal 3','FontName','Times');
    case 'Signal 4'
        u4 = getappdata(0,'set_u4');
        t4 = getappdata(0,'set_t4');
        colorgen = @(color,text) ['<html><table border=0 width=400 bgcolor=',color,'><TR><TD>',text,'</TD></TR> </table></html>'];
        set(handles.statisticsTable,'Data',[]);
        data = { colorgen('#F0F0F0','Mean'), num2str(mean(u4))
            colorgen('#F0F0F0','Std Dev.'), num2str(std(u4))
            };
        set(handles.statisticsTable,'Data',data);
        set(handles.statisticsPanel,'Title','Original signal 4 statistics');
        cla(handles.originalaxes,'reset');
        axes(handles.originalaxes)
        plot(t4,u4);
        xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
        ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
        title('Signal 4','FontName','Times');
    case 'Signal 5'
        u5 = getappdata(0,'set_u5');
        t5 = getappdata(0,'set_t5');
        colorgen = @(color,text) ['<html><table border=0 width=400 bgcolor=',color,'><TR><TD>',text,'</TD></TR> </table></html>'];
        set(handles.statisticsTable,'Data',[]);
        data = { colorgen('#F0F0F0','Mean'), num2str(mean(u5))
            colorgen('#F0F0F0','Std Dev.'), num2str(std(u5))
            };
        set(handles.statisticsTable,'Data',data);
        set(handles.statisticsPanel,'Title','Original signal 5 statistics');
        cla(handles.originalaxes,'reset');
        axes(handles.originalaxes)
        plot(t5,u5);
        xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
        ylabel('\hspace{25em}\normalfont\bf{Signal}','interpreter','latex');
        title('Signal 5','FontName','Times');
end


% --- Executes on selection change in selectDataStationaryPopup.
function selectDataStationaryPopup_Callback(~, ~, ~)
% hObject    handle to selectDataStationaryPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns selectDataStationaryPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from selectDataStationaryPopup


% --- Executes during object creation, after setting all properties.
function selectDataStationaryPopup_CreateFcn(hObject, ~, ~)
% hObject    handle to selectDataStationaryPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in checkAnotherStationary.
function checkAnotherStationary_Callback(~, ~, handles)
% hObject    handle to checkAnotherStationary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Push function in Stationary menu to reset all the objects inorder to
% analyse another data

set(handles.selectDataStationaryPopup, 'Enable','On')
set(handles.noStationarityRadio,'Value',0);
set(handles.yesStationarityRadio,'Value',0);
set(handles.wantStationarityPopup,'Value',1);
array2 = [handles.noStationarityRadio,handles.yesStationarityRadio,handles.wantStationarityPopup];
set(array2,'Enable','Off')
array1 = [handles.stationaryDataStationaryCheck,handles.stationaryDataPolyCheck,...
    handles.polynomialStationaryCheck,handles.originalDataStationaryCheck];
set(array1,'Enable','Off');
set(array1,'Value',0);
set(array1,'Visible','Off');
cla(handles.stationaryaxes,'reset');
set(handles.statisticsTable,'Data',[]);
set(handles.statisticsPanel,'title','Signal statistics');



function edit19_Callback(~, ~, ~)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, ~, ~)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function edit76_CreateFcn(hObject, ~, ~)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function edit77_CreateFcn(hObject, ~, ~)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function edit78_CreateFcn(hObject, ~, ~)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function edit79_CreateFcn(hObject, ~, ~)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in popupmenu18.
function popupmenu18_Callback(~, ~, ~)
% hObject    handle to popupmenu18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu18 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu18


% --- Executes during object creation, after setting all properties.
function popupmenu18_CreateFcn(hObject, ~, ~)
% hObject    handle to popupmenu18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in originalDataPopup.
function originalDataPopup_Callback(~, ~, ~)
% hObject    handle to originalDataPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns originalDataPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from originalDataPopup


% --- Executes during object creation, after setting all properties.
function originalDataPopup_CreateFcn(hObject, ~, ~)
% hObject    handle to originalDataPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in anotherDataNoisePush.
function anotherDataNoisePush_Callback(~, ~, handles)
% hObject    handle to anotherDataNoisePush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Push function in Noise Removal Menu which resets all the  objects inorder
% to analyse another data

handle = [handles.chauvenetRadio,handles.histogramRadio,handles.defaultChauvenetRadio,handles.otherChauvenetRadio,...
    handles.defaultHistogramRadio,handles.otherHistogramRadio,handles.removalRadio,handles.replacementRadio];
set(handle,'Value',0);
set(handles.histogramBinInput,'String','');
set(handles.chauvenetDeviationInput,'String','');
array = [handles.defaultChauvenetRadio,handles.otherChauvenetRadio,handles.chauvenetDeviationInput,...
    handles.defaultHistogramRadio,handles.otherHistogramRadio,handles.histogramBinInput,handles.removalRadio,...
    handles.replacementRadio];
set(array,'Enable','Off');
check = [handles.stationaryDetrendNoiseCheck,handles.stationaryPolyNoiseCheck];
set(check,'Enable','On');
set(handles.originalDataPopup,'Enable','On');
array1 = [handles.selectedHistoCheck,handles.noiselessSubsHistoCheck,handles.noiselessRemoHistoCheck,...
    handles.selectedDataNoiseCheck,handles.noiselessSubsCheck,handles.noiselessRemoCheck];
set(array1,'Visible','Off');
set(array,'Value',0);
set(array1,'Enable','Off');
set(handles.statisticsTable,'Data',[]);
set(handles.statisticsPanel,'Title','Signal statistics');
cla(handles.noiseaxes1,'reset');
cla(handles.noiseaxes2,'reset');


% --- Executes on button press in selectedDataNoiseCheck.
function selectedDataNoiseCheck_Callback(~, ~, handles)
% hObject    handle to selectedDataNoiseCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting the data, noiseless data obtained by Replacement(Chauvenet or
% Histogram) which was stored during the run execution in Noise Removal Menu.
% These datas are used for plotting on axes 1 depending
% upon which checkbox is checked and which is not.

new_u = getappdata(0,'temp_u');
new_u = new_u - mean(new_u);
t = getappdata(0,'temp_t');
pos = getappdata(0,'set_pos');
final_u = getappdata(0,'set_final');
axes(handles.noiseaxes1);
cla reset;
if get(handles.selectedDataNoiseCheck,'Value')&&get(handles.noiselessSubsCheck,'Value')
    time = t(pos);
    a = new_u(pos);
    plot(t,new_u,t,final_u);
    title('Selected signal','FontName','Times');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{Signal}','interpreter','latex');
    legend('Selected signal','Noiseless signal by substitution');
    hold on;
    plot(time,a,'*');
elseif get(handles.selectedDataNoiseCheck,'Value')
    time = t(pos);
    a = new_u(pos);
    plot(t,new_u);
    title('Selected signal','FontName','Times');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{Signal}','interpreter','latex');
    legend('Selected signal');
    hold on;
    plot(time,a,'*');
elseif get(handles.noiselessSubsCheck,'Value')
    plot(t,final_u);
    title('Selected signal','FontName','Times');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{Signal}','interpreter','latex');
    legend('Noiseless signal by substitution');
else
    cla reset; % If none is selected, axes 1 is cleared
end
% Hint: get(hObject,'Value') returns toggle state of selectedDataNoiseCheck


% --- Executes on button press in checkbox41.
function checkbox41_Callback(~, ~, ~)
% hObject    handle to checkbox41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox41


% --- Executes on button press in noiselessSubsCheck.
function noiselessSubsCheck_Callback(~, ~, handles)
% hObject    handle to noiselessSubsCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting the data, noiseless data obtained by Replacement(Chauvenet or
% Histogram) which was stored during the run execution in Noise Removal Menu.
% These datas are used for plotting on axes 1 depending
% upon which checkbox is checked and which is not.

new_u = getappdata(0,'temp_u');
new_u = new_u - mean(new_u);
t = getappdata(0,'temp_t');
pos = getappdata(0,'set_pos');
final_u = getappdata(0,'set_final');
axes(handles.noiseaxes1);
cla reset;
if get(handles.selectedDataNoiseCheck,'Value')&&get(handles.noiselessSubsCheck,'Value')
    time = t(pos);
    a = new_u(pos);
    plot(t,new_u,t,final_u);
    title('Selected signal','FontName','Times');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{Signal}','interpreter','latex');
    legend('Selected signal','Noiseless signal by substitution');
    hold on;
    plot(time,a,'*');
elseif get(handles.selectedDataNoiseCheck,'Value')
    time = t(pos);
    a = new_u(pos);
    plot(t,new_u);
    title('Selected signal','FontName','Times');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{Signal}','interpreter','latex');
    legend('Selected signal');
    hold on;
    plot(time,a,'*');
elseif get(handles.noiselessSubsCheck,'Value')
    plot(t,final_u);
    title('Selected signal','FontName','Times');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{Signal}','interpreter','latex');
    legend('Noiseless signal by substitution');
else
    cla reset; % If none is selected, axes 1 is cleared
end
% Hint: get(hObject,'Value') returns toggle state of noiselessSubsCheck


% --- Executes on button press in noiselessRemoCheck.
function noiselessRemoCheck_Callback(~, ~, ~)
% hObject    handle to noiselessRemoCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of noiselessRemoCheck


% --- Executes on button press in replacementHover.
function replacementHover_Callback(~, ~, ~)
% hObject    handle to replacementHover (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in removalHover.
function removalHover_Callback(~, ~, ~)
% hObject    handle to removalHover (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in computedDataPopup.
function computedDataPopup_Callback(~, ~, ~)
% hObject    handle to computedDataPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns computedDataPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from computedDataPopup


% --- Executes during object creation, after setting all properties.
function computedDataPopup_CreateFcn(hObject, ~, ~)
% hObject    handle to computedDataPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in histogramHover.
function histogramHover_Callback(~, ~, ~)
% hObject    handle to histogramHover (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in defaultHistogramRadio.
function defaultHistogramRadio_Callback(~, ~, ~)
% hObject    handle to defaultHistogramRadio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of defaultHistogramRadio


% --- Executes on button press in otherHistogramRadio.
function otherHistogramRadio_Callback(~, ~, ~)
% hObject    handle to otherHistogramRadio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of otherHistogramRadio



function histogramBinInput_Callback(~, ~, ~)
% hObject    handle to histogramBinInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of histogramBinInput as text
%        str2double(get(hObject,'String')) returns contents of histogramBinInput as a double


% --- Executes during object creation, after setting all properties.
function histogramBinInput_CreateFcn(hObject, ~, ~)
% hObject    handle to histogramBinInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in chauvenetHover.
function chauvenetHover_Callback(~, ~, ~)
% hObject    handle to chauvenetHover (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function chauvenetDeviationInput_Callback(~, ~, ~)
% hObject    handle to chauvenetDeviationInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of chauvenetDeviationInput as text
%        str2double(get(hObject,'String')) returns contents of chauvenetDeviationInput as a double


% --- Executes during object creation, after setting all properties.
function chauvenetDeviationInput_CreateFcn(hObject, ~, ~)
% hObject    handle to chauvenetDeviationInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Function to check zscore value of stationarity
function z = zscore(vec,N)

%   Split the vec in N equally dimensioned subvectors, compute the reverse
%   arangement test and the z-score.

K = length(vec);
KSub = fix(K/N);

% Get the mean square for all segments
MeanSquare = zeros(1,N);
for i = 1:N
    lim1 = (i-1)*(KSub)+1;
    lim2 = i*KSub;
    
    MeanSquare(i,1) = mean(vec(lim1:lim2).^2);
end

% Compute number of reverse arangement
A = 0;
for i = 1:N-1
    for j = i+1:N
        if MeanSquare(i) > MeanSquare(j)
            A = A + 1;
        end
    end
end

% Compute z-score
mu_A = (N^2-N) / 4;
sigma_A = sqrt((2 * N^3 + 3 * N^2 - 5*N) / (72));

z = (A - mu_A) / sigma_A;


% --- Executes when selected object is changed in noiseDetectionGroup.
function noiseDetectionGroup_SelectionChangedFcn(~, ~, handles)
% hObject    handle to the selected object in noiseDetectionGroup
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% This function is a button group of Chauvenet and Histogram. Initially
% data is store in a temporary variable, then depending on the radio button
% selected, required objects are made visible, enabled and default value is set

str1 = get(handles.originalDataPopup, 'String');
val1 = get(handles.originalDataPopup,'Value');
if strcmp(str1,'Signal 1')
    if get(handles.stationaryPolyNoiseCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sPoly'',''var'')')
            new_u = evalin('base','Signal1_sPoly');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            handle = [handles.chauvenetRadio,handles.histogramRadio];
            set(handle,'Value',0);
            return;
        end
    elseif get(handles.stationaryDetrendNoiseCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sDetr'',''var'')')
            new_u = evalin('base','Signal1_sDetr');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            handle = [handles.chauvenetRadio,handles.histogramRadio];
            set(handle,'Value',0);
            return;
        end
    else
        new_u = getappdata(0,'set_u1');
        t = getappdata(0,'set_t1');
    end
    set(handles.statisticsPanel,'Title','Noiseless signal 1 statistics');
else
    switch str1{val1}
        case 'Signal 1'
            if get(handles.stationaryPolyNoiseCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sPoly'',''var'')')
                    new_u = evalin('base','Signal1_sPoly');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    handle = [handles.chauvenetRadio,handles.histogramRadio];
                    set(handle,'Value',0);
                    return;
                end
            elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sDetr'',''var'')')
                    new_u = evalin('base','Signal1_sDetr');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    handle = [handles.chauvenetRadio,handles.histogramRadio];
                    set(handle,'Value',0);
                    return;
                end
            else
                new_u = getappdata(0,'set_u1');
                t = getappdata(0,'set_t1');
            end
            set(handles.statisticsPanel,'Title','Noiseless signal 1 statistics');
            
        case 'Signal 2'
            if get(handles.stationaryPolyNoiseCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sPoly'',''var'')')
                    new_u = evalin('base','Signal2_sPoly');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    handle = [handles.chauvenetRadio,handles.histogramRadio];
                    set(handle,'Value',0);
                    return;
                end
            elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sDetr'',''var'')')
                    new_u = evalin('base','Signal2_sDetr');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    handle = [handles.chauvenetRadio,handles.histogramRadio];
                    set(handle,'Value',0);
                    return;
                end
            else
                new_u = getappdata(0,'set_u2');
                t = getappdata(0,'set_t2');
            end
            set(handles.statisticsPanel,'Title','Noiseless signal 2 statistics');
            
        case 'Signal 3'
            if get(handles.stationaryPolyNoiseCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sPoly'',''var'')')
                    new_u = evalin('base','Signal3_sPoly');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    handle = [handles.chauvenetRadio,handles.histogramRadio];
                    set(handle,'Value',0);
                    return;
                end
            elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sDetr'',''var'')')
                    new_u = evalin('base','Signal3_sDetr');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    handle = [handles.chauvenetRadio,handles.histogramRadio];
                    set(handle,'Value',0);
                    return;
                end
            else
                new_u = getappdata(0,'set_u3');
                t = getappdata(0,'set_t3');
            end
            set(handles.statisticsPanel,'Title','Noiseless signal 3 statistics');
            
        case 'Signal 4'
            if get(handles.stationaryPolyNoiseCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sPoly'',''var'')')
                    new_u = evalin('base','Signal4_sPoly');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    handle = [handles.chauvenetRadio,handles.histogramRadio];
                    set(handle,'Value',0);
                    return;
                end
            elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sDetr'',''var'')')
                    new_u = evalin('base','Signal4_sDetr');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    handle = [handles.chauvenetRadio,handles.histogramRadio];
                    set(handle,'Value',0);
                    return;
                end
            else
                new_u = getappdata(0,'set_u4');
                t = getappdata(0,'set_t4');
            end
            set(handles.statisticsPanel,'Title','Noiseless signal 4 statistics');
            
        case 'Signal 5'
            if get(handles.stationaryPolyNoiseCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sPoly'',''var'')')
                    new_u = evalin('base','Signal5_sPoly');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    handle = [handles.chauvenetRadio,handles.histogramRadio];
                    set(handle,'Value',0);
                    return;
                end
            elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sDetr'',''var'')')
                    new_u = evalin('base','Signal5_sDetr');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    handle = [handles.chauvenetRadio,handles.histogramRadio];
                    set(handle,'Value',0);
                    return;
                end
            else
                new_u = getappdata(0,'set_u5');
                t = getappdata(0,'set_t5');
            end
            set(handles.statisticsPanel,'Title','Noiseless signal 5 statistics');
    end
end

% Temporary variable created to store the selected data which will be used
% in plotting checkbox panel
setappdata(0,'temp_u',new_u);
setappdata(0,'temp_t',t);

set(handles.originalDataPopup,'Enable','Off');
check = [handles.stationaryDetrendNoiseCheck,handles.stationaryPolyNoiseCheck];
set(check,'Enable','Off');
var = get(handles.noiseDetectionGroup,'SelectedObject');
selection = get(var,'String');
switch selection
    case 'Chauvenet'
        N = length(new_u);
        lim = 1 - 1/(2*N);
        % Check if vpasolve is present
        has_vpasolve = ~isempty(which('vpasolve'));
        if has_vpasolve ~= 1
            errordlg('Your MATLAB does not have vpasolve. Chauvenet method cannot be used','Calculation failed');
            set(handles.chauvenetRadio,'Value',0);
            return;
        end
        % Symbolic variable to compute the default value of the standard
        % deviation to determine outliers using Chauvenet
        syms a
        n = double(vpasolve(normcdf(a)-normcdf(-a)== lim,a));
        setappdata(0,'set_dev',n);
        set(handles.chauvenetDeviationInput,'String',num2str(n));
        set(handles.defaultChauvenetRadio,'Value',1);
        set(handles.otherChauvenetRadio,'Value',0);
        array1 = [handles.defaultHistogramRadio,handles.otherHistogramRadio,handles.replacementRadio,...
            handles.removalRadio];
        set(handles.histogramBinInput,'String','');
        set(handles.histogramBinInput,'Enable','Off');
        set(array1,'Enable','Off');
        set(array1,'Value',0);
        array2 = [handles.defaultChauvenetRadio,handles.otherChauvenetRadio,handles.chauvenetDeviationInput];
        set(array2,'Enable','On');
        set(handles.statisticsPanel,'Title','Selected signal statistics');
        array3 = [handles.selectedDataNoiseCheck,handles.noiselessSubsCheck,handles.noiselessRemoCheck,...
            handles.noiselessSubsHistoCheck,handles.noiselessRemoHistoCheck,handles.selectedHistoCheck,...
            handles.chauvenetDeviationInput];
        set(array3,'Enable','Off');
        
    case 'Histogram'
        set(handles.histogramBinInput,'String',20);
        set(handles.defaultHistogramRadio,'Value',1);
        set(handles.otherHistogramRadio,'Value',0);
        array1 = [handles.defaultChauvenetRadio,handles.otherChauvenetRadio,handles.removalRadio,...
            handles.replacementRadio];
        set(handles.chauvenetDeviationInput,'String','');
        set(handles.chauvenetDeviationInput,'Enable','Off');
        set(array1,'Enable','Off');
        set(array1,'Value',0);
        array2 = [handles.defaultHistogramRadio,handles.otherHistogramRadio,handles.histogramBinInput];
        set(array2,'Enable','On');
        set(handles.statisticsPanel,'Title','Selected signal statistics');
        array3 = [handles.selectedDataNoiseCheck,handles.noiselessSubsCheck,handles.noiselessRemoCheck,...
            handles.noiselessSubsHistoCheck,handles.noiselessRemoHistoCheck,handles.selectedHistoCheck,...
            handles.histogramBinInput];
        set(array3,'Enable','Off');
end


% --- Executes when selected object is changed in chauvenetDeviationGroup.
function chauvenetDeviationGroup_SelectionChangedFcn(~, ~, handles)
% hObject    handle to the selected object in chauvenetDeviationGroup
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Standard deviation radio button group of Chauvenet method
var = get(handles.chauvenetDeviationGroup,'SelectedObject');
selection = get(var,'String');
switch selection
    case 'Default'
        n = getappdata(0,'set_dev');
        set(handles.chauvenetDeviationInput,'String',num2str(n));
        set(handles.chauvenetDeviationInput,'Enable','Off');
    case 'Other'
        set(handles.chauvenetDeviationInput,'Enable','On');
end


% --- Executes when selected object is changed in histogramBinGroup.
function histogramBinGroup_SelectionChangedFcn(~, ~, handles)
% hObject    handle to the selected object in histogramBinGroup
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Bin size radio button group of Histogram method
var = get(handles.histogramBinGroup,'SelectedObject');
selection = get(var,'String');
switch selection
    case 'Default'
        set(handles.histogramBinInput,'String',20);
        set(handles.histogramBinInput,'Enable','Off');
    case 'Other';
        set(handles.histogramBinInput,'Enable','On');
end


% --- Executes on button press in selectedHistoCheck.
function selectedHistoCheck_Callback(~, ~, handles)
% hObject    handle to selectedHistoCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting the data, noiseless data obtained by Replacement(Chauvenet or
% Histogram) which was stored during the run execution in Noise Removal Menu.
% These datas are used for plotting HISTOGRAM on axes 2 depending
% upon which checkbox is checked and which is not.

new_u = getappdata(0,'temp_u');
new_u = new_u - mean(new_u);
vec = getappdata(0,'set_vec');
final_u = getappdata(0,'set_final');
if (get(handles.histogramRadio,'Value'))
    k = get(handles.histogramBinInput,'String');
    k = str2double(k);
else
    k = 20;
end
if isnan(k)
    errordlg('Enter number of bins','Plotting Denied');
    return;
end
axes(handles.noiseaxes2);
cla reset;
if get(handles.selectedHistoCheck,'Value')&&get(handles.noiselessSubsHistoCheck,'Value')
    h = histogram(new_u,k);
    title('Histogram distribution','FontName','Times');
    xlabel('\hspace{30em}\normalfont\bf{Bins}','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{pdf}','interpreter','latex');
    hold on;
    histogram(final_u,k);
    % Representing outliers by vertical lines on the histogram
    for i=1:length(vec)
        hold on;
        x = h.BinEdges(vec(i):vec(i)+1);
        h1 = line([x(1) x(1)],[0 max(h.Values)]);
        h2 = line([x(2) x(2)],[0 max(h.Values)]);
        set([h1 h2],'Color','r')
    end
    legend('Selected signal','Noiseless signal with substitution');
elseif get(handles.selectedHistoCheck,'Value')
    h = histogram(new_u,k);
    title('Histogram distribution','FontName','Times');
    xlabel('\hspace{30em}\normalfont\bf{Bins}','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{pdf}','interpreter','latex');
    legend('Selected signal');
    % Representing outliers by vertical lines on the histogram
    for i=1:length(vec)
        hold on;
        x = h.BinEdges(vec(i):vec(i)+1);
        h1 = line([x(1) x(1)],[0 max(h.Values)]);
        h2 = line([x(2) x(2)],[0 max(h.Values)]);
        set([h1 h2],'Color','r')
    end
elseif get(handles.noiselessSubsHistoCheck,'Value')
    histogram(final_u,k);
    xlabel('\hspace{30em}\normalfont\bf{Bins}','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{pdf}','interpreter','latex');
    title('Histogram distribution','FontName','Times');
    legend('Noiseless signal with substitution');
else
    cla reset;
end
% Hint: get(hObject,'Value') returns toggle state of selectedHistoCheck


% --- Executes on button press in noiselessSubsHistoCheck.
function noiselessSubsHistoCheck_Callback(~, ~, handles)
% hObject    handle to noiselessSubsHistoCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting the data, noiseless data obtained by Replacement(Chauvenet or
% Histogram) which was stored during the run execution in Noise Removal Menu.
% These datas are used for plotting HISTOGRAM on axes 2 depending
% upon which checkbox is checked and which is not.

new_u = getappdata(0,'temp_u');
new_u = new_u - mean(new_u);
vec = getappdata(0,'set_vec');
final_u = getappdata(0,'set_final');
if (get(handles.histogramRadio,'Value'))
    k = get(handles.histogramBinInput,'String');
    k = str2double(k);
else
    k = 20;
end
if isnan(k)
    errordlg('Enter number of bins','Plotting Denied');
    return;
end
axes(handles.noiseaxes2);
cla reset;
if get(handles.selectedHistoCheck,'Value')&&get(handles.noiselessSubsHistoCheck,'Value')
    h = histogram(new_u,k);
    title('Histogram distribution','FontName','Times');
    xlabel('\hspace{30em}\normalfont\bf{Bins}','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{pdf}','interpreter','latex');
    hold on;
    histogram(final_u,k);
    % Representing outliers by vertical lines on the histogram
    for i=1:length(vec)
        hold on;
        x = h.BinEdges(vec(i):vec(i)+1);
        h1 = line([x(1) x(1)],[0 max(h.Values)]);
        h2 = line([x(2) x(2)],[0 max(h.Values)]);
        set([h1 h2],'Color','r')
    end
    legend('Selected signal','Noiseless signal with substitution');
elseif get(handles.selectedHistoCheck,'Value')
    h = histogram(new_u,k);
    title('Histogram distribution','FontName','Times');
    xlabel('\hspace{30em}\normalfont\bf{Bins}','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{pdf}','interpreter','latex');
    legend('Selected signal');
    % Representing outliers by vertical lines on the histogram
    for i=1:length(vec)
        hold on;
        x = h.BinEdges(vec(i):vec(i)+1);
        h1 = line([x(1) x(1)],[0 max(h.Values)]);
        h2 = line([x(2) x(2)],[0 max(h.Values)]);
        set([h1 h2],'Color','r');
    end
elseif get(handles.noiselessSubsHistoCheck,'Value')
    histogram(final_u,k);
    title('Histogram distribution','FontName','Times');
    xlabel('\hspace{30em}\normalfont\bf{Bins}','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{pdf}','interpreter','latex');
    legend('Noiseless signal with substitution');
else
    cla reset;
end
% Hint: get(hObject,'Value') returns toggle state of noiselessSubsHistoCheck


% --- Executes on button press in noiselessRemoHistoCheck.
function noiselessRemoHistoCheck_Callback(~, ~, ~)
% hObject    handle to noiselessRemoHistoCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of noiselessRemoHistoCheck


% --- Executes when selected object is changed in postdetectionGroup.
function postdetectionGroup_SelectionChangedFcn(hObject, ~, handles)
% hObject    handle to the selected object in postdetectionGroup
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Function to replace or remove spurious data
varia = get(handles.postdetectionGroup,'SelectedObject');
selection = get(varia,'String');
new_u = getappdata(0,'temp_u');
mean_n1 = mean(new_u);
new_u = new_u - mean_n1;
t = getappdata(0,'temp_t');
sigma_n = std(new_u);
switch selection
    case 'Removal'
        var1 = get(handles.noiseDetectionGroup,'SelectedObject');
        selection1 = get(var1,'String');
        switch selection1
            case 'Chauvenet'
                n = get(handles.chauvenetDeviationInput,'String');
                n = str2double(n);
                cal_u = n*sigma_n;
                mean_n = mean(new_u);
                % Find their position in the vector
                pos1 = (new_u <= (mean_n + cal_u))&((new_u >= (mean_n - cal_u)));
                % Detect spurious data and store remaining data in final_u
                final_u = new_u(pos1);
                t1 = t(pos1);
                axes(handles.noiseaxes1);
                cla reset;
                legend(handles.noiseaxes1,'Off');
                plot(t1,final_u);
                title('Selected signal','FontName','Times');
                xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
                ylabel('\hspace{10em}\normalfont\bf{Signal}','interpreter','latex');
                axes(handles.noiseaxes2)
                cla reset;
                histogram(final_u,20);
                title('Histogram distribution','FontName','Times');
                xlabel('\hspace{30em}\normalfont\bf{Bins}','interpreter','latex');
                ylabel('\hspace{10em}\normalfont\bf{pdf}','interpreter','latex');
                set(handles.noiselessRemoHistoCheck,'Visible','On');
                set(handles.noiselessRemoHistoCheck,'Enable','Off');
                set(handles.noiselessRemoHistoCheck,'Value',1);
                set(handles.noiselessRemoCheck,'Visible','On');
                set(handles.noiselessRemoCheck,'Enable','Off');
                set(handles.noiselessRemoCheck,'Value',1);
                array = [handles.selectedDataNoiseCheck,handles.noiselessSubsCheck,handles.selectedHistoCheck,...
                    handles.noiselessSubsHistoCheck];
                set(array,'Value',0);
                set(array,'Enable','Off');
                % For computing mean,std and saving the data, we add back the initial mean
                final_u = final_u + mean_n1;
                
                set(handles.statisticsPanel,'Title','Noiseless signal after Chauv. Removal');
                colorgen = @(color,text) ['<html><table border=0 width=400 bgcolor=',color,'><TR><TD>',text,'</TD></TR> </table></html>'];
                data = {colorgen('#F0F0F0','Mean'), num2str(mean(final_u))
                    colorgen('#F0F0F0','Std Dev.'), num2str(std(final_u))
                    colorgen('#F0F0F0','Kurtosis'), num2str(kurtosis(final_u))
                    colorgen('#F0F0F0','Skewness'), num2str(skewness(final_u))
                    };
                set(handles.statisticsTable,'Data',data);
                
                % Assigning the Removed Chauvenet data to workspace and Updating the struct and summary table
                str1 = get(handles.originalDataPopup, 'String');
                val1 = get(handles.originalDataPopup,'Value');
                if strcmp(str1,'Signal 1')
                    setappdata(0,'norm_t1',t1);
                    if get(handles.stationaryPolyNoiseCheck,'Value')
                        assignin('base','Signal1_sPoly_nChauRemo',final_u);
                        handles.Summary1.Mean.Signal1_sPoly_nChauRemo = mean(final_u);
                        handles.Summary1.Std.SampleRecord.Signal1_sPoly_nChauRemo = std(final_u);
                    elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                        assignin('base','Signal1_sDetr_nChauRemo',final_u);
                        handles.Summary1.Mean.Signal1_sDetr_nChauRemo = mean(final_u);
                        handles.Summary1.Std.SampleRecord.Signal1_sDetr_nChauRemo = std(final_u);
                    else
                        assignin('base','Signal1_nChauRemo',final_u);
                        handles.Summary1.Mean.Signal1_nChauRemo = mean(final_u);
                        handles.Summary1.Std.SampleRecord.Signal1_nChauRemo = std(final_u);
                    end
                else
                    switch str1{val1}
                        case 'Signal 1'
                            setappdata(0,'norm_t1',t1);
                            if get(handles.stationaryPolyNoiseCheck,'Value')
                                assignin('base','Signal1_sPoly_nChauRemo',final_u);
                                handles.Summary1.Mean.Signal1_sPoly_nChauRemo = mean(final_u);
                                handles.Summary1.Std.SampleRecord.Signal1_sPoly_nChauRemo = std(final_u);
                            elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                                assignin('base','Signal1_sDetr_nChauRemo',final_u);
                                handles.Summary1.Mean.Signal1_sDetr_nChauRemo = mean(final_u);
                                handles.Summary1.Std.SampleRecord.Signal1_sDetr_nChauRemo = std(final_u);
                            else
                                assignin('base','Signal1_nChauRemo',final_u);
                                handles.Summary1.Mean.Signal1_nChauRemo = mean(final_u);
                                handles.Summary1.Std.SampleRecord.Signal1_nChauRemo = std(final_u);
                            end
                        case 'Signal 2'
                            setappdata(0,'norm_t2',t1);
                            if get(handles.stationaryPolyNoiseCheck,'Value')
                                assignin('base','Signal2_sPoly_nChauRemo',final_u);
                                handles.Summary2.Mean.Signal2_sPoly_nChauRemo = mean(final_u);
                                handles.Summary2.Std.SampleRecord.Signal2_sPoly_nChauRemo = std(final_u);
                            elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                                assignin('base','Signal2_sDetr_nChauRemo',final_u);
                                handles.Summary2.Mean.Signal2_sDetr_nChauRemo = mean(final_u);
                                handles.Summary2.Std.SampleRecord.Signal2_sDetr_nChauRemo = std(final_u);
                            else
                                assignin('base','Signal2_nChauRemo',final_u);
                                handles.Summary2.Mean.Signal2_nChauRemo = mean(final_u);
                                handles.Summary2.Std.SampleRecord.Signal2_nChauRemo = std(final_u);
                            end
                        case 'Signal 3'
                            setappdata(0,'norm_t3',t1);
                            if get(handles.stationaryPolyNoiseCheck,'Value')
                                assignin('base','Signal3_sPoly_nChauRemo',final_u);
                                handles.Summary3.Mean.Signal3_sPoly_nChauRemo = mean(final_u);
                                handles.Summary3.Std.SampleRecord.Signal3_sPoly_nChauRemo = std(final_u);
                            elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                                assignin('base','Signal3_sDetr_nChauRemo',final_u);
                                handles.Summary3.Mean.Signal3_sDetr_nChauRemo = mean(final_u);
                                handles.Summary3.Std.SampleRecord.Signal3_sDetr_nChauRemo = std(final_u);
                            else
                                assignin('base','Signal3_nChauRemo',final_u);
                                handles.Summary3.Mean.Signal3_nChauRemo = mean(final_u);
                                handles.Summary3.Std.SampleRecord.Signal3_nChauRemo = std(final_u);
                            end
                        case 'Signal 4'
                            setappdata(0,'norm_t4',t1);
                            if get(handles.stationaryPolyNoiseCheck,'Value')
                                assignin('base','Signal4_sPoly_nChauRemo',final_u);
                                handles.Summary4.Mean.Signal4_sPoly_nChauRemo = mean(final_u);
                                handles.Summary4.Std.SampleRecord.Signal4_sPoly_nChauRemo = std(final_u);
                            elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                                assignin('base','Signal4_sDetr_nChauRemo',final_u);
                                handles.Summary4.Mean.Signal4_sDetr_nChauRemo = mean(final_u);
                                handles.Summary4.Std.SampleRecord.Signal4_sDetr_nChauRemo = std(final_u);
                            else
                                assignin('base','Signal4_nChauRemo',final_u);
                                handles.Summary4.Mean.Signal4_nChauRemo = mean(final_u);
                                handles.Summary4.Std.SampleRecord.Signal4_nChauRemo = std(final_u);
                            end
                        case 'Signal 5'
                            setappdata(0,'norm_t5',t1);
                            if get(handles.stationaryPolyNoiseCheck,'Value')
                                assignin('base','Signal5_sPoly_nChauRemo',final_u);
                                handles.Summary5.Mean.Signal5_sPoly_nChauRemo = mean(final_u);
                                handles.Summary5.Std.SampleRecord.Signal5_sPoly_nChauRemo = std(final_u);
                            elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                                assignin('base','Signal5_sDetr_nChauRemo',final_u);
                                handles.Summary5.Mean.Signal5_sDetr_nChauRemo = mean(final_u);
                                handles.Summary5.Std.SampleRecord.Signal5_sDetr_nChauRemo = std(final_u);
                            else
                                assignin('base','Signal5_nChauRemo',final_u);
                                handles.Summary5.Mean.Signal5_nChauRemo = mean(final_u);
                                handles.Summary5.Std.SampleRecord.Signal5_nChauRemo = std(final_u);
                            end
                    end
                end
                % Removing mean again and saving in temporary variable
                % which will be used in plotting checkbox panel
                final_u = final_u - mean(final_u);
                setappdata(0,'set_final',final_u);
                
            case 'Histogram'
                final_u = new_u;
                t1 = t;
                k = get(handles.histogramBinInput,'String');
                k = str2double(k);
                % Getting the position of spurious data
                pos = getappdata(0,'set_pos');
                % Removing the spurious data and time at the detected
                % position
                final_u(pos) = [];
                t1(pos) = [];
                axes(handles.noiseaxes2);
                cla reset;
                legend(handles.noiseaxes2,'Off');
                histogram(final_u,k);
                title('Histogram distribution','FontName','Times');
                xlabel('\hspace{30em}\normalfont\bf{Bins}','interpreter','latex');
                ylabel('\hspace{10em}\normalfont\bf{pdf}','interpreter','latex');
                axes(handles.noiseaxes1);
                cla reset
                legend(handles.noiseaxes1,'Off');
                plot(t1,final_u);
                title('Selected signal','FontName','Times');
                xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
                ylabel('\hspace{10em}\normalfont\bf{Signal}','interpreter','latex');
                set(handles.noiselessRemoHistoCheck,'Visible','On');
                set(handles.noiselessRemoHistoCheck,'Enable','Off');
                set(handles.noiselessRemoHistoCheck,'Value',1);
                set(handles.noiselessRemoCheck,'Visible','On');
                set(handles.noiselessRemoCheck,'Enable','Off');
                set(handles.noiselessRemoCheck,'Value',1);
                array = [handles.selectedDataNoiseCheck,handles.noiselessSubsCheck,handles.selectedHistoCheck,...
                    handles.noiselessSubsHistoCheck];
                set(array,'Value',0);
                set(array,'Enable','Off');
                final_u = final_u + mean_n1;
                
                set(handles.statisticsPanel,'Title','Noiseless signal after Histo. Removal');
                colorgen = @(color,text) ['<html><table border=0 width=400 bgcolor=',color,'><TR><TD>',text,'</TD></TR> </table></html>'];
                data = {colorgen('#F0F0F0','Mean'), num2str(mean(final_u))
                    colorgen('#F0F0F0','Std Dev.'), num2str(std(final_u))
                    colorgen('#F0F0F0','Kurtosis'), num2str(kurtosis(final_u))
                    colorgen('#F0F0F0','Skewness'), num2str(skewness(final_u))
                    };
                set(handles.statisticsTable,'Data',data);
                
                % Assigning the Removed Histogram data to workspace and Updating the struct and summary table
                str1 = get(handles.originalDataPopup, 'String');
                val1 = get(handles.originalDataPopup,'Value');
                if strcmp(str1,'Signal 1')
                    setappdata(0,'norm_t1',t1);
                    if get(handles.stationaryPolyNoiseCheck,'Value')
                        assignin('base','Signal1_sPoly_nHistRemo',final_u);
                        handles.Summary1.Mean.Signal1_sPoly_nHistRemo = mean(final_u);
                        handles.Summary1.Std.SampleRecord.Signal1_sPoly_nHistRemo = std(final_u);
                    elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                        assignin('base','Signal1_sDetr_nHistRemo',final_u);
                        handles.Summary1.Mean.Signal1_sDetr_nHistRemo = mean(final_u);
                        handles.Summary1.Std.SampleRecord.Signal1_sDetr_nHistRemo = std(final_u);
                    else
                        assignin('base','Signal1_nHistRemo',final_u);
                        handles.Summary1.Mean.Signal1_nHistRemo = mean(final_u);
                        handles.Summary1.Std.SampleRecord.Signal1_nHistRemo = std(final_u);
                    end
                else
                    switch str1{val1}
                        case 'Signal 1'
                            setappdata(0,'norm_t1',t1);
                            if get(handles.stationaryPolyNoiseCheck,'Value')
                                assignin('base','Signal1_sPoly_nHistRemo',final_u);
                                handles.Summary1.Mean.Signal1_sPoly_nHistRemo = mean(final_u);
                                handles.Summary1.Std.SampleRecord.Signal1_sPoly_nHistRemo = std(final_u);
                            elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                                assignin('base','Signal1_sDetr_nHistRemo',final_u);
                                handles.Summary1.Mean.Signal1_sDetr_nHistRemo = mean(final_u);
                                handles.Summary1.Std.SampleRecord.Signal1_sDetr_nHistRemo = std(final_u);
                            else
                                assignin('base','Signal1_nHistRemo',final_u);
                                handles.Summary1.Mean.Signal1_nHistRemo = mean(final_u);
                                handles.Summary1.Std.SampleRecord.Signal1_nHistRemo = std(final_u);
                            end
                        case 'Signal 2'
                            setappdata(0,'norm_t2',t1);
                            if get(handles.stationaryPolyNoiseCheck,'Value')
                                assignin('base','Signal2_sPoly_nHistRemo',final_u);
                                handles.Summary2.Mean.Signal2_sPoly_nHistRemo = mean(final_u);
                                handles.Summary2.Std.SampleRecord.Signal2_sPoly_nHistRemo = std(final_u);
                            elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                                assignin('base','Signal2_sDetr_nHistRemo',final_u);
                                handles.Summary2.Mean.Signal2_sDetr_nHistRemo = mean(final_u);
                                handles.Summary2.Std.SampleRecord.Signal2_sDetr_nHistRemo = std(final_u);
                            else
                                assignin('base','Signal2_nHistRemo',final_u);
                                handles.Summary2.Mean.Signal2_nHistRemo = mean(final_u);
                                handles.Summary2.Std.SampleRecord.Signal2_nHistRemo = std(final_u);
                            end
                        case 'Signal 3'
                            setappdata(0,'norm_t3',t1);
                            if get(handles.stationaryPolyNoiseCheck,'Value')
                                assignin('base','Signal3_sPoly_nHistRemo',final_u);
                                handles.Summary3.Mean.Signal3_sPoly_nHistRemo = mean(final_u);
                                handles.Summary3.Std.SampleRecord.Signal3_sPoly_nHistRemo = std(final_u);
                            elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                                assignin('base','Signal3_sDetr_nHistRemo',final_u);
                                handles.Summary3.Mean.Signal3_sDetr_nHistRemo = mean(final_u);
                                handles.Summary3.Std.SampleRecord.Signal3_sDetr_nHistRemo = std(final_u);
                            else
                                assignin('base','Signal3_nHistRemo',final_u);
                                handles.Summary3.Mean.Signal3_nHistRemo = mean(final_u);
                                handles.Summary3.Std.SampleRecord.Signal3_nHistRemo = std(final_u);
                            end
                        case 'Signal 4'
                            setappdata(0,'norm_t4',t1);
                            if get(handles.stationaryPolyNoiseCheck,'Value')
                                assignin('base','Signal4_sPoly_nHistRemo',final_u);
                                handles.Summary4.Mean.Signal4_sPoly_nHistRemo = mean(final_u);
                                handles.Summary4.Std.SampleRecord.Signal4_sPoly_nHistRemo = std(final_u);
                            elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                                assignin('base','Signal4_sDetr_nHistRemo',final_u);
                                handles.Summary4.Mean.Signal4_sDetr_nHistRemo = mean(final_u);
                                handles.Summary4.Std.SampleRecord.Signal4_sDetr_nHistRemo = std(final_u);
                            else
                                assignin('base','Signal4_nHistRemo',final_u);
                                handles.Summary4.Mean.Signal4_nHistRemo = mean(final_u);
                                handles.Summary4.Std.SampleRecord.Signal4_nHistRemo = std(final_u);
                            end
                        case 'Signal 5'
                            setappdata(0,'norm_t5',t1);
                            if get(handles.stationaryPolyNoiseCheck,'Value')
                                assignin('base','Signal5_sPoly_nHistRemo',final_u);
                                handles.Summary5.Mean.Signal5_sPoly_nHistRemo = mean(final_u);
                                handles.Summary5.Std.SampleRecord.Signal5_sPoly_nHistRemo = std(final_u);
                            elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                                assignin('base','Signal5_sDetr_nHistRemo',final_u);
                                handles.Summary5.Mean.Signal5_sDetr_nHistRemo = mean(final_u);
                                handles.Summary5.Std.SampleRecord.Signal5_sDetr_nHistRemo = std(final_u);
                            else
                                assignin('base','Signal5_nHistRemo',final_u);
                                handles.Summary5.Mean.Signal5_nHistRemo = mean(final_u);
                                handles.Summary5.Std.SampleRecord.Signal5_nHistRemo = std(final_u);
                            end
                    end
                end
                % Removing mean again and saving in temporary variable
                % which will be used in plotting checkbox panel
                final_u = final_u - mean(final_u);
                setappdata(0,'set_final',final_u);
        end
        
    case 'Replacement';
        var1 = get(handles.noiseDetectionGroup,'SelectedObject');
        selection1 = get(var1,'String');
        switch selection1
            case 'Chauvenet'
                n = get(handles.chauvenetDeviationInput,'String');
                n = str2double(n);
                cal_u = n*sigma_n;
                mean_n = mean(new_u);
                j = 1;
                count = 0;
                % Detecting spurious data which lie outside the limits
                for i=1:numel(new_u)
                    if(((new_u(i) < (mean_n + cal_u)) && (new_u(i) > (mean_n - cal_u))))
                        final_u(j) = new_u(i);
                        j = j + 1;
                    else
                        if i == 1
                            slope = (new_u(i+2)-new_u(i+1))/(t(i+2)-t(i+1));
                            final_u(j) = new_u(i+1) + slope*(t(i) - t(i+1));
                        elseif i == new_u(end)
                            slope = (new_u(end-1)-new_u(end-2))/(t(end-1)-t(end-2));
                            final_u(j) = new_u(end-1) + slope*(t(end) - t(end-1));
                        else
                            final_u(j) = (new_u(i+1) + new_u(i-1))/2;
                        end
                        j = j + 1;
                        count = count+1;
                    end
                end
                axes(handles.noiseaxes1);
                cla reset
                legend(handles.noiseaxes1,'Off');
                plot(t,final_u);
                title('Selected signal','FontName','Times');
                xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
                ylabel('\hspace{10em}\normalfont\bf{Signal}','interpreter','latex');
                axes(handles.noiseaxes2);
                cla reset;
                histogram(final_u,20);
                title('Histogram distribution','FontName','Times');
                xlabel('\hspace{30em}\normalfont\bf{Bins}','interpreter','latex');
                ylabel('\hspace{10em}\normalfont\bf{pdf}','interpreter','latex');
                array = [handles.selectedDataNoiseCheck,handles.noiselessSubsCheck,handles.selectedHistoCheck,...
                    handles.noiselessSubsHistoCheck];
                set(array,'Enable','On');
                set(array,'Visible','On');
                set(handles.noiselessSubsCheck,'Value',1);
                set(handles.noiselessSubsHistoCheck,'Value',1);
                set(handles.noiselessRemoCheck,'Value',0);
                set(handles.noiselessRemoHistoCheck,'Value',0);
                set(handles.noiselessRemoCheck,'Enable','Off');
                set(handles.noiselessRemoHistoCheck,'Enable','Off');
                set(handles.selectedDataNoiseCheck,'Value',0);
                set(handles.selectedHistoCheck,'Value',0);
                mean_f = mean(final_u);
                cal_u = n*std(final_u);
                a = [final_u((final_u > (mean_f + cal_u))),final_u((final_u < (mean_f - cal_u)))];
                final_u = final_u + mean_n1;
                set(handles.statisticsPanel,'Title','Noiseless signal after Chauv. subst.');
                colorgen = @(color,text) ['<html><table border=0 width=400 bgcolor=',color,'><TR><TD>',text,'</TD></TR> </table></html>'];
                data = {colorgen('#F0F0F0','Mean'), num2str(mean(final_u))
                    colorgen('#F0F0F0','Std Dev.'), num2str(std(final_u))
                    colorgen('#F0F0F0','Kurtosis'), num2str(kurtosis(final_u))
                    colorgen('#F0F0F0','Skewness'), num2str(skewness(final_u))
                    };
                set(handles.statisticsTable,'Data',data);
                % Assigning the Replaced Chauvenet data to workspace and Updating the struct and summary table
                str1 = get(handles.originalDataPopup, 'String');
                val1 = get(handles.originalDataPopup,'Value');
                if strcmp(str1,'Signal 1')
                    if get(handles.stationaryPolyNoiseCheck,'Value')
                        assignin('base','Signal1_sPoly_nChau',final_u);
                        handles.Summary1.Mean.Signal1_sPoly_nChau = mean(final_u);
                        handles.Summary1.Std.SampleRecord.Signal1_sPoly_nChau = std(final_u);
                    elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                        assignin('base','Signal1_sDetr_nChau',final_u);
                        handles.Summary1.Mean.Signal1_sDetr_nChau = mean(final_u);
                        handles.Summary1.Std.SampleRecord.Signal1_sDetr_nChau = std(final_u);
                    else
                        assignin('base','Signal1_nChau',final_u);
                        handles.Summary1.Mean.Signal1_nChau = mean(final_u);
                        handles.Summary1.Std.SampleRecord.Signal1_nChau = std(final_u);
                    end
                    
                else
                    switch str1{val1}
                        case 'Signal 1'
                            if get(handles.stationaryPolyNoiseCheck,'Value')
                                assignin('base','Signal1_sPoly_nChau',final_u);
                                handles.Summary1.Mean.Signal1_sPoly_nChau = mean(final_u);
                                handles.Summary1.Std.SampleRecord.Signal1_sPoly_nChau = std(final_u);
                            elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                                assignin('base','Signal1_sDetr_nChau',final_u);
                                handles.Summary1.Mean.Signal1_sDetr_nChau = mean(final_u);
                                handles.Summary1.Std.SampleRecord.Signal1_sDetr_nChau = std(final_u);
                            else
                                assignin('base','Signal1_nChau',final_u);
                                handles.Summary1.Mean.Signal1_nChau = mean(final_u);
                                handles.Summary1.Std.SampleRecord.Signal1_nChau = std(final_u);
                            end
                        case 'Signal 2'
                            if get(handles.stationaryPolyNoiseCheck,'Value')
                                assignin('base','Signal2_sPoly_nChau',final_u);
                                handles.Summary2.Mean.Signal2_sPoly_nChau = mean(final_u);
                                handles.Summary2.Std.SampleRecord.Signal2_sPoly_nChau = std(final_u);
                            elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                                assignin('base','Signal2_sDetr_nChau',final_u);
                                handles.Summary2.Mean.Signal2_sDetr_nChau = mean(final_u);
                                handles.Summary2.Std.SampleRecord.Signal2_sDetr_nChau = std(final_u);
                            else
                                assignin('base','Signal2_nChau',final_u);
                                handles.Summary2.Mean.Signal2_nChau = mean(final_u);
                                handles.Summary2.Std.SampleRecord.Signal2_nChau = std(final_u);
                            end
                        case 'Signal 3'
                            if get(handles.stationaryPolyNoiseCheck,'Value')
                                assignin('base','Signal3_sPoly_nChau',final_u);
                                handles.Summary3.Mean.Signal3_sPoly_nChau = mean(final_u);
                                handles.Summary3.Std.SampleRecord.Signal3_sPoly_nChau = std(final_u);
                            elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                                assignin('base','Signal3_sDetr_nChau',final_u);
                                handles.Summary3.Mean.Signal3_sDetr_nChau = mean(final_u);
                                handles.Summary3.Std.SampleRecord.Signal3_sDetr_nChau = std(final_u);
                            else
                                assignin('base','Signal3_nChau',final_u);
                                handles.Summary3.Mean.Signal3_nChau = mean(final_u);
                                handles.Summary3.Std.SampleRecord.Signal3_nChau = std(final_u);
                            end
                        case 'Signal 4'
                            if get(handles.stationaryPolyNoiseCheck,'Value')
                                assignin('base','Signal4_sPoly_nChau',final_u);
                                handles.Summary4.Mean.Signal4_sPoly_nChau = mean(final_u);
                                handles.Summary4.Std.SampleRecord.Signal4_sPoly_nChau = std(final_u);
                            elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                                assignin('base','Signal4_sDetr_nChau',final_u);
                                handles.Summary4.Mean.Signal4_sDetr_nChau = mean(final_u);
                                handles.Summary4.Std.SampleRecord.Signal4_sDetr_nChau = std(final_u);
                            else
                                assignin('base','Signal4_nChau',final_u);
                                handles.Summary4.Mean.Signal4_nChau = mean(final_u);
                                handles.Summary4.Std.SampleRecord.Signal4_nChau = std(final_u);
                            end
                        case 'Signal 5'
                            if get(handles.stationaryPolyNoiseCheck,'Value')
                                assignin('base','Signal5_sPoly_nChau',final_u);
                                handles.Summary5.Mean.Signal5_sPoly_nChau = mean(final_u);
                                handles.Summary5.Std.SampleRecord.Signal5_sPoly_nChau = std(final_u);
                            elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                                assignin('base','Signal5_sDetr_nChau',final_u);
                                handles.Summary5.Mean.Signal5_sDetr_nChau = mean(final_u);
                                handles.Summary5.Std.SampleRecord.Signal5_sDetr_nChau = std(final_u);
                            else
                                assignin('base','Signal5_nChau',final_u);
                                handles.Summary5.Mean.Signal5_nChau = mean(final_u);
                                handles.Summary5.Std.SampleRecord.Signal5_nChau = std(final_u);
                            end
                    end
                end
                % Removing mean again and saving in temporary variable
                % which will be used in plotting checkbox panel
                final_u = final_u - mean(final_u);
                setappdata(0,'set_final',final_u);
                
            case 'Histogram'
                k = get(handles.histogramBinInput,'String');
                k = str2double(k);
                final_u = new_u;
                pos = getappdata(0,'set_pos');
                for i=1:length(pos)
                    idx = pos(i);
                    if idx == 1
                        slope = (new_u(idx+2)-new_u(idx+1))/(t(idx+2)-t(idx+1));
                        final_u(idx) = new_u(idx+1) + slope*(t(idx) - t(idx+1));
                    elseif idx == final_u(end)
                        slope = (new_u(end-1)-new_u(end-2))/(t(end-1)-t(end-2));
                        final_u(idx) = new_u(end-1) + slope*(t(end) - t(end-1));
                    else
                        final_u(idx) = (final_u(idx-1)+final_u(idx+1))/2;
                    end
                end
                axes(handles.noiseaxes2);
                cla reset
                legend(handles.noiseaxes2,'Off');
                h = histogram(final_u,k);
                title('Histogram distribution','FontName','Times');
                xlabel('\hspace{30em}\normalfont\bf{Bins}','interpreter','latex');
                ylabel('\hspace{10em}\normalfont\bf{pdf}','interpreter','latex');
                axes(handles.noiseaxes1);
                cla reset
                legend(handles.noiseaxes1,'Off');
                plot(t,final_u);
                title('Selected signal','FontName','Times');
                xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
                ylabel('\hspace{10em}\normalfont\bf{Signal}','interpreter','latex');
                array = [handles.selectedDataNoiseCheck,handles.noiselessSubsCheck,handles.selectedHistoCheck,...
                    handles.noiselessSubsHistoCheck];
                set(array,'Enable','On');
                set(array,'Visible','On');
                set(handles.noiselessSubsCheck,'Value',1);
                set(handles.noiselessSubsHistoCheck,'Value',1);
                set(handles.noiselessRemoCheck,'Value',0);
                set(handles.noiselessRemoHistoCheck,'Value',0);
                set(handles.noiselessRemoCheck,'Enable','Off');
                set(handles.noiselessRemoHistoCheck,'Enable','Off');
                set(handles.selectedDataNoiseCheck,'Value',0);
                set(handles.selectedHistoCheck,'Value',0);
                count = 0;
                vec = [];
                % Detecting if still outliers exist
                for i=1:k
                    if round(i<k/2) && (h.Values(i+1)==0) && (h.Values(i)~=0)
                        for j=i:-1:1
                            count = count + 1;
                            vec(count) = j;
                            if j~=1 && (h.Values(i-1)==0)
                                break;
                            end
                        end
                    else if (i>k/2) && (h.Values(i-1)==0) && (h.Values(i)~=0)
                            count = count + 1;
                            vec(count) = i;
                        end
                    end
                end
                pos = [];
                % Representing outliers by vertical lines
                for i=1:length(vec)
                    x = h.BinEdges(vec(i):vec(i)+1);
                    pos = [pos,find((new_u > x(1))&(new_u < x(2)))];
                end
                a = final_u(pos);
                final_u = final_u + mean_n1;
                
                set(handles.statisticsPanel,'Title','Noiseless signal after histo. subst.');
                colorgen = @(color,text) ['<html><table border=0 width=400 bgcolor=',color,'><TR><TD>',text,'</TD></TR> </table></html>'];
                data = {colorgen('#F0F0F0','Mean'), num2str(mean(final_u))
                    colorgen('#F0F0F0','Std Dev.'), num2str(std(final_u))
                    colorgen('#F0F0F0','Kurtosis'), num2str(kurtosis(final_u))
                    colorgen('#F0F0F0','Skewness'), num2str(skewness(final_u))
                    };
                set(handles.statisticsTable,'Data',data);
                % Assigning the Replaced Histogram data to workspace and Updating the struct and summary table
                str1 = get(handles.originalDataPopup, 'String');
                val1 = get(handles.originalDataPopup,'Value');
                if strcmp(str1,'Signal 1')
                    if get(handles.stationaryPolyNoiseCheck,'Value')
                        assignin('base','Signal1_sPoly_nHist',final_u);
                        handles.Summary1.Mean.Signal1_sPoly_nHist = mean(final_u);
                        handles.Summary1.Std.SampleRecord.Signal1_sPoly_nHist = std(final_u);
                    elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                        assignin('base','Signal1_sDetr_nHist',final_u);
                        handles.Summary1.Mean.Signal1_sDetr_nHist = mean(final_u);
                        handles.Summary1.Std.SampleRecord.Signal1_sDetr_nHist = std(final_u);
                    else
                        assignin('base','Signal1_nHist',final_u);
                        handles.Summary1.Mean.Signal1_nHist = mean(final_u);
                        handles.Summary1.Std.SampleRecord.Signal1_nHist = std(final_u);
                    end
                else
                    switch str1{val1}
                        case 'Signal 1'
                            if get(handles.stationaryPolyNoiseCheck,'Value')
                                assignin('base','Signal1_sPoly_nHist',final_u);
                                handles.Summary1.Mean.Signal1_sPoly_nHist = mean(final_u);
                                handles.Summary1.Std.SampleRecord.Signal1_sPoly_nHist = std(final_u);
                            elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                                assignin('base','Signal1_sDetr_nHist',final_u);
                                handles.Summary1.Mean.Signal1_sDetr_nHist = mean(final_u);
                                handles.Summary1.Std.SampleRecord.Signal1_sDetr_nHist = std(final_u);
                            else
                                assignin('base','Signal1_nHist',final_u);
                                handles.Summary1.Mean.Signal1_nHist = mean(final_u);
                                handles.Summary1.Std.SampleRecord.Signal1_nHist = std(final_u);
                            end
                        case 'Signal 2'
                            if get(handles.stationaryPolyNoiseCheck,'Value')
                                assignin('base','Signal2_sPoly_nHist',final_u);
                                handles.Summary2.Mean.Signal2_sPoly_nHist = mean(final_u);
                                handles.Summary2.Std.SampleRecord.Signal2_sPoly_nHist = std(final_u);
                            elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                                assignin('base','Signal2_sDetr_nHist',final_u);
                                handles.Summary2.Mean.Signal2_sDetr_nHist = mean(final_u);
                                handles.Summary2.Std.SampleRecord.Signal2_sDetr_nHist = std(final_u);
                            else
                                assignin('base','Signal2_nHist',final_u);
                                handles.Summary2.Mean.Signal2_nHist = mean(final_u);
                                handles.Summary2.Std.SampleRecord.Signal2_nHist = std(final_u);
                            end
                        case 'Signal 3'
                            if get(handles.stationaryPolyNoiseCheck,'Value')
                                assignin('base','Signal3_sPoly_nHist',final_u);
                                handles.Summary3.Mean.Signal3_sPoly_nHist = mean(final_u);
                                handles.Summary3.Std.SampleRecord.Signal3_sPoly_nHist = std(final_u);
                            elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                                assignin('base','Signal3_sDetr_nHist',final_u);
                                handles.Summary3.Mean.Signal3_sDetr_nHist = mean(final_u);
                                handles.Summary3.Std.SampleRecord.Signal3_sDetr_nHist = std(final_u);
                            else
                                assignin('base','Signal3_nHist',final_u);
                                handles.Summary3.Mean.Signal3_nHist = mean(final_u);
                                handles.Summary3.Std.SampleRecord.Signal3_nHist = std(final_u);
                            end
                        case 'Signal 4'
                            if get(handles.stationaryPolyNoiseCheck,'Value')
                                assignin('base','Signal4_sPoly_nHist',final_u);
                                handles.Summary4.Mean.Signal4_sPoly_nHist = mean(final_u);
                                handles.Summary4.Std.SampleRecord.Signal4_sPoly_nHist = std(final_u);
                            elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                                assignin('base','Signal4_sDetr_nHist',final_u);
                                handles.Summary4.Mean.Signal4_sDetr_nHist = mean(final_u);
                                handles.Summary4.Std.SampleRecord.Signal4_sDetr_nHist = std(final_u);
                            else
                                assignin('base','Signal4_nHist',final_u);
                                handles.Summary4.Mean.Signal4_nHist = mean(final_u);
                                handles.Summary4.Std.SampleRecord.Signal4_nHist = std(final_u);
                            end
                        case 'Signal 5'
                            if get(handles.stationaryPolyNoiseCheck,'Value')
                                assignin('base','Signal5_sPoly_nHist',final_u);
                                handles.Summary5.Mean.Signal5_sPoly_nHist = mean(final_u);
                                handles.Summary5.Std.SampleRecord.Signal5_sPoly_nHist = std(final_u);
                            elseif get(handles.stationaryDetrendNoiseCheck,'Value')
                                assignin('base','Signal5_sDetr_nHist',final_u);
                                handles.Summary5.Mean.Signal5_sDetr_nHist = mean(final_u);
                                handles.Summary5.Std.SampleRecord.Signal5_sDetr_nHist = std(final_u);
                            else
                                assignin('base','Signal5_nHist',final_u);
                                handles.Summary5.Mean.Signal5_nHist = mean(final_u);
                                handles.Summary5.Std.SampleRecord.Signal5_nHist = std(final_u);
                            end
                    end
                end
                % Removing mean again and saving in temporary variable
                % which will be used in plotting checkbox panel
                final_u = final_u - mean(final_u);
                setappdata(0,'set_final',final_u);
        end
end
guidata(hObject,handles);% Updating gui object and handles


% --- Executes on button press in selectedNormHistoCheck.
function selectedNormHistoCheck_Callback(~, ~, handles)
% hObject    handle to selectedNormHistoCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting saved data from Normality menu and using it for plotting on axes 2
final_u = getappdata(0,'temp_u');
final_u = final_u - mean(final_u);
nbins = get(handles.binSizeNormInput,'String');
if isempty(nbins)
    errordlg('Enter number of bins','Plotting Denied');
    return;
end
nbins = str2double(nbins);
pd = fitdist(final_u','Normal');
step = (max(final_u)-min(final_u))/200;
x_pdf = (min(final_u):step:max(final_u));
y = pdf(pd,x_pdf);
axes(handles.normalityaxes2);
cla reset;
if get(handles.selectedNormHistoCheck,'Value')&&get(handles.selectedNormFitCheck,'Value')
    histogram(final_u,'Normalization','pdf','NumBins',nbins);
    title('Histogram distribution','FontName','Times');
    xlabel('\hspace{30em}\normalfont\bf{Bins}','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{pdf}','interpreter','latex');
    hold on
    plot(x_pdf,y,'linewidth',1.2);
elseif get(handles.selectedNormHistoCheck,'Value')
    histogram(final_u,'Normalization','pdf','NumBins',nbins);
    title('Histogram distribution','FontName','Times');
    xlabel('\hspace{30em}\normalfont\bf{Bins}','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{pdf}','interpreter','latex');
elseif get(handles.selectedNormFitCheck,'Value')
    plot(x_pdf,y,'linewidth',1.2);
    title('Probablity distribution','FontName','Times');
else
    cla reset;
end

% Hint: get(hObject,'Value') returns toggle state of selectedNormHistoCheck


% --- Executes on button press in selectedNormFitCheck.
function selectedNormFitCheck_Callback(~, ~, handles)
% hObject    handle to selectedNormFitCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting saved data from Normality menu and using it for plotting on axes 2
final_u = getappdata(0,'temp_u');
final_u = final_u - mean(final_u);
nbins = get(handles.binSizeNormInput,'String');
if isempty(nbins)
    errordlg('Enter number of bins','Plotting Denied');
    return;
end
nbins = str2double(nbins);
pd = fitdist(final_u','Normal');
step = (max(final_u)-min(final_u))/200;
x_pdf = (min(final_u):step:max(final_u));
y = pdf(pd,x_pdf);
axes(handles.normalityaxes2);
cla reset;
if get(handles.selectedNormHistoCheck,'Value')&&get(handles.selectedNormFitCheck,'Value')
    histogram(final_u,'Normalization','pdf','NumBins',nbins);
    title('Histogram distribution','FontName','Times');
    xlabel('\hspace{30em}\normalfont\bf{Bins}','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{pdf}','interpreter','latex');
    hold on
    plot(x_pdf,y,'linewidth',1.2);
elseif get(handles.selectedNormHistoCheck,'Value')
    histogram(final_u,'Normalization','pdf','NumBins',nbins);
    title('Histogram distribution','FontName','Times');
    xlabel('\hspace{30em}\normalfont\bf{Bins}','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{pdf}','interpreter','latex');
elseif get(handles.selectedNormFitCheck,'Value')
    plot(x_pdf,y,'linewidth',1.2);
    title('Probability distribution','FontName','Times');
else
    cla reset;
end
% Hint: get(hObject,'Value') returns toggle state of selectedNormFitCheck


% --- Executes on button press in selectedDataNormCheck.
function selectedDataNormCheck_Callback(~, ~, handles)
% hObject    handle to selectedDataNormCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting saved data from Normality menu and using it for plotting on axes 1
final_u = getappdata(0,'temp_u');
t = getappdata(0,'temp_t');
axes(handles.normalityaxes1);
cla reset;
if get(handles.selectedDataNormCheck,'Value')
    plot(t,final_u);
    title('Selected signal','FontName','Times');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{Signal}','interpreter','latex');
else
    cla reset;
end
% Hint: get(hObject,'Value') returns toggle state of selectedDataNormCheck



function binSizeNormInput_Callback(~, ~, ~)
% hObject    handle to binSizeNormInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of binSizeNormInput as text
%        str2double(get(hObject,'String')) returns contents of binSizeNormInput as a double


% --- Executes during object creation, after setting all properties.
function binSizeNormInput_CreateFcn(hObject, ~, ~)
% hObject    handle to binSizeNormInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function significanceNormInput_Callback(~, ~, ~)
% hObject    handle to significanceNormInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of significanceNormInput as text
%        str2double(get(hObject,'String')) returns contents of significanceNormInput as a double


% --- Executes during object creation, after setting all properties.
function significanceNormInput_CreateFcn(hObject, ~, ~)
% hObject    handle to significanceNormInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in originalDataNormPopup.
function originalDataNormPopup_Callback(~, ~, ~)
% hObject    handle to originalDataNormPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns originalDataNormPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from originalDataNormPopup


% --- Executes during object creation, after setting all properties.
function originalDataNormPopup_CreateFcn(hObject, ~, ~)
% hObject    handle to originalDataNormPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% % --- Executes on selection change in selectDataNormPopup.
% function selectDataNormPopup_Callback(~, ~, ~)
% % hObject    handle to selectDataNormPopup (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
%
% % Hints: contents = cellstr(get(hObject,'String')) returns selectDataNormPopup contents as cell array
% %        contents{get(hObject,'Value')} returns selected item from selectDataNormPopup
%
%
% % --- Executes during object creation, after setting all properties.
% function selectDataNormPopup_CreateFcn(hObject, ~, ~)
% % hObject    handle to selectDataNormPopup (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
%
% % Hint: popupmenu controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end


% --- Executes on button press in anotherDataNormPush.
function anotherDataNormPush_Callback(~, ~, handles)
% hObject    handle to anotherDataNormPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Push normality function for reseting the objects inorder toanalyse
% another data
array = [handles.originalDataNormPopup,handles.stationaryPolyNormCheck,handles.stationaryDetrendNormCheck,...
    handles.chauNormCheck,handles.histoNormCheck,handles.replacedNormCheck,handles.removedNormCheck];
set(array,'Enable','On');
set(handles.statisticsTable,'Data',[]);
set(handles.statisticsPanel,'title','Signal statistics');
array1 = [handles.selectedDataNormCheck,handles.selectedNormHistoCheck,handles.selectedNormFitCheck];
set(array1,'Value',0);
set(array1,'Enable','Off');
set(array1,'Visible','Off');
cla(handles.normalityaxes1,'reset');
cla(handles.normalityaxes2,'reset');
array2 = [handles.defaultBinNormRadio,handles.otherBinNormRadio];
set(array2,'Value',0);
set(handles.binSizeNormInput,'String','');


% --- Executes when selected object is changed in binSizeNormGroup.
function binSizeNormGroup_SelectionChangedFcn(~, ~, handles)
% hObject    handle to the selected object in binSizeNormGroup
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

str1 = get(handles.originalDataNormPopup, 'String');
val1 = get(handles.originalDataNormPopup,'Value');
if get(handles.stationaryPolyNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')
    axes(handles.normalityaxes2);
    cla reset;
    axes(handles.normalityaxes1);
    cla reset;
    legend(handles.normalityaxes1,'Off');
    legend(handles.normalityaxes2,'Off');
    set(handles.resultDisplay,'String','');
    errordlg('Select either stationary data obtained from Detrend or obtained from polynomial fit',...
        'Computation failed');
    return;
end
if get(handles.chauNormCheck,'Value')&&get(handles.histoNormCheck,'Value')
    axes(handles.normalityaxes2);
    cla reset;
    axes(handles.normalityaxes1);
    cla reset;
    legend(handles.normalityaxes1,'Off');
    legend(handles.normalityaxes2,'Off');
    set(handles.resultDisplay,'String','');
    errordlg('Select either clean data obtained from Chauvenet or obtained from histogram substitution',...
        'Computation failed');
    return;
end
if get(handles.replacedNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
    axes(handles.normalityaxes2);
    cla reset;
    axes(handles.normalityaxes1);
    cla reset;
    legend(handles.normalityaxes1,'Off');
    legend(handles.normalityaxes2,'Off');
    set(handles.resultDisplay,'String','');
    errordlg('Select either clean data obtained by ''removal'' or obtained by ''replacement'' method',...
        'Computation failed');
    return;
end
if (get(handles.replacedNormCheck,'Value')||get(handles.removedNormCheck,'Value'))
    if ~(get(handles.chauNormCheck,'Value')||get(handles.histoNormCheck,'Value'))
        axes(handles.normalityaxes2);
        cla reset;
        axes(handles.normalityaxes1);
        cla reset;
        legend(handles.normalityaxes1,'Off');
        legend(handles.normalityaxes2,'Off');
        set(handles.resultDisplay,'String','');
        errordlg('Select one of the clean data obtained from Chauvenet or obtained from histogram substitution',...
            'Computation failed');
        return;
    end
end
if (get(handles.chauNormCheck,'Value')||get(handles.histoNormCheck,'Value'))
    if ~(get(handles.removedNormCheck,'Value')||get(handles.replacedNormCheck,'Value'))
        axes(handles.normalityaxes2);
        cla reset;
        axes(handles.normalityaxes1);
        cla reset;
        legend(handles.normalityaxes1,'Off');
        legend(handles.normalityaxes2,'Off');
        set(handles.resultDisplay,'String','');
        errordlg('Select one of the clean data obtained by ''removal'' or obtained by ''replacement'' method',...
            'Computation failed');
        return;
    end
end
% Checking which signal is selected and storing it in final_u along with
% time vector for normality analysis
if strcmp(str1,'Signal 1')
    array1 = [handles.data5SummaryPanel,handles.data2SummaryPanel,handles.data3SummaryPanel,...
        handles.data4SummaryPanel];
    set(array1,'Visible','Off');
    set(handles.data1SummaryPanel,'Visible','On');
    
    if get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
            &&get(handles.removedNormCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sPoly_nChauRemo'',''var'')')
            final_u = evalin('base','Signal1_sPoly_nChauRemo');
            t = getappdata(0,'norm_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
            &&get(handles.removedNormCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sDetr_nChauRemo'',''var'')')
            final_u = evalin('base','Signal1_sDetr_nChauRemo');
            t = getappdata(0,'norm_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
            &&get(handles.removedNormCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sPoly_nHistRemo'',''var'')')
            final_u = evalin('base','Signal1_sPoly_nHistRemo');
            t = getappdata(0,'norm_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
            &&get(handles.removedNormCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sDetr_nHistRemo'',''var'')')
            final_u = evalin('base','Signal1_sDetr_nHistRemo');
            t = getappdata(0,'norm_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.histoNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_nHistRemo'',''var'')')
            final_u = evalin('base','Signal1_nHistRemo');
            t = getappdata(0,'norm_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.chauNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_nChauRemo'',''var'')')
            final_u = evalin('base','Signal1_nChauRemo');
            t = getappdata(0,'norm_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
            &&get(handles.replacedNormCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sPoly_nChau'',''var'')')
            final_u = evalin('base','Signal1_sPoly_nChau');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
            &&get(handles.replacedNormCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sDetr_nChau'',''var'')')
            final_u = evalin('base','Signal1_sDetr_nChau');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
            &&get(handles.replacedNormCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sPoly_nHist'',''var'')')
            final_u = evalin('base','Signal1_sPoly_nHist');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
            &&get(handles.replacedNormCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sDetr_nHist'',''var'')')
            final_u = evalin('base','Signal1_sDetr_nHist');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.histoNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_nHist'',''var'')')
            final_u = evalin('base','Signal1_nHist');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.chauNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_nChau'',''var'')')
            final_u = evalin('base','Signal1_nChau');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryPolyNormCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sPoly'',''var'')')
            final_u = evalin('base','Signal1_sPoly');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryDetrendNormCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sDetr'',''var'')')
            final_u = evalin('base','Signal1_sDetr');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal do not exist','Plotting denied');
            return;
        end
    else
        final_u = getappdata(0,'set_u1');
        t = getappdata(0,'set_t1');
    end
    
else
    switch str1{val1}
        case 'Signal 1'
            array1 = [handles.data5SummaryPanel,handles.data2SummaryPanel,handles.data3SummaryPanel,...
                handles.data4SummaryPanel];
            set(array1,'Visible','Off');
            set(handles.data1SummaryPanel,'Visible','On');
            
            if get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sPoly_nChauRemo'',''var'')')
                    final_u = evalin('base','Signal1_sPoly_nChauRemo');
                    t = getappdata(0,'norm_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sDetr_nChauRemo'',''var'')')
                    final_u = evalin('base','Signal1_sDetr_nChauRemo');
                    t = getappdata(0,'norm_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sPoly_nHistRemo'',''var'')')
                    final_u = evalin('base','Signal1_sPoly_nHistRemo');
                    t = getappdata(0,'norm_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sDetr_nHistRemo'',''var'')')
                    final_u = evalin('base','Signal1_sDetr_nHistRemo');
                    t = getappdata(0,'norm_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_nHistRemo'',''var'')')
                    final_u = evalin('base','Signal1_nHistRemo');
                    t = getappdata(0,'norm_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.chauNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_nChauRemo'',''var'')')
                    final_u = evalin('base','Signal1_nChauRemo');
                    t = getappdata(0,'norm_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sPoly_nChau'',''var'')')
                    final_u = evalin('base','Signal1_sPoly_nChau');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sDetr_nChau'',''var'')')
                    final_u = evalin('base','Signal1_sDetr_nChau');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sPoly_nHist'',''var'')')
                    final_u = evalin('base','Signal1_sPoly_nHist');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sDetr_nHist'',''var'')')
                    final_u = evalin('base','Signal1_sDetr_nHist');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_nHist'',''var'')')
                    final_u = evalin('base','Signal1_nHist');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.chauNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_nChau'',''var'')')
                    final_u = evalin('base','Signal1_nChau');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryPolyNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sPoly'',''var'')')
                    final_u = evalin('base','Signal1_sPoly');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryDetrendNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sDetr'',''var'')')
                    final_u = evalin('base','Signal1_sDetr');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal do not exist','Plotting denied');
                    return;
                end
            else
                final_u = getappdata(0,'set_u1');
                t = getappdata(0,'set_t1');
            end
        case 'Signal 2'
            array1 = [handles.data1SummaryPanel,handles.data5SummaryPanel,handles.data3SummaryPanel,...
                handles.data4SummaryPanel];
            set(array1,'Visible','Off');
            set(handles.data2SummaryPanel,'Visible','On');
            
            if get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sPoly_nChauRemo'',''var'')')
                    final_u = evalin('base','Signal2_sPoly_nChauRemo');
                    t = getappdata(0,'norm_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sDetr_nChauRemo'',''var'')')
                    final_u = evalin('base','Signal2_sDetr_nChauRemo');
                    t = getappdata(0,'norm_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sPoly_nHistRemo'',''var'')')
                    final_u = evalin('base','Signal2_sPoly_nHistRemo');
                    t = getappdata(0,'norm_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sDetr_nHistRemo'',''var'')')
                    final_u = evalin('base','Signal2_sDetr_nHistRemo');
                    t = getappdata(0,'norm_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_nHistRemo'',''var'')')
                    final_u = evalin('base','Signal2_nHistRemo');
                    t = getappdata(0,'norm_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.chauNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_nChauRemo'',''var'')')
                    final_u = evalin('base','Signal2_nChauRemo');
                    t = getappdata(0,'norm_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sPoly_nChau'',''var'')')
                    final_u = evalin('base','Signal2_sPoly_nChau');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sDetr_nChau'',''var'')')
                    final_u = evalin('base','Signal2_sDetr_nChau');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sPoly_nHist'',''var'')')
                    final_u = evalin('base','Signal2_sPoly_nHist');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sDetr_nHist'',''var'')')
                    final_u = evalin('base','Signal2_sDetr_nHist');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_nHist'',''var'')')
                    final_u = evalin('base','Signal2_nHist');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.chauNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_nChau'',''var'')')
                    final_u = evalin('base','Signal2_nChau');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryPolyNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sPoly'',''var'')')
                    final_u = evalin('base','Signal2_sPoly');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryDetrendNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sDetr'',''var'')')
                    final_u = evalin('base','Signal2_sDetr');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal do not exist','Plotting denied');
                    return;
                end
            else
                final_u = getappdata(0,'set_u2');
                t = getappdata(0,'set_t2');
            end
            
        case 'Signal 3'
            array1 = [handles.data1SummaryPanel,handles.data2SummaryPanel,handles.data5SummaryPanel,...
                handles.data4SummaryPanel];
            set(array1,'Visible','Off');
            set(handles.data3SummaryPanel,'Visible','On');
            
            if get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sPoly_nChauRemo'',''var'')')
                    final_u = evalin('base','Signal3_sPoly_nChauRemo');
                    t = getappdata(0,'norm_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sDetr_nChauRemo'',''var'')')
                    final_u = evalin('base','Signal3_sDetr_nChauRemo');
                    t = getappdata(0,'norm_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sPoly_nHistRemo'',''var'')')
                    final_u = evalin('base','Signal3_sPoly_nHistRemo');
                    t = getappdata(0,'norm_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sDetr_nHistRemo'',''var'')')
                    final_u = evalin('base','Signal3_sDetr_nHistRemo');
                    t = getappdata(0,'norm_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_nHistRemo'',''var'')')
                    final_u = evalin('base','Signal3_nHistRemo');
                    t = getappdata(0,'norm_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.chauNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_nChauRemo'',''var'')')
                    final_u = evalin('base','Signal3_nChauRemo');
                    t = getappdata(0,'norm_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sPoly_nChau'',''var'')')
                    final_u = evalin('base','Signal3_sPoly_nChau');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sDetr_nChau'',''var'')')
                    final_u = evalin('base','Signal3_sDetr_nChau');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sPoly_nHist'',''var'')')
                    final_u = evalin('base','Signal3_sPoly_nHist');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sDetr_nHist'',''var'')')
                    final_u = evalin('base','Signal3_sDetr_nHist');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_nHist'',''var'')')
                    final_u = evalin('base','Signal3_nHist');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.chauNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_nChau'',''var'')')
                    final_u = evalin('base','Signal3_nChau');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryPolyNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sPoly'',''var'')')
                    final_u = evalin('base','Signal3_sPoly');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryDetrendNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sDetr'',''var'')')
                    final_u = evalin('base','Signal3_sDetr');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal do not exist','Plotting denied');
                    return;
                end
            else
                final_u = getappdata(0,'set_u3');
                t = getappdata(0,'set_t3');
            end
            
        case 'Signal 4'
            array1 = [handles.data1SummaryPanel,handles.data2SummaryPanel,handles.data3SummaryPanel,...
                handles.data5SummaryPanel];
            set(array1,'Visible','Off');
            set(handles.data4SummaryPanel,'Visible','On');
            
            if get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sPoly_nChauRemo'',''var'')')
                    final_u = evalin('base','Signal4_sPoly_nChauRemo');
                    t = getappdata(0,'norm_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sDetr_nChauRemo'',''var'')')
                    final_u = evalin('base','Signal4_sDetr_nChauRemo');
                    t = getappdata(0,'norm_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sPoly_nHistRemo'',''var'')')
                    final_u = evalin('base','Signal4_sPoly_nHistRemo');
                    t = getappdata(0,'norm_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sDetr_nHistRemo'',''var'')')
                    final_u = evalin('base','Signal4_sDetr_nHistRemo');
                    t = getappdata(0,'norm_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_nHistRemo'',''var'')')
                    final_u = evalin('base','Signal4_nHistRemo');
                    t = getappdata(0,'norm_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.chauNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_nChauRemo'',''var'')')
                    final_u = evalin('base','Signal4_nChauRemo');
                    t = getappdata(0,'norm_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sPoly_nChau'',''var'')')
                    final_u = evalin('base','Signal4_sPoly_nChau');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sDetr_nChau'',''var'')')
                    final_u = evalin('base','Signal4_sDetr_nChau');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sPoly_nHist'',''var'')')
                    final_u = evalin('base','Signal4_sPoly_nHist');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sDetr_nHist'',''var'')')
                    final_u = evalin('base','Signal4_sDetr_nHist');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_nHist'',''var'')')
                    final_u = evalin('base','Signal4_nHist');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.chauNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_nChau'',''var'')')
                    final_u = evalin('base','Signal4_nChau');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryPolyNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sPoly'',''var'')')
                    final_u = evalin('base','Signal4_sPoly');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryDetrendNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sDetr'',''var'')')
                    final_u = evalin('base','Signal4_sDetr');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal do not exist','Plotting denied');
                    return;
                end
            else
                final_u = getappdata(0,'set_u4');
                t = getappdata(0,'set_t4');
            end
            
        case 'Signal 5'
            array1 = [handles.data1SummaryPanel,handles.data2SummaryPanel,handles.data3SummaryPanel,...
                handles.data4SummaryPanel];
            set(array1,'Visible','Off');
            set(handles.data5SummaryPanel,'Visible','On');
            
            if get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sPoly_nChauRemo'',''var'')')
                    final_u = evalin('base','Signal5_sPoly_nChauRemo');
                    t = getappdata(0,'norm_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sDetr_nChauRemo'',''var'')')
                    final_u = evalin('base','Signal5_sDetr_nChauRemo');
                    t = getappdata(0,'norm_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sPoly_nHistRemo'',''var'')')
                    final_u = evalin('base','Signal5_sPoly_nHistRemo');
                    t = getappdata(0,'norm_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sDetr_nHistRemo'',''var'')')
                    final_u = evalin('base','Signal5_sDetr_nHistRemo');
                    t = getappdata(0,'norm_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_nHistRemo'',''var'')')
                    final_u = evalin('base','Signal5_nHistRemo');
                    t = getappdata(0,'norm_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.chauNormCheck,'Value')&&get(handles.removedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_nChauRemo'',''var'')')
                    final_u = evalin('base','Signal5_nChauRemo');
                    t = getappdata(0,'norm_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sPoly_nChau'',''var'')')
                    final_u = evalin('base','Signal5_sPoly_nChau');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.chauNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sDetr_nChau'',''var'')')
                    final_u = evalin('base','Signal5_sDetr_nChau');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryPolyNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sPoly_nHist'',''var'')')
                    final_u = evalin('base','Signal5_sPoly_nHist');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.stationaryDetrendNormCheck,'Value')...
                    &&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sDetr_nHist'',''var'')')
                    final_u = evalin('base','Signal5_sDetr_nHist');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.histoNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_nHist'',''var'')')
                    final_u = evalin('base','Signal5_nHist');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.chauNormCheck,'Value')&&get(handles.replacedNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_nChau'',''var'')')
                    final_u = evalin('base','Signal5_nChau');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryPolyNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sPoly'',''var'')')
                    final_u = evalin('base','Signal5_sPoly');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryDetrendNormCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sDetr'',''var'')')
                    final_u = evalin('base','Signal5_sDetr');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal do not exist','Plotting denied');
                    return;
                end
            else
                final_u = getappdata(0,'set_u5');
                t = getappdata(0,'set_t5');
            end
            
    end
end
% Creating temporary variable for data and time vector which is used in
% plotting checkbox panel function
setappdata(0,'temp_t',t);
setappdata(0,'temp_u',final_u);
% Radio group for bin size required in normality menu
array = [handles.selectedDataNormCheck,handles.selectedNormHistoCheck,handles.selectedNormFitCheck];
set(array,'Enable','Off');
var = get(handles.binSizeNormGroup,'SelectedObject');
selection = get(var,'String');
switch selection
    case 'Default'
        width = 0.4*std(final_u);
        n = (max(final_u)-min(final_u))/width;
        n = floor(n);
        set(handles.binSizeNormInput,'String',num2str(n));
        set(handles.binSizeNormInput,'Enable','Off');
        array = [handles.originalDataNormPopup,handles.stationaryPolyNormCheck,handles.stationaryDetrendNormCheck,...
            handles.chauNormCheck,handles.histoNormCheck,handles.replacedNormCheck,handles.removedNormCheck];
        set(array,'Enable','Off');
    case 'Other'
        set(handles.binSizeNormInput,'Enable','On');
end


% --- Executes when selected object is changed in significanceNormGroup.
function significanceNormGroup_SelectionChangedFcn(~, ~, handles)
% hObject    handle to the selected object in significanceNormGroup
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Radio group for confidence level required in normality menu
array = [handles.selectedDataNormCheck,handles.selectedNormHistoCheck,handles.selectedNormFitCheck];
set(array,'Enable','Off');
var = get(handles.significanceNormGroup,'SelectedObject');
selection = get(var,'String');
switch selection
    case 'Default'
        n = 0.95;
        set(handles.significanceNormInput,'String',num2str(n));
        set(handles.significanceNormInput,'Enable','Off');
    case 'Other'
        set(handles.significanceNormInput,'Enable','On');
end


% --- Executes on button press in selectedDataPeriodicCheck.
function selectedDataPeriodicCheck_Callback(~, ~, handles)
% hObject    handle to selectedDataPeriodicCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting selected data, non periodic data and fitted sine wave from
% Periodicity menu and using it for plotting on axes 1

final_u = getappdata(0,'temp_u');
final_u = final_u - mean(final_u);
filtered_u = getappdata(0,'set_filter');
filtered_u = filtered_u - mean(filtered_u);
t = getappdata(0,'temp_t');
axes(handles.periodicaxes1);
cla reset;
if get(handles.selectedDataPeriodicCheck,'Value')&&get(handles.nonPeriodicCheck,'Value')
    plot(t,final_u,t,filtered_u);
    title('Selected signal','FontName','Times');
    legend('Selected Time Trace','Non-periodic Time Trace');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.selectedDataPeriodicCheck,'Value')
    plot(t,final_u);
    title('Selected signal','FontName','Times');
    legend('Selected Time Trace');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.nonPeriodicCheck,'Value')
    plot(t,filtered_u);
    title('Selected signal','FontName','Times');
    legend('Non-periodic Time Trace');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{Signal}','interpreter','latex');
else
    cla reset;
end
% Hint: get(hObject,'Value') returns toggle state of selectedDataPeriodicCheck



% --- Executes on button press in nonPeriodicCheck.
function nonPeriodicCheck_Callback(~, ~, handles)
% hObject    handle to nonPeriodicCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting selected data, non periodic data and fitted sine wave from
% Periodicity menu and using it for plotting on axes 1

final_u = getappdata(0,'temp_u');
final_u = final_u - mean(final_u);
filtered_u = getappdata(0,'set_filter');
filtered_u = filtered_u - mean(filtered_u);
t = getappdata(0,'temp_t');
axes(handles.periodicaxes1);
cla reset;
if get(handles.selectedDataPeriodicCheck,'Value')&&get(handles.nonPeriodicCheck,'Value')
    plot(t,final_u,t,filtered_u);
    title('Selected signal','FontName','Times');
    legend('Selected Time Trace','Non-periodic Time Trace');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.selectedDataPeriodicCheck,'Value')
    plot(t,final_u);
    title('Selected signal','FontName','Times');
    legend('Selected Time Trace');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{Signal}','interpreter','latex');
elseif get(handles.nonPeriodicCheck,'Value')
    plot(t,filtered_u);
    title('Selected signal','FontName','Times');
    legend('Non-periodic Time Trace');
    xlabel('\hspace{30em}\normalfont\bf{t[s]}','interpreter','latex');
    ylabel('\hspace{10em}\normalfont\bf{Signal}','interpreter','latex');
else
    cla reset;
end
% Hint: get(hObject,'Value') returns toggle state of nonPeriodicCheck


% --- Executes on button press in peakRemovedSpectrumCheck.
function peakRemovedSpectrumCheck_Callback(~, ~, handles)
% hObject    handle to peakRemovedSpectrumCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Power spectral density(pxx) and frequency obtained from
% Periodicity menu and using it for plotting on axes 2
pxx = getappdata(0,'set_p1');
f1 = getappdata(0,'set_f1');
pxx1 = getappdata(0,'set_p2');
f2 = getappdata(0,'set_f2');
[loca,peaks] = PeakSeek((pxx),[],mean((pxx)));
posit = peaks == max(peaks);
locs = loca(posit);
axes(handles.periodicaxes2);
cla reset;
if get(handles.peakRemovedSpectrumCheck,'Value')&&get(handles.selectedSpectrumCheck,'Value')
    semilogy(f1,(pxx),f2,(pxx1));
    title('Spectral Density','FontName','Times');
    hold on;
    xlabel('\hspace{30em}\normalfont\bf{f[Hz]}','interpreter','latex');
    legend('Selected signal spectrum','Non-periodic signal spectrum');
    semilogy(f1(locs),peaks(posit),'*','MarkerSize',5);
elseif get(handles.peakRemovedSpectrumCheck,'Value')
    semilogy(f2,(pxx1));
    title('Spectral Density','FontName','Times');
    xlabel('\hspace{30em}\normalfont\bf{f[Hz]}','interpreter','latex');
    legend('Non-periodic signal spectrum');
elseif get(handles.selectedSpectrumCheck,'Value')
    semilogy(f1,(pxx));
    title('Spectral Density','FontName','Times');
    hold on;
    xlabel('\hspace{30em}\normalfont\bf{f[Hz]}','interpreter','latex');
    legend('Selected signal spectrum');
    semilogy(f1(locs),peaks(posit),'*','MarkerSize',5);
else
    cla reset;
end

% Hint: get(hObject,'Value') returns toggle state of peakRemovedSpectrumCheck


% --- Executes on button press in selectedSpectrumCheck.
function selectedSpectrumCheck_Callback(~, ~, handles)
% hObject    handle to selectedSpectrumCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Power spectral density(pxx) and frequency obtained from
% Periodicity menu and using it for plotting on axes 2
pxx = getappdata(0,'set_p1');
f1 = getappdata(0,'set_f1');
pxx1 = getappdata(0,'set_p2');
f2 = getappdata(0,'set_f2');
[loca,peaks] = PeakSeek((pxx),[],mean((pxx)));
posit = peaks == max(peaks);
locs = loca(posit);
axes(handles.periodicaxes2);
cla reset;
if get(handles.peakRemovedSpectrumCheck,'Value')&&get(handles.selectedSpectrumCheck,'Value')
    semilogy(f1,(pxx),f2,(pxx1));
    title('Spectral Density','FontName','Times');
    hold on;
    xlabel('\hspace{30em}\normalfont\bf{f[Hz]}','interpreter','latex');
    legend('Selected signal spectrum','Non-periodic signal spectrum');
    semilogy(f1(locs),peaks(posit),'*','MarkerSize',5);
elseif get(handles.peakRemovedSpectrumCheck,'Value')
    semilogy(f2,(pxx1));
    title('Spectral Density','FontName','Times');
    xlabel('\hspace{30em}\normalfont\bf{f[Hz]}','interpreter','latex');
    legend('Non-periodic signal spectrum');
elseif get(handles.selectedSpectrumCheck,'Value')
    semilogy(f1,(pxx));
    title('Spectral Density','FontName','Times');
    hold on;
    xlabel('\hspace{30em}\normalfont\bf{f[Hz]}','interpreter','latex');
    legend('Selected signal spectrum');
    semilogy(f1(locs),peaks(posit),'*','MarkerSize',5);
else
    cla reset;
end
% Hint: get(hObject,'Value') returns toggle state of selectedSpectrumCheck


% --- Executes on selection change in originalDataPeriodicPopup.
function originalDataPeriodicPopup_Callback(~, ~, ~)
% hObject    handle to originalDataPeriodicPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns originalDataPeriodicPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from originalDataPeriodicPopup


% --- Executes during object creation, after setting all properties.
function originalDataPeriodicPopup_CreateFcn(hObject, ~, ~)
% hObject    handle to originalDataPeriodicPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% % --- Executes on selection change in selectDataPeriodicPopup.
% function selectDataPeriodicPopup_Callback(~, ~, ~)
% % hObject    handle to selectDataPeriodicPopup (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
%
% % Hints: contents = cellstr(get(hObject,'String')) returns selectDataPeriodicPopup contents as cell array
% %        contents{get(hObject,'Value')} returns selected item from selectDataPeriodicPopup
%
%
% % --- Executes during object creation, after setting all properties.
% function selectDataPeriodicPopup_CreateFcn(hObject, ~, ~)
% % hObject    handle to selectDataPeriodicPopup (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
%
% % Hint: popupmenu controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end


% --- Executes on button press in anotherDataPeriodicPush.
function anotherDataPeriodicPush_Callback(~, ~, handles)
% hObject    handle to anotherDataPeriodicPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Push function for reseting objects in Periodicity menu to default inorder
% to analyze another data
set(handles.discretePeriodicInput,'String','');
set(handles.discretePeriodicInput,'Enable','Off');
set(handles.defaultDiscreteRadio,'Value',0);
set(handles.otherDiscreteRadio,'Value',0);
array1 = [handles.yesRemovePerioButton,handles.noRemovePerioButton];
set(array1,'Value',0);
set(array1,'Enable','Off');
array2 = [handles.selectedDataPeriodicCheck,handles.nonPeriodicCheck,...
    handles.selectedSpectrumCheck,handles.peakRemovedSpectrumCheck];
set(array2,'Visible','Off');
set(array2,'Value',0);
set(array2,'Enable','Off');
check = [handles.originalDataPeriodicPopup,handles.stationaryPolyPeriodicCheck,handles.stationaryDetrendPeriodicCheck,...
    handles.noiselessChauPeriodicCheck,handles.noiselessHistoPeriodicCheck];
set(check,'Enable','On');
set(handles.statisticsTable,'Data',[]);
set(handles.statisticsPanel,'title','Signal statistics');
cla(handles.periodicaxes1,'reset');
cla(handles.periodicaxes2,'reset');
set(handles.resultDisplay,'String','');
array3 = [handles.scalePeriodicityInput,handles.minlimitPeriodicityInput,...
    handles.maxlimitPeriodicityInput,handles.appendPeriodicityInput];
set(array3,'Enable','Off');
set(array3,'String','');


function [locs,pks]=PeakSeek(x,minpeakdist,minpeakh)
% Alternative to the findpeaks function.  This thing runs much much faster.
% It really leaves findpeaks in the dust.  It also can handle ties between
% peaks.  Findpeaks just erases both in a tie.  Shame on findpeaks.
%
% x is a vector input (generally a timecourse)
% minpeakdist is the minimum desired distance between peaks (optional, defaults to 1)
% minpeakh is the minimum height of a peak (optional)
%
% (c) 2010
% Peter O'Connor
% peter<dot>ed<dot>oconnor .AT. gmail<dot>com

if size(x,2)==1, x=x'; end

% Find all maxima and ties
locs=find(x(2:end-1)>=x(1:end-2) & x(2:end-1)>=x(3:end))+1;

if nargin<2, minpeakdist=1; end % If no minpeakdist specified, default to 1.

if nargin>2 % If there's a minpeakheight
    locs(x(locs)<=minpeakh)=[];
end

if minpeakdist>1
    while 1
        
        del=diff(locs)<minpeakdist;
        
        if ~any(del), break; end
        
        pks=x(locs);
        
        [garb, mins]=min([pks(del) ; pks([false del])]); %#ok<ASGLU>
        
        deln=find(del);
        
        deln=[deln(mins==1) deln(mins==2)+1];
        
        locs(deln)=[];
        
    end
end

if nargout>1,
    pks=x(locs);
end



function divPeriodicInput_Callback(~, ~, ~)
% hObject    handle to divPeriodicInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of divPeriodicInput as text
%        str2double(get(hObject,'String')) returns contents of divPeriodicInput as a double


% --- Executes during object creation, after setting all properties.
function divPeriodicInput_CreateFcn(hObject, ~, ~)
% hObject    handle to divPeriodicInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function discretePeriodicInput_Callback(~, ~, ~)
% hObject    handle to discretePeriodicInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of discretePeriodicInput as text
%        str2double(get(hObject,'String')) returns contents of discretePeriodicInput as a double


% --- Executes during object creation, after setting all properties.
function discretePeriodicInput_CreateFcn(hObject, ~, ~)
% hObject    handle to discretePeriodicInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function overPeriodicInput_Callback(~, ~, ~)
% hObject    handle to overPeriodicInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of overPeriodicInput as text
%        str2double(get(hObject,'String')) returns contents of overPeriodicInput as a double


% --- Executes during object creation, after setting all properties.
function overPeriodicInput_CreateFcn(hObject, ~, ~)
% hObject    handle to overPeriodicInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in windowPopup.
function windowPopup_Callback(~, ~, ~)
% hObject    handle to windowPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns windowPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from windowPopup


% --- Executes during object creation, after setting all properties.
function windowPopup_CreateFcn(hObject, ~, ~)
% hObject    handle to windowPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in divPeriodicGroup.
function divPeriodicGroup_SelectionChangedFcn(~, ~, handles)
% hObject    handle to the selected object in divPeriodicGroup
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Division required for pwelch in Periodicity menu

var = get(handles.divPeriodicGroup,'SelectedObject');
selection = get(var,'String');
switch selection
    case 'Default'
        set(handles.divPeriodicInput,'String','8');
        set(handles.divPeriodicInput,'Enable','Off');
    case 'Other'
        set(handles.divPeriodicInput,'Enable','On');
end


% --- Executes when selected object is changed in overPeriodicGroup.
function overPeriodicGroup_SelectionChangedFcn(~, ~, handles)
% hObject    handle to the selected object in overPeriodicGroup
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Overlap of divisions required for pwelch in Periodicity menu

var = get(handles.overPeriodicGroup,'SelectedObject');
selection = get(var,'String');
switch selection
    case 'Default'
        set(handles.overPeriodicInput,'String','0.5');
        set(handles.overPeriodicInput,'Enable','Off');
    case 'Other'
        set(handles.overPeriodicInput,'Enable','On');
end


% --- Executes when selected object is changed in discretePeriodicGroup.
function discretePeriodicGroup_SelectionChangedFcn(~, ~, handles)
% hObject    handle to the selected object in discretePeriodicGroup
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str1 = get(handles.originalDataPeriodicPopup, 'String');
val1 = get(handles.originalDataPeriodicPopup,'Value');

% Getting the selected data,its time vector and its sampling frequency
% from the temporary variable
if strcmp(str1,'Signal 1')
    if get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sPoly_nChau'',''var'')')
            final_u = evalin('base','Signal1_sPoly_nChau');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sDetr_nChau'',''var'')')
            final_u = evalin('base','Signal1_sDetr_nChau');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sPoly_nHist'',''var'')')
            final_u = evalin('base','Signal1_sPoly_nHist');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sDetr_nHist'',''var'')')
            final_u = evalin('base','Signal1_sDetr_nHist');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessHistoPeriodicCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_nHist'',''var'')')
            final_u = evalin('base','Signal1_nHist');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessChauPeriodicCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_nChau'',''var'')')
            final_u = evalin('base','Signal1_nChau');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryPolyPeriodicCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sPoly'',''var'')')
            final_u = evalin('base','Signal1_sPoly');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryDetrendPeriodicCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sDetr'',''var'')')
            final_u = evalin('base','Signal1_sDetr');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    else
        final_u = getappdata(0,'set_u1');
        t = getappdata(0,'set_t1');
    end
    
else
    switch str1{val1}
        case 'Signal 1'
            if get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sPoly_nChau'',''var'')')
                    final_u = evalin('base','Signal1_sPoly_nChau');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sDetr_nChau'',''var'')')
                    final_u = evalin('base','Signal1_sDetr_nChau');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sPoly_nHist'',''var'')')
                    final_u = evalin('base','Signal1_sPoly_nHist');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sDetr_nHist'',''var'')')
                    final_u = evalin('base','Signal1_sDetr_nHist');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_nHist'',''var'')')
                    final_u = evalin('base','Signal1_nHist');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_nChau'',''var'')')
                    final_u = evalin('base','Signal1_nChau');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryPolyPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sPoly'',''var'')')
                    final_u = evalin('base','Signal1_sPoly');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryDetrendPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sDetr'',''var'')')
                    final_u = evalin('base','Signal1_sDetr');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            else
                final_u = getappdata(0,'set_u1');
                t = getappdata(0,'set_t1');
            end
            
        case 'Signal 2'
            if get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sPoly_nChau'',''var'')')
                    final_u = evalin('base','Signal2_sPoly_nChau');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sDetr_nChau'',''var'')')
                    final_u = evalin('base','Signal2_sDetr_nChau');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sPoly_nHist'',''var'')')
                    final_u = evalin('base','Signal2_sPoly_nHist');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sDetr_nHist'',''var'')')
                    final_u = evalin('base','Signal2_sDetr_nHist');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_nHist'',''var'')')
                    final_u = evalin('base','Signal2_nHist');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_nChau'',''var'')')
                    final_u = evalin('base','Signal2_nChau');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryPolyPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sPoly'',''var'')')
                    final_u = evalin('base','Signal2_sPoly');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryDetrendPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sDetr'',''var'')')
                    final_u = evalin('base','Signal2_sDetr');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            else
                final_u = getappdata(0,'set_u2');
                t = getappdata(0,'set_t2');
            end
            
        case 'Signal 3'
            if get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sPoly_nChau'',''var'')')
                    final_u = evalin('base','Signal3_sPoly_nChau');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sDetr_nChau'',''var'')')
                    final_u = evalin('base','Signal3_sDetr_nChau');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sPoly_nHist'',''var'')')
                    final_u = evalin('base','Signal3_sPoly_nHist');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sDetr_nHist'',''var'')')
                    final_u = evalin('base','Signal3_sDetr_nHist');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_nHist'',''var'')')
                    final_u = evalin('base','Signal3_nHist');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_nChau'',''var'')')
                    final_u = evalin('base','Signal3_nChau');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryPolyPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sPoly'',''var'')')
                    final_u = evalin('base','Signal3_sPoly');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryDetrendPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sDetr'',''var'')')
                    final_u = evalin('base','Signal3_sDetr');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            else
                final_u = getappdata(0,'set_u3');
                t = getappdata(0,'set_t3');
            end
            
        case 'Signal 4'
            if get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sPoly_nChau'',''var'')')
                    final_u = evalin('base','Signal4_sPoly_nChau');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sDetr_nChau'',''var'')')
                    final_u = evalin('base','Signal4_sDetr_nChau');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sPoly_nHist'',''var'')')
                    final_u = evalin('base','Signal4_sPoly_nHist');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sDetr_nHist'',''var'')')
                    final_u = evalin('base','Signal4_sDetr_nHist');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_nHist'',''var'')')
                    final_u = evalin('base','Signal4_nHist');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_nChau'',''var'')')
                    final_u = evalin('base','Signal4_nChau');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryPolyPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sPoly'',''var'')')
                    final_u = evalin('base','Signal4_sPoly');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryDetrendPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sDetr'',''var'')')
                    final_u = evalin('base','Signal4_sDetr');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            else
                final_u = getappdata(0,'set_u4');
                t = getappdata(0,'set_t4');
            end
            
        case 'Signal 5'
            if get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sPoly_nChau'',''var'')')
                    final_u = evalin('base','Signal5_sPoly_nChau');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sDetr_nChau'',''var'')')
                    final_u = evalin('base','Signal5_sDetr_nChau');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sPoly_nHist'',''var'')')
                    final_u = evalin('base','Signal5_sPoly_nHist');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sDetr_nHist'',''var'')')
                    final_u = evalin('base','Signal5_sDetr_nHist');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_nHist'',''var'')')
                    final_u = evalin('base','Signal5_nHist');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_nChau'',''var'')')
                    final_u = evalin('base','Signal5_nChau');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryPolyPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sPoly'',''var'')')
                    final_u = evalin('base','Signal5_sPoly');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryDetrendPeriodicCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sDetr'',''var'')')
                    final_u = evalin('base','Signal5_sDetr');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            else
                final_u = getappdata(0,'set_u5');
                t = getappdata(0,'set_t5');
            end
            
    end
end
setappdata(0,'temp_u',final_u);
setappdata(0,'temp_t',t);

N = length(final_u);

% Discrete fourier transform points required for pwelch in Periodicity menu
var = get(handles.discretePeriodicGroup,'SelectedObject');
selection = get(var,'String');
switch selection
    case 'Default'
        nfft = max(256,0.1*N);
        set(handles.discretePeriodicInput,'String',num2str(round(nfft)));
        set(handles.discretePeriodicInput,'Enable','Off');
    case 'Other'
        set(handles.discretePeriodicInput,'Enable','On');
end


% --- Executes on selection change in originalDataSpectralPopup.
function originalDataSpectralPopup_Callback(~, ~, ~)
% hObject    handle to originalDataSpectralPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns originalDataSpectralPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from originalDataSpectralPopup


% --- Executes during object creation, after setting all properties.
function originalDataSpectralPopup_CreateFcn(hObject, ~, ~)
% hObject    handle to originalDataSpectralPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% % --- Executes on selection change in selectDataSpectralPopup.
% function selectDataSpectralPopup_Callback(~, ~, ~)
% % hObject    handle to selectDataSpectralPopup (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
%
% % Hints: contents = cellstr(get(hObject,'String')) returns selectDataSpectralPopup contents as cell array
% %        contents{get(hObject,'Value')} returns selected item from selectDataSpectralPopup
%
%
% % --- Executes during object creation, after setting all properties.
% function selectDataSpectralPopup_CreateFcn(hObject, ~, ~)
% % hObject    handle to selectDataSpectralPopup (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
%
% % Hint: popupmenu controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end


% --- Executes on button press in anotherDataSpectralPush.
function anotherDataSpectralPush_Callback(~, ~, handles)
% hObject    handle to anotherDataSpectralPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Push function for resetting all the objects to default inorder to analyse
% another data
array2 = [handles.spectralDistriPlotCheck,handles.autoPlotCheck,handles.integralTimeText,handles.integralText...
    handles.integralTimeUnit,handles.integralTimeScaleUnit,handles.integralTimeDisplay,handles.integralDisplay,handles.integralHover];
set(array2,'Visible','Off');
check = [handles.stationaryPolySpectralCheck,handles.stationaryDetrendSpectralCheck,handles.noiselessChauSpectralCheck,...
    handles.noiselessHistoSpectralCheck,handles.nonperiodicSpectralCheck];
set(check,'Enable','On');
handle = [handles.autoDefaultSpectralButton,handles.autoOtherSpectralButton,...
    handles.defaultDiscSpectralButton,handles.otherDiscSpectralButton];
set(handle,'Value',0);
set(handles.autoSpectralInput,'String','');
set(handles.autoSpectralInput,'Enable','Off');
set(handles.discreteSpectralInput,'String','');
set(handles.discreteSpectralInput,'Enable','Off');
set(handles.originalDataSpectralPopup,'Enable','On');
set(handles.statisticsTable,'Data',[]);
set(handles.statisticsPanel,'title','Signal statistics');
cla(handles.spectralaxes1,'reset');
cla(handles.spectralaxes2,'reset');


% --- Executes on button press in autoPlotCheck.
function autoPlotCheck_Callback(~, ~, ~)
% hObject    handle to autoPlotCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of autoPlotCheck


% --- Executes on button press in spectralDistriPlotCheck.
function spectralDistriPlotCheck_Callback(~, ~, ~)
% hObject    handle to spectralDistriPlotCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of spectralDistriPlotCheck


% --- Executes on slider movement.
function spectralSlider_Callback(hObject, ~, handles)
% hObject    handle to spectralSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Slider function for computing the Integral time scale when the slider is
% used, thereafter updating the summary struct and summary table

filtered_u = getappdata(0,'temp_u');
fs = getappdata(0,'temp_f');
if ~convert(get(handles.integralDisplay,'Visible'))
    errordlg('Run the Analysis to generate the plot','Computation Denied');
    return;
end
% mean_fi = mean(filtered_u);
% filtered_u = filtered_u - mean_fi;
N = length(filtered_u);
acor_new = getappdata(0,'set_acor_new');
lag = getappdata(0,'set_lag');
id = get(handles.spectralSlider,'Value');
temp = 1:length(lag);
[~,index] = min(abs(temp-id)); % Setting the index to nearest integer
id3 = index;
tau = lag/fs;
axes(handles.spectralaxes2);
cla reset;
plot(tau,acor_new);
xlim([tau(1), tau(end)]);
title('Autocorrelation coefficient','FontName','Times');
hold on;
grid on;
% Vertical line on the auto correlation plot upto which the integral time is computed
h2 = line([tau(id3),tau(id3)],[0,acor_new(id3)]);
set(h2,'Color','r')
% Marker on the autocorrelation curve upto which the integral time is computed
plot(tau(id3),acor_new(id3),'o','markersize',3);
% Coloring the area under the curve
area(tau(1:id3),acor_new(1:id3),'Facecolor',[0 0.75 0.75]);
xlabel('$$\hspace{30em}\normalfont\bf\tau{[s]}$$','interpreter','latex');
if id3 == 1
    Int2 = 0;
else
    Int2 = trapz(tau(1:id3),abs(acor_new(1:id3))); % Computing integral time scale
end
set(handles.integralDisplay,'String',num2str(Int2));
set(handles.integralTimeDisplay,'String',num2str(tau(id3)));
set(handles.spectralSlider,'Value',(id3));

Time = N/fs;
dt = 1/fs;
if dt < 2*Int2
    Neff = round(Time/(2*Int2));
else
    Neff = N;
end

std_sample = std(filtered_u);
std_mean = std_sample/sqrt(Neff);
    
% Updating struct and summary table
str1 = get(handles.originalDataSpectralPopup, 'String');
val1 = get(handles.originalDataSpectralPopup,'Value');
if strcmp(str1,'Signal 1')
    handles.Summary1.IntegralTimeScale = Int2;
    handles.Summary1.AutocorrelationCoefficient.Rho = acor_new;
    handles.Summary1.AutocorrelationCoefficient.Tau = tau;
    assignin('base','Signal1_Auto_Rho',acor_new);
    assignin('base','Signal1_Auto_Tau',tau);
    data = get(handles.data1SummaryTable,'Data');
    dataCol = cellstr(data(:,2));
    dataCol(6) = cellstr(num2str(Int2));
    data(:,2) = dataCol;
    set(handles.data1SummaryTable,'Data',data);
    
    if get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
            get(handles.nonperiodicSpectralCheck,'Value')
        handles.Summary1.Std.Mean.Signal1_sPoly_nChau_np = std_mean;
    elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
            get(handles.nonperiodicSpectralCheck,'Value')
        handles.Summary1.Std.Mean.Signal1_sDetr_nChau_np = std_mean;
    elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
            get(handles.nonperiodicSpectralCheck,'Value')
        handles.Summary1.Std.Mean.Signal1_sPoly_nHisto_np = std_mean;
    elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
            get(handles.nonperiodicSpectralCheck,'Value')
        handles.Summary1.Std.Mean.Signal1_sDetr_nHisto_np = std_mean;
    elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
        handles.Summary1.Std.Mean.Signal1_nHisto_np = std_mean;
    elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
        handles.Summary1.Std.Mean.Signal1_nChau_np = std_mean;
    elseif get(handles.stationaryPolySpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
        handles.Summary1.Std.Mean.Signal1_sPoly_np = std_mean;
    elseif get(handles.stationaryDetrendSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
        handles.Summary1.Std.Mean.Signal1_sDetr_np = std_mean;
    elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
        handles.Summary1.Std.Mean.Signal1_sPoly_nChau = std_mean;
    elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
        handles.Summary1.Std.Mean.Signal1_sDetr_nChau = std_mean;
    elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
        handles.Summary1.Std.Mean.Signal1_sPoly_nHisto = std_mean;
    elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
        handles.Summary1.Std.Mean.Signal1_sDetr_nHisto = std_mean;
    elseif get(handles.noiselessChauSpectralCheck,'Value')
        handles.Summary1.Std.Mean.Signal1_nChau = std_mean;
    elseif get(handles.noiselessHistoSpectralCheck,'Value')
        handles.Summary1.Std.Mean.Signal1_nHisto = std_mean;
    elseif get(handles.stationaryDetrendSpectralCheck,'Value')
        handles.Summary1.Std.Mean.Signal1_sDetr = std_mean;
    elseif get(handles.stationaryPolySpectralCheck,'Value')
        handles.Summary1.Std.Mean.Signal1_sPoly = std_mean;
    elseif get(handles.nonperiodicSpectralCheck,'Value')
        handles.Summary1.Std.Mean.Signal1_np = std_mean;
    else
        handles.Summary1.Std.Mean.Signal1 = std_mean;
    end
else
    switch str1{val1}
        case 'Signal 1'
            handles.Summary1.IntegralTimeScale = Int2;
            handles.Summary1.AutocorrelationCoefficient.Rho = acor_new;
            handles.Summary1.AutocorrelationCoefficient.Tau = tau;
            assignin('base','Signal1_Auto_Rho',acor_new);
            assignin('base','Signal1_Auto_Tau',tau);
            data = get(handles.data1SummaryTable,'Data');
            dataCol = cellstr(data(:,2));
            dataCol(6) = cellstr(num2str(Int2));
            data(:,2) = dataCol;
            set(handles.data1SummaryTable,'Data',data);
            if get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary1.Std.Mean.Signal1_sPoly_nChau_np = std_mean;
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary1.Std.Mean.Signal1_sDetr_nChau_np = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary1.Std.Mean.Signal1_sPoly_nHisto_np = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary1.Std.Mean.Signal1_sDetr_nHisto_np = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary1.Std.Mean.Signal1_nHisto_np = std_mean;
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary1.Std.Mean.Signal1_nChau_np = std_mean;
            elseif get(handles.stationaryPolySpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary1.Std.Mean.Signal1_sPoly_np = std_mean;
            elseif get(handles.stationaryDetrendSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary1.Std.Mean.Signal1_sDetr_np = std_mean;
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                handles.Summary1.Std.Mean.Signal1_sPoly_nChau = std_mean;
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                handles.Summary1.Std.Mean.Signal1_sDetr_nChau = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                handles.Summary1.Std.Mean.Signal1_sPoly_nHisto = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                handles.Summary1.Std.Mean.Signal1_sDetr_nHisto = std_mean;
            elseif get(handles.noiselessChauSpectralCheck,'Value')
                handles.Summary1.Std.Mean.Signal1_nChau = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')
                handles.Summary1.Std.Mean.Signal1_nHisto = std_mean;
            elseif get(handles.stationaryDetrendSpectralCheck,'Value')
                handles.Summary1.Std.Mean.Signal1_sDetr = std_mean;
            elseif get(handles.stationaryPolySpectralCheck,'Value')
                handles.Summary1.Std.Mean.Signal1_sPoly = std_mean;
            elseif get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary1.Std.Mean.Signal1_np = std_mean;
            else
                handles.Summary1.Std.Mean.Signal1 = std_mean;
            end
        case 'Signal 2'
            handles.Summary2.IntegralTimeScale = Int2;
            handles.Summary2.AutocorrelationCoefficient.Rho = acor_new;
            handles.Summary2.AutocorrelationCoefficient.Tau = tau;
            assignin('base','Signal2_Auto_Rho',acor_new);
            assignin('base','Signal2_Auto_Tau',tau);
            data = get(handles.data2SummaryTable,'Data');
            dataCol = cellstr(data(:,2));
            dataCol(6) = cellstr(num2str(Int2));
            data(:,2) = dataCol;
            set(handles.data2SummaryTable,'Data',data);
            if get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary2.Std.Mean.Signal2_sPoly_nChau_np = std_mean;
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary2.Std.Mean.Signal2_sDetr_nChau_np = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary2.Std.Mean.Signal2_sPoly_nHisto_np = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary2.Std.Mean.Signal2_sDetr_nHisto_np = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary2.Std.Mean.Signal2_nHisto_np = std_mean;
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary2.Std.Mean.Signal2_nChau_np = std_mean;
            elseif get(handles.stationaryPolySpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary2.Std.Mean.Signal2_sPoly_np = std_mean;
            elseif get(handles.stationaryDetrendSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary2.Std.Mean.Signal2_sDetr_np = std_mean;
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                handles.Summary2.Std.Mean.Signal2_sPoly_nChau = std_mean;
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                handles.Summary2.Std.Mean.Signal2_sDetr_nChau = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                handles.Summary2.Std.Mean.Signal2_sPoly_nHisto = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                handles.Summary2.Std.Mean.Signal2_sDetr_nHisto = std_mean;
            elseif get(handles.noiselessChauSpectralCheck,'Value')
                handles.Summary2.Std.Mean.Signal2_nChau = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')
                handles.Summary2.Std.Mean.Signal2_nHisto = std_mean;
            elseif get(handles.stationaryDetrendSpectralCheck,'Value')
                handles.Summary2.Std.Mean.Signal2_sDetr = std_mean;
            elseif get(handles.stationaryPolySpectralCheck,'Value')
                handles.Summary2.Std.Mean.Signal2_sPoly = std_mean;
            elseif get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary2.Std.Mean.Signal2_np = std_mean;
            else
                handles.Summary2.Std.Mean.Signal2 = std_mean;
            end
        case 'Signal 3'
            handles.Summary3.IntegralTimeScale = Int2;
            handles.Summary3.AutocorrelationCoefficient.Rho = acor_new;
            handles.Summary3.AutocorrelationCoefficient.Tau = tau;
            assignin('base','Signal3_Auto_Rho',acor_new);
            assignin('base','Signal3_Auto_Tau',tau);
            data = get(handles.data3SummaryTable,'Data');
            dataCol = cellstr(data(:,2));
            dataCol(6) = cellstr(num2str(Int2));
            data(:,2) = dataCol;
            set(handles.data3SummaryTable,'Data',data);
            if get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary3.Std.Mean.Signal3_sPoly_nChau_np = std_mean;
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary3.Std.Mean.Signal3_sDetr_nChau_np = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary3.Std.Mean.Signal3_sPoly_nHisto_np = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary3.Std.Mean.Signal3_sDetr_nHisto_np = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary3.Std.Mean.Signal3_nHisto_np = std_mean;
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary3.Std.Mean.Signal3_nChau_np = std_mean;
            elseif get(handles.stationaryPolySpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary3.Std.Mean.Signal3_sPoly_np = std_mean;
            elseif get(handles.stationaryDetrendSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary3.Std.Mean.Signal3_sDetr_np = std_mean;
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                handles.Summary3.Std.Mean.Signal3_sPoly_nChau = std_mean;
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                handles.Summary3.Std.Mean.Signal3_sDetr_nChau = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                handles.Summary3.Std.Mean.Signal3_sPoly_nHisto = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                handles.Summary3.Std.Mean.Signal3_sDetr_nHisto = std_mean;
            elseif get(handles.noiselessChauSpectralCheck,'Value')
                handles.Summary3.Std.Mean.Signal3_nChau = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')
                handles.Summary3.Std.Mean.Signal3_nHisto = std_mean;
            elseif get(handles.stationaryDetrendSpectralCheck,'Value')
                handles.Summary3.Std.Mean.Signal3_sDetr = std_mean;
            elseif get(handles.stationaryPolySpectralCheck,'Value')
                handles.Summary3.Std.Mean.Signal3_sPoly = std_mean;
            elseif get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary3.Std.Mean.Signal3_np = std_mean;
            else
                handles.Summary3.Std.Mean.Signal3 = std_mean;
            end
        case 'Signal 4'
            handles.Summary4.IntegralTimeScale = Int2;
            handles.Summary4.AutocorrelationCoefficient.Rho = acor_new;
            handles.Summary4.AutocorrelationCoefficient.Tau = tau;
            assignin('base','Signal4_Auto_Rho',acor_new);
            assignin('base','Signal4_Auto_Tau',tau);
            data = get(handles.data4SummaryTable,'Data');
            dataCol = cellstr(data(:,2));
            dataCol(6) = cellstr(num2str(Int2));
            data(:,2) = dataCol;
            set(handles.data4SummaryTable,'Data',data);
            if get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary4.Std.Mean.Signal4_sPoly_nChau_np = std_mean;
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary4.Std.Mean.Signal4_sDetr_nChau_np = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary4.Std.Mean.Signal4_sPoly_nHisto_np = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary4.Std.Mean.Signal4_sDetr_nHisto_np = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary4.Std.Mean.Signal4_nHisto_np = std_mean;
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary4.Std.Mean.Signal4_nChau_np = std_mean;
            elseif get(handles.stationaryPolySpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary4.Std.Mean.Signal4_sPoly_np = std_mean;
            elseif get(handles.stationaryDetrendSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary4.Std.Mean.Signal4_sDetr_np = std_mean;
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                handles.Summary4.Std.Mean.Signal4_sPoly_nChau = std_mean;
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                handles.Summary4.Std.Mean.Signal4_sDetr_nChau = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                handles.Summary4.Std.Mean.Signal4_sPoly_nHisto = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                handles.Summary4.Std.Mean.Signal4_sDetr_nHisto = std_mean;
            elseif get(handles.noiselessChauSpectralCheck,'Value')
                handles.Summary4.Std.Mean.Signal4_nChau = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')
                handles.Summary4.Std.Mean.Signal4_nHisto = std_mean;
            elseif get(handles.stationaryDetrendSpectralCheck,'Value')
                handles.Summary4.Std.Mean.Signal4_sDetr = std_mean;
            elseif get(handles.stationaryPolySpectralCheck,'Value')
                handles.Summary4.Std.Mean.Signal4_sPoly = std_mean;
            elseif get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary4.Std.Mean.Signal4_np = std_mean;
            else
                handles.Summary4.Std.Mean.Signal4 = std_mean;
            end
        case 'Signal 5'
            handles.Summary5.IntegralTimeScale = Int2;
            handles.Summary5.AutocorrelationCoefficient.Rho = acor_new;
            handles.Summary5.AutocorrelationCoefficient.Tau = tau;
            assignin('base','Signal5_Auto_Rho',acor_new);
            assignin('base','Signal5_Auto_Tau',tau);
            data = get(handles.data5SummaryTable,'Data');
            dataCol = cellstr(data(:,2));
            dataCol(6) = cellstr(num2str(Int2));
            data(:,2) = dataCol;
            set(handles.data5SummaryTable,'Data',data);
            if get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary5.Std.Mean.Signal5_sPoly_nChau_np = std_mean;
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary5.Std.Mean.Signal5_sDetr_nChau_np = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary5.Std.Mean.Signal5_sPoly_nHisto_np = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary5.Std.Mean.Signal5_sDetr_nHisto_np = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary5.Std.Mean.Signal5_nHisto_np = std_mean;
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary5.Std.Mean.Signal5_nChau_np = std_mean;
            elseif get(handles.stationaryPolySpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary5.Std.Mean.Signal5_sPoly_np = std_mean;
            elseif get(handles.stationaryDetrendSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary5.Std.Mean.Signal5_sDetr_np = std_mean;
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                handles.Summary5.Std.Mean.Signal5_sPoly_nChau = std_mean;
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                handles.Summary5.Std.Mean.Signal5_sDetr_nChau = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                handles.Summary5.Std.Mean.Signal5_sPoly_nHisto = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                handles.Summary5.Std.Mean.Signal5_sDetr_nHisto = std_mean;
            elseif get(handles.noiselessChauSpectralCheck,'Value')
                handles.Summary5.Std.Mean.Signal5_nChau = std_mean;
            elseif get(handles.noiselessHistoSpectralCheck,'Value')
                handles.Summary5.Std.Mean.Signal5_nHisto = std_mean;
            elseif get(handles.stationaryDetrendSpectralCheck,'Value')
                handles.Summary5.Std.Mean.Signal5_sDetr = std_mean;
            elseif get(handles.stationaryPolySpectralCheck,'Value')
                handles.Summary5.Std.Mean.Signal5_sPoly = std_mean;
            elseif get(handles.nonperiodicSpectralCheck,'Value')
                handles.Summary5.Std.Mean.Signal5_np = std_mean;
            else
                handles.Summary5.Std.Mean.Signal5 = std_mean;
            end
    end
end

guidata(hObject,handles); % Updating gui object and handles
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function spectralSlider_CreateFcn(hObject, ~, ~)
% hObject    handle to spectralSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function divisionSpectralInput_Callback(~, ~, ~)
% hObject    handle to divisionSpectralInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of divisionSpectralInput as text
%        str2double(get(hObject,'String')) returns contents of divisionSpectralInput as a double


% --- Executes during object creation, after setting all properties.
function divisionSpectralInput_CreateFcn(hObject, ~, ~)
% hObject    handle to divisionSpectralInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function discreteSpectralInput_Callback(~, ~, ~)
% hObject    handle to discreteSpectralInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of discreteSpectralInput as text
%        str2double(get(hObject,'String')) returns contents of discreteSpectralInput as a double


% --- Executes during object creation, after setting all properties.
function discreteSpectralInput_CreateFcn(hObject, ~, ~)
% hObject    handle to discreteSpectralInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function overSpectralInput_Callback(~, ~, ~)
% hObject    handle to overSpectralInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of overSpectralInput as text
%        str2double(get(hObject,'String')) returns contents of overSpectralInput as a double


% --- Executes during object creation, after setting all properties.
function overSpectralInput_CreateFcn(hObject, ~, ~)
% hObject    handle to overSpectralInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in windowSpectralPopup.
function windowSpectralPopup_Callback(~, ~, ~)
% hObject    handle to windowSpectralPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns windowSpectralPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from windowSpectralPopup


% --- Executes during object creation, after setting all properties.
function windowSpectralPopup_CreateFcn(hObject, ~, ~)
% hObject    handle to windowSpectralPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in divisionSpectralGroup.
function divisionSpectralGroup_SelectionChangedFcn(~, ~, handles)
% hObject    handle to the selected object in divisionSpectralGroup
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Division of data for pwelch in Spectral Analysis menu

var = get(handles.divisionSpectralGroup,'SelectedObject');
selection = get(var,'String');
switch selection
    case 'Default'
        set(handles.divisionSpectralInput,'String','8');
        set(handles.divisionSpectralInput,'Enable','Off');
    case 'Other'
        set(handles.divisionSpectralInput,'Enable','On');
end


% --- Executes when selected object is changed in overSpectralGroup.
function overSpectralGroup_SelectionChangedFcn(~, ~, handles)
% hObject    handle to the selected object in overSpectralGroup
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Overlap of the datas for pwelch in Spectral Analysis menu
var = get(handles.overSpectralGroup,'SelectedObject');
selection = get(var,'String');
switch selection
    case 'Default'
        set(handles.overSpectralInput,'String','0.5');
        set(handles.overSpectralInput,'Enable','Off');
    case 'Other'
        set(handles.overSpectralInput,'Enable','On');
end

% --- Executes when selected object is changed in discreteSpectralGroup.
function discreteSpectralGroup_SelectionChangedFcn(~, ~, handles)
% hObject    handle to the selected object in discreteSpectralGroup
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.stationaryPolySpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
    axes(handles.spectralaxes2);
    cla reset;
    axes(handles.spectralaxes1);
    cla reset;
    legend(handles.spectralaxes1,'Off');
    legend(handles.spectralaxes2,'Off');
    set(handles.resultDisplay,'String','');
    errordlg('Select either stationary data obtained from Detrend or obtained from polynomial fit',...
        'Computation failed');
    return;
end
if get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.noiselessHistoSpectralCheck,'Value')
    axes(handles.spectralaxes2);
    cla reset;
    axes(handles.spectralaxes1);
    cla reset;
    legend(handles.spectralaxes1,'Off');
    legend(handles.spectralaxes2,'Off');
    set(handles.resultDisplay,'String','');
    errordlg('Select either noiseless data obtained from Chauvenet or obtained from histogram substitution',...
        'Computation failed');
    return;
end
str1 = get(handles.originalDataSpectralPopup,'String');
val1 = get(handles.originalDataSpectralPopup,'Value');
if strcmp(str1,'Signal 1')
    array1 = [handles.data5SummaryPanel,handles.data2SummaryPanel,handles.data3SummaryPanel,...
        handles.data4SummaryPanel];
    set(array1,'Visible','Off');
    set(handles.data1SummaryPanel,'Visible','On');
    fs = str2double(get(handles.sampling1Input,'String'));
    
    if get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
            get(handles.nonperiodicSpectralCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sPoly_nChau_np'',''var'')')
            filtered_u = evalin('base','Signal1_sPoly_nChau_np');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
            get(handles.nonperiodicSpectralCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sDetr_nChau_np'',''var'')')
            filtered_u = evalin('base','Signal1_sDetr_nChau_np');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
            get(handles.nonperiodicSpectralCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sPoly_nHist_np'',''var'')')
            filtered_u = evalin('base','Signal1_sPoly_nHist_np');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
            get(handles.nonperiodicSpectralCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sDetr_nHist_np'',''var'')')
            filtered_u = evalin('base','Signal1_sDetr_nHist_np');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_nHist_np'',''var'')')
            filtered_u = evalin('base','Signal1_nHist_np');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_nChau_np'',''var'')')
            filtered_u = evalin('base','Signal1_nChau_np');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryPolySpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sPoly_np'',''var'')')
            filtered_u = evalin('base','Signal1_sPoly_np');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryDetrendSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sDetr_np'',''var'')')
            filtered_u = evalin('base','Signal1_sDetr_np');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sPoly_nChau'',''var'')')
            filtered_u = evalin('base','Signal1_sPoly_nChau');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sDetr_nChau'',''var'')')
            filtered_u = evalin('base','Signal1_sDetr_nChau');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sPoly_nHist'',''var'')')
            filtered_u = evalin('base','Signal1_sPoly_nHist');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sDetr_nHist'',''var'')')
            filtered_u = evalin('base','Signal1_sDetr_nHist');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessChauSpectralCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_nChau'',''var'')')
            filtered_u = evalin('base','Signal1_nChau');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessHistoSpectralCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_nHist'',''var'')')
            filtered_u = evalin('base','Signal1_nHist');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryDetrendSpectralCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sDetr'',''var'')')
            filtered_u = evalin('base','Signal1_sDetr');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryPolySpectralCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_sPoly'',''var'')')
            filtered_u = evalin('base','Signal1_sPoly');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    elseif get(handles.nonperiodicSpectralCheck,'Value')
        if evalin( 'base', 'exist(''Signal1_np'',''var'')')
            filtered_u = evalin('base','Signal1_np');
            t = getappdata(0,'set_t1');
        else
            errordlg('The requested signal does not exist','Plotting denied');
            return;
        end
    else
        filtered_u = getappdata(0,'set_u1');
        t = getappdata(0,'set_t1');
    end
    
else
    switch str1{val1}
        case 'Signal 1'
            array1 = [handles.data5SummaryPanel,handles.data2SummaryPanel,handles.data3SummaryPanel,...
                handles.data4SummaryPanel];
            set(array1,'Visible','Off');
            set(handles.data1SummaryPanel,'Visible','On');
            fs = str2double(get(handles.sampling1Input,'String'));
            
            if get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sPoly_nChau_np'',''var'')')
                    filtered_u = evalin('base','Signal1_sPoly_nChau_np');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sDetr_nChau_np'',''var'')')
                    filtered_u = evalin('base','Signal1_sDetr_nChau_np');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sPoly_nHist_np'',''var'')')
                    filtered_u = evalin('base','Signal1_sPoly_nHist_np');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sDetr_nHist_np'',''var'')')
                    filtered_u = evalin('base','Signal1_sDetr_nHist_np');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_nHist_np'',''var'')')
                    filtered_u = evalin('base','Signal1_nHist_np');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_nChau_np'',''var'')')
                    filtered_u = evalin('base','Signal1_nChau_np');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryPolySpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sPoly_np'',''var'')')
                    filtered_u = evalin('base','Signal1_sPoly_np');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryDetrendSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sDetr_np'',''var'')')
                    filtered_u = evalin('base','Signal1_sDetr_np');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sPoly_nChau'',''var'')')
                    filtered_u = evalin('base','Signal1_sPoly_nChau');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sDetr_nChau'',''var'')')
                    filtered_u = evalin('base','Signal1_sDetr_nChau');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sPoly_nHist'',''var'')')
                    filtered_u = evalin('base','Signal1_sPoly_nHist');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sDetr_nHist'',''var'')')
                    filtered_u = evalin('base','Signal1_sDetr_nHist');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_nChau'',''var'')')
                    filtered_u = evalin('base','Signal1_nChau');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_nHist'',''var'')')
                    filtered_u = evalin('base','Signal1_nHist');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryDetrendSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sDetr'',''var'')')
                    filtered_u = evalin('base','Signal1_sDetr');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryPolySpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_sPoly'',''var'')')
                    filtered_u = evalin('base','Signal1_sPoly');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal1_np'',''var'')')
                    filtered_u = evalin('base','Signal1_np');
                    t = getappdata(0,'set_t1');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            else
                filtered_u = getappdata(0,'set_u1');
                t = getappdata(0,'set_t1');
            end
            
        case 'Signal 2'
            array1 = [handles.data1SummaryPanel,handles.data5SummaryPanel,handles.data3SummaryPanel,...
                handles.data4SummaryPanel];
            set(array1,'Visible','Off');
            set(handles.data2SummaryPanel,'Visible','On');
            fs = str2double(get(handles.sampling1Input,'String'));
            
            if get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sPoly_nChau_np'',''var'')')
                    filtered_u = evalin('base','Signal2_sPoly_nChau_np');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sDetr_nChau_np'',''var'')')
                    filtered_u = evalin('base','Signal2_sDetr_nChau_np');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sPoly_nHist_np'',''var'')')
                    filtered_u = evalin('base','Signal2_sPoly_nHist_np');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sDetr_nHist_np'',''var'')')
                    filtered_u = evalin('base','Signal2_sDetr_nHist_np');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_nHist_np'',''var'')')
                    filtered_u = evalin('base','Signal2_nHist_np');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_nChau_np'',''var'')')
                    filtered_u = evalin('base','Signal2_nChau_np');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryPolySpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sPoly_np'',''var'')')
                    filtered_u = evalin('base','Signal2_sPoly_np');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryDetrendSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sDetr_np'',''var'')')
                    filtered_u = evalin('base','Signal2_sDetr_np');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sPoly_nChau'',''var'')')
                    filtered_u = evalin('base','Signal2_sPoly_nChau');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sDetr_nChau'',''var'')')
                    filtered_u = evalin('base','Signal2_sDetr_nChau');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sPoly_nHist'',''var'')')
                    filtered_u = evalin('base','Signal2_sPoly_nHist');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sDetr_nHist'',''var'')')
                    filtered_u = evalin('base','Signal2_sDetr_nHist');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_nChau'',''var'')')
                    filtered_u = evalin('base','Signal2_nChau');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_nHist'',''var'')')
                    filtered_u = evalin('base','Signal2_nHist');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryDetrendSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sDetr'',''var'')')
                    filtered_u = evalin('base','Signal2_sDetr');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryPolySpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_sPoly'',''var'')')
                    filtered_u = evalin('base','Signal2_sPoly');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal2_np'',''var'')')
                    filtered_u = evalin('base','Signal2_np');
                    t = getappdata(0,'set_t2');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            else
                filtered_u = getappdata(0,'set_u2');
                t = getappdata(0,'set_t2');
            end
            
        case 'Signal 3'
            array1 = [handles.data1SummaryPanel,handles.data2SummaryPanel,handles.data5SummaryPanel,...
                handles.data4SummaryPanel];
            set(array1,'Visible','Off');
            set(handles.data3SummaryPanel,'Visible','On');
            fs = str2double(get(handles.sampling1Input,'String'));
            
            if get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sPoly_nChau_np'',''var'')')
                    filtered_u = evalin('base','Signal3_sPoly_nChau_np');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sDetr_nChau_np'',''var'')')
                    filtered_u = evalin('base','Signal3_sDetr_nChau_np');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sPoly_nHist_np'',''var'')')
                    filtered_u = evalin('base','Signal3_sPoly_nHist_np');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sDetr_nHist_np'',''var'')')
                    filtered_u = evalin('base','Signal3_sDetr_nHist_np');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_nHist_np'',''var'')')
                    filtered_u = evalin('base','Signal3_nHist_np');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_nChau_np'',''var'')')
                    filtered_u = evalin('base','Signal3_nChau_np');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryPolySpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sPoly_np'',''var'')')
                    filtered_u = evalin('base','Signal3_sPoly_np');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryDetrendSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sDetr_np'',''var'')')
                    filtered_u = evalin('base','Signal3_sDetr_np');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sPoly_nChau'',''var'')')
                    filtered_u = evalin('base','Signal3_sPoly_nChau');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sDetr_nChau'',''var'')')
                    filtered_u = evalin('base','Signal3_sDetr_nChau');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sPoly_nHist'',''var'')')
                    filtered_u = evalin('base','Signal3_sPoly_nHist');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sDetr_nHist'',''var'')')
                    filtered_u = evalin('base','Signal3_sDetr_nHist');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_nChau'',''var'')')
                    filtered_u = evalin('base','Signal3_nChau');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_nHist'',''var'')')
                    filtered_u = evalin('base','Signal3_nHist');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryDetrendSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sDetr'',''var'')')
                    filtered_u = evalin('base','Signal3_sDetr');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryPolySpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_sPoly'',''var'')')
                    filtered_u = evalin('base','Signal3_sPoly');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal3_np'',''var'')')
                    filtered_u = evalin('base','Signal3_np');
                    t = getappdata(0,'set_t3');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            else
                filtered_u = getappdata(0,'set_u3');
                t = getappdata(0,'set_t3');
            end
            
        case 'Signal 4'
            array1 = [handles.data1SummaryPanel,handles.data2SummaryPanel,handles.data3SummaryPanel,...
                handles.data5SummaryPanel];
            set(array1,'Visible','Off');
            set(handles.data4SummaryPanel,'Visible','On');
            fs = str2double(get(handles.sampling1Input,'String'));
            
            if get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sPoly_nChau_np'',''var'')')
                    filtered_u = evalin('base','Signal4_sPoly_nChau_np');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sDetr_nChau_np'',''var'')')
                    filtered_u = evalin('base','Signal4_sDetr_nChau_np');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sPoly_nHist_np'',''var'')')
                    filtered_u = evalin('base','Signal4_sPoly_nHist_np');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sDetr_nHist_np'',''var'')')
                    filtered_u = evalin('base','Signal4_sDetr_nHist_np');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_nHist_np'',''var'')')
                    filtered_u = evalin('base','Signal4_nHist_np');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_nChau_np'',''var'')')
                    filtered_u = evalin('base','Signal4_nChau_np');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryPolySpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sPoly_np'',''var'')')
                    filtered_u = evalin('base','Signal4_sPoly_np');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryDetrendSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sDetr_np'',''var'')')
                    filtered_u = evalin('base','Signal4_sDetr_np');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sPoly_nChau'',''var'')')
                    filtered_u = evalin('base','Signal4_sPoly_nChau');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sDetr_nChau'',''var'')')
                    filtered_u = evalin('base','Signal4_sDetr_nChau');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sPoly_nHist'',''var'')')
                    filtered_u = evalin('base','Signal4_sPoly_nHist');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sDetr_nHist'',''var'')')
                    filtered_u = evalin('base','Signal4_sDetr_nHist');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_nChau'',''var'')')
                    filtered_u = evalin('base','Signal4_nChau');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_nHist'',''var'')')
                    filtered_u = evalin('base','Signal4_nHist');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryDetrendSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sDetr'',''var'')')
                    filtered_u = evalin('base','Signal4_sDetr');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryPolySpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_sPoly'',''var'')')
                    filtered_u = evalin('base','Signal4_sPoly');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal4_np'',''var'')')
                    filtered_u = evalin('base','Signal4_np');
                    t = getappdata(0,'set_t4');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            else
                filtered_u = getappdata(0,'set_u4');
                t = getappdata(0,'set_t4');
            end
            
        case 'Signal 5'
            array1 = [handles.data1SummaryPanel,handles.data2SummaryPanel,handles.data3SummaryPanel,...
                handles.data4SummaryPanel];
            set(array1,'Visible','Off');
            set(handles.data5SummaryPanel,'Visible','On');
            fs = str2double(get(handles.sampling1Input,'String'));
            
            if get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sPoly_nChau_np'',''var'')')
                    filtered_u = evalin('base','Signal5_sPoly_nChau_np');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sDetr_nChau_np'',''var'')')
                    filtered_u = evalin('base','Signal5_sDetr_nChau_np');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sPoly_nHist_np'',''var'')')
                    filtered_u = evalin('base','Signal5_sPoly_nHist_np');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')&&...
                    get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sDetr_nHist_np'',''var'')')
                    filtered_u = evalin('base','Signal5_sDetr_nHist_np');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_nHist_np'',''var'')')
                    filtered_u = evalin('base','Signal5_nHist_np');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_nChau_np'',''var'')')
                    filtered_u = evalin('base','Signal5_nChau_np');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryPolySpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sPoly_np'',''var'')')
                    filtered_u = evalin('base','Signal5_sPoly_np');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryDetrendSpectralCheck,'Value')&&get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sDetr_np'',''var'')')
                    filtered_u = evalin('base','Signal5_sDetr_np');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sPoly_nChau'',''var'')')
                    filtered_u = evalin('base','Signal5_sPoly_nChau');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sDetr_nChau'',''var'')')
                    filtered_u = evalin('base','Signal5_sDetr_nChau');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryPolySpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sPoly_nHist'',''var'')')
                    filtered_u = evalin('base','Signal5_sPoly_nHist');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')&&get(handles.stationaryDetrendSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sDetr_nHist'',''var'')')
                    filtered_u = evalin('base','Signal5_sDetr_nHist');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessChauSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_nChau'',''var'')')
                    filtered_u = evalin('base','Signal5_nChau');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.noiselessHistoSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_nHist'',''var'')')
                    filtered_u = evalin('base','Signal5_nHist');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryDetrendSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sDetr'',''var'')')
                    filtered_u = evalin('base','Signal5_sDetr');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.stationaryPolySpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_sPoly'',''var'')')
                    filtered_u = evalin('base','Signal5_sPoly');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            elseif get(handles.nonperiodicSpectralCheck,'Value')
                if evalin( 'base', 'exist(''Signal5_np'',''var'')')
                    filtered_u = evalin('base','Signal5_np');
                    t = getappdata(0,'set_t5');
                else
                    errordlg('The requested signal does not exist','Plotting denied');
                    return;
                end
            else
                filtered_u = getappdata(0,'set_u5');
                t = getappdata(0,'set_t5');
            end
            
    end
end


setappdata(0,'temp_u',filtered_u);
setappdata(0,'temp_f',fs);
N = length(filtered_u);

% Number of discrete fourier tranforms for pwelch in Spectral Analysis menu
var = get(handles.discreteSpectralGroup,'SelectedObject');
selection = get(var,'String');
switch selection
    case 'Default'
        nfft = max(256,0.1*N);
        set(handles.discreteSpectralInput,'String',num2str(round(nfft)));
        set(handles.discreteSpectralInput,'Enable','Off');
    case 'Other'
        set(handles.discreteSpectralInput,'Enable','On');
end



% --- Executes on button press in integralHover.
function integralHover_Callback(~, ~, ~)
% hObject    handle to integralHover (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function data1VariableInput_Callback(~, ~, ~)
% hObject    handle to data1VariableInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of data1VariableInput as text
%        str2double(get(hObject,'String')) returns contents of data1VariableInput as a double


% --- Executes during object creation, after setting all properties.
function data1VariableInput_CreateFcn(hObject, ~, ~)
% hObject    handle to data1VariableInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in data1UncertaintyPopup.
function data1UncertaintyPopup_Callback(~, ~, ~)
% hObject    handle to data1UncertaintyPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns data1UncertaintyPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from data1UncertaintyPopup


% --- Executes during object creation, after setting all properties.
function data1UncertaintyPopup_CreateFcn(hObject, ~, ~)
% hObject    handle to data1UncertaintyPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function data5VariableInput_Callback(~, ~, ~)
% hObject    handle to data5VariableInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of data5VariableInput as text
%        str2double(get(hObject,'String')) returns contents of data5VariableInput as a double


% --- Executes during object creation, after setting all properties.
function data5VariableInput_CreateFcn(hObject, ~, ~)
% hObject    handle to data5VariableInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in data5UncertaintyPopup.
function data5UncertaintyPopup_Callback(~, ~, ~)
% hObject    handle to data5UncertaintyPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns data5UncertaintyPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from data5UncertaintyPopup


% --- Executes during object creation, after setting all properties.
function data5UncertaintyPopup_CreateFcn(hObject, ~, ~)
% hObject    handle to data5UncertaintyPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function data4VariableInput_Callback(~, ~, ~)
% hObject    handle to data4VariableInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of data4VariableInput as text
%        str2double(get(hObject,'String')) returns contents of data4VariableInput as a double


% --- Executes during object creation, after setting all properties.
function data4VariableInput_CreateFcn(hObject, ~, ~)
% hObject    handle to data4VariableInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in data4UncertaintyPopup.
function data4UncertaintyPopup_Callback(~, ~, ~)
% hObject    handle to data4UncertaintyPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns data4UncertaintyPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from data4UncertaintyPopup


% --- Executes during object creation, after setting all properties.
function data4UncertaintyPopup_CreateFcn(hObject, ~, ~)
% hObject    handle to data4UncertaintyPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function data3VariableInput_Callback(~, ~, ~)
% hObject    handle to data3VariableInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of data3VariableInput as text
%        str2double(get(hObject,'String')) returns contents of data3VariableInput as a double


% --- Executes during object creation, after setting all properties.
function data3VariableInput_CreateFcn(hObject, ~, ~)
% hObject    handle to data3VariableInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in data3UncertaintyPopup.
function data3UncertaintyPopup_Callback(~, ~, ~)
% hObject    handle to data3UncertaintyPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns data3UncertaintyPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from data3UncertaintyPopup


% --- Executes during object creation, after setting all properties.
function data3UncertaintyPopup_CreateFcn(hObject, ~, ~)
% hObject    handle to data3UncertaintyPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function data2VariableInput_Callback(~, ~, ~)
% hObject    handle to data2VariableInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of data2VariableInput as text
%        str2double(get(hObject,'String')) returns contents of data2VariableInput as a double


% --- Executes during object creation, after setting all properties.
function data2VariableInput_CreateFcn(hObject, ~, ~)
% hObject    handle to data2VariableInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in data2UncertaintyPopup.
function data2UncertaintyPopup_Callback(~, ~, ~)
% hObject    handle to data2UncertaintyPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns data2UncertaintyPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from data2UncertaintyPopup


% --- Executes during object creation, after setting all properties.
function data2UncertaintyPopup_CreateFcn(hObject, ~, ~)
% hObject    handle to data2UncertaintyPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in higherUncertaintyHover.
function higherUncertaintyHover_Callback(~, ~, ~)
% hObject    handle to higherUncertaintyHover (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in expandedUncertaintyHover.
function expandedUncertaintyHover_Callback(~, ~, ~)
% hObject    handle to expandedUncertaintyHover (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function uncertaintySlider_Callback(hObject, ~, handles)
% hObject    handle to uncertaintySlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting selected data for determining autocorrelation and plotting it

acor_new = getappdata(0,'set_acor_new');
lag = getappdata(0,'set_lag');
filtered_u = getappdata(0,'temp_u');
f1 = getappdata(0,'temp_f');
res = filtered_u;
mean_fi = mean(filtered_u);
filtered_u = filtered_u - mean_fi;
N = length(filtered_u);
id = get(handles.uncertaintySlider,'Value');
temp = 1:length(lag);
[~,index] = min(abs(temp-id)); % Setting index to nearest integer
id3 = index;
tau = lag/f1;
axes(handles.uncertaintyaxes2);
cla reset;
plot(tau,acor_new);
xlim([tau(1), tau(end)]);
title('Autocorrelation coefficient','FontName','Times');
hold on;
grid on;
% Representing a vertical line on the upto which integral time scale is computed
h2 = line([tau(id3),tau(id3)],[0,acor_new(id3)]);
set(h2,'Color','r')
% Marker on the curve upto which integral time scale is computed
plot(tau(id3),acor_new(id3),'o','markersize',3);
% Coloring the area under the curve
area(tau(1:id3),acor_new(1:id3),'Facecolor',[0 0.75 0.75]);
xlabel('$$\hspace{25em}\normalfont\bf\tau{[s]}$$','interpreter','latex');
if id3 == 1
    Int2 = 0;
else
    Int2 = trapz(tau(1:id3),abs(acor_new(1:id3))); % Computing integral time scale
end
handles.UncertaintySummary.IntegralTimeScale = Int2;
handles.UncertaintySummary.AutocorrelationCoefficient.Rho = acor_new;
handles.UncertaintySummary.AutocorrelationCoefficient.Tau = tau;
assignin('base','Result_Auto_Rho',acor_new);
assignin('base','Result_Auto_Tau',tau);
set(handles.timeScaleUncertaintyDisplay,'String',num2str(Int2));

T = getappdata(0,'temp_T');
std_sample = std(res);
dt = 1/f1;
if dt < 2*Int2
    Neff = round(T/(2*Int2));
else
    Neff = N;
end
std_mean = std_sample/sqrt(Neff);
out = str2double(get(handles.systematicUncertaintyDisplay,'string'));
if isnan(out)
    out = 0;
end
total = sqrt(out^2 + (std_mean)^2); % Combined uncertainty
set(handles.combinedUncertaintyDisplay,'String',num2str(total,'%.5s'));
expan = 2*total; % Expanded uncertainty
set(handles.expandedUncertaintyDisplay,'String',num2str(expan,'%.5s'));
set(handles.meanOutput,'String',num2str(mean(res),'%.5s'));
set(handles.uncertaintyOutput,'String',num2str(expan,'%.5s'));
handles.UncertaintySummary.Std.SampleRecord = std_sample;
handles.UncertaintySummary.Std.Mean = std_mean;
handles.UncertaintySummary.Neff = Neff;
handles.UncertaintySummary.TotalMeanUncert = total;
handles.UncertaintySummary.ExpandedMeanUncert = expan;

variable = get(handles.numberOfDataGroup,'SelectedObject');
selection = get(variable,'String');
colorgen = @(color,text) ['<html><table border=0 width=400 bgcolor=',color,'><TR><TD>',text,'</TD></TR> </table></html>'];
switch selection
    case '1'
        std_mean1 = getappdata(0,'temp_std_mean1');
        data = { colorgen('#F0F0F0','Signal 1'), num2str(std_mean1)
            colorgen('#F0F0F0','Result mean'), num2str(std_mean,'%.5s')
            };
        set(handles.randomUncertaintyTable,'Data',data);
    case '2'
        std_mean1 = getappdata(0,'temp_std_mean1');
        std_mean2 = getappdata(0,'temp_std_mean2');
        data = { colorgen('#F0F0F0','Signal 1'), num2str(std_mean1)
            colorgen('#F0F0F0','Signal 2'), num2str(std_mean2)
            colorgen('#F0F0F0','Result mean'), num2str(std_mean,'%.5s')
            };
        set(handles.randomUncertaintyTable,'Data',data);
    case '3'
        std_mean1 = getappdata(0,'temp_std_mean1');
        std_mean2 = getappdata(0,'temp_std_mean2');
        std_mean3 = getappdata(0,'temp_std_mean3');
        data = { colorgen('#F0F0F0','Signal 1'), num2str(std_mean1)
            colorgen('#F0F0F0','Signal 2'), num2str(std_mean2)
            colorgen('#F0F0F0','Signal 3'), num2str(std_mean3)
            colorgen('#F0F0F0','Result mean'), num2str(std_mean,'%.5s')
            };
        set(handles.randomUncertaintyTable,'Data',data);
    case '4'
        std_mean1 = getappdata(0,'temp_std_mean1');
        std_mean2 = getappdata(0,'temp_std_mean2');
        std_mean3 = getappdata(0,'temp_std_mean3');
        std_mean4 = getappdata(0,'temp_std_mean4');
        data = { colorgen('#F0F0F0','Signal 1'), num2str(std_mean1)
            colorgen('#F0F0F0','Signal 2'), num2str(std_mean2)
            colorgen('#F0F0F0','Signal 3'), num2str(std_mean3)
            colorgen('#F0F0F0','Signal 4'), num2str(std_mean4)
            colorgen('#F0F0F0','Result mean'), num2str(std_mean,'%.5s')
            };
        set(handles.randomUncertaintyTable,'Data',data);
    case '5'
        std_mean1 = getappdata(0,'temp_std_mean1');
        std_mean2 = getappdata(0,'temp_std_mean2');
        std_mean3 = getappdata(0,'temp_std_mean3');
        std_mean4 = getappdata(0,'temp_std_mean4');
        std_mean5 = getappdata(0,'temp_std_mean5');
        data = { colorgen('#F0F0F0','Signal 1'), num2str(std_mean1)
            colorgen('#F0F0F0','Signal 2'), num2str(std_mean2)
            colorgen('#F0F0F0','Signal 3'), num2str(std_mean3)
            colorgen('#F0F0F0','Signal 4'), num2str(std_mean4)
            colorgen('#F0F0F0','Signal 5'), num2str(std_mean5)
            colorgen('#F0F0F0','Result mean'), num2str(std_mean,'%.5s')
            };
        set(handles.randomUncertaintyTable,'Data',data);
end

var1 = get(handles.secondUncertaintyGroup,'SelectedObject');
selection1 = get(var1,'String');
I = get(handles.timeScaleUncertaintyDisplay,'String');
I = str2double(I);
x = filtered_u;
% Computing second order uncertainty
switch selection1
    case 'Assuming normal dist.'
        second = sqrt(4*I/T);
        set(handles.secondUncertaintyDisplay,'String',num2str(second));
        handles.UncertaintySummary.SecondOrderUncert.NormDist = second;
    case 'Direct equation'
        temp = (mean(x.^4)/(mean(x.^2)^2))-1;
        second = sqrt(2*I*temp/T);
        set(handles.secondUncertaintyDisplay,'String',num2str(second));
        handles.UncertaintySummary.SecondOrderUncert.Formula = second;
end
% Computing third order uncertainty
var2 = get(handles.thirdUncertaintyGroup,'SelectedObject');
selection2 = get(var2,'String');
switch selection2
    case 'Assuming normal dist.'
        third = 0;
        set(handles.thirdUncertaintyDisplay,'String',num2str(third));
        handles.UncertaintySummary.ThirdOrderUncert.NormDist = third;
    case 'Direct equation'
        temp = (mean(x.^6)/(mean(x.^3)^2))-1;
        third = sqrt(2*I*temp/T);
        set(handles.thirdUncertaintyDisplay,'String',num2str(third));
        handles.UncertaintySummary.ThirdOrderUncert.Formula = third;
end
% Computing fourth order uncertainty
var3 = get(handles.fourthUncertaintyGroup,'SelectedObject');
selection3 = get(var3,'String');
switch selection3
    case 'Assuming normal dist.'
        fourth = sqrt(22*I/T);
        set(handles.fourthUncertaintyDisplay,'String',num2str(fourth));
        handles.UncertaintySummary.FourthOrderUncert.NormDist = fourth;
    case 'Direct equation'
        temp = (mean(x.^8)/(mean(x.^4)^2))-1;
        fourth = sqrt(2*I*temp/T);
        set(handles.fourthUncertaintyDisplay,'String',num2str(fourth));
        handles.UncertaintySummary.FourthOrderUncert.Formula = fourth;
end

guidata(hObject,handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function uncertaintySlider_CreateFcn(hObject, ~, ~)
% hObject    handle to uncertaintySlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function samplingData5UncertaintyInput_Callback(~, ~, ~)
% hObject    handle to samplingData5UncertaintyInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samplingData5UncertaintyInput as text
%        str2double(get(hObject,'String')) returns contents of samplingData5UncertaintyInput as a double


% --- Executes during object creation, after setting all properties.
function samplingData5UncertaintyInput_CreateFcn(hObject, ~, ~)
% hObject    handle to samplingData5UncertaintyInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function samplingData4UncertaintyInput_Callback(~, ~, ~)
% hObject    handle to samplingData4UncertaintyInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samplingData4UncertaintyInput as text
%        str2double(get(hObject,'String')) returns contents of samplingData4UncertaintyInput as a double


% --- Executes during object creation, after setting all properties.
function samplingData4UncertaintyInput_CreateFcn(hObject, ~, ~)
% hObject    handle to samplingData4UncertaintyInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function samplingData3UncertaintyInput_Callback(~, ~, ~)
% hObject    handle to samplingData3UncertaintyInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samplingData3UncertaintyInput as text
%        str2double(get(hObject,'String')) returns contents of samplingData3UncertaintyInput as a double


% --- Executes during object creation, after setting all properties.
function samplingData3UncertaintyInput_CreateFcn(hObject, ~, ~)
% hObject    handle to samplingData3UncertaintyInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function samplingData2UncertaintyInput_Callback(~, ~, ~)
% hObject    handle to samplingData2UncertaintyInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samplingData2UncertaintyInput as text
%        str2double(get(hObject,'String')) returns contents of samplingData2UncertaintyInput as a double


% --- Executes during object creation, after setting all properties.
function samplingData2UncertaintyInput_CreateFcn(hObject, ~, ~)
% hObject    handle to samplingData2UncertaintyInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function samplingData1UncertaintyInput_Callback(~, ~, ~)
% hObject    handle to samplingData1UncertaintyInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samplingData1UncertaintyInput as text
%        str2double(get(hObject,'String')) returns contents of samplingData1UncertaintyInput as a double


% --- Executes during object creation, after setting all properties.
function samplingData1UncertaintyInput_CreateFcn(hObject, ~, ~)
% hObject    handle to samplingData1UncertaintyInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in secondUncertaintyGroup.
function secondUncertaintyGroup_SelectionChangedFcn(hObject, ~, handles)
% hObject    handle to the selected object in secondUncertaintyGroup
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Computing second order uncertainty
var = get(handles.secondUncertaintyGroup,'SelectedObject');
selection = get(var,'String');
I = get(handles.timeScaleUncertaintyDisplay,'String');
I = str2double(I);
T = getappdata(0,'temp_T');
x = getappdata(0,'temp_u');
x = x - mean(x);
switch selection
    case 'Assuming normal dist.'
        second = sqrt(4*I/T);
        set(handles.secondUncertaintyDisplay,'String',num2str(second));
        handles.UncertaintySummary.SecondOrderUncert.NormDist = second;
    case 'Direct equation'
        temp = (mean(x.^4)/(mean(x.^2)^2))-1;
        second = sqrt(2*I*temp/T);
        set(handles.secondUncertaintyDisplay,'String',num2str(second));
        handles.UncertaintySummary.SecondOrderUncert.Formula = second;
end
guidata(hObject,handles);

% --- Executes when selected object is changed in thirdUncertaintyGroup.
function thirdUncertaintyGroup_SelectionChangedFcn(hObject, ~, handles)
% hObject    handle to the selected object in thirdUncertaintyGroup
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Computing third order uncertainty
var = get(handles.thirdUncertaintyGroup,'SelectedObject');
selection = get(var,'String');
I = get(handles.timeScaleUncertaintyDisplay,'String');
I = str2double(I);
T = getappdata(0,'temp_T');
x = getappdata(0,'temp_u');
x = x - mean(x);
switch selection
    case 'Assuming normal dist.'
        third = 0;
        set(handles.thirdUncertaintyDisplay,'String',num2str(third));
        handles.UncertaintySummary.ThirdOrderUncert.NormDist = third;
    case 'Direct equation'
        temp = (mean(x.^6)/(mean(x.^3)^2))-1;
        third = sqrt(2*I*temp/T);
        set(handles.thirdUncertaintyDisplay,'String',num2str(third));
        handles.UncertaintySummary.ThirdOrderUncert.Formula = third;
end
guidata(hObject,handles);


% --- Executes when selected object is changed in fourthUncertaintyGroup.
function fourthUncertaintyGroup_SelectionChangedFcn(hObject, ~, handles)
% hObject    handle to the selected object in fourthUncertaintyGroup
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Computing fourth order uncertainty
var = get(handles.fourthUncertaintyGroup,'SelectedObject');
selection = get(var,'String');
I = get(handles.timeScaleUncertaintyDisplay,'String');
I = str2double(I);
T = getappdata(0,'temp_T');
x = getappdata(0,'temp_u');
x = x - mean(x);
switch selection
    case 'Assuming normal dist.'
        fourth = sqrt(22*I/T);
        set(handles.fourthUncertaintyDisplay,'String',num2str(fourth));
        handles.UncertaintySummary.FourthOrderUncert.NormDist = fourth;
    case 'Direct equation'
        temp = (mean(x.^8)/(mean(x.^4)^2))-1;
        fourth = sqrt(2*I*temp/T);
        set(handles.fourthUncertaintyDisplay,'String',num2str(fourth));
        handles.UncertaintySummary.FourthOrderUncert.Formula = fourth;
end
guidata(hObject,handles);

function CInput_Callback(~, ~, ~)
% hObject    handle to CInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CInput as text
%        str2double(get(hObject,'String')) returns contents of CInput as a double


% --- Executes during object creation, after setting all properties.
function CInput_CreateFcn(hObject, ~, ~)
% hObject    handle to CInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n1Input_Callback(~, ~, ~)
% hObject    handle to n1Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n1Input as text
%        str2double(get(hObject,'String')) returns contents of n1Input as a double


% --- Executes during object creation, after setting all properties.
function n1Input_CreateFcn(hObject, ~, ~)
% hObject    handle to n1Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n3Input_Callback(~, ~, ~)
% hObject    handle to n3Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n3Input as text
%        str2double(get(hObject,'String')) returns contents of n3Input as a double


% --- Executes during object creation, after setting all properties.
function n3Input_CreateFcn(hObject, ~, ~)
% hObject    handle to n3Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n5Input_Callback(~, ~, ~)
% hObject    handle to n5Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n5Input as text
%        str2double(get(hObject,'String')) returns contents of n5Input as a double


% --- Executes during object creation, after setting all properties.
function n5Input_CreateFcn(hObject, ~, ~)
% hObject    handle to n5Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function n4Input_Callback(~, ~, ~)
% hObject    handle to n4Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n4Input as text
%        str2double(get(hObject,'String')) returns contents of n4Input as a double


% --- Executes during object creation, after setting all properties.
function n4Input_CreateFcn(hObject, ~, ~)
% hObject    handle to n4Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n2Input_Callback(~, ~, ~)
% hObject    handle to n2Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n2Input as text
%        str2double(get(hObject,'String')) returns contents of n2Input as a double


% --- Executes during object creation, after setting all properties.
function n2Input_CreateFcn(hObject, ~, ~)
% hObject    handle to n2Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function data1RelUncertaintyInput_Callback(~, ~, ~)
% hObject    handle to data1RelUncertaintyInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of data1RelUncertaintyInput as text
%        str2double(get(hObject,'String')) returns contents of data1RelUncertaintyInput as a double


% --- Executes during object creation, after setting all properties.
function data1RelUncertaintyInput_CreateFcn(hObject, ~, ~)
% hObject    handle to data1RelUncertaintyInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function data2RelUncertaintyInput_Callback(~, ~, ~)
% hObject    handle to data2RelUncertaintyInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of data2RelUncertaintyInput as text
%        str2double(get(hObject,'String')) returns contents of data2RelUncertaintyInput as a double


% --- Executes during object creation, after setting all properties.
function data2RelUncertaintyInput_CreateFcn(hObject, ~, ~)
% hObject    handle to data2RelUncertaintyInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function data3RelUncertaintyInput_Callback(~, ~, ~)
% hObject    handle to data3RelUncertaintyInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of data3RelUncertaintyInput as text
%        str2double(get(hObject,'String')) returns contents of data3RelUncertaintyInput as a double


% --- Executes during object creation, after setting all properties.
function data3RelUncertaintyInput_CreateFcn(hObject, ~, ~)
% hObject    handle to data3RelUncertaintyInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function data4RelUncertaintyInput_Callback(~, ~, ~)
% hObject    handle to data4RelUncertaintyInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of data4RelUncertaintyInput as text
%        str2double(get(hObject,'String')) returns contents of data4RelUncertaintyInput as a double


% --- Executes during object creation, after setting all properties.
function data4RelUncertaintyInput_CreateFcn(hObject, ~, ~)
% hObject    handle to data4RelUncertaintyInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function data5RelUncertaintyInput_Callback(~, ~, ~)
% hObject    handle to data5RelUncertaintyInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of data5RelUncertaintyInput as text
%        str2double(get(hObject,'String')) returns contents of data5RelUncertaintyInput as a double


% --- Executes during object creation, after setting all properties.
function data5RelUncertaintyInput_CreateFcn(hObject, ~, ~)
% hObject    handle to data5RelUncertaintyInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in overallDisplayHover.
function overallDisplayHover_Callback(~, ~, ~)
% hObject    handle to overallDisplayHover (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected object is changed in systematicUncertaintyGroup.
function systematicUncertaintyGroup_SelectionChangedFcn(~, ~, handles)
% hObject    handle to the selected object in systematicUncertaintyGroup
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Function to check if user wants to insert systematic uncertainty
variable = get(handles.systematicUncertaintyGroup,'SelectedObject');
selection = get(variable,'String');
array = [handles.data1RelUncertaintyInput,handles.data2RelUncertaintyInput,handles.data3RelUncertaintyInput,...
    handles.data4RelUncertaintyInput,handles.data5RelUncertaintyInput];
switch selection
    case 'Yes'
        set(array,'Enable','On');
    case 'No'
        set(array,'Enable','Off');
        set(array,'String','');
end


% --------------------------------------------------------------------
function SavePlot_ClickedCallback(~, ~, handles)
% hObject    handle to SavePlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Function for saving the plots
% Plots in Import menu
if convert(get(handles.originalaxes,'Visible'))
    [FileName, PathName] = uiputfile('*.fig','Save Plot as'); % Getting the file name and path
    if FileName == 0 % If saving window is closed by the user, exiting the function
        return;
    end
    outputFileName = fullfile(PathName,FileName);
    fignew = figure('Visible','off'); % Invisible figure
    newAxes = copyobj(handles.originalaxes,fignew); % Copy the appropriate axes
    set(newAxes,'Position',get(groot,'DefaultAxesPosition'));
    set(fignew,'CreateFcn','set(gcbf,''Visible'',''on'')'); % Make it visible upon loading
    savefig(fignew,outputFileName);
    delete(fignew); % Deleting the copied figure
    % Plots in Stationarity menu
elseif convert(get(handles.stationaryaxes,'Visible'))
    [FileName, PathName] = uiputfile('*.fig','Save Plot as');
    if FileName == 0
        return;
    end
    outputFileName = fullfile(PathName,FileName);
    fignew = figure('Visible','off'); % Invisible figure
    newAxes = copyobj(handles.stationaryaxes,fignew); % Copy the appropriate axes
    set(newAxes,'Position',get(groot,'DefaultAxesPosition')); % The original position is copied too, so adjust it.
    set(fignew,'CreateFcn','set(gcbf,''Visible'',''on'')'); % Make it visible upon loading
    savefig(fignew,outputFileName);
    delete(fignew);
    
    % Plots in Noise Removal menu
elseif convert(get(handles.noiseaxes1,'Visible'))
    [FileName1, PathName1] = uiputfile('*.fig','Save Plot 1 as');
    if FileName1 ~= 0
        outputFileName1 = fullfile(PathName1,FileName1);
        fignew = figure('Visible','off'); % Invisible figure
        newAxes = copyobj(handles.noiseaxes1,fignew); % Copy the appropriate axes
        set(newAxes,'Position',get(groot,'DefaultAxesPosition')); % The original position is copied too, so adjust it.
        set(fignew,'CreateFcn','set(gcbf,''Visible'',''on'')'); % Make it visible upon loading
        savefig(fignew,outputFileName1);
        delete(fignew);
    end
    [FileName2, PathName2] = uiputfile('*.fig','Save Plot 2 as');
    if FileName2 ~= 0
        outputFileName2 = fullfile(PathName2,FileName2);
        fignew = figure('Visible','off'); % Invisible figure
        newAxes = copyobj(handles.noiseaxes2,fignew); % Copy the appropriate axes
        set(newAxes,'Position',get(groot,'DefaultAxesPosition')); % The original position is copied too, so adjust it.
        set(fignew,'CreateFcn','set(gcbf,''Visible'',''on'')'); % Make it visible upon loading
        savefig(fignew,outputFileName2);
        delete(fignew);
    end
    % Plots in Normality menu
elseif convert(get(handles.normalityaxes1,'Visible'))
    [FileName1, PathName1] = uiputfile('*.fig','Save Plot 1 as');
    if FileName1 ~= 0
        outputFileName1 = fullfile(PathName1,FileName1);
        fignew = figure('Visible','off'); % Invisible figure
        newAxes = copyobj(handles.normalityaxes1,fignew); % Copy the appropriate axes
        set(newAxes,'Position',get(groot,'DefaultAxesPosition')); % The original position is copied too, so adjust it.
        set(fignew,'CreateFcn','set(gcbf,''Visible'',''on'')'); % Make it visible upon loading
        savefig(fignew,outputFileName1);
        delete(fignew);
    end
    [FileName2, PathName2] = uiputfile('*.fig','Save Plot 2 as');
    if FileName2 ~= 0
        outputFileName2 = fullfile(PathName2,FileName2);
        fignew = figure('Visible','off'); % Invisible figure
        newAxes = copyobj(handles.normalityaxes2,fignew); % Copy the appropriate axes
        set(newAxes,'Position',get(groot,'DefaultAxesPosition')); % The original position is copied too, so adjust it.
        set(fignew,'CreateFcn','set(gcbf,''Visible'',''on'')'); % Make it visible upon loading
        savefig(fignew,outputFileName2);
        delete(fignew);
    end
    % Plots in Periodicity menu
elseif convert(get(handles.periodicaxes1,'Visible'))
    [FileName1, PathName1] = uiputfile('*.fig','Save Plot 1 as');
    if FileName1 ~= 0
        outputFileName1 = fullfile(PathName1,FileName1);
        fignew = figure('Visible','off'); % Invisible figure
        newAxes = copyobj(handles.periodicaxes1,fignew); % Copy the appropriate axes
        set(newAxes,'Position',get(groot,'DefaultAxesPosition')); % The original position is copied too, so adjust it.
        set(fignew,'CreateFcn','set(gcbf,''Visible'',''on'')'); % Make it visible upon loading
        savefig(fignew,outputFileName1);
        delete(fignew);
    end
    [FileName2, PathName2] = uiputfile('*.fig','Save Plot 2 as');
    if FileName2 ~= 0
        outputFileName2 = fullfile(PathName2,FileName2);
        fignew = figure('Visible','off'); % Invisible figure
        newAxes = copyobj(handles.periodicaxes2,fignew); % Copy the appropriate axes
        set(newAxes,'Position',get(groot,'DefaultAxesPosition')); % The original position is copied too, so adjust it.
        set(fignew,'CreateFcn','set(gcbf,''Visible'',''on'')'); % Make it visible upon loading
        savefig(fignew,outputFileName2);
        delete(fignew);
    end
    % Plots in Spectral Analysis menu
elseif convert(get(handles.spectralaxes1,'Visible'))
    [FileName1, PathName1] = uiputfile('*.fig','Save Plot 1 as');
    if FileName1 ~= 0
        outputFileName1 = fullfile(PathName1,FileName1);
        fignew = figure('Visible','off'); % Invisible figure
        newAxes = copyobj(handles.spectralaxes1,fignew); % Copy the appropriate axes
        set(newAxes,'Position',get(groot,'DefaultAxesPosition')); % The original position is copied too, so adjust it.
        set(fignew,'CreateFcn','set(gcbf,''Visible'',''on'')'); % Make it visible upon loading
        savefig(fignew,outputFileName1);
        delete(fignew);
    end
    [FileName2, PathName2] = uiputfile('*.fig','Save Plot 2 as');
    if FileName2 ~= 0
        outputFileName2 = fullfile(PathName2,FileName2);
        fignew = figure('Visible','off'); % Invisible figure
        newAxes = copyobj(handles.spectralaxes2,fignew); % Copy the appropriate axes
        set(newAxes,'Position',get(groot,'DefaultAxesPosition')); % The original position is copied too, so adjust it.
        set(fignew,'CreateFcn','set(gcbf,''Visible'',''on'')'); % Make it visible upon loading
        savefig(fignew,outputFileName2);
        delete(fignew);
    end
    % Plots in Uncertainty menu
elseif convert(get(handles.uncertaintyPlotPanel,'Visible'))
    [FileName1, PathName1] = uiputfile('*.fig','Save Plot 1 as');
    if FileName1 ~= 0
        outputFileName1 = fullfile(PathName1,FileName1);
        fignew = figure('Visible','off'); % Invisible figure
        newAxes = copyobj(handles.uncertaintyaxes1,fignew); % Copy the appropriate axes
        set(newAxes,'Position',get(groot,'DefaultAxesPosition')); % The original position is copied too, so adjust it.
        set(fignew,'CreateFcn','set(gcbf,''Visible'',''on'')'); % Make it visible upon loading
        savefig(fignew,outputFileName1);
        delete(fignew);
    end
    [FileName2, PathName2] = uiputfile('*.fig','Save Plot 2 as');
    if FileName2 ~= 0
        outputFileName2 = fullfile(PathName2,FileName2);
        fignew = figure('Visible','off'); % Invisible figure
        newAxes = copyobj(handles.uncertaintyaxes2,fignew); % Copy the appropriate axes
        set(newAxes,'Position',get(groot,'DefaultAxesPosition')); % The original position is copied too, so adjust it.
        set(fignew,'CreateFcn','set(gcbf,''Visible'',''on'')'); % Make it visible upon loading
        savefig(fignew,outputFileName2);
        delete(fignew);
    end
end



% --------------------------------------------------------------------
function Download_ClickedCallback(~, ~, handles)
% hObject    handle to Download (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Dowloading the Summary
Summary1 = handles.Summary1;
UncertaintySummary = handles.UncertaintySummary;
if isempty('Summary1')
    errordlg('No data to save.','Saving failed');
    return;
end
variable = get(handles.numberOfDataGroup,'SelectedObject');
selection = get(variable,'String');
switch selection
    case '1'
        [FileName, PathName] = uiputfile('*.mat','Save Summary as'); %Getting file and path name
        if FileName ~= 0 % Saving if the window for selecting path wasn't closed
            outputFileName = fullfile(PathName,FileName);
            save(outputFileName,'Summary1','UncertaintySummary');
        end
    case '2'
        [FileName, PathName] = uiputfile('*.mat','Save Summary as');
        if FileName ~= 0
            outputFileName = fullfile(PathName,FileName);
            Summary2 = handles.Summary2;
            save(outputFileName,'Summary1','Summary2','UncertaintySummary');
        end
    case '3'
        [FileName, PathName] = uiputfile('*.mat','Save Summary as');
        if FileName ~= 0
            outputFileName = fullfile(PathName,FileName);
            Summary2 = handles.Summary2;
            Summary3 = handles.Summary3;
            save(outputFileName,'Summary1','Summary2','Summary3','UncertaintySummary');
        end
    case '4'
        [FileName, PathName] = uiputfile('*.mat','Save Summary as');
        if FileName ~= 0
            outputFileName = fullfile(PathName,FileName);
            Summary2 = handles.Summary2;
            Summary3 = handles.Summary3;
            Summary4 = handles.Summary4;
            save(outputFileName,'Summary1','Summary2','Summary3','Summary4','UncertaintySummary');
        end
    case '5'
        [FileName, PathName] = uiputfile('*.mat','Save Summary as');
        if FileName ~= 0
            outputFileName = fullfile(PathName,FileName);
            Summary2 = handles.Summary2;
            Summary3 = handles.Summary3;
            Summary4 = handles.Summary4;
            Summary5 = handles.Summary5;
            save(outputFileName,'Summary1','Summary2','Summary3','Summary4','Summary5','UncertaintySummary');
        end
end


% --- Executes during object creation, after setting all properties.
function data2SummaryTable_CreateFcn(hObject, ~, ~)
% hObject    handle to data2SummaryTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'ColumnWidth',{163,155});


% --- Executes during object creation, after setting all properties.
function data3SummaryTable_CreateFcn(hObject, ~, ~)
% hObject    handle to data3SummaryTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'ColumnWidth',{163,155});


% --- Executes during object creation, after setting all properties.
function data4SummaryTable_CreateFcn(hObject, ~, ~)
% hObject    handle to data4SummaryTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'ColumnWidth',{163,155});


% --- Executes during object creation, after setting all properties.
function data5SummaryTable_CreateFcn(hObject, ~, ~)
% hObject    handle to data5SummaryTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'ColumnWidth',{163,155});


% --- Executes when selected object is changed in removePeriodicityGroup.
function removePeriodicityGroup_SelectionChangedFcn(hObject, ~, handles)
% hObject    handle to the selected object in removePeriodicityGroup
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
final_u = getappdata(0,'temp_u');
N = length(final_u);
fs = getappdata(0,'temp_fs');
s = rng;
rng(s);

if isempty(get(handles.appendPeriodicityInput,'String'))
    NR = ceil(0.003*length(final_u));
else
    NR = str2double(get(handles.appendPeriodicityInput,'String'));
end

x1 = flipud(final_u(2:NR+1));  % maintain continuity in level and slope
x2 = flipud(final_u(end-NR:end-1));
xn = [x1,final_u,x2];

mean_x = mean(xn);
xn = xn - mean_x;
N1 = length(xn);

mean_f = mean(final_u);
final_u = final_u - mean_f;
t = getappdata(0,'temp_t');
pxx = getappdata(0,'set_p1');
f1 = getappdata(0,'set_f1');
na = str2double(get(handles.divPeriodicInput,'String')); % No. of division for pwelch
p = str2double(get(handles.overPeriodicInput,'String')); % Overlap for pwelch
nfft = str2double(get(handles.discretePeriodicInput,'String'));
[loca,peaks] = PeakSeek((pxx),[],mean((pxx)));
posit = peaks == max(peaks);
locs = loca(posit);
sm = smooth(pxx,3);
for i = locs:(length(f1) - 1)
    if sm(i+1) > sm(i)
        indmax = i;
        break;
    end
    if i == length(f1) - 1
        indmax = length(f1);
    end
end

for j = locs:-1:2
    if sm(j-1) > sm(j)
        indmin = j;
        break;
    end
    if j == 2
        indmin = 1;
    end
end

indmin = max(indmin-2,1);
indmax = min(indmax+2,length(f1));

axes(handles.periodicaxes2);
hold on
semilogy(f1(indmin),sm(indmin),'or');
semilogy(f1(indmax),sm(indmax),'or');

xn1 = [xn zeros(1,N1)];
x_f = (fft(xn1));

if isempty(get(handles.minlimitPeriodicityInput,'String'))
    r1 = round(indmin*N1*2/(nfft+1));
else
    freq = str2double(get(handles.minlimitPeriodicityInput,'String'));
    diff = abs(freq-f1);
    indmin = find(diff == min(diff));
    r1 = round(indmin*N1*2/(nfft+1));
end

if isempty(get(handles.maxlimitPeriodicityInput,'String'))
    r2 = round(indmax*N1*2/(nfft+1));
else
    freq = str2double(get(handles.maxlimitPeriodicityInput,'String'));
    diff = abs(freq-f1);
    indmax = find(diff == min(diff));
    r2 = round(indmax*N1*2/(nfft+1));
end

r4 = 2*N1-r1+2;
r3 = 2*N1-r2+2;

y_f = abs(real(x_f));
temp1 = real(x_f(1:r1-1));
temp2 = real(x_f(r2+1:r3-1));
temp3 = real(x_f(r4+1:end));

y_fo = abs(imag(x_f));
tempo1 = imag(x_f(1:r1-1));
tempo2 = imag(x_f(r2+1:r3-1));
tempo3 = imag(x_f(r4+1:end));


a = 0;
b = max(abs(real(x_f)));
c = 0;
d = max(abs(imag(x_f)));

if isempty(get(handles.scalePeriodicityInput,'String'))
    scale = 0.2;
else
    scale = str2double(get(handles.scalePeriodicityInput,'String'));
end

j = 1;
for i = r1:r2
    y_f(i) = (a + (b-a).*rand(1,1))*scale;
    y_f(r4-j+1) = y_f(i);
    y_fo(i) = (c + (d-c).*rand(1,1))*scale;
    y_fo(r4-j+1) = y_fo(i);
    j = j + 1;
end

y_f2 = [temp1,y_f(r1:r2),temp2,y_f(r3:r4),temp3];
y_f3 = [tempo1,y_fo(r1:r2),tempo2,y_fo(r3:r4),tempo3];
y_f4 = y_f2 + 1i*y_f3;

y_t = (ifft(y_f4));
filtered_u1 = real(y_t(1:N1));
filtered_u = filtered_u1(NR+1:end-NR);
% Formula for computing the input needed for pwelch
temp = 2*(1-p)+(na-1)*p+(1-2*p)*(na-2);
n = floor(N1/temp);
Stri1 = get(handles.windowPopup, 'String');
Vari1 = get(handles.windowPopup,'Value');
% Performing pwelch on the non-periodic data
switch Stri1{Vari1}
    case 'hamming'
        [pxx1,f2] = pwelch(filtered_u,hamming(n),floor(p*n),nfft,fs);
    case 'hann'
        [pxx1,f2] = pwelch(filtered_u,hanning(n),floor(p*n),nfft,fs);
    case 'rectwin'
        [pxx1,f2] = pwelch(filtered_u,rectwin(n),floor(p*n),nfft,fs);
    case 'chebwin'
        [pxx1,f2] = pwelch(filtered_u,chebwin(n),floor(p*n),nfft,fs);
    case 'gausswin'
        [pxx1,f2] = pwelch(filtered_u,gausswin(n),floor(p*n),nfft,fs);
    case 'triang'
        [pxx1,f2] = pwelch(filtered_u,triang(n),floor(p*n),nfft,fs);
end

var = get(handles.removePeriodicityGroup,'SelectedObject');
selection = get(var,'String');
switch selection
    case 'Yes'
        array = [handles.selectedDataPeriodicCheck,handles.selectedSpectrumCheck,...
            handles.nonPeriodicCheck,handles.peakRemovedSpectrumCheck];
        set(array,'Visible','On');
        set(array,'Enable','On');
        set(array,'Value',1);
        array1 = [handles.scalePeriodicityInput,handles.minlimitPeriodicityInput,...
            handles.maxlimitPeriodicityInput,handles.appendPeriodicityInput];
        set(array1,'Enable','On');
        axes(handles.periodicaxes2);
        cla reset;
        semilogy(f1,(pxx),f2,(pxx1));
        title('Spectral Density','FontName','Times');
        hold on;
        xlabel('\hspace{30em}\normalfont\bf{f[Hz]}','interpreter','latex');
        legend('Selected signal spectrum','Non-periodic signal spectrum');
        semilogy(f1(locs),peaks(posit),'*','MarkerSize',5);
        
        axes(handles.periodicaxes1);
        cla reset
        plot(t,final_u,t,filtered_u);
        title('Selected signal','FontName','Times');
        legend('Selected Time Trace','Non-periodic Time Trace');
        xlabel('$$\hspace{30em}\normalfont\bf{t[s]}$$','interpreter','latex');
        ylabel('\hspace{10em}\normalfont\bf{Signal}','interpreter','latex');
        
        filtered_u = filtered_u + mean_f;
        handles.message = {sprintf('A peak of %f is detected at a frequency of %d Hz\n',max(peaks),f1(locs))
            sprintf('A new signal is generated with periodicity removed at f = %d Hz',f1(locs))};
        set(handles.resultDisplay,'String',handles.message);
        set(handles.scalePeriodicityInput,'String',scale);
        set(handles.appendPeriodicityInput,'String',NR);
        set(handles.minlimitPeriodicityInput,'String',num2str(f1(indmin),'%.2f'));
        set(handles.maxlimitPeriodicityInput,'String',num2str(f1(indmax),'%.2f'));
    case 'No'
        array = [handles.selectedDataPeriodicCheck,handles.selectedSpectrumCheck];
        set(array,'Visible','On');
        set(array,'Enable','On');
        set(array,'Value',1);
        array1 = [handles.scalePeriodicityInput,handles.minlimitPeriodicityInput,...
            handles.maxlimitPeriodicityInput,handles.appendPeriodicityInput];
        set(array1,'Enable','off');
        set(array1,'String','');
        array1 = [handles.nonPeriodicCheck,handles.peakRemovedSpectrumCheck];
        set(array1,'Visible','Off');
        set(array1,'Value',0);
        axes(handles.periodicaxes2);
        cla reset;
        semilogy(f1,(pxx));
        title('Spectral Density','FontName','Times');
        hold on;
        xlabel('\hspace{30em}\normalfont\bf{f[Hz]}','interpreter','latex');
        legend('Selected signal spectrum');
        semilogy(f1(locs),peaks(posit),'*','MarkerSize',5);
        axes(handles.periodicaxes1);
        cla reset;
        plot(t,final_u);
        title('Selected signal','FontName','Times');
        legend('Selected Time Trace');
        xlabel('$$\hspace{30em}\normalfont\bf{t[s]}$$','interpreter','latex');
        ylabel('\hspace{10em}\normalfont\bf{Signal}','interpreter','latex');
        filtered_u = final_u + mean_f;
        handles.message = {sprintf('A peak of %f is detected at a frequency of %d Hz\n',max(peaks),f1(locs))};
        set(handles.resultDisplay,'String',handles.message);
end
colorgen = @(color,text) ['<html><table border=0 width=400 bgcolor=',color,'><TR><TD>',text,'</TD></TR> </table></html>'];
data = {colorgen('#F0F0F0','Mean'), num2str(mean(filtered_u))
    colorgen('#F0F0F0','Std Dev.'), num2str(std(filtered_u))
    colorgen('#F0F0F0','Kurtosis'), num2str(kurtosis(filtered_u))
    colorgen('#F0F0F0','Skewness'), num2str(skewness(filtered_u))
    };
set(handles.statisticsTable,'Data',data);
% Saving the non-periodic data, updating struct and updating the
% summary table
string1 = get(handles.originalDataPeriodicPopup, 'String');
value1 = get(handles.originalDataPeriodicPopup,'Value');
if strcmp(string1,'Signal 1')
    data = get(handles.data1SummaryTable,'Data');
    dataCol = cellstr(data(:,2));
    if get(handles.yesRemovePerioButton','Value')
        dataCol(4) = cellstr('Yes');
    else
        dataCol(4) = cellstr('No');
    end
    dataCol(5) = cellstr(num2str(f1(locs)));
    data(:,2) = dataCol;
    set(handles.data1SummaryTable,'Data',data);
    
    if get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
        assignin('base','Signal1_sPoly_nChau_np',filtered_u);
        handles.Summary1.Mean.Signal1_sPoly_nChau_np = mean(filtered_u);
        handles.Summary1.Std.SampleRecord.Signal1_sPoly_nChau_np = std(filtered_u);
        handles.Summary1.PeakFrequency.Signal1_sPoly_nChau = f1(locs);
        handles.Summary1.PeakValue.Signal1_sPoly_nChau = max(peaks);
    elseif get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
        assignin('base','Signal1_sDetr_nChau_np',filtered_u);
        handles.Summary1.Mean.Signal1_sDetr_nChau_np = mean(filtered_u);
        handles.Summary1.Std.SampleRecord.Signal1_sDetr_nChau_np = std(filtered_u);
        handles.Summary1.PeakFrequency.Signal1_sDetr_nChau = f1(locs);
        handles.Summary1.PeakValue.Signal1_sDetr_nChau = max(peaks);
    elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
        assignin('base','Signal1_sPoly_nHist_np',filtered_u);
        handles.Summary1.Mean.Signal1_sPoly_nHist_np = mean(filtered_u);
        handles.Summary1.Std.SampleRecord.Signal1_sPoly_nHist_np = std(filtered_u);
        handles.Summary1.PeakFrequency.Signal1_sPoly_nHist = f1(locs);
        handles.Summary1.PeakValue.Signal1_sPoly_nHist = max(peaks);
    elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
        assignin('base','Signal1_sDetr_nHist_np',filtered_u);
        handles.Summary1.Mean.Signal1_sDetr_nHist_np = mean(filtered_u);
        handles.Summary1.Std.SampleRecord.Signal1_sDetr_nHist_np = std(filtered_u);
        handles.Summary1.PeakFrequency.Signal1_sDetr_nHist = f1(locs);
        handles.Summary1.PeakValue.Signal1_sDetr_nHist = max(peaks);
    elseif get(handles.noiselessHistoPeriodicCheck,'Value')
        assignin('base','Signal1_nHist_np',filtered_u);
        handles.Summary1.Mean.Signal1_nHist_np = mean(filtered_u);
        handles.Summary1.Std.SampleRecord.Signal1_nHist_np = std(filtered_u);
        handles.Summary1.PeakFrequency.Signal1_nHist = f1(locs);
        handles.Summary1.PeakValue.Signal1_nHist = max(peaks);
    elseif get(handles.noiselessChauPeriodicCheck,'Value')
        assignin('base','Signal1_nChau_np',filtered_u);
        handles.Summary1.Mean.Signal1_nChau_np = mean(filtered_u);
        handles.Summary1.Std.SampleRecord.Signal1_nChau_np = std(filtered_u);
        handles.Summary1.PeakFrequency.Signal1_nChau = f1(locs);
        handles.Summary1.PeakValue.Signal1_nChau = max(peaks);
    elseif get(handles.stationaryPolyPeriodicCheck,'Value')
        assignin('base','Signal1_sPoly_np',filtered_u);
        handles.Summary1.Mean.Signal1_sPoly_np = mean(filtered_u);
        handles.Summary1.Std.SampleRecord.Signal1_sPoly_np = std(filtered_u);
        handles.Summary1.PeakFrequency.Signal1_sPoly = f1(locs);
        handles.Summary1.PeakValue.Signal1_sPoly = max(peaks);
    elseif get(handles.stationaryDetrendPeriodicCheck,'Value')
        assignin('base','Signal1_sDetr_np',filtered_u);
        handles.Summary1.Mean.Signal1_sDetr_np = mean(filtered_u);
        handles.Summary1.Std.SampleRecord.Signal1_sDetr_np = std(filtered_u);
        handles.Summary1.PeakFrequency.Signal1_sDetr = f1(locs);
        handles.Summary1.PeakValue.Signal1_sDetr = max(peaks);
    else
        assignin('base','Signal1_np',filtered_u);
        handles.Summary1.Mean.Signal1_np = mean(filtered_u);
        handles.Summary1.Std.SampleRecord.Signal1_np = std(filtered_u);
        handles.Summary1.PeakFrequency.Signal1 = f1(locs);
        handles.Summary1.PeakValue.Signal1 = max(peaks);
    end
    
else
    switch string1{value1}
        case 'Signal 1'
            data = get(handles.data1SummaryTable,'Data');
            dataCol = cellstr(data(:,2));
            if get(handles.yesRemovePerioButton','Value')
                dataCol(4) = cellstr('Yes');
            else
                dataCol(4) = cellstr('No');
            end
            dataCol(5) = cellstr(num2str(f1(locs)));
            data(:,2) = dataCol;
            set(handles.data1SummaryTable,'Data',data);
            
            if get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                assignin('base','Signal1_sPoly_nChau_np',filtered_u);
                handles.Summary1.Mean.Signal1_sPoly_nChau_np = mean(filtered_u);
                handles.Summary1.Std.SampleRecord.Signal1_sPoly_nChau_np = std(filtered_u);
                handles.Summary1.PeakFrequency.Signal1_sPoly_nChau = f1(locs);
                handles.Summary1.PeakValue.Signal1_sPoly_nChau = max(peaks);
            elseif get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                assignin('base','Signal1_sDetr_nChau_np',filtered_u);
                handles.Summary1.Mean.Signal1_sDetr_nChau_np = mean(filtered_u);
                handles.Summary1.Std.SampleRecord.Signal1_sDetr_nChau_np = std(filtered_u);
                handles.Summary1.PeakFrequency.Signal1_sDetr_nChau = f1(locs);
                handles.Summary1.PeakValue.Signal1_sDetr_nChau = max(peaks);
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                assignin('base','Signal1_sPoly_nHist_np',filtered_u);
                handles.Summary1.Mean.Signal1_sPoly_nHist_np = mean(filtered_u);
                handles.Summary1.Std.SampleRecord.Signal1_sPoly_nHist_np = std(filtered_u);
                handles.Summary1.PeakFrequency.Signal1_sPoly_nHist = f1(locs);
                handles.Summary1.PeakValue.Signal1_sPoly_nHist = max(peaks);
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                assignin('base','Signal1_sDetr_nHist_np',filtered_u);
                handles.Summary1.Mean.Signal1_sDetr_nHist_np = mean(filtered_u);
                handles.Summary1.Std.SampleRecord.Signal1_sDetr_nHist_np = std(filtered_u);
                handles.Summary1.PeakFrequency.Signal1_sDetr_nHist = f1(locs);
                handles.Summary1.PeakValue.Signal1_sDetr_nHist = max(peaks);
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')
                assignin('base','Signal1_nHist_np',filtered_u);
                handles.Summary1.Mean.Signal1_nHist_np = mean(filtered_u);
                handles.Summary1.Std.SampleRecord.Signal1_nHist_np = std(filtered_u);
                handles.Summary1.PeakFrequency.Signal1_nHist = f1(locs);
                handles.Summary1.PeakValue.Signal1_nHist = max(peaks);
            elseif get(handles.noiselessChauPeriodicCheck,'Value')
                assignin('base','Signal1_nChau_np',filtered_u);
                handles.Summary1.Mean.Signal1_nChau_np = mean(filtered_u);
                handles.Summary1.Std.SampleRecord.Signal1_nChau_np = std(filtered_u);
                handles.Summary1.PeakFrequency.Signal1_nChau = f1(locs);
                handles.Summary1.PeakValue.Signal1_nChau = max(peaks);
            elseif get(handles.stationaryPolyPeriodicCheck,'Value')
                assignin('base','Signal1_sPoly_np',filtered_u);
                handles.Summary1.Mean.Signal1_sPoly_np = mean(filtered_u);
                handles.Summary1.Std.SampleRecord.Signal1_sPoly_np = std(filtered_u);
                handles.Summary1.PeakFrequency.Signal1_sPoly = f1(locs);
                handles.Summary1.PeakValue.Signal1_sPoly = max(peaks);
            elseif get(handles.stationaryDetrendPeriodicCheck,'Value')
                assignin('base','Signal1_sDetr_np',filtered_u);
                handles.Summary1.Mean.Signal1_sDetr_np = mean(filtered_u);
                handles.Summary1.Std.SampleRecord.Signal1_sDetr_np = std(filtered_u);
                handles.Summary1.PeakFrequency.Signal1_sDetr = f1(locs);
                handles.Summary1.PeakValue.Signal1_sDetr = max(peaks);
            else
                assignin('base','Signal1_np',filtered_u);
                handles.Summary1.Mean.Signal1_np = mean(filtered_u);
                handles.Summary1.Std.SampleRecord.Signal1_np = std(filtered_u);
                handles.Summary1.PeakFrequency.Signal1 = f1(locs);
                handles.Summary1.PeakValue.Signal1 = max(peaks);
            end
            
        case 'Signal 2'
            data = get(handles.data2SummaryTable,'Data');
            dataCol = cellstr(data(:,2));
            if get(handles.yesRemovePerioButton','Value')
                dataCol(4) = cellstr('Yes');
            else
                dataCol(4) = cellstr('No');
            end
            dataCol(5) = cellstr(num2str(f1(locs)));
            data(:,2) = dataCol;
            set(handles.data2SummaryTable,'Data',data);
            
            if get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                assignin('base','Signal2_sPoly_nChau_np',filtered_u);
                handles.Summary2.Mean.Signal2_sPoly_nChau_np = mean(filtered_u);
                handles.Summary2.Std.SampleRecord.Signal2_sPoly_nChau_np = std(filtered_u);
                handles.Summary2.PeakFrequency.Signal2_sPoly_nChau = f1(locs);
                handles.Summary2.PeakValue.Signal2_sPoly_nChau = max(peaks);
            elseif get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                assignin('base','Signal2_sDetr_nChau_np',filtered_u);
                handles.Summary2.Mean.Signal2_sDetr_nChau_np = mean(filtered_u);
                handles.Summary2.Std.SampleRecord.Signal2_sDetr_nChau_np = std(filtered_u);
                handles.Summary2.PeakFrequency.Signal2_sDetr_nChau = f1(locs);
                handles.Summary2.PeakValue.Signal2_sDetr_nChau = max(peaks);
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                assignin('base','Signal2_sPoly_nHist_np',filtered_u);
                handles.Summary2.Mean.Signal2_sPoly_nHist_np = mean(filtered_u);
                handles.Summary2.Std.SampleRecord.Signal2_sPoly_nHist_np = std(filtered_u);
                handles.Summary2.PeakFrequency.Signal2_sPoly_nHist = f1(locs);
                handles.Summary2.PeakValue.Signal2_sPoly_nHist = max(peaks);
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                assignin('base','Signal2_sDetr_nHist_np',filtered_u);
                handles.Summary2.Mean.Signal2_sDetr_nHist_np = mean(filtered_u);
                handles.Summary2.Std.SampleRecord.Signal2_sDetr_nHist_np = std(filtered_u);
                handles.Summary2.PeakFrequency.Signal2_sDetr_nHist = f1(locs);
                handles.Summary2.PeakValue.Signal2_sDetr_nHist = max(peaks);
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')
                assignin('base','Signal2_nHist_np',filtered_u);
                handles.Summary2.Mean.Signal2_nHist_np = mean(filtered_u);
                handles.Summary2.Std.SampleRecord.Signal2_nHist_np = std(filtered_u);
                handles.Summary2.PeakFrequency.Signal2_nHist = f1(locs);
                handles.Summary2.PeakValue.Signal2_nHist = max(peaks);
            elseif get(handles.noiselessChauPeriodicCheck,'Value')
                assignin('base','Signal2_nChau_np',filtered_u);
                handles.Summary2.Mean.Signal2_nChau_np = mean(filtered_u);
                handles.Summary2.Std.SampleRecord.Signal2_nChau_np = std(filtered_u);
                handles.Summary2.PeakFrequency.Signal2_nChau = f1(locs);
                handles.Summary2.PeakValue.Signal2_nChau = max(peaks);
            elseif get(handles.stationaryPolyPeriodicCheck,'Value')
                assignin('base','Signal2_sPoly_np',filtered_u);
                handles.Summary2.Mean.Signal2_sPoly_np = mean(filtered_u);
                handles.Summary2.Std.SampleRecord.Signal2_sPoly_np = std(filtered_u);
                handles.Summary2.PeakFrequency.Signal2_sPoly = f1(locs);
                handles.Summary2.PeakValue.Signal2_sPoly = max(peaks);
            elseif get(handles.stationaryDetrendPeriodicCheck,'Value')
                assignin('base','Signal2_sDetr_np',filtered_u);
                handles.Summary2.Mean.Signal2_sDetr_np = mean(filtered_u);
                handles.Summary2.Std.SampleRecord.Signal2_sDetr_np = std(filtered_u);
                handles.Summary2.PeakFrequency.Signal2_sDetr = f1(locs);
                handles.Summary2.PeakValue.Signal2_sDetr = max(peaks);
            else
                assignin('base','Signal2_np',filtered_u);
                handles.Summary2.Mean.Signal2_np = mean(filtered_u);
                handles.Summary2.Std.SampleRecord.Signal2_np = std(filtered_u);
                handles.Summary2.PeakFrequency.Signal2 = f1(locs);
                handles.Summary2.PeakValue.Signal2 = max(peaks);
            end
            
        case 'Signal 3'
            data = get(handles.data3SummaryTable,'Data');
            dataCol = cellstr(data(:,2));
            if get(handles.yesRemovePerioButton','Value')
                dataCol(4) = cellstr('Yes');
            else
                dataCol(4) = cellstr('No');
            end
            dataCol(5) = cellstr(num2str(f1(locs)));
            data(:,2) = dataCol;
            set(handles.data3SummaryTable,'Data',data);
            
            if get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                assignin('base','Signal3_sPoly_nChau_np',filtered_u);
                handles.Summary3.Mean.Signal3_sPoly_nChau_np = mean(filtered_u);
                handles.Summary3.Std.SampleRecord.Signal3_sPoly_nChau_np = std(filtered_u);
                handles.Summary3.PeakFrequency.Signal3_sPoly_nChau = f1(locs);
                handles.Summary3.PeakValue.Signal3_sPoly_nChau = max(peaks);
            elseif get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                assignin('base','Signal3_sDetr_nChau_np',filtered_u);
                handles.Summary3.Mean.Signal3_sDetr_nChau_np = mean(filtered_u);
                handles.Summary3.Std.SampleRecord.Signal3_sDetr_nChau_np = std(filtered_u);
                handles.Summary3.PeakFrequency.Signal3_sDetr_nChau = f1(locs);
                handles.Summary3.PeakValue.Signal3_sDetr_nChau = max(peaks);
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                assignin('base','Signal3_sPoly_nHist_np',filtered_u);
                handles.Summary3.Mean.Signal3_sPoly_nHist_np = mean(filtered_u);
                handles.Summary3.Std.SampleRecord.Signal3_sPoly_nHist_np = std(filtered_u);
                handles.Summary3.PeakFrequency.Signal3_sPoly_nHist = f1(locs);
                handles.Summary3.PeakValue.Signal3_sPoly_nHist = max(peaks);
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                assignin('base','Signal3_sDetr_nHist_np',filtered_u);
                handles.Summary3.Mean.Signal3_sDetr_nHist_np = mean(filtered_u);
                handles.Summary3.Std.SampleRecord.Signal3_sDetr_nHist_np = std(filtered_u);
                handles.Summary3.PeakFrequency.Signal3_sDetr_nHist = f1(locs);
                handles.Summary3.PeakValue.Signal3_sDetr_nHist = max(peaks);
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')
                assignin('base','Signal3_nHist_np',filtered_u);
                handles.Summary3.Mean.Signal3_nHist_np = mean(filtered_u);
                handles.Summary3.Std.SampleRecord.Signal3_nHist_np = std(filtered_u);
                handles.Summary3.PeakFrequency.Signal3_nHist = f1(locs);
                handles.Summary3.PeakValue.Signal3_nHist = max(peaks);
            elseif get(handles.noiselessChauPeriodicCheck,'Value')
                assignin('base','Signal3_nChau_np',filtered_u);
                handles.Summary3.Mean.Signal3_nChau_np = mean(filtered_u);
                handles.Summary3.Std.SampleRecord.Signal3_nChau_np = std(filtered_u);
                handles.Summary3.PeakFrequency.Signal3_nChau = f1(locs);
                handles.Summary3.PeakValue.Signal3_nChau = max(peaks);
            elseif get(handles.stationaryPolyPeriodicCheck,'Value')
                assignin('base','Signal3_sPoly_np',filtered_u);
                handles.Summary3.Mean.Signal3_sPoly_np = mean(filtered_u);
                handles.Summary3.Std.SampleRecord.Signal3_sPoly_np = std(filtered_u);
                handles.Summary3.PeakFrequency.Signal3_sPoly = f1(locs);
                handles.Summary3.PeakValue.Signal3_sPoly = max(peaks);
            elseif get(handles.stationaryDetrendPeriodicCheck,'Value')
                assignin('base','Signal3_sDetr_np',filtered_u);
                handles.Summary3.Mean.Signal3_sDetr_np = mean(filtered_u);
                handles.Summary3.Std.SampleRecord.Signal3_sDetr_np = std(filtered_u);
                handles.Summary3.PeakFrequency.Signal3_sDetr = f1(locs);
                handles.Summary3.PeakValue.Signal3_sDetr = max(peaks);
            else
                assignin('base','Signal3_np',filtered_u);
                handles.Summary3.Mean.Signal3_np = mean(filtered_u);
                handles.Summary3.Std.SampleRecord.Signal3_np = std(filtered_u);
                handles.Summary3.PeakFrequency.Signal3 = f1(locs);
                handles.Summary3.PeakValue.Signal3 = max(peaks);
            end
            
        case 'Signal 4'
            data = get(handles.data4SummaryTable,'Data');
            dataCol = cellstr(data(:,2));
            if get(handles.yesRemovePerioButton','Value')
                dataCol(4) = cellstr('Yes');
            else
                dataCol(4) = cellstr('No');
            end
            dataCol(5) = cellstr(num2str(f1(locs)));
            data(:,2) = dataCol;
            set(handles.data4SummaryTable,'Data',data);
            
            if get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                assignin('base','Signal4_sPoly_nChau_np',filtered_u);
                handles.Summary4.Mean.Signal4_sPoly_nChau_np = mean(filtered_u);
                handles.Summary4.Std.SampleRecord.Signal4_sPoly_nChau_np = std(filtered_u);
                handles.Summary4.PeakFrequency.Signal4_sPoly_nChau = f1(locs);
                handles.Summary4.PeakValue.Signal4_sPoly_nChau = max(peaks);
            elseif get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                assignin('base','Signal4_sDetr_nChau_np',filtered_u);
                handles.Summary4.Mean.Signal4_sDetr_nChau_np = mean(filtered_u);
                handles.Summary4.Std.SampleRecord.Signal4_sDetr_nChau_np = std(filtered_u);
                handles.Summary4.PeakFrequency.Signal4_sDetr_nChau = f1(locs);
                handles.Summary4.PeakValue.Signal4_sDetr_nChau = max(peaks);
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                assignin('base','Signal4_sPoly_nHist_np',filtered_u);
                handles.Summary4.Mean.Signal4_sPoly_nHist_np = mean(filtered_u);
                handles.Summary4.Std.SampleRecord.Signal4_sPoly_nHist_np = std(filtered_u);
                handles.Summary4.PeakFrequency.Signal4_sPoly_nHist = f1(locs);
                handles.Summary4.PeakValue.Signal4_sPoly_nHist = max(peaks);
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                assignin('base','Signal4_sDetr_nHist_np',filtered_u);
                handles.Summary4.Mean.Signal4_sDetr_nHist_np = mean(filtered_u);
                handles.Summary4.Std.SampleRecord.Signal4_sDetr_nHist_np = std(filtered_u);
                handles.Summary4.PeakFrequency.Signal4_sDetr_nHist = f1(locs);
                handles.Summary4.PeakValue.Signal4_sDetr_nHist = max(peaks);
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')
                assignin('base','Signal4_nHist_np',filtered_u);
                handles.Summary4.Mean.Signal4_nHist_np = mean(filtered_u);
                handles.Summary4.Std.SampleRecord.Signal4_nHist_np = std(filtered_u);
                handles.Summary4.PeakFrequency.Signal4_nHist = f1(locs);
                handles.Summary4.PeakValue.Signal4_nHist = max(peaks);
            elseif get(handles.noiselessChauPeriodicCheck,'Value')
                assignin('base','Signal4_nChau_np',filtered_u);
                handles.Summary4.Mean.Signal4_nChau_np = mean(filtered_u);
                handles.Summary4.Std.SampleRecord.Signal4_nChau_np = std(filtered_u);
                handles.Summary4.PeakFrequency.Signal4_nChau = f1(locs);
                handles.Summary4.PeakValue.Signal4_nChau = max(peaks);
            elseif get(handles.stationaryPolyPeriodicCheck,'Value')
                assignin('base','Signal4_sPoly_np',filtered_u);
                handles.Summary4.Mean.Signal4_sPoly_np = mean(filtered_u);
                handles.Summary4.Std.SampleRecord.Signal4_sPoly_np = std(filtered_u);
                handles.Summary4.PeakFrequency.Signal4_sPoly = f1(locs);
                handles.Summary4.PeakValue.Signal4_sPoly = max(peaks);
            elseif get(handles.stationaryDetrendPeriodicCheck,'Value')
                assignin('base','Signal4_sDetr_np',filtered_u);
                handles.Summary4.Mean.Signal4_sDetr_np = mean(filtered_u);
                handles.Summary4.Std.SampleRecord.Signal4_sDetr_np = std(filtered_u);
                handles.Summary4.PeakFrequency.Signal4_sDetr = f1(locs);
                handles.Summary4.PeakValue.Signal4_sDetr = max(peaks);
            else
                assignin('base','Signal4_np',filtered_u);
                handles.Summary4.Mean.Signal4_np = mean(filtered_u);
                handles.Summary4.Std.SampleRecord.Signal4_np = std(filtered_u);
                handles.Summary4.PeakFrequency.Signal4 = f1(locs);
                handles.Summary4.PeakValue.Signal4 = max(peaks);
            end
            
        case 'Signal 5'
            data = get(handles.data5SummaryTable,'Data');
            dataCol = cellstr(data(:,2));
            if get(handles.yesRemovePerioButton','Value')
                dataCol(4) = cellstr('Yes');
            else
                dataCol(4) = cellstr('No');
            end
            dataCol(5) = cellstr(num2str(f1(locs)));
            data(:,2) = dataCol;
            set(handles.data5SummaryTable,'Data',data);
            
            if get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                assignin('base','Signal5_sPoly_nChau_np',filtered_u);
                handles.Summary5.Mean.Signal5_sPoly_nChau_np = mean(filtered_u);
                handles.Summary5.Std.SampleRecord.Signal5_sPoly_nChau_np = std(filtered_u);
                handles.Summary5.PeakFrequency.Signal5_sPoly_nChau = f1(locs);
                handles.Summary5.PeakValue.Signal5_sPoly_nChau = max(peaks);
            elseif get(handles.noiselessChauPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                assignin('base','Signal5_sDetr_nChau_np',filtered_u);
                handles.Summary5.Mean.Signal5_sDetr_nChau_np = mean(filtered_u);
                handles.Summary5.Std.SampleRecord.Signal5_sDetr_nChau_np = std(filtered_u);
                handles.Summary5.PeakFrequency.Signal5_sDetr_nChau = f1(locs);
                handles.Summary5.PeakValue.Signal5_sDetr_nChau = max(peaks);
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryPolyPeriodicCheck,'Value')
                assignin('base','Signal5_sPoly_nHist_np',filtered_u);
                handles.Summary5.Mean.Signal5_sPoly_nHist_np = mean(filtered_u);
                handles.Summary5.Std.SampleRecord.Signal5_sPoly_nHist_np = std(filtered_u);
                handles.Summary5.PeakFrequency.Signal5_sPoly_nHist = f1(locs);
                handles.Summary5.PeakValue.Signal5_sPoly_nHist = max(peaks);
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')&&get(handles.stationaryDetrendPeriodicCheck,'Value')
                assignin('base','Signal5_sDetr_nHist_np',filtered_u);
                handles.Summary5.Mean.Signal5_sDetr_nHist_np = mean(filtered_u);
                handles.Summary5.Std.SampleRecord.Signal5_sDetr_nHist_np = std(filtered_u);
                handles.Summary5.PeakFrequency.Signal5_sDetr_nHist = f1(locs);
                handles.Summary5.PeakValue.Signal5_sDetr_nHist = max(peaks);
            elseif get(handles.noiselessHistoPeriodicCheck,'Value')
                assignin('base','Signal5_nHist_np',filtered_u);
                handles.Summary5.Mean.Signal5_nHist_np = mean(filtered_u);
                handles.Summary5.Std.SampleRecord.Signal5_nHist_np = std(filtered_u);
                handles.Summary5.PeakFrequency.Signal5_nHist = f1(locs);
                handles.Summary5.PeakValue.Signal5_nHist = max(peaks);
            elseif get(handles.noiselessChauPeriodicCheck,'Value')
                assignin('base','Signal5_nChau_np',filtered_u);
                handles.Summary5.Mean.Signal5_nChau_np = mean(filtered_u);
                handles.Summary5.Std.SampleRecord.Signal5_nChau_np = std(filtered_u);
                handles.Summary5.PeakFrequency.Signal5_nChau = f1(locs);
                handles.Summary5.PeakValue.Signal5_nChau = max(peaks);
            elseif get(handles.stationaryPolyPeriodicCheck,'Value')
                assignin('base','Signal5_sPoly_np',filtered_u);
                handles.Summary5.Mean.Signal5_sPoly_np = mean(filtered_u);
                handles.Summary5.Std.SampleRecord.Signal5_sPoly_np = std(filtered_u);
                handles.Summary5.PeakFrequency.Signal5_sPoly = f1(locs);
                handles.Summary5.PeakValue.Signal5_sPoly = max(peaks);
            elseif get(handles.stationaryDetrendPeriodicCheck,'Value')
                assignin('base','Signal5_sDetr_np',filtered_u);
                handles.Summary5.Mean.Signal5_sDetr_np = mean(filtered_u);
                handles.Summary5.Std.SampleRecord.Signal5_sDetr_np = std(filtered_u);
                handles.Summary5.PeakFrequency.Signal5_sDetr = f1(locs);
                handles.Summary5.PeakValue.Signal5_sDetr = max(peaks);
            else
                assignin('base','Signal5_np',filtered_u);
                handles.Summary5.Mean.Signal5_np = mean(filtered_u);
                handles.Summary5.Std.SampleRecord.Signal5_np = std(filtered_u);
                handles.Summary5.PeakFrequency.Signal5 = f1(locs);
                handles.Summary5.PeakValue.Signal5 = max(peaks);
            end
            
    end
end
guidata(hObject,handles);


% --- Executes on button press in stationaryDetrendPeriodicCheck.
function stationaryDetrendPeriodicCheck_Callback(hObject, eventdata, handles)
% hObject    handle to stationaryDetrendPeriodicCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stationaryDetrendPeriodicCheck


% --- Executes on button press in stationaryPolyPeriodicCheck.
function stationaryPolyPeriodicCheck_Callback(hObject, eventdata, handles)
% hObject    handle to stationaryPolyPeriodicCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stationaryPolyPeriodicCheck


% --- Executes on button press in normalizedPeriodicCheck.
function normalizedPeriodicCheck_Callback(hObject, eventdata, handles)
% hObject    handle to normalizedPeriodicCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of normalizedPeriodicCheck


% --- Executes on button press in noiselessChauPeriodicCheck.
function noiselessChauPeriodicCheck_Callback(hObject, eventdata, handles)
% hObject    handle to noiselessChauPeriodicCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of noiselessChauPeriodicCheck


% --- Executes on button press in noiselessHistoPeriodicCheck.
function noiselessHistoPeriodicCheck_Callback(hObject, eventdata, handles)
% hObject    handle to noiselessHistoPeriodicCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of noiselessHistoPeriodicCheck


% --- Executes on button press in stationaryDetrendNormCheck.
function stationaryDetrendNormCheck_Callback(hObject, eventdata, handles)
% hObject    handle to stationaryDetrendNormCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stationaryDetrendNormCheck


% --- Executes on button press in stationaryPolyNormCheck.
function stationaryPolyNormCheck_Callback(hObject, eventdata, handles)
% hObject    handle to stationaryPolyNormCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stationaryPolyNormCheck


% --- Executes on button press in chauNormCheck.
function chauNormCheck_Callback(hObject, eventdata, handles)
% hObject    handle to chauNormCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chauNormCheck


% --- Executes on button press in histoNormCheck.
function histoNormCheck_Callback(hObject, eventdata, handles)
% hObject    handle to histoNormCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of histoNormCheck


% --- Executes on button press in noiselessChauSpectralCheck.
function noiselessChauSpectralCheck_Callback(hObject, eventdata, handles)
% hObject    handle to noiselessChauSpectralCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of noiselessChauSpectralCheck


% --- Executes on button press in noiselessHistoSpectralCheck.
function noiselessHistoSpectralCheck_Callback(hObject, eventdata, handles)
% hObject    handle to noiselessHistoSpectralCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of noiselessHistoSpectralCheck


% --- Executes on button press in nonperiodicSpectralCheck.
function nonperiodicSpectralCheck_Callback(hObject, eventdata, handles)
% hObject    handle to nonperiodicSpectralCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of nonperiodicSpectralCheck


% --- Executes on button press in stationaryDetrendSpectralCheck.
function stationaryDetrendSpectralCheck_Callback(hObject, eventdata, handles)
% hObject    handle to stationaryDetrendSpectralCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stationaryDetrendSpectralCheck


% --- Executes on button press in stationaryPolySpectralCheck.
function stationaryPolySpectralCheck_Callback(hObject, eventdata, handles)
% hObject    handle to stationaryPolySpectralCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stationaryPolySpectralCheck


% --- Executes on button press in stationaryDetrendUncertainty1Check.
function stationaryDetrendUncertainty1Check_Callback(hObject, eventdata, handles)
% hObject    handle to stationaryDetrendUncertainty1Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stationaryDetrendUncertainty1Check


% --- Executes on button press in noiselessHistoUncertainty1Check.
function stationaryPolyUncertainty1Check_Callback(hObject, eventdata, handles)
% hObject    handle to noiselessHistoUncertainty1Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of noiselessHistoUncertainty1Check


% --- Executes on button press in stationaryPolyUncertainty1Check.
function noiselessHistoUncertainty1Check_Callback(hObject, eventdata, handles)
% hObject    handle to stationaryPolyUncertainty1Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stationaryPolyUncertainty1Check


% --- Executes on button press in nonperiodicUncertainty1Check.
function nonperiodicUncertainty1Check_Callback(hObject, eventdata, handles)
% hObject    handle to nonperiodicUncertainty1Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of nonperiodicUncertainty1Check


% --- Executes on button press in noiselessHistoUncertainty1Check.
function noiselessChauUncertainty1Check_Callback(hObject, eventdata, handles)
% hObject    handle to noiselessHistoUncertainty1Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of noiselessHistoUncertainty1Check


% --- Executes on button press in stationaryDetrendUncertainty5Check.
function stationaryDetrendUncertainty5Check_Callback(hObject, eventdata, handles)
% hObject    handle to stationaryDetrendUncertainty5Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stationaryDetrendUncertainty5Check


% --- Executes on button press in stationaryPolyUncertainty5Check.
function stationaryPolyUncertainty5Check_Callback(hObject, eventdata, handles)
% hObject    handle to stationaryPolyUncertainty5Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stationaryPolyUncertainty5Check


% --- Executes on button press in noiselessHistoUncertainty5Check.
function noiselessHistoUncertainty5Check_Callback(hObject, eventdata, handles)
% hObject    handle to noiselessHistoUncertainty5Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of noiselessHistoUncertainty5Check


% --- Executes on button press in nonperiodicUncertainty5Check.
function nonperiodicUncertainty5Check_Callback(hObject, eventdata, handles)
% hObject    handle to nonperiodicUncertainty5Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of nonperiodicUncertainty5Check


% --- Executes on button press in noiselessChauUncertainty5Check.
function noiselessChauUncertainty5Check_Callback(hObject, eventdata, handles)
% hObject    handle to noiselessChauUncertainty5Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of noiselessChauUncertainty5Check


% --- Executes on button press in stationaryDetrendUncertainty4Check.
function stationaryDetrendUncertainty4Check_Callback(hObject, eventdata, handles)
% hObject    handle to stationaryDetrendUncertainty4Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stationaryDetrendUncertainty4Check


% --- Executes on button press in stationaryPolyUncertainty4Check.
function stationaryPolyUncertainty4Check_Callback(hObject, eventdata, handles)
% hObject    handle to stationaryPolyUncertainty4Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stationaryPolyUncertainty4Check


% --- Executes on button press in noiselessHistoUncertainty4Check.
function noiselessHistoUncertainty4Check_Callback(hObject, eventdata, handles)
% hObject    handle to noiselessHistoUncertainty4Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of noiselessHistoUncertainty4Check


% --- Executes on button press in nonperiodicUncertainty4Check.
function nonperiodicUncertainty4Check_Callback(hObject, eventdata, handles)
% hObject    handle to nonperiodicUncertainty4Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of nonperiodicUncertainty4Check


% --- Executes on button press in noiselessChauUncertainty4Check.
function noiselessChauUncertainty4Check_Callback(hObject, eventdata, handles)
% hObject    handle to noiselessChauUncertainty4Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of noiselessChauUncertainty4Check


% --- Executes on button press in stationaryDetrendUncertainty3Check.
function stationaryDetrendUncertainty3Check_Callback(hObject, eventdata, handles)
% hObject    handle to stationaryDetrendUncertainty3Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stationaryDetrendUncertainty3Check


% --- Executes on button press in stationaryPolyUncertainty3Check.
function stationaryPolyUncertainty3Check_Callback(hObject, eventdata, handles)
% hObject    handle to stationaryPolyUncertainty3Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stationaryPolyUncertainty3Check


% --- Executes on button press in noiselessHistoUncertainty3Check.
function noiselessHistoUncertainty3Check_Callback(hObject, eventdata, handles)
% hObject    handle to noiselessHistoUncertainty3Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of noiselessHistoUncertainty3Check


% --- Executes on button press in nonperiodicUncertainty3Check.
function nonperiodicUncertainty3Check_Callback(hObject, eventdata, handles)
% hObject    handle to nonperiodicUncertainty3Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of nonperiodicUncertainty3Check


% --- Executes on button press in noiselessChauUncertainty3Check.
function noiselessChauUncertainty3Check_Callback(hObject, eventdata, handles)
% hObject    handle to noiselessChauUncertainty3Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of noiselessChauUncertainty3Check


% --- Executes on button press in stationaryDetrendUncertainty2Check.
function stationaryDetrendUncertainty2Check_Callback(hObject, eventdata, handles)
% hObject    handle to stationaryDetrendUncertainty2Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stationaryDetrendUncertainty2Check


% --- Executes on button press in stationaryPolyUncertainty2Check.
function stationaryPolyUncertainty2Check_Callback(hObject, eventdata, handles)
% hObject    handle to stationaryPolyUncertainty2Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stationaryPolyUncertainty2Check


% --- Executes on button press in noiselessHistoUncertainty2Check.
function noiselessHistoUncertainty2Check_Callback(hObject, eventdata, handles)
% hObject    handle to noiselessHistoUncertainty2Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of noiselessHistoUncertainty2Check


% --- Executes on button press in nonperiodicUncertainty2Check.
function nonperiodicUncertainty2Check_Callback(hObject, eventdata, handles)
% hObject    handle to nonperiodicUncertainty2Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of nonperiodicUncertainty2Check


% --- Executes on button press in noiselessChauUncertainty2Check.
function noiselessChauUncertainty2Check_Callback(hObject, eventdata, handles)
% hObject    handle to noiselessChauUncertainty2Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of noiselessChauUncertainty2Check


% --- Executes on button press in stationaryDetrendNoiseCheck.
function stationaryDetrendNoiseCheck_Callback(hObject, eventdata, handles)
% hObject    handle to stationaryDetrendNoiseCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stationaryDetrendNoiseCheck


% --- Executes on button press in stationaryPolyNoiseCheck.
function stationaryPolyNoiseCheck_Callback(hObject, eventdata, handles)
% hObject    handle to stationaryPolyNoiseCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stationaryPolyNoiseCheck


% --- Executes on button press in replacedNormCheck.
function replacedNormCheck_Callback(hObject, eventdata, handles)
% hObject    handle to replacedNormCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of replacedNormCheck


% --- Executes on button press in removedNormCheck.
function removedNormCheck_Callback(hObject, eventdata, handles)
% hObject    handle to removedNormCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of removedNormCheck


function result = SummaryFunc(i)
result = struct('Mean',struct(['Signal'  num2str(i)],'Not Performed',['Signal'  num2str(i) '_sDetr'],'Not Performed',['Signal'  num2str(i) '_sPoly'],'Not Performed',...
    ['Signal'  num2str(i) '_nHist'],'Not Performed',['Signal'  num2str(i) '_nChau'],'Not Performed',['Signal'  num2str(i) '_sDetr_nHist'],'Not Performed',...
    ['Signal'  num2str(i) '_sDetr_nChau'],'Not Performed',['Signal'  num2str(i) '_sPoly_nHist'],'Not Performed',['Signal'  num2str(i) '_sPoly_nChau'],'Not Performed',...
    ['Signal'  num2str(i) '_np'],'Not Performed',['Signal'  num2str(i) '_sDetr_np'],'Not Performed',['Signal'  num2str(i) '_sPoly_np'],'Not Performed',...
    ['Signal'  num2str(i) '_nHist_np'],'Not Performed',['Signal'  num2str(i) '_nChau_np'],'Not Performed',['Signal'  num2str(i) '_sDetr_nHist_np'],'Not Performed',...
    ['Signal'  num2str(i) '_sDetr_nChau_np'],'Not Performed',['Signal'  num2str(i) '_sPoly_nHist_np'],'Not Performed',['Signal'  num2str(i) '_sPoly_nChau_np'],'Not Performed',...
    ['Signal'  num2str(i) '_nChauRemo'],'Not Performed',['Signal'  num2str(i) '_sDetr_nChauRemo'],'Not Performed',['Signal'  num2str(i) '_sDetr_nHistRemo'],'Not Performed',...
    ['Signal'  num2str(i) '_sPoly_nChauRemo'],'Not Performed',['Signal'  num2str(i) '_sPoly_nHistRemo'],'Not Performed',['Signal'  num2str(i) '_nHistRemo'],'Not Performed'),...
    'Std',struct('SampleRecord',struct(['Signal'  num2str(i)],'Not Performed',['Signal'  num2str(i) '_sDetr'],'Not Performed',['Signal'  num2str(i) '_sPoly'],'Not Performed',...
    ['Signal'  num2str(i) '_nHist'],'Not Performed',['Signal'  num2str(i) '_nChau'],'Not Performed',['Signal'  num2str(i) '_sDetr_nHist'],'Not Performed',...
    ['Signal'  num2str(i) '_sDetr_nChau'],'Not Performed',['Signal'  num2str(i) '_sPoly_nHist'],'Not Performed',['Signal'  num2str(i) '_sPoly_nChau'],'Not Performed',...
    ['Signal'  num2str(i) '_np'],'Not Performed',['Signal'  num2str(i) '_sDetr_np'],'Not Performed',['Signal'  num2str(i) '_sPoly_np'],'Not Performed',...
    ['Signal'  num2str(i) '_nHist_np'],'Not Performed',['Signal'  num2str(i) '_nChau_np'],'Not Performed',['Signal'  num2str(i) '_sDetr_nHist_np'],'Not Performed',...
    ['Signal'  num2str(i) '_sDetr_nChau_np'],'Not Performed',['Signal'  num2str(i) '_sPoly_nHist_np'],'Not Performed',['Signal'  num2str(i) '_sPoly_nChau_np'],'Not Performed',...
    ['Signal'  num2str(i) '_nChauRemo'],'Not Performed',['Signal'  num2str(i) '_sDetr_nChauRemo'],'Not Performed',['Signal'  num2str(i) '_sDetr_nHistRemo'],'Not Performed',...
    ['Signal'  num2str(i) '_sPoly_nChauRemo'],'Not Performed',['Signal'  num2str(i) '_sPoly_nHistRemo'],'Not Performed',['Signal'  num2str(i) '_nHistRemo'],'Not Performed'),...
    'Mean',struct(['Signal'  num2str(i)],'Not Performed',['Signal'  num2str(i) '_sDetr'],'Not Performed',['Signal'  num2str(i) '_sPoly'],'Not Performed',...
    ['Signal'  num2str(i) '_nHist'],'Not Performed',['Signal'  num2str(i) '_nChau'],'Not Performed',['Signal'  num2str(i) '_sDetr_nHist'],'Not Performed',...
    ['Signal'  num2str(i) '_sDetr_nChau'],'Not Performed',['Signal'  num2str(i) '_sPoly_nHist'],'Not Performed',['Signal'  num2str(i) '_sPoly_nChau'],'Not Performed',...
    ['Signal'  num2str(i) '_np'],'Not Performed',['Signal'  num2str(i) '_sDetr_np'],'Not Performed',['Signal'  num2str(i) '_sPoly_np'],'Not Performed',...
    ['Signal'  num2str(i) '_nHist_np'],'Not Performed',['Signal'  num2str(i) '_nChau_np'],'Not Performed',['Signal'  num2str(i) '_sDetr_nHist_np'],'Not Performed',...
    ['Signal'  num2str(i) '_sDetr_nChau_np'],'Not Performed',['Signal'  num2str(i) '_sPoly_nHist_np'],'Not Performed',['Signal'  num2str(i) '_sPoly_nChau_np'],'Not Performed')),...
    'IsStationary',struct(['Signal'  num2str(i)],'Not Performed',['Signal'  num2str(i) '_sDetr'],'Not Performed',['Signal'  num2str(i) '_sPoly'],'Not Performed'),...
    'zScore',struct(['Signal'  num2str(i)],'Not Performed',['Signal'  num2str(i) '_sDetr'],'Not Performed',['Signal'  num2str(i) '_sPoly'],'Not Performed'),...
    'SpuriousIndex',struct('Chauvenet','Not Performed','Histogram','Not Performed'),...
    'Normality',struct(['Signal'  num2str(i)],'Not Performed',['Signal'  num2str(i) '_sDetr'],'Not Performed',['Signal'  num2str(i) '_sPoly'],'Not Performed',...
    ['Signal'  num2str(i) '_nHist'],'Not Performed',['Signal'  num2str(i) '_nChau'],'Not Performed',['Signal'  num2str(i) '_sDetr_nHist'],'Not Performed',...
    ['Signal'  num2str(i) '_sDetr_nChau'],'Not Performed',['Signal'  num2str(i) '_sPoly_nHist'],'Not Performed',['Signal'  num2str(i) '_sPoly_nChau'],'Not Performed',...
    ['Signal'  num2str(i) '_nChauRemo'],'Not Performed',['Signal'  num2str(i) '_sDetr_nChauRemo'],'Not Performed',['Signal'  num2str(i) '_sDetr_nHistRemo'],'Not Performed',...
    ['Signal'  num2str(i) '_sPoly_nChauRemo'],'Not Performed',['Signal'  num2str(i) '_sPoly_nHistRemo'],'Not Performed',['Signal'  num2str(i) '_nHistRemo'],'Not Performed'),...
    'PeakFrequency',struct(['Signal'  num2str(i)],'Not Performed',['Signal'  num2str(i) '_sDetr'],'Not Performed',['Signal'  num2str(i) '_sPoly'],'Not Performed',...
    ['Signal'  num2str(i) '_nHist'],'Not Performed',['Signal'  num2str(i) '_nChau'],'Not Performed',['Signal'  num2str(i) '_sDetr_nHist'],'Not Performed',...
    ['Signal'  num2str(i) '_sDetr_nChau'],'Not Performed',['Signal'  num2str(i) '_sPoly_nHist'],'Not Performed',['Signal'  num2str(i) '_sPoly_nChau'],'Not Performed'),...
    'PeakValue',struct(['Signal'  num2str(i)],'Not Performed',['Signal'  num2str(i) '_sDetr'],'Not Performed',['Signal'  num2str(i) '_sPoly'],'Not Performed',...
    ['Signal'  num2str(i) '_nHist'],'Not Performed',['Signal'  num2str(i) '_nChau'],'Not Performed',['Signal'  num2str(i) '_sDetr_nHist'],'Not Performed',...
    ['Signal'  num2str(i) '_sDetr_nChau'],'Not Performed',['Signal'  num2str(i) '_sPoly_nHist'],'Not Performed',['Signal'  num2str(i) '_sPoly_nChau'],'Not Performed'),...
    'IntegralTimeScale','Not Performed','AutocorrelationCoefficient',struct('Rho','Not Performed','Tau','Not Performed'),'SpectralDensity',struct('Sxx','Not Performed','Freq','Not Performed'));



function autoUncertaintyInput_Callback(hObject, eventdata, handles)
% hObject    handle to autoUncertaintyInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of autoUncertaintyInput as text
%        str2double(get(hObject,'String')) returns contents of autoUncertaintyInput as a double


% --- Executes during object creation, after setting all properties.
function autoUncertaintyInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to autoUncertaintyInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function [result,pos] = Trapzarea(acor_new,N,tau)

id1 = find(acor_new < 0,1,'first'); %first zero-crossing
% If no first zero crossing take the entire vector and then
% evaluate area under the curve to get integral time scale
if isempty(id1)
    id3 = N;
else
    id2 = find(acor_new(id1:end) > 0,1,'first');%second zero-crossing
    % If no second zero crossing take the entire vector and then
    % evaluate area under the curve to get integral time scale
    if isempty(id2)
        id3 = N;
    else
        id2 = id1 + id2 - 1;
        id3 = find(acor_new(id2:end) < 0,1,'first');%third zero-crossing
        % If no third zero crossing take the entire vector and then
        % evaluate area under the curve to get integral time scale
        if isempty(id3)
            id3 = N;
        else
            id3 = id2 + id3 - 1;
        end
    end
end
pos = id3;
result = trapz(tau(1:id3-1),abs(acor_new(1:id3-1)));


function d = divisor(n)
%   Check whether input is positive integer and scalar.
if ~isscalar(n)
    error('divisor:NonScalarInput','Input must be a scalar.');
end
if (n < 1) || (floor(n) ~= n)
    error('divisor:PositiveIntegerOnly', 'Input must be a positive integer.');
end

%% Find prime factors of number :
pf = factor(n);         % Prime factors of n
upf = unique(pf);       % Unique

%% Calculate the divisors
d = upf(1).^(0:1:sum(pf == upf(1)))';
for f = upf(2:end)
    d = d*(f.^(0:1:sum(pf == f)));
    d = d(:);
end
d = sort(d)';



function autoSpectralInput_Callback(hObject, eventdata, handles)
% hObject    handle to autoSpectralInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of autoSpectralInput as text
%        str2double(get(hObject,'String')) returns contents of autoSpectralInput as a double


% --- Executes during object creation, after setting all properties.
function autoSpectralInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to autoSpectralInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in autoSpectralRadio.
function autoSpectralRadio_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in autoSpectralRadio
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(get(handles.discreteSpectralInput,'String'))
    errordlg('Please input the value of number of discrete Fourier transform points','Computation failed');
    return;
end
var1 = get(handles.autoSpectralRadio,'SelectedObject');
selection = get(var1,'String');
filtered_u = getappdata(0,'temp_u');
fs = getappdata(0,'temp_fs');
filtered_u = filtered_u - mean(filtered_u);
N = length(filtered_u);

switch selection
    case 'Default'
        x = reshape(filtered_u,[N,1]);
        ts = 1/fs;
        xtemp=zeros(1,2*N);
        SxxAvg=zeros(1,2*N);
        for i = 1:1
            xtemp(1:N)= x(:,i);
            xtemp(N+1:2*N)=0;
            Xf = ts*fft(xtemp);
            Sxx=Xf.*conj(Xf)/(N*ts);
            SxxAvg=SxxAvg+Sxx;
        end
        SxxAvg=SxxAvg/N;
        % Now determine the autocorrelation by inverting autospectral density
        % and scaling the results
        Rxx = (1/ts)*ifft(SxxAvg);
        for i = 1:N-1
            Rxx(i)=Rxx(i)*N/(N-i);
        end
        Rxx(N)=0;
        auto_new = Rxx/var(filtered_u);
        auto_new = auto_new(1:N);
        lag1 = (1:N);
        tau = lag1/fs;
        % Finding area
        [~,pos] = Trapzarea(auto_new,N,tau);
        L = round(2*pos);
        array = divisor(N);
        if length(array) == 2
            N_new = N - 1;
            array = divisor(N_new);
        else
            N_new = N;
        end
        diff = abs(array - L);
        [~,pos] = min(diff);
        L_block = array(pos);
        N_block = N_new/L_block;
        set(handles.autoSpectralInput,'String',num2str(N_block));
        set(handles.autoSpectralInput,'Enable','off');
        set(handles.integralTimeDisplay,'String','');
        check = [handles.stationaryPolySpectralCheck,handles.stationaryDetrendSpectralCheck,handles.noiselessChauSpectralCheck,...
            handles.noiselessHistoSpectralCheck,handles.nonperiodicSpectralCheck];
        set(check,'Enable','Off');
    case 'Other'
        set(handles.autoSpectralInput,'Enable','on');
        set(handles.autoSpectralInput,'String','');
        set(handles.integralTimeDisplay,'String','');
end


% --- Executes when selected object is changed in autoUncertaintyRadio.
function autoUncertaintyRadio_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in autoUncertaintyRadio
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
const = get(handles.CInput,'String'); % Getting constant
if isempty(const)
    errordlg('Constant value is missing','Computation failed');
    return;
end
if get(handles.noiselessHistoUncertainty1Check,'Value')&&get(handles.stationaryDetrendUncertainty1Check,'Value')
    axes(handles.uncertaintyaxes2);
    cla reset;
    axes(handles.uncertaintyaxes1);
    cla reset;
    legend(handles.uncertaintyaxes1,'Off');
    legend(handles.uncertaintyaxes2,'Off');
    errordlg('Select either stationary data obtained from Detrend or obtained from polynomial fit',...
        'Computation failed');
    return;
end
if get(handles.noiselessHistoUncertainty1Check,'Value')&&get(handles.stationaryPolyUncertainty1Check,'Value')
    axes(handles.uncertaintyaxes2);
    cla reset;
    axes(handles.uncertaintyaxes1);
    cla reset;
    legend(handles.uncertaintyaxes1,'Off');
    legend(handles.uncertaintyaxes2,'Off');
    errordlg('Select either noiseless data obtained from Chauvenet or obtained from histogram substitution',...
        'Computation failed');
    return;
end
% Getting the selected signal 1 and its time vector
if get(handles.noiselessChauUncertainty1Check,'Value')&&get(handles.stationaryPolyUncertainty1Check,'Value')&&...
        get(handles.nonperiodicUncertainty1Check,'Value')
    if evalin( 'base', 'exist(''Signal1_sPoly_nChau_np'',''var'')')
        u1 = evalin('base','Signal1_sPoly_nChau_np');
        t = getappdata(0,'set_t1');
        if strcmpi(handles.Summary1.Std.Mean.Signal1_sPoly_nChau_np,'Not Performed')
            errordlg('Spectral analysis of the requested signal 1 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
            return;
        end
        std_mean1 = handles.Summary1.Std.Mean.Signal1_sPoly_nChau_np;
    else
        errordlg('The requested signal 1 does not exist','Plotting denied');
        return;
    end
elseif get(handles.noiselessChauUncertainty1Check,'Value')&&get(handles.stationaryDetrendUncertainty1Check,'Value')&&...
        get(handles.nonperiodicUncertainty1Check,'Value')
    if evalin( 'base', 'exist(''Signal1_sDetr_nChau_np'',''var'')')
        u1 = evalin('base','Signal1_sDetr_nChau_np');
        t = getappdata(0,'set_t1');
        if strcmpi(handles.Summary1.Std.Mean.Signal1_sDetr_nChau_np,'Not Performed')
            errordlg('Spectral analysis of the requested signal 1 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
            return;
        end
        std_mean1 = handles.Summary1.Std.Mean.Signal1_sDetr_nChau_np;
    else
        errordlg('The requested signal 1 does not exist','Plotting denied');
        return;
    end
elseif get(handles.stationaryPolyUncertainty1Check,'Value')&&get(handles.noiselessHistoUncertainty1Check,'Value')&&...
        get(handles.nonperiodicUncertainty1Check,'Value')
    if evalin( 'base', 'exist(''Signal1_sPoly_nHist_np'',''var'')')
        u1 = evalin('base','Signal1_sPoly_nHist_np');
        t = getappdata(0,'set_t1');
        if strcmpi(handles.Summary1.Std.Mean.Signal1_sPoly_nHist_np,'Not Performed')
            errordlg('Spectral analysis of the requested signal 1 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
            return;
        end
        std_mean1 = handles.Summary1.Std.Mean.Signal1_sPoly_nHist_np;
    else
        errordlg('The requested signal 1 does not exist','Plotting denied');
        return;
    end
elseif get(handles.noiselessHistoUncertainty1Check,'Value')&&get(handles.stationaryDetrendUncertainty1Check,'Value')&&...
        get(handles.nonperiodicUncertainty1Check,'Value')
    if evalin( 'base', 'exist(''Signal1_sDetr_nHist_np'',''var'')')
        u1 = evalin('base','Signal1_sDetr_nHist_np');
        t = getappdata(0,'set_t1');
        if strcmpi(handles.Summary1.Std.Mean.Signal1_sDetr_nHist_np,'Not Performed')
            errordlg('Spectral analysis of the requested signal 1 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
            return;
        end
        std_mean1 = handles.Summary1.Std.Mean.Signal1_sDetr_nHist_np;
    else
        errordlg('The requested signal 1 does not exist','Plotting denied');
        return;
    end
elseif get(handles.noiselessHistoUncertainty1Check,'Value')&&get(handles.nonperiodicUncertainty1Check,'Value')
    if evalin( 'base', 'exist(''Signal1_nHist_np'',''var'')')
        u1 = evalin('base','Signal1_nHist_np');
        t = getappdata(0,'set_t1');
        if strcmpi(handles.Summary1.Std.Mean.Signal1_nHist_np,'Not Performed')
            errordlg('Spectral analysis of the requested signal 1 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
            return;
        end
        std_mean1 = handles.Summary1.Std.Mean.Signal1_nHist_np;
    else
        errordlg('The requested signal 1 does not exist','Plotting denied');
        return;
    end
elseif get(handles.noiselessChauUncertainty1Check,'Value')&&get(handles.nonperiodicUncertainty1Check,'Value')
    if evalin( 'base', 'exist(''Signal1_nChau_np'',''var'')')
        u1 = evalin('base','Signal1_nChau_np');
        t = getappdata(0,'set_t1');
        if strcmpi(handles.Summary1.Std.Mean.Signal1_nChau_np,'Not Performed')
            errordlg('Spectral analysis of the requested signal 1 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
            return;
        end
        std_mean1 = handles.Summary1.Std.Mean.Signal1_nChau_np;
    else
        errordlg('The requested signal 1 does not exist','Plotting denied');
        return;
    end
elseif get(handles.stationaryPolyUncertainty1Check,'Value')&&get(handles.nonperiodicUncertainty1Check,'Value')
    if evalin( 'base', 'exist(''Signal1_sPoly_np'',''var'')')
        u1 = evalin('base','Signal1_sPoly_np');
        t = getappdata(0,'set_t1');
        if strcmpi(handles.Summary1.Std.Mean.Signal1_sPoly_np,'Not Performed')
            errordlg('Spectral analysis of the requested signal 1 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
            return;
        end
        std_mean1 = handles.Summary1.Std.Mean.Signal1_sPoly_np;
    else
        errordlg('The requested signal 1 does not exist','Plotting denied');
        return;
    end
elseif get(handles.stationaryDetrendUncertainty1Check,'Value')&&get(handles.nonperiodicUncertainty1Check,'Value')
    if evalin( 'base', 'exist(''Signal1_sDetr_np'',''var'')')
        u1 = evalin('base','Signal1_sDetr_np');
        t = getappdata(0,'set_t1');
        if strcmpi(handles.Summary1.Std.Mean.Signal1_sDetr_np,'Not Performed')
            errordlg('Spectral analysis of the requested signal 1 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
            return;
        end
        std_mean1 = handles.Summary1.Std.Mean.Signal1_sDetr_np;
    else
        errordlg('The requested signal 1 does not exist','Plotting denied');
        return;
    end
elseif get(handles.stationaryPolyUncertainty1Check,'Value')&&get(handles.noiselessChauUncertainty1Check,'Value')
    if evalin( 'base', 'exist(''Signal1_sPoly_nChau'',''var'')')
        u1 = evalin('base','Signal1_sPoly_nChau');
        t = getappdata(0,'set_t1');
        if strcmpi(handles.Summary1.Std.Mean.Signal1_sPoly_nChau,'Not Performed')
            errordlg('Spectral analysis of the requested signal 1 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
            return;
        end
        std_mean1 = handles.Summary1.Std.Mean.Signal1_sPoly_nChau;
    else
        errordlg('The requested signal 1 does not exist','Plotting denied');
        return;
    end
elseif get(handles.noiselessChauUncertainty1Check,'Value')&&get(handles.stationaryDetrendUncertainty1Check,'Value')
    if evalin( 'base', 'exist(''Signal1_sDetr_nChau'',''var'')')
        u1 = evalin('base','Signal1_sDetr_nChau');
        t = getappdata(0,'set_t1');
        if strcmpi(handles.Summary1.Std.Mean.Signal1_sDetr_nChau,'Not Performed')
            errordlg('Spectral analysis of the requested signal 1 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
            return;
        end
        std_mean1 = handles.Summary1.Std.Mean.Signal1_sDetr_nChau;
    else
        errordlg('The requested signal 1 does not exist','Plotting denied');
        return;
    end
elseif get(handles.stationaryPolyUncertainty1Check,'Value')&&get(handles.noiselessHistoUncertainty1Check,'Value')
    if evalin( 'base', 'exist(''Signal1_sPoly_nHist'',''var'')')
        u1 = evalin('base','Signal1_sPoly_nHist');
        t = getappdata(0,'set_t1');
        if strcmpi(handles.Summary1.Std.Mean.Signal1_sPoly_nHist,'Not Performed')
            errordlg('Spectral analysis of the requested signal 1 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
            return;
        end
        std_mean1 = handles.Summary1.Std.Mean.Signal1_sPoly_nHist;
    else
        errordlg('The requested signal 1 does not exist','Plotting denied');
        return;
    end
elseif get(handles.noiselessHistoUncertainty1Check,'Value')&&get(handles.stationaryDetrendUncertainty1Check,'Value')
    if evalin( 'base', 'exist(''Signal1_sDetr_nHist'',''var'')')
        u1 = evalin('base','Signal1_sDetr_nHist');
        t = getappdata(0,'set_t1');
        if strcmpi(handles.Summary1.Std.Mean.Signal1_sDetr_nHist,'Not Performed')
            errordlg('Spectral analysis of the requested signal 1 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
            return;
        end
        std_mean1 = handles.Summary1.Std.Mean.Signal1_sDetr_nHist;
    else
        errordlg('The requested signal 1 does not exist','Plotting denied');
        return;
    end
elseif get(handles.noiselessChauUncertainty1Check,'Value')
    if evalin( 'base', 'exist(''Signal1_nChau'',''var'')')
        u1 = evalin('base','Signal1_nChau');
        t = getappdata(0,'set_t1');
        if strcmpi(handles.Summary1.Std.Mean.Signal1_nChau,'Not Performed')
            errordlg('Spectral analysis of the requested signal 1 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
            return;
        end
        std_mean1 = handles.Summary1.Std.Mean.Signal1_nChau;
    else
        errordlg('The requested signal 1 does not exist','Plotting denied');
        return;
    end
elseif get(handles.noiselessHistoUncertainty1Check,'Value')
    if evalin( 'base', 'exist(''Signal1_nHist'',''var'')')
        u1 = evalin('base','Signal1_nHist');
        t = getappdata(0,'set_t1');
        if strcmpi(handles.Summary1.Std.Mean.Signal1_nHist,'Not Performed')
            errordlg('Spectral analysis of the requested signal 1 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
            return;
        end
        std_mean1 = handles.Summary1.Std.Mean.Signal1_nHist;
    else
        errordlg('The requested signal 1 does not exist','Plotting denied');
        return;
    end
elseif get(handles.stationaryDetrendUncertainty1Check,'Value')
    if evalin( 'base', 'exist(''Signal1_sDetr'',''var'')')
        u1 = evalin('base','Signal1_sDetr');
        t = getappdata(0,'set_t1');
        if strcmpi(handles.Summary1.Std.Mean.Signal1_sDetr,'Not Performed')
            errordlg('Spectral analysis of the requested signal 1 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
            return;
        end
        std_mean1 = handles.Summary1.Std.Mean.Signal1_sDetr;
    else
        errordlg('The requested signal 1 does not exist','Plotting denied');
        return;
    end
elseif get(handles.stationaryPolyUncertainty1Check,'Value')
    if evalin( 'base', 'exist(''Signal1_sPoly'',''var'')')
        u1 = evalin('base','Signal1_sPoly');
        t = getappdata(0,'set_t1');
        if strcmpi(handles.Summary1.Std.Mean.Signal1_sPoly,'Not Performed')
            errordlg('Spectral analysis of the requested signal 1 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
            return;
        end
        std_mean1 = handles.Summary1.Std.Mean.Signal1_sPoly;
    else
        errordlg('The requested signal 1 does not exist','Plotting denied');
        return;
    end
elseif get(handles.nonperiodicUncertainty1Check,'Value')
    if evalin( 'base', 'exist(''Signal1_np'',''var'')')
        u1 = evalin('base','Signal1_np');
        t = getappdata(0,'set_t1');
        if strcmpi(handles.Summary1.Std.Mean.Signal1_np,'Not Performed')
            errordlg('Spectral analysis of the requested signal 1 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
            return;
        end
        std_mean1 = handles.Summary1.Std.Mean.Signal1_np;
    else
        errordlg('The requested signal 1 does not exist','Plotting denied');
        return;
    end
else
    u1 = getappdata(0,'set_u1');
    t = getappdata(0,'set_t1');
    if strcmpi(handles.Summary1.Std.Mean.Signal1,'Not Performed')
        errordlg('Spectral analysis of the requested signal 1 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
        return;
    end
    std_mean1 = handles.Summary1.Std.Mean.Signal1;
end
setappdata(0,'temp_std_mean1',std_mean1);
expo1 = get(handles.n1Input,'String');
expo1 = str2double(expo1);
const = str2double(const);
t1 = t;
N1 = length(u1);
f1 = str2double(get(handles.sampling1Input,'String'));

if convert(get(handles.data2UncertaintyGroup,'Visible'))
    % Getting selected data 2 and its time vector
    if get(handles.stationaryPolyUncertainty2Check,'Value')&&get(handles.stationaryDetrendUncertainty2Check,'Value')
        axes(handles.uncertaintyaxes2);
        cla reset;
        axes(handles.uncertaintyaxes1);
        cla reset;
        legend(handles.uncertaintyaxes1,'Off');
        legend(handles.uncertaintyaxes2,'Off');
        errordlg('Select either stationary data obtained from Detrend or obtained from polynomial fit',...
            'Computation failed');
        return;
    end
    if get(handles.noiselessChauUncertainty2Check,'Value')&&get(handles.noiselessHistoUncertainty2Check,'Value')
        axes(handles.uncertaintyaxes2);
        cla reset;
        axes(handles.uncertaintyaxes1);
        cla reset;
        legend(handles.uncertaintyaxes1,'Off');
        legend(handles.uncertaintyaxes2,'Off');
        errordlg('Select either noiseless data obtained from Chauvenet or obtained from histogram substitution',...
            'Computation failed');
        return;
    end
    if get(handles.noiselessChauUncertainty2Check,'Value')&&get(handles.stationaryPolyUncertainty2Check,'Value')&&...
            get(handles.nonperiodicUncertainty2Check,'Value')
        if evalin( 'base', 'exist(''Signal2_sPoly_nChau_np'',''var'')')
            u2 = evalin('base','Signal2_sPoly_nChau_np');
            t = getappdata(0,'set_t2');
            if strcmpi(handles.Summary2.Std.Mean.Signal2_sPoly_nChau_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 2 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean2 = handles.Summary2.Std.Mean.Signal2_sPoly_nChau_np;
        else
            errordlg('The requested signal 2 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessChauUncertainty2Check,'Value')&&get(handles.stationaryDetrendUncertainty2Check,'Value')&&...
            get(handles.nonperiodicUncertainty2Check,'Value')
        if evalin( 'base', 'exist(''Signal2_sDetr_nChau_np'',''var'')')
            u2 = evalin('base','Signal2_sDetr_nChau_np');
            t = getappdata(0,'set_t2');
            if strcmpi(handles.Summary2.Std.Mean.Signal2_sDetr_nChau_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 2 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean2 = handles.Summary2.Std.Mean.Signal2_sDetr_nChau_np;
        else
            errordlg('The requested signal 2 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryPolyUncertainty2Check,'Value')&&get(handles.noiselessHistoUncertainty2Check,'Value')&&...
            get(handles.nonperiodicUncertainty2Check,'Value')
        if evalin( 'base', 'exist(''Signal2_sPoly_nHist_np'',''var'')')
            u2 = evalin('base','Signal2_sPoly_nHist_np');
            t = getappdata(0,'set_t2');
            if strcmpi(handles.Summary2.Std.Mean.Signal2_sPoly_nHist_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 2 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean2 = handles.Summary2.Std.Mean.Signal2_sPoly_nHist_np;
        else
            errordlg('The requested signal 2 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessHistoUncertainty2Check,'Value')&&get(handles.stationaryDetrendUncertainty2Check,'Value')&&...
            get(handles.nonperiodicUncertainty2Check,'Value')
        if evalin( 'base', 'exist(''Signal2_sDetr_nHist_np'',''var'')')
            u2 = evalin('base','Signal2_sDetr_nHist_np');
            t = getappdata(0,'set_t2');
            if strcmpi(handles.Summary2.Std.Mean.Signal2_sDetr_nHist_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 2 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean2 = handles.Summary2.Std.Mean.Signal2_sDetr_nHist_np;
        else
            errordlg('The requested signal 2 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessHistoUncertainty2Check,'Value')&&get(handles.nonperiodicUncertainty2Check,'Value')
        if evalin( 'base', 'exist(''Signal2_nHist_np'',''var'')')
            u2 = evalin('base','Signal2_nHist_np');
            t = getappdata(0,'set_t2');
            if strcmpi(handles.Summary2.Std.Mean.Signal2_nHist_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 2 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean2 = handles.Summary2.Std.Mean.Signal2_nHist_np;
        else
            errordlg('The requested signal 2 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessChauUncertainty2Check,'Value')&&get(handles.nonperiodicUncertainty2Check,'Value')
        if evalin( 'base', 'exist(''Signal2_nChau_np'',''var'')')
            u2 = evalin('base','Signal2_nChau_np');
            t = getappdata(0,'set_t2');
            if strcmpi(handles.Summary2.Std.Mean.Signal2_nChau_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 2 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean2 = handles.Summary2.Std.Mean.Signal2_nChau_np;
        else
            errordlg('The requested signal 2 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryPolyUncertainty2Check,'Value')&&get(handles.nonperiodicUncertainty2Check,'Value')
        if evalin( 'base', 'exist(''Signal2_sPoly_np'',''var'')')
            u2 = evalin('base','Signal2_sPoly_np');
            t = getappdata(0,'set_t2');
            if strcmpi(handles.Summary2.Std.Mean.Signal2_sPoly_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 2 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean2 = handles.Summary2.Std.Mean.Signal2_sPoly_np;
        else
            errordlg('The requested signal 2 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryDetrendUncertainty2Check,'Value')&&get(handles.nonperiodicUncertainty2Check,'Value')
        if evalin( 'base', 'exist(''Signal2_sDetr_np'',''var'')')
            u2 = evalin('base','Signal2_sDetr_np');
            t = getappdata(0,'set_t2');
            if strcmpi(handles.Summary2.Std.Mean.Signal2_sDetr_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 2 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean2 = handles.Summary2.Std.Mean.Signal2_sDetr_np;
        else
            errordlg('The requested signal 2 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryPolyUncertainty2Check,'Value')&&get(handles.noiselessChauUncertainty2Check,'Value')
        if evalin( 'base', 'exist(''Signal2_sPoly_nChau'',''var'')')
            u2 = evalin('base','Signal2_sPoly_nChau');
            t = getappdata(0,'set_t2');
            if strcmpi(handles.Summary2.Std.Mean.Signal2_sPoly_nChau,'Not Performed')
                errordlg('Spectral analysis of the requested signal 2 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean2 = handles.Summary2.Std.Mean.Signal2_sPoly_nChau;
        else
            errordlg('The requested signal 2 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessChauUncertainty2Check,'Value')&&get(handles.stationaryDetrendUncertainty2Check,'Value')
        if evalin( 'base', 'exist(''Signal2_sDetr_nChau'',''var'')')
            u2 = evalin('base','Signal2_sDetr_nChau');
            t = getappdata(0,'set_t2');
            if strcmpi(handles.Summary2.Std.Mean.Signal2_sDetr_nChau,'Not Performed')
                errordlg('Spectral analysis of the requested signal 2 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean2 = handles.Summary2.Std.Mean.Signal2_sDetr_nChau;
        else
            errordlg('The requested signal 2 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryPolyUncertainty2Check,'Value')&&get(handles.noiselessHistoUncertainty2Check,'Value')
        if evalin( 'base', 'exist(''Signal2_sPoly_nHist'',''var'')')
            u2 = evalin('base','Signal2_sPoly_nHist');
            t = getappdata(0,'set_t2');
            if strcmpi(handles.Summary2.Std.Mean.Signal2_sPoly_nHist,'Not Performed')
                errordlg('Spectral analysis of the requested signal 2 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean2 = handles.Summary2.Std.Mean.Signal2_sPoly_nHist;
        else
            errordlg('The requested signal 2 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessHistoUncertainty2Check,'Value')&&get(handles.stationaryDetrendUncertainty2Check,'Value')
        if evalin( 'base', 'exist(''Signal2_sDetr_nHist'',''var'')')
            u2 = evalin('base','Signal2_sDetr_nHist');
            t = getappdata(0,'set_t2');
            if strcmpi(handles.Summary2.Std.Mean.Signal2_sDetr_nHist,'Not Performed')
                errordlg('Spectral analysis of the requested signal 2 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean2 = handles.Summary2.Std.Mean.Signal2_sDetr_nHist;
        else
            errordlg('The requested signal 2 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessChauUncertainty2Check,'Value')
        if evalin( 'base', 'exist(''Signal2_nChau'',''var'')')
            u2 = evalin('base','Signal2_nChau');
            t = getappdata(0,'set_t2');
            if strcmpi(handles.Summary2.Std.Mean.Signal2_nChau,'Not Performed')
                errordlg('Spectral analysis of the requested signal 2 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean2 = handles.Summary2.Std.Mean.Signal2_nChau;
        else
            errordlg('The requested signal 2 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessHistoUncertainty2Check,'Value')
        if evalin( 'base', 'exist(''Signal2_nHist'',''var'')')
            u2 = evalin('base','Signal2_nHist');
            t = getappdata(0,'set_t2');
            if strcmpi(handles.Summary2.Std.Mean.Signal2_nHist,'Not Performed')
                errordlg('Spectral analysis of the requested signal 2 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean2 = handles.Summary2.Std.Mean.Signal2_nHist;
        else
            errordlg('The requested signal 2 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryDetrendUncertainty2Check,'Value')
        if evalin( 'base', 'exist(''Signal2_sDetr'',''var'')')
            u2 = evalin('base','Signal2_sDetr');
            t = getappdata(0,'set_t2');
            if strcmpi(handles.Summary2.Std.Mean.Signal2_sDetr,'Not Performed')
                errordlg('Spectral analysis of the requested signal 2 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean2 = handles.Summary2.Std.Mean.Signal2_sDetr;
        else
            errordlg('The requested signal 2 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryPolyUncertainty2Check,'Value')
        if evalin( 'base', 'exist(''Signal2_sPoly'',''var'')')
            u2 = evalin('base','Signal2_sPoly');
            t = getappdata(0,'set_t2');
            if strcmpi(handles.Summary2.Std.Mean.Signal2_sPoly,'Not Performed')
                errordlg('Spectral analysis of the requested signal 2 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean2 = handles.Summary2.Std.Mean.Signal2_sPoly;
        else
            errordlg('The requested signal 2 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.nonperiodicUncertainty2Check,'Value')
        if evalin( 'base', 'exist(''Signal2_np'',''var'')')
            u2 = evalin('base','Signal2_np');
            t = getappdata(0,'set_t2');
            if strcmpi(handles.Summary2.Std.Mean.Signal2_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 2 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean2 = handles.Summary2.Std.Mean.Signal2_np;
        else
            errordlg('The requested signal 2 does not exist','Plotting denied');
            return;
        end
    else
        u2 = getappdata(0,'set_u2');
        t = getappdata(0,'set_t2');
        if strcmpi(handles.Summary2.Std.Mean.Signal2,'Not Performed')
            errordlg('Spectral analysis of the requested signal 2 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
            return;
        end
        std_mean2 = handles.Summary2.Std.Mean.Signal2;
    end
    setappdata(0,'temp_std_mean2',std_mean2);
    expo2 = get(handles.n2Input,'String');
    expo2 = str2double(expo2);
    N2 = length(u2);
    f2 = str2double(get(handles.sampling2Input,'String'));
    
    % Check if data lengths are same
    if f1 ~= f2
        errordlg('Sampling frequency of signals are not same','Computation failed');
        return;
    else
        mini = min([N1,N2]);
        u1 = u1(1:mini);
        u2 = u2(1:mini);
        t1 = t1(1:mini);
    end
end

if convert(get(handles.data3UncertaintyGroup,'Visible'))
    if get(handles.stationaryPolyUncertainty3Check,'Value')&&get(handles.stationaryDetrendUncertainty3Check,'Value')
        axes(handles.uncertaintyaxes2);
        cla reset;
        axes(handles.uncertaintyaxes1);
        cla reset;
        legend(handles.uncertaintyaxes1,'Off');
        legend(handles.uncertaintyaxes2,'Off');
        errordlg('Select either stationary data obtained from Detrend or obtained from polynomial fit',...
            'Computation failed');
        return;
    end
    if get(handles.noiselessChauUncertainty3Check,'Value')&&get(handles.noiselessHistoUncertainty3Check,'Value')
        axes(handles.uncertaintyaxes2);
        cla reset;
        axes(handles.uncertaintyaxes1);
        cla reset;
        legend(handles.uncertaintyaxes1,'Off');
        legend(handles.uncertaintyaxes2,'Off');
        errordlg('Select either noiseless data obtained from Chauvenet or obtained from histogram substitution',...
            'Computation failed');
        return;
    end
    % Getting selected data 3 and its time vector
    if get(handles.noiselessChauUncertainty3Check,'Value')&&get(handles.stationaryPolyUncertainty3Check,'Value')&&...
            get(handles.nonperiodicUncertainty3Check,'Value')
        if evalin( 'base', 'exist(''Signal3_sPoly_nChau_np'',''var'')')
            u3 = evalin('base','Signal3_sPoly_nChau_np');
            t = getappdata(0,'set_t3');
            if strcmpi(handles.Summary3.Std.Mean.Signal3_sPoly_nChau_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 3 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean3 = handles.Summary3.Std.Mean.Signal3_sPoly_nChau_np;
        else
            errordlg('The requested signal 3 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessChauUncertainty3Check,'Value')&&get(handles.stationaryDetrendUncertainty3Check,'Value')&&...
            get(handles.nonperiodicUncertainty3Check,'Value')
        if evalin( 'base', 'exist(''Signal3_sDetr_nChau_np'',''var'')')
            u3 = evalin('base','Signal3_sDetr_nChau_np');
            t = getappdata(0,'set_t3');
            if strcmpi(handles.Summary3.Std.Mean.Signal3_sDetr_nChau_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 3 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean3 = handles.Summary3.Std.Mean.Signal3_sDetr_nChau_np;
        else
            errordlg('The requested signal 3 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryPolyUncertainty3Check,'Value')&&get(handles.noiselessHistoUncertainty3Check,'Value')&&...
            get(handles.nonperiodicUncertainty3Check,'Value')
        if evalin( 'base', 'exist(''Signal3_sPoly_nHist_np'',''var'')')
            u3 = evalin('base','Signal3_sPoly_nHist_np');
            t = getappdata(0,'set_t3');
            if strcmpi(handles.Summary3.Std.Mean.Signal3_sPoly_nHist_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 3 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean3 = handles.Summary3.Std.Mean.Signal3_sPoly_nHist_np;
        else
            errordlg('The requested signal 3 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessHistoUncertainty3Check,'Value')&&get(handles.stationaryDetrendUncertainty3Check,'Value')&&...
            get(handles.nonperiodicUncertainty3Check,'Value')
        if evalin( 'base', 'exist(''Signal3_sDetr_nHist_np'',''var'')')
            u3 = evalin('base','Signal3_sDetr_nHist_np');
            t = getappdata(0,'set_t3');
            if strcmpi(handles.Summary3.Std.Mean.Signal3_sDetr_nHist_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 3 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean3 = handles.Summary3.Std.Mean.Signal3_sDetr_nHist_np;
        else
            errordlg('The requested signal 3 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessHistoUncertainty3Check,'Value')&&get(handles.nonperiodicUncertainty3Check,'Value')
        if evalin( 'base', 'exist(''Signal3_nHist_np'',''var'')')
            u3 = evalin('base','Signal3_nHist_np');
            t = getappdata(0,'set_t3');
            if strcmpi(handles.Summary3.Std.Mean.Signal3_nHist_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 3 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean3 = handles.Summary3.Std.Mean.Signal3_nHist_np;
        else
            errordlg('The requested signal 3 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessChauUncertainty3Check,'Value')&&get(handles.nonperiodicUncertainty3Check,'Value')
        if evalin( 'base', 'exist(''Signal3_nChau_np'',''var'')')
            u3 = evalin('base','Signal3_nChau_np');
            t = getappdata(0,'set_t3');
            if strcmpi(handles.Summary3.Std.Mean.Signal3_nChau_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 3 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean3 = handles.Summary3.Std.Mean.Signal3_nChau_np;
        else
            errordlg('The requested signal 3 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryPolyUncertainty3Check,'Value')&&get(handles.nonperiodicUncertainty3Check,'Value')
        if evalin( 'base', 'exist(''Signal3_sPoly_np'',''var'')')
            u3 = evalin('base','Signal3_sPoly_np');
            t = getappdata(0,'set_t3');
            if strcmpi(handles.Summary3.Std.Mean.Signal3_sPoly_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 3 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean3 = handles.Summary3.Std.Mean.Signal3_sPoly_np;
        else
            errordlg('The requested signal 3 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryDetrendUncertainty3Check,'Value')&&get(handles.nonperiodicUncertainty3Check,'Value')
        if evalin( 'base', 'exist(''Signal3_sDetr_np'',''var'')')
            u3 = evalin('base','Signal3_sDetr_np');
            t = getappdata(0,'set_t3');
            if strcmpi(handles.Summary3.Std.Mean.Signal3_sDetr_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 3 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean3 = handles.Summary3.Std.Mean.Signal3_sDetr_np;
        else
            errordlg('The requested signal 3 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryPolyUncertainty3Check,'Value')&&get(handles.noiselessChauUncertainty3Check,'Value')
        if evalin( 'base', 'exist(''Signal3_sPoly_nChau'',''var'')')
            u3 = evalin('base','Signal3_sPoly_nChau');
            t = getappdata(0,'set_t3');
            if strcmpi(handles.Summary3.Std.Mean.Signal3_sPoly_nChau,'Not Performed')
                errordlg('Spectral analysis of the requested signal 3 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean3 = handles.Summary3.Std.Mean.Signal3_sPoly_nChau;
        else
            errordlg('The requested signal 3 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessChauUncertainty3Check,'Value')&&get(handles.stationaryDetrendUncertainty3Check,'Value')
        if evalin( 'base', 'exist(''Signal3_sDetr_nChau'',''var'')')
            u3 = evalin('base','Signal3_sDetr_nChau');
            t = getappdata(0,'set_t3');
            if strcmpi(handles.Summary3.Std.Mean.Signal3_sDetr_nChau,'Not Performed')
                errordlg('Spectral analysis of the requested signal 3 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean3 = handles.Summary3.Std.Mean.Signal3_sDetr_nChau;
        else
            errordlg('The requested signal 3 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryPolyUncertainty3Check,'Value')&&get(handles.noiselessHistoUncertainty3Check,'Value')
        if evalin( 'base', 'exist(''Signal3_sPoly_nHist'',''var'')')
            u3 = evalin('base','Signal3_sPoly_nHist');
            t = getappdata(0,'set_t3');
            if strcmpi(handles.Summary3.Std.Mean.Signal3_sPoly_nHist,'Not Performed')
                errordlg('Spectral analysis of the requested signal 3 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean3 = handles.Summary3.Std.Mean.Signal3_sPoly_nHist;
        else
            errordlg('The requested signal 3 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessHistoUncertainty3Check,'Value')&&get(handles.stationaryDetrendUncertainty3Check,'Value')
        if evalin( 'base', 'exist(''Signal3_sDetr_nHist'',''var'')')
            u3 = evalin('base','Signal3_sDetr_nHist');
            t = getappdata(0,'set_t3');
            if strcmpi(handles.Summary3.Std.Mean.Signal3_sDetr_nHist,'Not Performed')
                errordlg('Spectral analysis of the requested signal 3 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean3 = handles.Summary3.Std.Mean.Signal3_sDetr_nHist;
        else
            errordlg('The requested signal 3 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessChauUncertainty3Check,'Value')
        if evalin( 'base', 'exist(''Signal3_nChau'',''var'')')
            u3 = evalin('base','Signal3_nChau');
            t = getappdata(0,'set_t3');
            if strcmpi(handles.Summary3.Std.Mean.Signal3_nChau,'Not Performed')
                errordlg('Spectral analysis of the requested signal 3 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean3 = handles.Summary3.Std.Mean.Signal3_nChau;
        else
            errordlg('The requested signal 3 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessHistoUncertainty3Check,'Value')
        if evalin( 'base', 'exist(''Signal3_nHist'',''var'')')
            u3 = evalin('base','Signal3_nHist');
            t = getappdata(0,'set_t3');
            if strcmpi(handles.Summary3.Std.Mean.Signal3_nHist,'Not Performed')
                errordlg('Spectral analysis of the requested signal 3 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean3 = handles.Summary3.Std.Mean.Signal3_nHist;
        else
            errordlg('The requested signal 3 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryDetrendUncertainty3Check,'Value')
        if evalin( 'base', 'exist(''Signal3_sDetr'',''var'')')
            u3 = evalin('base','Signal3_sDetr');
            t = getappdata(0,'set_t3');
            if strcmpi(handles.Summary3.Std.Mean.Signal3_sDetr,'Not Performed')
                errordlg('Spectral analysis of the requested signal 3 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean3 = handles.Summary3.Std.Mean.Signal3_sDetr;
        else
            errordlg('The requested signal 3 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryPolyUncertainty3Check,'Value')
        if evalin( 'base', 'exist(''Signal3_sPoly'',''var'')')
            u3 = evalin('base','Signal3_sPoly');
            t = getappdata(0,'set_t3');
            if strcmpi(handles.Summary3.Std.Mean.Signal3_sPoly,'Not Performed')
                errordlg('Spectral analysis of the requested signal 3 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean3 = handles.Summary3.Std.Mean.Signal3_sPoly;
        else
            errordlg('The requested signal 3 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.nonperiodicUncertainty3Check,'Value')
        if evalin( 'base', 'exist(''Signal3_np'',''var'')')
            u3 = evalin('base','Signal3_np');
            t = getappdata(0,'set_t3');
            if strcmpi(handles.Summary3.Std.Mean.Signal3_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 3 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean3 = handles.Summary3.Std.Mean.Signal3_np;
        else
            errordlg('The requested signal 3 does not exist','Plotting denied');
            return;
        end
    else
        u3 = getappdata(0,'set_u3');
        t = getappdata(0,'set_t3');
        if strcmpi(handles.Summary3.Std.Mean.Signal3,'Not Performed')
            errordlg('Spectral analysis of the requested signal 3 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
            return;
        end
        std_mean3 = handles.Summary3.Std.Mean.Signal3;
    end
    setappdata(0,'temp_std_mean3',std_mean3);
    expo3 = get(handles.n3Input,'String');
    expo3 = str2double(expo3);
    N3 = length(u3);
    f3 = str2double(get(handles.sampling3Input,'String'));
    
    % Checking if the data lengths are same
    if f1 ~= f2 && f2 ~= f3
        errordlg('Sampling frequency of signals are not same','Computation failed');
        return;
    else
        mini = min([N1,N2,N3]);
        u1 = u1(1:mini);
        t1 = t1(1:mini);
        u2 = u2(1:mini);
        u3 = u3(1:mini);
    end
end

if convert(get(handles.data4UncertaintyGroup,'Visible'))
    if get(handles.stationaryPolyUncertainty4Check,'Value')&&get(handles.stationaryDetrendUncertainty4Check,'Value')
        axes(handles.uncertaintyaxes2);
        cla reset;
        axes(handles.uncertaintyaxes1);
        cla reset;
        legend(handles.uncertaintyaxes1,'Off');
        legend(handles.uncertaintyaxes2,'Off');
        errordlg('Select either stationary data obtained from Detrend or obtained from polynomial fit',...
            'Computation failed');
        return;
    end
    if get(handles.noiselessChauUncertainty4Check,'Value')&&get(handles.noiselessHistoUncertainty4Check,'Value')
        axes(handles.uncertaintyaxes2);
        cla reset;
        axes(handles.uncertaintyaxes1);
        cla reset;
        legend(handles.uncertaintyaxes1,'Off');
        legend(handles.uncertaintyaxes2,'Off');
        errordlg('Select either noiseless data obtained from Chauvenet or obtained from histogram substitution',...
            'Computation failed');
        return;
    end
    % Getting selected data 4 and its time vector
    if get(handles.noiselessChauUncertainty4Check,'Value')&&get(handles.stationaryPolyUncertainty4Check,'Value')&&...
            get(handles.nonperiodicUncertainty4Check,'Value')
        if evalin( 'base', 'exist(''Signal4_sPoly_nChau_np'',''var'')')
            u4 = evalin('base','Signal4_sPoly_nChau_np');
            t = getappdata(0,'set_t4');
            if strcmpi(handles.Summary4.Std.Mean.Signal4_sPoly_nChau_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 4 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean4 = handles.Summary4.Std.Mean.Signal4_sPoly_nChau_np;
        else
            errordlg('The requested signal 4 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessChauUncertainty4Check,'Value')&&get(handles.stationaryDetrendUncertainty4Check,'Value')&&...
            get(handles.nonperiodicUncertainty4Check,'Value')
        if evalin( 'base', 'exist(''Signal4_sDetr_nChau_np'',''var'')')
            u4 = evalin('base','Signal4_sDetr_nChau_np');
            t = getappdata(0,'set_t4');
            if strcmpi(handles.Summary4.Std.Mean.Signal4_sDetr_nChau_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 4 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean4 = handles.Summary4.Std.Mean.Signal4_sDetr_nChau_np;
        else
            errordlg('The requested signal 4 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryPolyUncertainty4Check,'Value')&&get(handles.noiselessHistoUncertainty4Check,'Value')&&...
            get(handles.nonperiodicUncertainty4Check,'Value')
        if evalin( 'base', 'exist(''Signal4_sPoly_nHist_np'',''var'')')
            u4 = evalin('base','Signal4_sPoly_nHist_np');
            t = getappdata(0,'set_t4');
            if strcmpi(handles.Summary4.Std.Mean.Signal4_sPoly_nHist_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 4 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean4 = handles.Summary4.Std.Mean.Signal4_sPoly_nHist_np;
        else
            errordlg('The requested signal 4 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessHistoUncertainty4Check,'Value')&&get(handles.stationaryDetrendUncertainty4Check,'Value')&&...
            get(handles.nonperiodicUncertainty4Check,'Value')
        if evalin( 'base', 'exist(''Signal4_sDetr_nHist_np'',''var'')')
            u4 = evalin('base','Signal4_sDetr_nHist_np');
            t = getappdata(0,'set_t4');
            if strcmpi(handles.Summary4.Std.Mean.Signal4_sDetr_nHist_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 4 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean4 = handles.Summary4.Std.Mean.Signal4_sDetr_nHist_np;
        else
            errordlg('The requested signal 4 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessHistoUncertainty4Check,'Value')&&get(handles.nonperiodicUncertainty4Check,'Value')
        if evalin( 'base', 'exist(''Signal4_nHist_np'',''var'')')
            u4 = evalin('base','Signal4_nHist_np');
            t = getappdata(0,'set_t4');
            if strcmpi(handles.Summary4.Std.Mean.Signal4_nHist_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 4 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean4 = handles.Summary4.Std.Mean.Signal4_nHist_np;
        else
            errordlg('The requested signal 4 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessChauUncertainty4Check,'Value')&&get(handles.nonperiodicUncertainty4Check,'Value')
        if evalin( 'base', 'exist(''Signal4_nChau_np'',''var'')')
            u4 = evalin('base','Signal4_nChau_np');
            t = getappdata(0,'set_t4');
            if strcmpi(handles.Summary4.Std.Mean.Signal4_nChau_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 4 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean4 = handles.Summary4.Std.Mean.Signal4_nChau_np;
        else
            errordlg('The requested signal 4 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryPolyUncertainty4Check,'Value')&&get(handles.nonperiodicUncertainty4Check,'Value')
        if evalin( 'base', 'exist(''Signal4_sPoly_np'',''var'')')
            u4 = evalin('base','Signal4_sPoly_np');
            t = getappdata(0,'set_t4');
            if strcmpi(handles.Summary4.Std.Mean.Signal4_sPoly_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 4 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean4 = handles.Summary4.Std.Mean.Signal4_sPoly_np;
        else
            errordlg('The requested signal 4 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryDetrendUncertainty4Check,'Value')&&get(handles.nonperiodicUncertainty4Check,'Value')
        if evalin( 'base', 'exist(''Signal4_sDetr_np'',''var'')')
            u4 = evalin('base','Signal4_sDetr_np');
            t = getappdata(0,'set_t4');
            if strcmpi(handles.Summary4.Std.Mean.Signal4_sDetr_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 4 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean4 = handles.Summary4.Std.Mean.Signal4_sDetr_np;
        else
            errordlg('The requested signal 4 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryPolyUncertainty4Check,'Value')&&get(handles.noiselessChauUncertainty4Check,'Value')
        if evalin( 'base', 'exist(''Signal4_sPoly_nChau'',''var'')')
            u4 = evalin('base','Signal4_sPoly_nChau');
            t = getappdata(0,'set_t4');
            if strcmpi(handles.Summary4.Std.Mean.Signal4_sPoly_nChau,'Not Performed')
                errordlg('Spectral analysis of the requested signal 4 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean4 = handles.Summary4.Std.Mean.Signal4_sPoly_nChau;
        else
            errordlg('The requested signal 4 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessChauUncertainty4Check,'Value')&&get(handles.stationaryDetrendUncertainty4Check,'Value')
        if evalin( 'base', 'exist(''Signal4_sDetr_nChau'',''var'')')
            u4 = evalin('base','Signal4_sDetr_nChau');
            t = getappdata(0,'set_t4');
            if strcmpi(handles.Summary4.Std.Mean.Signal4_sDetr_nChau,'Not Performed')
                errordlg('Spectral analysis of the requested signal 4 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean4 = handles.Summary4.Std.Mean.Signal4_sDetr_nChau;
        else
            errordlg('The requested signal 4 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryPolyUncertainty4Check,'Value')&&get(handles.noiselessHistoUncertainty4Check,'Value')
        if evalin( 'base', 'exist(''Signal4_sPoly_nHist'',''var'')')
            u4 = evalin('base','Signal4_sPoly_nHist');
            t = getappdata(0,'set_t4');
            if strcmpi(handles.Summary4.Std.Mean.Signal4_sPoly_nHist,'Not Performed')
                errordlg('Spectral analysis of the requested signal 4 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean4 = handles.Summary4.Std.Mean.Signal4_sPoly_nHist;
        else
            errordlg('The requested signal 4 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessHistoUncertainty4Check,'Value')&&get(handles.stationaryDetrendUncertainty4Check,'Value')
        if evalin( 'base', 'exist(''Signal4_sDetr_nHist'',''var'')')
            u4 = evalin('base','Signal4_sDetr_nHist');
            t = getappdata(0,'set_t4');
            if strcmpi(handles.Summary4.Std.Mean.Signal4_sDetr_nHist,'Not Performed')
                errordlg('Spectral analysis of the requested signal 4 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean4 = handles.Summary4.Std.Mean.Signal4_sDetr_nHist;
        else
            errordlg('The requested signal 4 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessChauUncertainty4Check,'Value')
        if evalin( 'base', 'exist(''Signal4_nChau'',''var'')')
            u4 = evalin('base','Signal4_nChau');
            t = getappdata(0,'set_t4');
            if strcmpi(handles.Summary4.Std.Mean.Signal4_nChau,'Not Performed')
                errordlg('Spectral analysis of the requested signal 4 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean4 = handles.Summary4.Std.Mean.Signal4_nChau;
        else
            errordlg('The requested signal 4 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessHistoUncertainty4Check,'Value')
        if evalin( 'base', 'exist(''Signal4_nHist'',''var'')')
            u4 = evalin('base','Signal4_nHist');
            t = getappdata(0,'set_t4');
            if strcmpi(handles.Summary4.Std.Mean.Signal4_nHist,'Not Performed')
                errordlg('Spectral analysis of the requested signal 4 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean4 = handles.Summary4.Std.Mean.Signal4_nHist;
        else
            errordlg('The requested signal 4 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryDetrendUncertainty4Check,'Value')
        if evalin( 'base', 'exist(''Signal4_sDetr'',''var'')')
            u4 = evalin('base','Signal4_sDetr');
            t = getappdata(0,'set_t4');
            if strcmpi(handles.Summary4.Std.Mean.Signal4_sDetr,'Not Performed')
                errordlg('Spectral analysis of the requested signal 4 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean4 = handles.Summary4.Std.Mean.Signal4_sDetr;
        else
            errordlg('The requested signal 4 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryPolyUncertainty4Check,'Value')
        if evalin( 'base', 'exist(''Signal4_sPoly'',''var'')')
            u4 = evalin('base','Signal4_sPoly');
            t = getappdata(0,'set_t4');
            if strcmpi(handles.Summary4.Std.Mean.Signal4_sPoly,'Not Performed')
                errordlg('Spectral analysis of the requested signal 4 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean4 = handles.Summary4.Std.Mean.Signal4_sPoly;
        else
            errordlg('The requested signal 4 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.nonperiodicUncertainty4Check,'Value')
        if evalin( 'base', 'exist(''Signal4_np'',''var'')')
            u4 = evalin('base','Signal4_np');
            t = getappdata(0,'set_t4');
            if strcmpi(handles.Summary4.Std.Mean.Signal4_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 4 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean4 = handles.Summary4.Std.Mean.Signal4_np;
        else
            errordlg('The requested signal 4 does not exist','Plotting denied');
            return;
        end
    else
        u4 = getappdata(0,'set_u4');
        t = getappdata(0,'set_t4');
        if strcmpi(handles.Summary4.Std.Mean.Signal4,'Not Performed')
            errordlg('Spectral analysis of the requested signal 4 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
            return;
        end
        std_mean4 = handles.Summary4.Std.Mean.Signal4;
    end
    setappdata(0,'temp_std_mean4',std_mean4);
    expo4 = get(handles.n4Input,'String');
    expo4 = str2double(expo4);
    N4 = length(u4);
    f4 = str2double(get(handles.sampling4Input,'String'));
    
    % Checking if data lengths are same
    if f1 ~= f2 && f2 ~= f3 && f3 ~= f4
        errordlg('Sampling frequency of signals are not same','Computation failed');
        return;
    else
        mini = min([N1,N2,N3,N4]);
        u1 = u1(1:mini);
        t1 = t1(1:mini);
        u2 = u2(1:mini);
        u3 = u3(1:mini);
        u4 = u4(1:mini);
    end
end

if convert(get(handles.data5UncertaintyGroup,'Visible'))
    if get(handles.stationaryPolyUncertainty5Check,'Value')&&get(handles.stationaryDetrendUncertainty5Check,'Value')
        axes(handles.uncertaintyaxes2);
        cla reset;
        axes(handles.uncertaintyaxes1);
        cla reset;
        legend(handles.uncertaintyaxes1,'Off');
        legend(handles.uncertaintyaxes2,'Off');
        errordlg('Select either stationary data obtained from Detrend or obtained from polynomial fit',...
            'Computation failed');
        return;
    end
    if get(handles.noiselessChauUncertainty5Check,'Value')&&get(handles.noiselessHistoUncertainty5Check,'Value')
        axes(handles.uncertaintyaxes2);
        cla reset;
        axes(handles.uncertaintyaxes1);
        cla reset;
        legend(handles.uncertaintyaxes1,'Off');
        legend(handles.uncertaintyaxes2,'Off');
        errordlg('Select either noiseless data obtained from Chauvenet or obtained from histogram substitution',...
            'Computation failed');
        return;
    end
    % Getting selected data 5 and its time vector
    if get(handles.noiselessChauUncertainty5Check,'Value')&&get(handles.stationaryPolyUncertainty5Check,'Value')&&...
            get(handles.nonperiodicUncertainty5Check,'Value')
        if evalin( 'base', 'exist(''Signal5_sPoly_nChau_np'',''var'')')
            u5 = evalin('base','Signal5_sPoly_nChau_np');
            t = getappdata(0,'set_t5');
            if strcmpi(handles.Summary5.Std.Mean.Signal5_sPoly_nChau_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 5 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean5 = handles.Summary5.Std.Mean.Signal5_sPoly_nChau_np;
        else
            errordlg('The requested signal 5 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessChauUncertainty5Check,'Value')&&get(handles.stationaryDetrendUncertainty5Check,'Value')&&...
            get(handles.nonperiodicUncertainty5Check,'Value')
        if evalin( 'base', 'exist(''Signal5_sDetr_nChau_np'',''var'')')
            u5 = evalin('base','Signal5_sDetr_nChau_np');
            t = getappdata(0,'set_t5');
            if strcmpi(handles.Summary5.Std.Mean.Signal5_sDetr_nChau_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 5 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean5 = handles.Summary5.Std.Mean.Signal5_sDetr_nChau_np;
        else
            errordlg('The requested signal 5 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryPolyUncertainty5Check,'Value')&&get(handles.noiselessHistoUncertainty5Check,'Value')&&...
            get(handles.nonperiodicUncertainty5Check,'Value')
        if evalin( 'base', 'exist(''Signal5_sPoly_nHist_np'',''var'')')
            u5 = evalin('base','Signal5_sPoly_nHist_np');
            t = getappdata(0,'set_t5');
            if strcmpi(handles.Summary5.Std.Mean.Signal5_sPoly_nHist_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 5 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean5 = handles.Summary5.Std.Mean.Signal5_sPoly_nHist_np;
        else
            errordlg('The requested signal 5 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessHistoUncertainty5Check,'Value')&&get(handles.stationaryDetrendUncertainty5Check,'Value')&&...
            get(handles.nonperiodicUncertainty5Check,'Value')
        if evalin( 'base', 'exist(''Signal5_sDetr_nHist_np'',''var'')')
            u5 = evalin('base','Signal5_sDetr_nHist_np');
            t = getappdata(0,'set_t5');
            if strcmpi(handles.Summary5.Std.Mean.Signal5_sDetr_nHist_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 5 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean5 = handles.Summary5.Std.Mean.Signal5_sDetr_nHist_np;
        else
            errordlg('The requested signal 5 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessHistoUncertainty5Check,'Value')&&get(handles.nonperiodicUncertainty5Check,'Value')
        if evalin( 'base', 'exist(''Signal5_nHist_np'',''var'')')
            u5 = evalin('base','Signal5_nHist_np');
            t = getappdata(0,'set_t5');
            if strcmpi(handles.Summary5.Std.Mean.Signal5_nHist_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 5 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean5 = handles.Summary5.Std.Mean.Signal5_nHist_np;
        else
            errordlg('The requested signal 5 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessChauUncertainty5Check,'Value')&&get(handles.nonperiodicUncertainty5Check,'Value')
        if evalin( 'base', 'exist(''Signal5_nChau_np'',''var'')')
            u5 = evalin('base','Signal5_nChau_np');
            t = getappdata(0,'set_t5');
            if strcmpi(handles.Summary5.Std.Mean.Signal5_nChau_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 5 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean5 = handles.Summary5.Std.Mean.Signal5_nChau_np;
        else
            errordlg('The requested signal 5 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryPolyUncertainty5Check,'Value')&&get(handles.nonperiodicUncertainty5Check,'Value')
        if evalin( 'base', 'exist(''Signal5_sPoly_np'',''var'')')
            u5 = evalin('base','Signal5_sPoly_np');
            t = getappdata(0,'set_t5');
            if strcmpi(handles.Summary5.Std.Mean.Signal5_sPoly_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 5 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean5 = handles.Summary5.Std.Mean.Signal5_sPoly_np;
        else
            errordlg('The requested signal 5 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryDetrendUncertainty5Check,'Value')&&get(handles.nonperiodicUncertainty5Check,'Value')
        if evalin( 'base', 'exist(''Signal5_sDetr_np'',''var'')')
            u5 = evalin('base','Signal5_sDetr_np');
            t = getappdata(0,'set_t5');
            if strcmpi(handles.Summary5.Std.Mean.Signal5_sDetr_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 5 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean5 = handles.Summary5.Std.Mean.Signal5_sDetr_np;
        else
            errordlg('The requested signal 5 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryPolyUncertainty5Check,'Value')&&get(handles.noiselessChauUncertainty5Check,'Value')
        if evalin( 'base', 'exist(''Signal5_sPoly_nChau'',''var'')')
            u5 = evalin('base','Signal5_sPoly_nChau');
            t = getappdata(0,'set_t5');
            if strcmpi(handles.Summary5.Std.Mean.Signal5_sPoly_nChau,'Not Performed')
                errordlg('Spectral analysis of the requested signal 5 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean5 = handles.Summary5.Std.Mean.Signal5_sPoly_nChau;
        else
            errordlg('The requested signal 5 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessChauUncertainty5Check,'Value')&&get(handles.stationaryDetrendUncertainty5Check,'Value')
        if evalin( 'base', 'exist(''Signal5_sDetr_nChau'',''var'')')
            u5 = evalin('base','Signal5_sDetr_nChau');
            t = getappdata(0,'set_t5');
            if strcmpi(handles.Summary5.Std.Mean.Signal5_sDetr_nChau,'Not Performed')
                errordlg('Spectral analysis of the requested signal 5 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean5 = handles.Summary5.Std.Mean.Signal5_sDetr_nChau;
        else
            errordlg('The requested signal 5 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryPolyUncertainty5Check,'Value')&&get(handles.noiselessHistoUncertainty5Check,'Value')
        if evalin( 'base', 'exist(''Signal5_sPoly_nHist'',''var'')')
            u5 = evalin('base','Signal5_sPoly_nHist');
            t = getappdata(0,'set_t5');
            if strcmpi(handles.Summary5.Std.Mean.Signal5_sPoly_nHist,'Not Performed')
                errordlg('Spectral analysis of the requested signal 5 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean5 = handles.Summary5.Std.Mean.Signal5_sPoly_nHist;
        else
            errordlg('The requested signal 5 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessHistoUncertainty5Check,'Value')&&get(handles.stationaryDetrendUncertainty5Check,'Value')
        if evalin( 'base', 'exist(''Signal5_sDetr_nHist'',''var'')')
            u5 = evalin('base','Signal5_sDetr_nHist');
            t = getappdata(0,'set_t5');
            if strcmpi(handles.Summary5.Std.Mean.Signal5_sDetr_nHist,'Not Performed')
                errordlg('Spectral analysis of the requested signal 5 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean5 = handles.Summary5.Std.Mean.Signal5_sDetr_nHist;
        else
            errordlg('The requested signal 5 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessChauUncertainty5Check,'Value')
        if evalin( 'base', 'exist(''Signal5_nChau'',''var'')')
            u5 = evalin('base','Signal5_nChau');
            t = getappdata(0,'set_t5');
            if strcmpi(handles.Summary5.Std.Mean.Signal5_nChau,'Not Performed')
                errordlg('Spectral analysis of the requested signal 5 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean5 = handles.Summary5.Std.Mean.Signal5_nChau;
        else
            errordlg('The requested signal 5 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.noiselessHistoUncertainty5Check,'Value')
        if evalin( 'base', 'exist(''Signal5_nHist'',''var'')')
            u5 = evalin('base','Signal5_nHist');
            t = getappdata(0,'set_t5');
            if strcmpi(handles.Summary5.Std.Mean.Signal5_nHist,'Not Performed')
                errordlg('Spectral analysis of the requested signal 5 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean5 = handles.Summary5.Std.Mean.Signal5_nHist;
        else
            errordlg('The requested signal 5 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryDetrendUncertainty5Check,'Value')
        if evalin( 'base', 'exist(''Signal5_sDetr'',''var'')')
            u5 = evalin('base','Signal5_sDetr');
            t = getappdata(0,'set_t5');
            if strcmpi(handles.Summary5.Std.Mean.Signal5_sDetr,'Not Performed')
                errordlg('Spectral analysis of the requested signal 5 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean5 = handles.Summary5.Std.Mean.Signal5_sDetr;
        else
            errordlg('The requested signal 5 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.stationaryPolyUncertainty5Check,'Value')
        if evalin( 'base', 'exist(''Signal5_sPoly'',''var'')')
            u5 = evalin('base','Signal5_sPoly');
            t = getappdata(0,'set_t5');
            if strcmpi(handles.Summary5.Std.Mean.Signal5_sPoly,'Not Performed')
                errordlg('Spectral analysis of the requested signal 5 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean5 = handles.Summary5.Std.Mean.Signal5_sPoly;
        else
            errordlg('The requested signal 5 does not exist','Plotting denied');
            return;
        end
    elseif get(handles.nonperiodicUncertainty5Check,'Value')
        if evalin( 'base', 'exist(''Signal5_np'',''var'')')
            u5 = evalin('base','Signal5_np');
            t = getappdata(0,'set_t5');
            if strcmpi(handles.Summary5.Std.Mean.Signal5_np,'Not Performed')
                errordlg('Spectral analysis of the requested signal 5 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
                return;
            end
            std_mean5 = handles.Summary5.Std.Mean.Signal5_np;
        else
            errordlg('The requested signal 5 does not exist','Plotting denied');
            return;
        end
    else
        u5 = getappdata(0,'set_u5');
        t = getappdata(0,'set_t5');
        if strcmpi(handles.Summary5.Std.Mean.Signal5,'Not Performed')
            errordlg('Spectral analysis of the requested signal 5 has not been performed and thus the random uncertainty of the mean cannot be computed','Computation failed');
            return;
        end
        std_mean5 = handles.Summary5.Std.Mean.Signal5;
    end
    setappdata(0,'temp_std_mean5',std_mean5);
    expo5 = get(handles.n5Input,'String');
    expo5 = str2double(expo5);
    N5 = length(u5);
    f5 = str2double(get(handles.sampling5Input,'String'));
    
    % Checking if data lengths are same
    if f1 ~= f2 && f2 ~= f3 && f3 ~= f4 && f4 ~= f5
        errordlg('Sampling frequency of signals are not same','Computation failed');
        return;
    else
        mini = min([N1,N2,N3,N4,N5]);
        u1 = u1(1:mini);
        t1 = t1(1:mini);
        u2 = u2(1:mini);
        u3 = u3(1:mini);
        u4 = u4(1:mini);
        u5 = u5(1:mini);
    end
end

variable = get(handles.numberOfDataGroup,'SelectedObject');
selection = get(variable,'String');
switch selection
    case '1'
        % Computing Result
        res = const.*(u1.^expo1);
    case '2'
        % Computing Result
        res = const.*(u1.^expo1).*(u2.^expo2);
    case '3'
        % Computing Result
        res = const.*(u1.^expo1).*(u2.^expo2).*(u3.^expo3);
    case '4'
        % Computing Result
        res = const.*(u1.^expo1).*(u2.^expo2).*(u3.^expo3).*(u4.^expo4);
    case '5'
        % Computing Result
        res = const.*(u1.^expo1).*(u2.^expo2).*(u3.^expo3).*(u4.^expo4).*(u5.^expo5);
end

t = t1;
filtered_u = res;
% Storing the result in temporary variable for using in slider function
setappdata(0,'temp_u',filtered_u);
setappdata(0,'temp_t',t);
setappdata(0,'temp_f',f1);

mean_fi = mean(filtered_u);
filtered_u = filtered_u - mean_fi;

var1 = get(handles.autoUncertaintyRadio,'SelectedObject');
selection = get(var1,'String');
N = length(filtered_u);
switch selection
    case 'Default'
        x = reshape(filtered_u,[N,1]);
        ts = 1/f1;
        xtemp=zeros(1,2*N);
        SxxAvg=zeros(1,2*N);
        for i = 1:1
            xtemp(1:N)= x(:,i);
            xtemp(N+1:2*N)=0;
            Xf = ts*fft(xtemp);
            Sxx=Xf.*conj(Xf)/(N*ts);
            SxxAvg=SxxAvg+Sxx;
        end
        SxxAvg=SxxAvg/N;
        % Now determine the autocorrelation by inverting autospectral density
        % and scaling the results
        Rxx = (1/ts)*ifft(SxxAvg);
        for i = 1:N-1
            Rxx(i)=Rxx(i)*N/(N-i);
        end
        Rxx(N)=0;
        auto_new = Rxx/var(filtered_u);
        lag1 = (1:N);
        auto_new = auto_new(1:N);
        tau = lag1/f1;
        % Finding area
        [~,pos] = Trapzarea(auto_new,N,tau);
        L = round(2*pos);
        array = divisor(N);
        if length(array) == 2
            N_new = N-1;
            array = divisor(N_new);
        else
            N_new = N;
        end
        diff = abs(array - L);
        [~,pos] = min(diff);
        L_block = array(pos);
        N_block = N_new/L_block;
        set(handles.autoUncertaintyInput,'String',num2str(N_block));
        set(handles.autoUncertaintyInput,'Enable','off');
    case 'Other'
        set(handles.autoUncertaintyInput,'Enable','on');
        set(handles.autoUncertaintyInput,'String','');
        
end


function scalePeriodicityInput_Callback(hObject, eventdata, handles)
% hObject    handle to scalePeriodicityInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of scalePeriodicityInput as text
%        str2double(get(hObject,'String')) returns contents of scalePeriodicityInput as a double


% --- Executes during object creation, after setting all properties.
function scalePeriodicityInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to scalePeriodicityInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function maxlimitPeriodicityInput_Callback(hObject, eventdata, handles)
% hObject    handle to maxlimitPeriodicityInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of maxlimitPeriodicityInput as text
%        str2double(get(hObject,'String')) returns contents of maxlimitPeriodicityInput as a double


% --- Executes during object creation, after setting all properties.
function maxlimitPeriodicityInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxlimitPeriodicityInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function minlimitPeriodicityInput_Callback(hObject, eventdata, handles)
% hObject    handle to minlimitPeriodicityInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of minlimitPeriodicityInput as text
%        str2double(get(hObject,'String')) returns contents of minlimitPeriodicityInput as a double


% --- Executes during object creation, after setting all properties.
function minlimitPeriodicityInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to minlimitPeriodicityInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in removePeriodicityHover.
function removePeriodicityHover_Callback(hObject, eventdata, handles)
% hObject    handle to removePeriodicityHover (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton68.
function pushbutton68_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton68 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function appendPeriodicityInput_Callback(hObject, eventdata, handles)
% hObject    handle to appendPeriodicityInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of appendPeriodicityInput as text
%        str2double(get(hObject,'String')) returns contents of appendPeriodicityInput as a double


% --- Executes during object creation, after setting all properties.
function appendPeriodicityInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to appendPeriodicityInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in appendPeriodicityHover.
function appendPeriodicityHover_Callback(hObject, eventdata, handles)
% hObject    handle to appendPeriodicityHover (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function [PolOrder] = DetPolyOrder(t,u)
%
% Input:
%   - t: time vector
%   - u: signal vector
%
% Output:
%   - PolOrder: polynomial order between 1 and 3
%
%% Fit the various poynomials
[p1,S1,mu1] = polyfit(t,u,1);[~,delta1] = polyval(p1,t,S1,mu1);
[p2,S2,mu2] = polyfit(t,u,2);[~,delta2] = polyval(p2,t,S2,mu2);
[p3,S3,mu3] = polyfit(t,u,3);[~,delta3] = polyval(p3,t,S3,mu3);

%% Fit a spline in the error distribution and compute its gradient
tt = 1:0.01:3;
Errors = [mean(delta1) mean(delta2) mean(delta3)]./(mean(delta1));
yEspl = spline(1:3, Errors);
yE_fit = ppval(yEspl,tt);
% Compute the spline gradient
yE_derv = gradient(yE_fit,tt);

%% Determine the best polynomial order
idx1 = find(Errors==min(Errors));
if idx1==1
    PolOrder=1;                     % If linear is the best --> case closed
else
    idx2 = find(abs(yE_derv)==min(abs(yE_derv)),1);
    PolOrder = round(tt(idx2)-0.2); % The -0.2 is to slightly favor lower orders
end





% function std_mean = ComputeMeanDeviation(filtered_u)
%
% fs = getappdata(0,'temp_fs');
% mean_fi = mean(filtered_u);
% filtered_u = filtered_u - mean_fi;
% N = length(filtered_u);
%
% x = reshape(filtered_u,[N,1]);
% ts = 1/fs;
% xtemp=zeros(1,2*N);
% SxxAvg=zeros(1,2*N);
% for i = 1:1
%     xtemp(1:N)= x(:,i);
%     xtemp(N+1:2*N)=0;
%     Xf = ts*fft(xtemp);
%     Sxx=Xf.*conj(Xf)/(N*ts);
%     SxxAvg=SxxAvg+Sxx;
% end
% SxxAvg=SxxAvg/N;
% % Now determine the autocorrelation by inverting autospectral density
% % and scaling the results
% Rxx = (1/ts)*ifft(SxxAvg);
% for i = 1:N-1
%     Rxx(i)=Rxx(i)*N/(N-i);
% end
% Rxx(N)=0;
% auto_new = Rxx/var(filtered_u);
% auto_new = auto_new(1:N);
% lag1 = (1:N);
% tau = lag1/fs;
% % Finding area
% [~,pos] = Trapzarea(auto_new,N,tau);
% L = round(2*pos);
% array = divisor(N);
% diff = abs(array - L);
% [~,pos] = min(diff);
% L_block = array(pos);
% N_block = N/L_block;
%
% % Re-evaluating
% x = reshape(filtered_u,[L_block,N_block]);
% ts = 1/fs;
% xtemp=zeros(1,2*L_block);
% SxxAvg=zeros(1,2*L_block);
% for i = 1:N_block
%     xtemp(1:L_block)= x(:,i);
%     xtemp(L_block+1:2*L_block)=0;
%     Xf = ts*fft(xtemp);
%     Sxx=Xf.*conj(Xf)/(L_block*ts);
%     SxxAvg=SxxAvg+Sxx;
% end
% SxxAvg=SxxAvg/N_block;
%
% % Now determine the Autocorrelation coefficient by inverting autospectral density
% % and scaling the results
% Rxx = (1/ts)*ifft(SxxAvg);
% Rxx = Rxx(1:L_block);
% for i = 1:L_block-1
%     Rxx(i)=Rxx(i)*L_block/(L_block-i);
% end
% Rxx(L_block)=0;
% acor_new = Rxx/var(filtered_u);
% lag = (1:L_block);
% acor_new = acor_new(1:L_block);
%
% % Checkng the zero crossing to compute the integral time scale
% id1 = find(acor_new < 0,1,'first'); %first zero-crossing
% % If no first zero crossing take the entire vector and then
% % evaluate area under the curve to get integral time scale
% flag = 0;
% if isempty(id1)
%     id3 = L_block;
%     flag = 1;
% else
%     id2 = find(acor_new(id1:end) > 0,1,'first');%second zero-crossing
%     % If no second zero crossing take the entire vector and then
%     % evaluate area under the curve to get integral time scale
%     if isempty(id2)
%         id3 = L_block;
%         flag = 1;
%     else
%         id2 = id1 + id2 - 1;
%         id3 = find(acor_new(id2:end) < 0,1,'first');%third zero-crossing
%         % If no third zero crossing take the entire vector and then
%         % evaluate area under the curve to get integral time scale
%         if isempty(id3)
%             id3 = L_block;
%             flag = 1;
%         else
%             id3 = id2 + id3 - 1;
%         end
%     end
% end
%
% if flag == 0
%     if abs(acor_new(id3)) > abs(acor_new(id3-1))
%         id3 = id3 -1;
%     end
% else
%     id3 = id3 - 1;
% end
%
% tau = lag/fs;
% Int2 = trapz(tau(1:id3),abs(acor_new(1:id3))); % Computing area using trapezoidal rule
%
% filtered_u = filtered_u + mean_fi;
% Time = N/fs;
% dt = 1/fs;
% if dt < 2*Int2
%     Neff = round(Time/(2*Int2));
% else
%     Neff = N;
% end
%
% std_sample = std(filtered_u);
% std_mean = std_sample/sqrt(Neff);



