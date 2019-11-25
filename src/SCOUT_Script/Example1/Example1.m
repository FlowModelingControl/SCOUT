%% Example 1:
% This example introduces the user to the basic capabilities of
% SCOUT_Script on one nonstationary signal that contains a periodic 
% component and spurious samples.
% ------------------------------------------------------------------------
%% Tasks (Part I): Signal classification,validation and editing
%   - Check for stationarity and correct for nonstationarity
%   - Check and replace spurious samples
%   - Check for normality
%   - Check for periodicity and remove the dominant frequency component
%   (for uncertainty analysis). 
%   - Perform spectral analysis and determine the integral time scale
% 
% All these operations are configured in ConfigFile1.m. 
% Check the ConfigFile and the user manual for more details.
% ------------------------------------------------------------------------
%% Tasks (PartII): Uncertainty analysis
% In addition to the above analyses, we also wish to determine:
%  - The total uncertainty (random + systematic uncertainty) of the mean of u
%  - The second order central moment <u'u'> and its uncertainty
%  - The third order central moment <u'u'u'> and its uncertainty
%
% In this case, we will set the data reduction equation as follows:
% 
% r = 1 Signal1^{1}
%
% Hence, u = r
% Uncertainty quantification/propagation is configured in 
% UncertaintyConfigFile.m.
% Check the UncertaintyConfigFile.m and the user manual for more details.
% ------------------------------------------------------------------------
%% Load data
clear; close all; clc;
% fix the random seed for repeatability
rng(1,'twister');
% Load signal from Sig1.mat. 
% The file contains one signal (u) from originally two velocity components 
% (u,v) acquired by an X-wire measurements.
% The signal was synthetically modified to make it more interesting. 
% The signal was sampled at 10 kHz.

% Load velocity vector into workspace
load('Sig1.mat')
%% Execute SCOUT Script
% All signal analyses and uncertainty quantification procedures are
% simultaneously performed with one command.
% In this example we will call on the signal u, which was already loaded from
% the file Sig1.mat into the workspace
%
% SCOUT_Script function is executed as follows:

SCOUT_Script(ConfigFile1('U','Workspace','u',10000),UncertaintyConfigFile) 

% The processed/corrected signal is saved in the workspace under the 
% provided variable name U with the suffix '_Final'.
%
% Other relevant results are also saved in the workspace, such as
% 'Integral time', 'Kurtosis', 'Mean', ' No. of spurious data
% present in the original signal', 'Auto-Correlation', 'Spectral
% distribution' etc, which are all denoted by their corresponding prefixes 
% and suffixes.
%
% Since it was activated in the ConfigFile1, a summary of all performed 
% classification, validation and editing analyses has also been saved in 
% the directory under U.mat
%
% Similarly and separately, another summary file of all performed uncertainty
% analyses (UncerFile.mat) has been generated.
%
% Using the saved results in the workspace and in the summary file, 
% further analysis and manipulation of the results can be easily performed.
%
% Below we provide some example analyses, result manipulations, and present
% some relevant plots
%% Plot original and processed signals
N = length(u);
fs = 10000;                 % Sampling frequency
dt = 1/fs;                  % Time step
t = linspace(0,(N-1)*dt,N); % Time vector
figure;
plot(t,u)                   % original u signal
hold on;
plot(t,U_Final);            % processed/corrected u signal (corrected for stationarity, spurious sample, and for periodic component)
legend('Original Signal','Processed Signal');
xlabel('Time [s]');
ylabel('u [m/s]');
%% Plot original and processed spectra
% Comparsion of the spectrum before and after removing the periodic
% component 
u_n = u - mean(u);
N = length(u_n);
nb = 8;                     % No. of blocks
p = 0.5;                    % 50% overlap   
nfft = 6554;
% Formula for computing the input needed for pwelch
temp = 2*(1-p)+(nb-1)*p+(1-2*p)*(nb-2);
n = floor(N/temp);
[pxx,f] = pwelch(u_n,hanning(n),floor(p*n),nfft,fs);

% Plotting
figure;
semilogy(f,pxx);
hold on;
semilogy(U_Spectral_Freq,U_Spectral_Sxx);
xlabel('$f$ [Hz]','interpreter','latex');
ylabel('$S_{uu}$','interpreter','latex');
legend('Original Signal','Processed Signal');
%% Plot autocorrelation and compute integral time scale
% The autocorrlation of the processed/corrected signal is plotted. 
% The integral time scale is computed using the default setting, i.e., the
% area under the curve up to the third zero-crossing. 
% This area is shown as shaded region in the autocorrelation plot 
figure;
plot(U_Auto_Tau,U_Auto_Rho);
xlim([0, U_Auto_Tau(end)]);
grid on;
hold on;
% Marker on the curve
plot(U_Auto_Tau(130),U_Auto_Rho(130),'o','markersize',3');
% Coloring the area under curve
area(U_Auto_Tau(1:130),U_Auto_Rho(1:130),'Facecolor',[0 0.75 0.75]);
xlabel('$\tau$[s]','interpreter','latex');
ylabel('$\rho$','interpreter','latex')

%% Mean with 95% confidence level
% Assuming a large sample record, we will report the uncertainties 
% for 95% confidence level 
% In this example, we have set the total relative systematic uncertainty 
% to 0.01 (see UncertaintyConfigFile for details).

load UncerFile.mat                                      % Load uncertainty analysis summary file
UncertaintyU = UncertaintySummary.ExpandedMeanUncert;   % Expanded uncertainty of the mean of u
fprintf('The mean of u, U = %f +/- %f\n',U_Mean, UncertaintyU);

%% Second and Third order central moment
% The higher order central moments of the modified signal are computed
% along their uncertainties using normal distribution for the second order
% and the general formula for the third order.
% 
% Note that the second order central moments are the familiar Reynolds stresses
%
% We will now report their values along with their corresponding
% uncertainty bands

moment2_u = moment(U_Final,2);                                      % Second central moment 
moment3_u = moment(U_Final,3);                                      % Third central moment
Uncertainty2_u = 2*UncertaintySummary.SecondOrderUncert.NormDist;   % Assuming large sample
Uncertainty3_u = 2*UncertaintySummary.ThirdOrderUncert.Formula;
fprintf('Second order central moment of u, <u''u''> = %f +/- %f\n',moment2_u,Uncertainty2_u);
fprintf('Third order central moment of u, <u''u''u''> = %f +/- %f\n',moment3_u,Uncertainty3_u);

