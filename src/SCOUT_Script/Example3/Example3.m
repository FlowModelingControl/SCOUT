%% Example 3:
% This example shows the user how to perform batch processing on a large
% set of data files using different configuration files. The dataset used
% is from X-wire measurements across a flow.
% ------------------------------------------------------------------------
%% Tasks (Part I): Signal classification,validation and editing
% The analysis we wish to perform on each file with both signals consist of the following:
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
% After processing the signals, we would like to plot the following:
%   - The mean streamwise velocity component accross the flow
%   - The mean spanwise velocity component accross the flow
%   - The standard deviation of the streamwise velocity component accross the flow

% ------------------------------------------------------------------------
%% Load data
clear; close all; clc;
% fix the random seed for repeatability
rng(1,'twister');
% Load signals Vel_#.mat from Data/ directory 
% Each file contains two velocity components (u,v) from X-wire measurements.  
% Both signals were sampled at 10 kHz.

% Load the first velocity component into workspace
list = dir('Data/Vel*.mat');
Nfile = length(list);
% Seqentially load the files and execute the analysis
% For simplicity, all u-components are analyzed with ConfigFile1 settings,
% and all v-components with ConfigFile2.
% For more accurate analysis, it is recommended to use different settings
% accross the flow
j = 16;
for i = 1:Nfile
    inputFile = ['Data/Vel_' int2str(j) '.mat'];
    load (inputFile);
    outName1 = ['U' num2str(i)];
    outName2 = ['V' num2str(i)];
    SCOUT_Script(ConfigFile1(outName1,'Workspace','u',10000),ConfigFile2(outName2,'Workspace','v',10000))
    clearvars u v
    j = j + 1;
end
%
% The processed/corrected signals are saved in the workspace under the variable name
% provided in the ConfigFiles with the suffix '_Final'.
%
% Other relevant results are also saved in the workspace, such as
% 'Integral time', 'Kurtosis', 'Mean', ' No. of spurious data
% present in the original signal', 'Auto-Correlation', 'Spectral
% distribution' etc, which are all denoted by their corresponding prefixes and suffixes.
%
% Since it was not activated in the ConfigFiles, no summary files were
% generated
%% Plotting relevant statistics
Fntsize = 14;
% Initialize the files
Umeans = zeros(1,Nfile);
Vmeans = zeros(1,Nfile);
stdu   = zeros(1,Nfile);
% Log mean and standard deviation into corresponding variable
for i = 1:Nfile
    outName1 = ['U' num2str(i)];
    outName2 = ['V' num2str(i)];
    Umeans(i) = eval([outName1 '_Mean']);
    Vmeans(i) = eval([outName2 '_Mean']);
    stdu(i) = std(eval([outName1 '_Final']));
end
% Plot
figure;plot(Umeans,'k-o','LineWidth',1.2);xlabel('Position','FontName','Times New Roman','FontSize',Fntsize); ylabel('$\overline{U}$', 'Interpreter','latex','FontSize',Fntsize)
figure;plot(Vmeans,'k-<','LineWidth',1.2);xlabel('Position','FontName','Times New Roman','FontSize',Fntsize); ylabel('$\overline{V}$', 'Interpreter','latex','FontSize',Fntsize)
figure;plot(stdu,'k-s','LineWidth',1.2);xlabel('Position','FontName','Times New Roman','FontSize',Fntsize); ylabel('$\sigma_u$', 'Interpreter','latex','FontSize',Fntsize)

