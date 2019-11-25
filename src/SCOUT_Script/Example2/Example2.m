%% Example 2:
% This example shows the user how to analyze and clean two signals
% simultaneously and propagate their uncertainties into a Data Reduction
% Equation (DRE)
% ------------------------------------------------------------------------
%% Tasks (Part I): Signal classification,validation and editing
% The analysis we wish to perform on both signals consist of the following:
%   - Check for stationarity and correct for nonstationarity
%   - Check for spurious samples and, when applicable, replace the corrupted ones
%   - Check for normality
%   - Check for periodicity and remove the dominant frequency component
%   (for uncertainty analysis), when needed. 
%   - Perform spectral analysis and determine the integral time scale
% 
% All these operations are set in ConfigFile1.m (for u) and ConfigFile2.m 
% (for v). Check the two ConfigFiles and the user manual for more details.
% ------------------------------------------------------------------------
%% Tasks (PartII): Uncertainty analysis
% In addition to the above analyses, we also wish to determine the 
% uncertainty of the cross-correlation component <u'v'>, 
%    where u'= u - U, and v'=v - V.
% Since there is no direct expression that yields the uncertainty of <u'v'>,
% we shall propagate uncertainties through the following data reduction equation: 
% 
% r = u' v' = 1 * (Signal1)^1 *(Signal2)^1
%
% This process shall be performed in three steps:
% 1- Clean and analyze u and v signals
% 2- Compute u' and v' from the 'cleaned' signals
% 3- Propagate the uncertainties into r and thus into <r> = <u'v'>
%
% We neglect systematic uncertainties in this example
% Settings for uncertainty quantification/propagation are inputted in UncertaintyConfigFile.m.
% Check UncertaintyConfigFile.m and the user manual for more details.
% ------------------------------------------------------------------------
%% Load data
clear; close all; clc;
% fix the random seed for repeatability
rng(1,'twister');
% Load signal u from Sig1.mat.
% The u signal is one of two velocity components (u,v) from X-wire measurements.
% To illustrate how to load directly from the SCOUT_Script, the second 
% velocity component v shall be loaded during the process execution below.  
% Both signals were sampled at 10 kHz.

% Load the first velocity component into workspace
load('Data/Sig1.mat')

%% Step 1: Processing and cleaning u and v

SCOUT_Script(ConfigFile1('U','Workspace','u',10000),ConfigFile2('V','Directory','Data/Sig2.mat',10000))

%
% Note the following:
% 1. We did not call on UncertaintyConfigFile. We do not need it yet.
% 2. Details on processing and cleaning u and v are similar to those in
% example 1. Please refer to ConfigFile1 and ConfigFile2 for details.
%
% The processed/corrected signals are saved in the workspace under the variable name
% provided in the ConfigFiles with the suffix '_Final'.
%
% Other relevant results are also saved in the workspace, such as
% 'Integral time', 'Kurtosis', 'Mean', ' No. of spurious data
% present in the original signal', 'Auto-Correlation', 'Spectral
% distribution' etc, which are all denoted by their corresponding prefixes and suffixes.
%
% Since it was activated in the ConfigFiles, summaries of all performed 
% classification, validation and editing analyses has also been saved in
% the directory under U.mat and V.mat
%% Computing u'and v', and the <u'v'> uncertainty
% After analyzing and cleaning u and v, we shall compute u' and v'
Um = U_Final - U_Mean;
Vm = V_Final - V_Mean;
%
% We are now ready to propagate the cleaned u' and v' into r = u'v' and
% calculate the uncertainty of its mean: <r> = <u'v'>

SCOUT_Script(ConfigFile3('Us','Workspace','Um',10000),ConfigFile3('Vs','Workspace','Vm',10000),UncertaintyConfigFile)

%
% Note the settings in ConfigFile3 are mostly disabled, since
% u and v have already been processed. The only reason we have ConfigFile3
% is to be able to call on UncertaintyConfigFile
% 
% Similarly and separately, another summary file on all performed uncertainty
% analyses (UncerFile.mat) has been generated.
%
%% Cross-correlation coefficient of u'v'
figure;
plot(UncerFile_Auto_Tau,UncerFile_Auto_Rho)
% xlim([0, U_Auto_Tau(end)]);
grid on;
hold on;
% Marker on the curve
plot(UncerFile_Auto_Tau(59),UncerFile_Auto_Rho(59),'o','markersize',3');
% Coloring the area under curve
area(UncerFile_Auto_Tau(1:59),UncerFile_Auto_Rho(1:59),'Facecolor',[0 0.75 0.75]);
xlabel('$\tau$[s]','interpreter','latex');
ylabel('$\rho$','interpreter','latex')

%% Plot of autocorrelation and integral time scale value
load UncerFile.mat                      % Load uncertainty analysis summary file
moment_uv = mean(UncerFile_Final);      % which is similar to mean(Um.*Vm); 
Uncertainty_uv = UncertaintySummary.ExpandedMeanUncert;     % Alternatively 2*UncertaintySummary.TotalMeanUncert
fprintf('Cross-correlation (<u''v''>) is %f +/- %f\n',moment_uv,Uncertainty_uv);
