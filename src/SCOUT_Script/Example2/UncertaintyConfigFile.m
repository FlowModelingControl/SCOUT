function U = UncertaintyConfigFile
%% file name
U.OutputFileName = 'UncerFile';           % Output file name: for summary file, and prefixes
%% Data Reduction equation
U.Uncertainty.Coefficient = 1;            % Constant variable of the reduction equation
U.Uncertainty.InputSystematic = 'No';     % Systemtaic uncertainty: 'Yes' if needed, 'No' when not needed
U.Uncertainty.TimeShift = 63;             % Total lag number (=time lag / Delta t) for integrating rho for the integral time scale,
                                          % 'Default' sets the total lag number at the third zero-crossing
                                            
%% Signal 1
U.Uncertainty.Exponent1 = 1;              % Exponent of the signal in the data reduction equation
U.Uncertainty.Systematic1 = 'NA';         % Relative systematic uncertainty,'NA' if not applicable

%% Signal 2
U.Uncertainty.Exponent2 = 1;              % Exponent of the signal in the data reduction equation
U.Uncertainty.Systematic2 = 'NA';         % Relative systematic uncertainty,'NA' if not applicable

%% Signal 3
% U.Uncertainty.Exponent3 = 2;              % Exponent of the signal in the data reduction equation
% U.Uncertainty.Systematic3 = 'NA';         % Relative systematic uncertainty,'NA' if not applicable
% 
% %% Signal 4
% U.Uncertainty.Exponent4 = 2;              % Exponent of the signal in the data reduction equation
% U.Uncertainty.Systematic4 = 'NA';         % Relative systematic uncertainty,'NA' if not applicable
% 
% %% Signal 5
% U.Uncertainty.Exponent5 = 2;              % Exponent of the signal in the data reduction equation
% U.Uncertainty.Systematic5 = 'NA';         % Relative systematic uncertainty,'NA' if not applicable

%% Autocorrelation
U.Uncertainty.AutocorrNumOfBlocks = 'Default';  % No.of blocks for averaging

%% Higher Order Uncertainties
U.SecondCentral.Normal = 'Yes';             % Second order central moment considering normal distribution
U.SecondCentral.Formula = 'No';             % Second order central moment using direct equation

U.ThirdCentral.Normal = 'No';               % Third order central moment considering normal distribution
U.ThirdCentral.Formula = 'Yes';             % Third order central moment using direct equation

U.FourthCentral.Normal = 'No';              % Fourth order central moment considering normal distribution
U.FourthCentral.Formula = 'Yes';            % Fourth order central moment using direct equation

%% Save Reuslt
U.Result.Save = 'Yes';                      % Save the uncertainty analysis results in a summary file 
end