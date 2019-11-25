function I = ConfigFile3(outname,pos,filename,sampfreq)
%% file name
I.OutputFileName = outname;                 % Output file name: for summary file, and prefixes
%% Import
I.Import.Position = pos;                    % Import the signal from directory or workspace
I.Import.File = filename;                   % In case of directory specify the path, in case of workspace specify the signal name
I.Import.SamplingFrequency = sampfreq;      % Sampling frequency of the signal in Hz

%% Stationary analysis
I.Stationarity.Subsize = 'Default';         % Sample size for reverse arrangement test
I.Stationarity.MakeStationary = 'No';       % Yes for making stationary and No for leaving the signal as it is
I.Stationarity.StationaryMethod = 'NA';     % Method to be used for making the signal stationary: 'Polynomial fit' or 'Inbuilt Detrend'. 
                                            % 'NA' if not applicable

%% Spurious samples
%% Spurious samples
I.Spurios.DetectionMethod = 'Chauvenet';    % Histogram or Chauvenet
I.Spurious.Chauvenet.n = 'Default';         % Default or numerical value of std deviation for Chauvenet method, 
                                            % 'NA' if not applicable
I.Spurious.Histogram.Bins = 'NA';           % No. of bins in case of Histogram method, 'NA' if not applicable
I.Spurious.Postprocessing = 'NA';  % Removal or Replacement or 'NA' for leaving he signal as it is

%% Normality
I.Normality.ConfidenceLevel = 'NA';         % Confidence level for checking the normality in decimal between 0 and 1
                                            % 'NA' if normality check not needed
I.Normality.NumberOfBins = 'Default';       % Number of bins for Chi-square goodness-of-fit check

%% Periodicity
I.Periodicity.Window = 'NA';                % hamming, hann, rectwin, chebwin, gausswin, triang, or NA for not performing the anlysis
I.Periodicity.NumberOfBlocks = 'Default';   % No.of blocks for averaging, NA if periodic component is not to be removed
I.Periodicity.Overlap = 'Default';          % Fraction of overlap of blocks in decimal between 0 and 1,
I.Periodicity.DiscreteFFT = 'Default';      % No. of discrete FFT points,
I.Periodicity.RemovePeriodic = 'No';        % 'Yes' for removing periodic component and 'No' for leaving the signal as it is
I.Periodicity.MinLimit = 'Default';         % Lower frequency band of the filter range (Depends on NFFT)  
I.Periodicity.MaxLimit = 'Default';         % Higher frequency band of the filter range (Depends on NFFT)
I.Periodicity.Attenuation = 0.19;           % Attenuation level: numerical value between 0 and 1
I.Periodicity.Points = 'Default';           % Number of points to be appended, default id 0.03*length of signal

%% Spectral analysis
I.Spectral.Window = 'hamming';              % hamming, hann, rectwin, chebwin, gausswin, triang 
I.Spectral.NumberOfBlocks = 'Default';      % No.of blocks for averaging
I.Spectral.Overlap = 'Default';             % Fraction of overlap of blocks in decimal between 0 and 1
I.Spectral.DiscreteFFT = 'Default';         % No. of discrete FFT points
I.Spectral.TimeShift = 'Default';           % Total lag number (=time lag / Delta t) for integrating rho for the integral time scale,
                                            % 'Default' sets the total lag number at the third zero-crossing
I.Spectral.AutocorrNumOfBlocks = 'Default'; % Number of blocks for the autocorrelation
                                         
%% Result
I.Summary.Save = 'Yes';                     % Save the complete summary as a '.mat'file
I.Workspace.Save = 'Yes';                   % Save statistics about each signal in workspace
end
