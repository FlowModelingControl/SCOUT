function I = ConfigFile2(outname,pos,filename,sampfreq)
%% file name
I.OutputFileName = outname;             % Output file name: for summary file, and prefixes
%% Import
I.Import.Position = pos;                % Import the signal from directory or workspace
I.Import.File = filename;               % In case of directory specify the path, in case of workspace specify the signal name
I.Import.SamplingFrequency = sampfreq;  % Sampling frequency of the signal in Hz

%% Stationary analysis
I.Stationarity.Subsize = 'Default';         % Sample size for reverse arrangement test
I.Stationarity.MakeStationary = 'Yes';      % Yes for making stationary and No for leaving the signal as it is
I.Stationarity.StationaryMethod = 'polynomial fit'; % Method to be used for making the signal stationary, 'Inbuilt Detrend' , 'Polynomial fit', or 'NA' if not applicable

%% Spurious samples
I.Spurios.DetectionMethod = 'Chauvenet';    % Histogram or Chauvenet
I.Spurious.Chauvenet.n = 'Default';         % Default or some other value of std deviation for Chauvenet method, 
                                            % 'NA' if not applicable
I.Spurious.Histogram.Bins = 'NA';           % No. of bins in case of Hitogram method, 'NA' if not applicable
I.Spurious.Postprocessing = 'Replacement';  % Removal, Replacement or 'NA' for leaving he signal as it is

%% Normality
I.Normality.ConfidenceLevel = 'Default';    % Confidence level for checking the normality in decimal between 0 and 1
                                            % 'NA' if normality check not needed
I.Normality.NumberOfBins = 'Default';       % Number of bins for Chi-square goodness-of-fit check

%% Periodicity
I.Periodicity.Window = 'NA';                % hamming, hann, rectwin, chebwin, gausswin, triang,
                                            % NA if periodic component is not to be removed
I.Periodicity.NumberOfBlocks = 'Default';   % No.of blocks for windowing, NA if periodic component is not to be removed
I.Periodicity.Overlap = 'Default';          % Fraction of overlap of blocks in decimal between 0 and 1,
                                            % NA if periodic component is not to be removed
I.Periodicity.DiscreteFFT = 'Default';      % No. of discrete FFT points,                                           
I.Periodicity.RemovePeriodic = 'No';        % 'Yes' for removing periodic component and 'No' for leaving the signal as it is
                                            % NA if periodic component is not to be removed
I.Periodicity.MinLimit = 'Default';         % Lower frequency band to filter out (Depends on NFFT)  
I.Periodicity.MaxLimit = 'Default';         % Higher frequency band to filter out (Depends on NFFT)
I.Periodicity.Attenuation = 0.23;           % Attenuation level: numerical value between 0 and 1
I.Periodicity.Points = 50;                  % Number of points to be appended, default id 0.01*length of signal
%% Spectral analysis
I.Spectral.Window = 'hann';                 % hamming, hann, rectwin, chebwin, gausswin, triang 
I.Spectral.NumberOfBlocks = 'Default';      % No.of blocks for windowing
I.Spectral.Overlap = 'Default';             % Fraction of overlap of blocks in decimal between 0 and 1
I.Spectral.DiscreteFFT = 'Default';         % No. of discrete FFT points
I.Spectral.TimeShift = 'Default';           % Total time lag in sec for integrating rho for the integral time scale,
                                            % 'Default' sets the third zero-crossing as total time lag
I.Spectral.AutocorrNumOfBlocks = 'Default'; % Number of blocks for the autocorrelation
                                         
%% Result
I.Summary.Save = 'No';                      % Save the complete summary as a '.mat'file
I.Workspace.Save = 'Yes';                   % Save statistics about each signal in workspace
end
