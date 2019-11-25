function SCOUT_Script(varargin)

set(0,'DefaultFigureVisible','off');
arg = nargin;
flag = 0;
for i=1:arg
    I = varargin{i};
    if isfield(I,'Uncertainty')
        flag = 1;
        temp = varargin{i};
        for j=i:arg-1
            varargin{j} = varargin{j+1};
        end
        varargin{end} = temp;
    end
    if flag == 1
        break;
    end
end

if flag==1
    U = varargin{end};
    UncertaintySummary = struct('TotalMeanUncert','Not Performed','ExpandedMeanUncert','Not Performed','TotalSystematicUncert',...
        'Not Performed','IntegralTimeScale','Not Performed','Std',struct('SampleRecord','Not Performed','Mean',...
        'Not Performed'),'Neff','Not Performed','SecondOrderUncert',struct('NormDist','Not Performed',...
        'Formula','Not Performed'),'ThirdOrderUncert',struct('NormDist','Not Performed','Formula','Not Performed'),...
        'FourthOrderUncert',struct('NormDist','Not Performed','Formula','Not Performed'),'AutocorrelationCoefficient',...
        struct('Rho','Not Performed','Tau','Not Performed'));
end

if flag==0
    arg = arg+1;
end
if arg>6
    errordlg('Please input maximum of 5 signals config files and 1 uncertainty config file','Computation failed');
    return;
end

for iter=1:arg-1
    flag_norm = 0;
    switch iter
        case 1
            Summary1 = SummaryFunc(1);
        case 2
            Summary2 = SummaryFunc(2);
        case 3
            Summary3 = SummaryFunc(3);
        case 4
            Summary4 = SummaryFunc(4);
        case 5
            Summary5 = SummaryFunc(5);
    end
    
    I = varargin{iter};
    
    %% Saving name and save option
    
    name{iter} = I.OutputFileName;
    saveOption{iter} = I.Summary.Save;
    name_new  = name{iter};
    
    %% Workspace variables
    s1 = strcat(name_new,'_Stationary');
    s2 = strcat(name_new,'_NumOfSpurious');
    s3 = strcat(name_new,'_NormalDist');
    s4 = strcat(name_new,'_Periodic');
    s5 = strcat(name_new,'_PeakFrequency');
    s6 = strcat(name_new,'_IntegralTime');
    s7 = strcat(name_new,'_Mean');
    s8 = strcat(name_new,'_Std');
    s9 = strcat(name_new,'_Kurtosis');
    s10 = strcat(name_new,'_Skewness');
    s11 = strcat(name_new,'_Auto_Rho');
    s12 = strcat(name_new,'_Auto_Tau');
    s13 = strcat(name_new,'_Spectral_Sxx');
    s14 = strcat(name_new,'_Spectral_Freq');
    s15 = strcat(name_new,'_Final');
    
    %% Import
    if strcmpi(I.Import.Position,'Workspace')
        W = evalin('base','whos');
        if ismember(I.Import.File,{W(:).name});
            u = evalin('base',I.Import.File);
            if iscolumn(u)
                u = u';
            end
        else
            errordlg('Signal does not exist in the workspace','Computation failed');
            return;
        end
    elseif strcmpi(I.Import.Position,'Directory')
        if exist(I.Import.File,'file')
            str = load(I.Import.File);
            u = table2array(struct2cell(str));
            if iscolumn(u)
                u = u';
            end
        else
            errordlg('File does not exist in the given directory','Computation failed');
            return;
        end
    end
    fs = I.Import.SamplingFrequency;
    N = length(u);    % Number of values
    dt = 1/fs;        % Time step
    t = linspace(0,(N-1)*dt,N); % Time vector
    
    switch iter
        case 1
            fs1 = fs;
            t1 = t;
            Summary1.Mean.Signal1 = mean(u);
            Summary1.Std.SampleRecord.Signal1 =  std(u);
        case 2
            fs2 = fs;
            t2 = t;
            Summary2.Mean.Signal2 = mean(u);
            Summary2.Std.SampleRecord.Signal2 =  std(u);
        case 3
            fs3 = fs;
            t3 = t;
            Summary3.Mean.Signal3 = mean(u);
            Summary3.Std.SampleRecord.Signal3 =  std(u);
        case 4
            fs4 = fs;
            t4 = t;
            Summary4.Mean.Signal4 = mean(u);
            Summary4.Std.SampleRecord.Signal4 =  std(u);
        case 5
            fs5 = fs;
            t5 = t;
            Summary5.Mean.Signal5 = mean(u);
            Summary5.Std.SampleRecord.Signal5 =  std(u);
    end
    
    %% Stationary analysis
    subsize = I.Stationarity.Subsize;
    if strcmpi(subsize,'default')
        subsize = 100;
    end
    K = N;
    KSub = fix(K/subsize);
    
    % Get the mean square for all segments
    MeanSquare = zeros(1,subsize);
    for i = 1:subsize
        lim1 = (i-1)*(KSub)+1;
        lim2 = i*KSub;
        
        MeanSquare(i,1) = mean(u(lim1:lim2).^2);
    end
    
    % Compute number of reverse arangement
    A = 0;
    for i = 1:subsize-1
        for j = i+1:subsize
            if MeanSquare(i) > MeanSquare(j)
                A = A + 1;
            end
        end
    end
    
    % Compute z-score
    mu_A = (subsize^2-subsize) / 4;
    sigma_A = sqrt((2 * subsize^3 + 3 * subsize^2 - 5*subsize) / (72));
    
    z_u = (A - mu_A) / sigma_A;
    switch iter
        case 1
            Summary1.zScore.Signal1 = z_u;
            if (z_u<=1.96 && z_u>=-1.96)
                Summary1.IsStationary.Signal1 = 'Yes';
                IsStationary = 'Yes';
            else
                Summary1.IsStationary.Signal1 = 'No';
                IsStationary = 'No';
            end
        case 2
            Summary2.zScore.Signal2 = z_u;
            if (z_u<=1.96 && z_u>=-1.96)
                Summary2.IsStationary.Signal2 = 'Yes';
                IsStationary = 'Yes';
            else
                Summary2.IsStationary.Signal2 = 'No';
                IsStationary = 'No';
            end
        case 3
            Summary3.zScore.Signal3 = z_u;
            if (z_u<=1.96 && z_u>=-1.96)
                Summary3.IsStationary.Signal3 = 'Yes';
                IsStationary = 'Yes';
            else
                Summary3.IsStationary.Signal3 = 'No';
                IsStationary = 'No';
            end
        case 4
            Summary4.zScore.Signal4 = z_u;
            if (z_u<=1.96 && z_u>=-1.96)
                Summary4.IsStationary.Signal4 = 'Yes';
                IsStationary = 'Yes';
            else
                Summary4.IsStationary.Signal4 = 'No';
                IsStationary = 'No';
            end
        case 5
            Summary5.zScore.Signal5 = z_u;
            if (z_u<=1.96 && z_u>=-1.96)
                Summary5.IsStationary.Signal5 = 'Yes';
                IsStationary = 'Yes';
            else
                Summary5.IsStationary.Signal5 = 'No';
                IsStationary = 'No';
            end
    end
    new_u = u;
    if strcmpi(I.Workspace.Save,'Yes')
        assignin('base',s1,IsStationary);
    end
    
    if ~(z_u<=1.96 && z_u>=-1.96) && strcmpi(I.Stationarity.MakeStationary,'Yes')
        if strcmpi(I.Stationarity.StationaryMethod,'Inbuilt Detrend')
            mean_u = mean(u);
            det_u = detrend(u); % Using inbuilt detrend command
            new_u = det_u + mean_u;
            assignin('base',s15,new_u);
            K = length(new_u);
            KSub = fix(K/subsize);
            
            % Get the mean square for all segments
            MeanSquare = zeros(1,subsize);
            for i = 1:subsize
                lim1 = (i-1)*(KSub)+1;
                lim2 = i*KSub;
                
                MeanSquare(i,1) = mean(new_u(lim1:lim2).^2);
            end
            
            % Compute number of reverse arangement
            A = 0;
            for i = 1:subsize-1
                for j = i+1:subsize
                    if MeanSquare(i) > MeanSquare(j)
                        A = A + 1;
                    end
                end
            end
            
            % Compute z-score
            mu_A = (subsize^2-subsize) / 4;
            sigma_A = sqrt((2 * subsize^3 + 3 * subsize^2 - 5*subsize) / (72));
            
            z_u = (A - mu_A) / sigma_A;
            
            switch iter
                case 1
                    Summary1.Mean.Signal1_sDetr = mean(new_u);
                    Summary1.Std.SampleRecord.Signal1_sDetr = std(new_u);
                    Summary1.zScore.Signal1_sDetr = z_u;
                    if (z_u<=1.96 && z_u>=-1.96)
                        Summary1.IsStationary.Signal1_sDetr = 'Yes';
                        IsStationary = 'Yes';
                    else
                        Summary1.IsStationary.Signal1_sDetr = 'No';
                        IsStationary = 'No';
                    end
                case 2
                    Summary2.Mean.Signal2_sDetr = mean(new_u);
                    Summary2.Std.SampleRecord.Signal2_sDetr = std(new_u);
                    Summary2.zScore.Signal2_sDetr = z_u;
                    if (z_u<=1.96 && z_u>=-1.96)
                        Summary2.IsStationary.Signal2_sDetr = 'Yes';
                        IsStationary = 'Yes';
                    else
                        Summary2.IsStationary.Signal2_sDetr = 'No';
                        IsStationary = 'No';
                    end
                case 3
                    Summary3.Mean.Signal3_sDetr = mean(new_u);
                    Summary3.Std.SampleRecord.Signal3_sDetr = std(new_u);
                    Summary3.zScore.Signal3_sDetr = z_u;
                    if (z_u<=1.96 && z_u>=-1.96)
                        Summary3.IsStationary.Signal3_sDetr = 'Yes';
                        IsStationary = 'Yes';
                    else
                        Summary3.IsStationary.Signal3_sDetr = 'No';
                        IsStationary = 'No';
                    end
                case 4
                    Summary4.Mean.Signal4_sDetr = mean(new_u);
                    Summary4.Std.SampleRecord.Signal4_sDetr = std(new_u);
                    Summary4.zScore.Signal4_sDetr = z_u;
                    if (z_u<=1.96 && z_u>=-1.96)
                        Summary4.IsStationary.Signal4_sDetr = 'Yes';
                        IsStationary = 'Yes';
                    else
                        Summary4.IsStationary.Signal4_sDetr = 'No';
                        IsStationary = 'No';
                    end
                case 5
                    Summary5.Mean.Signal5_sDetr = mean(new_u);
                    Summary5.Std.SampleRecord.Signal5_sDetr = std(new_u);
                    Summary5.zScore.Signal5_sDetr = z_u;
                    if (z_u<=1.96 && z_u>=-1.96)
                        Summary5.IsStationary.Signal5_sDetr = 'Yes';
                        IsStationary = 'Yes';
                    else
                        Summary5.IsStationary.Signal5_sDetr = 'No';
                        IsStationary = 'No';
                    end
            end
            if strcmpi(I.Workspace.Save,'Yes')
                assignin('base',s1,IsStationary);
            end
        elseif strcmpi(I.Stationarity.StationaryMethod,'Polynomial fit')
            fit = DetPolyOrder(t,u);            
            p = polyfit(t,u,fit);% Using polyfit command for fitting the data
            u_2 = polyval(p,t);% Generating the polynomial of 'fit' order
            new_u = (u - u_2) + mean(u);
            
            assignin('base',s15,new_u);
            
            K = length(new_u);
            KSub = fix(K/subsize);
            
            % Get the mean square for all segments
            MeanSquare = zeros(1,subsize);
            for i = 1:subsize
                lim1 = (i-1)*(KSub)+1;
                lim2 = i*KSub;
                
                MeanSquare(i,1) = mean(new_u(lim1:lim2).^2);
            end
            
            % Compute number of reverse arangement
            A = 0;
            for i = 1:subsize-1
                for j = i+1:subsize
                    if MeanSquare(i) > MeanSquare(j)
                        A = A + 1;
                    end
                end
            end
            
            % Compute z-score
            mu_A = (subsize^2-subsize) / 4;
            sigma_A = sqrt((2 * subsize^3 + 3 * subsize^2 - 5*subsize) / (72));
            
            z_u = (A - mu_A) / sigma_A;
            
            switch iter
                case 1
                    Summary1.Mean.Signal1_sPoly = mean(new_u);
                    Summary1.Std.SampleRecord.Signal1_sPoly = std(new_u);
                    Summary1.zScore.Signal1_sPoly = z_u;
                    if (z_u<=1.96 && z_u>=-1.96)
                        Summary1.IsStationary.Signal1_sPoly = 'Yes';
                        IsStationary = 'Yes';
                    else
                        Summary1.IsStationary.Signal1_sPoly = 'No';
                        IsStationary = 'No';
                    end
                case 2
                    Summary2.Mean.Signal2_sPoly = mean(new_u);
                    Summary2.Std.SampleRecord.Signal2_sPoly = std(new_u);
                    Summary2.zScore.Signal2_sPoly = z_u;
                    if (z_u<=1.96 && z_u>=-1.96)
                        Summary2.IsStationary.Signal2_sPoly = 'Yes';
                        IsStationary = 'Yes';
                    else
                        Summary2.IsStationary.Signal2_sPoly = 'No';
                        IsStationary = 'No';
                    end
                case 3
                    Summary3.Mean.Signal3_sPoly = mean(new_u);
                    Summary3.Std.SampleRecord.Signal3_sPoly = std(new_u);
                    Summary3.zScore.Signal3_sPoly = z_u;
                    if (z_u<=1.96 && z_u>=-1.96)
                        Summary3.IsStationary.Signal3_sPoly = 'Yes';
                        IsStationary = 'Yes';
                    else
                        Summary3.IsStationary.Signal3_sPoly = 'No';
                        IsStationary = 'No';
                    end
                case 4
                    Summary4.Mean.Signal4_sPoly = mean(new_u);
                    Summary4.Std.SampleRecord.Signal4_sPoly = std(new_u);
                    Summary4.zScore.Signal4_sPoly = z_u;
                    if (z_u<=1.96 && z_u>=-1.96)
                        Summary4.IsStationary.Signal4_sPoly = 'Yes';
                        IsStationary = 'Yes';
                    else
                        Summary4.IsStationary.Signal4_sPoly = 'No';
                        IsStationary = 'No';
                    end
                case 5
                    Summary5.Mean.Signal5_sPoly = mean(new_u);
                    Summary5.Std.SampleRecord.Signal5_sPoly = std(new_u);
                    Summary5.zScore.Signal5_sPoly = z_u;
                    if (z_u<=1.96 && z_u>=-1.96)
                        Summary5.IsStationary.Signal5_sPoly = 'Yes';
                        IsStationary = 'Yes';
                    else
                        Summary5.IsStationary.Signal5_sPoly = 'No';
                        IsStationary = 'No';
                    end
            end
            if strcmpi(I.Workspace.Save,'Yes')
                assignin('base',s1,IsStationary);
            end
        else
            errordlg('Input either ''Inbuilt Detrend'' or ''Polynomial fit'' as the method for making the signal stationary',...
                'Computation failed');
            return;
        end
    end
    
    
    %% Spurious samples
    
    method = I.Spurious.Postprocessing;
    method2 = I.Spurios.DetectionMethod;
    dev = I.Spurious.Chauvenet.n;
    bins = I.Spurious.Histogram.Bins;
    lim = 1 - 1/(2*N);
    
    switch lower(method)
        case 'removal'
            switch lower(method2)
                case 'chauvenet'
                    if strcmpi('default',dev)
                        has_vpasolve = ~isempty(which('vpasolve'));
                        if has_vpasolve ~= 1
                            errordlg('Your MATLAB does not have vpasolve. Chauvenet method cannot be used','Calculation failed');
                            set(handles.chauvenetRadio,'Value',0);
                            return;
                        end
                        syms a
                        n = double(vpasolve(normcdf(a)-normcdf(-a)== lim,a));
                    else
                        n = dev;
                    end
                    sigma_n = std(new_u);
                    cal_u = n*sigma_n;
                    mean_n = mean(new_u);
                    % Detect spurious data and store remaining data in final_u
                    a = [new_u((new_u > (mean_n + cal_u))),new_u((new_u < (mean_n - cal_u)))];
                    final_u = new_u((new_u <= (mean_n + cal_u))&((new_u >= (mean_n - cal_u))));
                    % Find their position in the vector
                    pos = find(new_u <= (mean_n + cal_u))&((new_u >= (mean_n - cal_u)));
                    final_u = final_u + mean_n;
                    
                    switch iter
                        case 1
                            Summary1.SpuriousIndex.Chauvenet = find(~pos);
                            if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary1.Mean.Signal1_sDetr_nChauRemo = mean(final_u);
                                Summary1.Std.SampleRecord.Signal1_sDetr_nChauRemo = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary1.Mean.Signal1_sPoly_nChauRemo = mean(final_u);
                                Summary1.Std.SampleRecord.Signal1_sPoly_nChauRemo = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary1.Mean.Signal1_nChauRemo = mean(final_u);
                                Summary1.Std.SampleRecord.Signal1_nChauRemo = std(final_u);
                            end
                        case 2
                            Summary2.SpuriousIndex.Chauvenet = find(~pos);
                            if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary2.Mean.Signal2_sDetr_nChauRemo = mean(final_u);
                                Summary2.Std.SampleRecord.Signal2_sDetr_nChauRemo = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary2.Mean.Signal2_sPoly_nChauRemo = mean(final_u);
                                Summary2.Std.SampleRecord.Signal2_sPoly_nChauRemo = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary2.Mean.Signal2_nChauRemo = mean(final_u);
                                Summary2.Std.SampleRecord.Signal2_nChauRemo = std(final_u);
                            end
                        case 3
                            Summary3.SpuriousIndex.Chauvenet = find(~pos);
                            if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary3.Mean.Signal3_sDetr_nChauRemo = mean(final_u);
                                Summary3.Std.SampleRecord.Signal3_sDetr_nChauRemo = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary3.Mean.Signal3_sPoly_nChauRemo = mean(final_u);
                                Summary3.Std.SampleRecord.Signal3_sPoly_nChauRemo = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary3.Mean.Signal3_nChauRemo = mean(final_u);
                                Summary3.Std.SampleRecord.Signal3_nChauRemo = std(final_u);
                            end
                        case 4
                            Summary4.SpuriousIndex.Chauvenet = find(~pos);
                            if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary4.Mean.Signal4_sDetr_nChauRemo = mean(final_u);
                                Summary4.Std.SampleRecord.Signal4_sDetr_nChauRemo = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary4.Mean.Signal4_sPoly_nChauRemo = mean(final_u);
                                Summary4.Std.SampleRecord.Signal4_sPoly_nChauRemo = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary4.Mean.Signal4_nChauRemo = mean(final_u);
                                Summary4.Std.SampleRecord.Signal4_nChauRemo = std(final_u);
                            end
                        case 5
                            Summary5.SpuriousIndex.Chauvenet = find(~pos);
                            if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary5.Mean.Signal5_sDetr_nChauRemo = mean(final_u);
                                Summary5.Std.SampleRecord.Signal5_sDetr_nChauRemo = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary5.Mean.Signal5_sPoly_nChauRemo = mean(final_u);
                                Summary5.Std.SampleRecord.Signal5_sPoly_nChauRemo = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary5.Mean.Signal5_nChauRemo = mean(final_u);
                                Summary5.Std.SampleRecord.Signal5_nChauRemo = std(final_u);
                            end
                    end
                    if strcmpi(I.Workspace.Save,'Yes')
                        assignin('base',s2,length(a));
                    end
                    assignin('base',s15,final_u);
                case 'histogram'
                    mean_n = mean(new_u);
                    final_u = new_u;
                    if strcmpi('default',bins)
                        k = 20;
                    else
                        k = bins;
                    end
                    
                    h = histogram(new_u,k);
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
                    pos = [];
                    % Finding the position of the spurious signal in those identified bins
                    for i=1:length(vec)
                        x = h.BinEdges(vec(i):vec(i)+1);
                        pos = [pos,find((new_u > x(1))&(new_u < x(2)))];
                    end
                    a = new_u(pos);
                    final_u(pos) = [];
                    final_u = final_u + mean_n;
                    switch iter
                        case 1
                            Summary1.SpuriousIndex.Histogram = pos;
                            if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary1.Mean.Signal1_sDetr_nHistRemo = mean(final_u);
                                Summary1.Std.SampleRecord.Signal1_sDetr_nHistRemo = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary1.Mean.Signal1_sPoly_nHistRemo = mean(final_u);
                                Summary1.Std.SampleRecord.Signal1_sPoly_nHistRemo = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary1.Mean.Signal1_nHistRemo = mean(final_u);
                                Summary1.Std.SampleRecord.Signal1_nHistRemo = std(final_u);
                            end
                        case 2
                            Summary2.SpuriousIndex.Histogram = pos;
                            if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary2.Mean.Signal2_sDetr_nHistRemo = mean(final_u);
                                Summary2.Std.SampleRecord.Signal2_sDetr_nHistRemo = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary2.Mean.Signal2_sPoly_nHistRemo = mean(final_u);
                                Summary2.Std.SampleRecord.Signal2_sPoly_nHistRemo = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary2.Mean.Signal2_nHistRemo = mean(final_u);
                                Summary2.Std.SampleRecord.Signal2_nHistRemo = std(final_u);
                            end
                        case 3
                            Summary3.SpuriousIndex.Histogram = pos;
                            if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary3.Mean.Signal3_sDetr_nHistRemo = mean(final_u);
                                Summary3.Std.SampleRecord.Signal3_sDetr_nHistRemo = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary3.Mean.Signal3_sPoly_nHistRemo = mean(final_u);
                                Summary3.Std.SampleRecord.Signal3_sPoly_nHistRemo = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary3.Mean.Signal3_nHistRemo = mean(final_u);
                                Summary3.Std.SampleRecord.Signal3_nHistRemo = std(final_u);
                            end
                        case 4
                            Summary4.SpuriousIndex.Histogram = pos;
                            if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary4.Mean.Signal4_sDetr_nHistRemo = mean(final_u);
                                Summary4.Std.SampleRecord.Signal4_sDetr_nHistRemo = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary4.Mean.Signal4_sPoly_nHistRemo = mean(final_u);
                                Summary4.Std.SampleRecord.Signal4_sPoly_nHistRemo = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary4.Mean.Signal4_nHistRemo = mean(final_u);
                                Summary4.Std.SampleRecord.Signal4_nHistRemo = std(final_u);
                            end
                        case 5
                            Summary5.SpuriousIndex.Histogram = pos;
                            if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary5.Mean.Signal5_sDetr_nHistRemo = mean(final_u);
                                Summary5.Std.SampleRecord.Signal5_sDetr_nHistRemo = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary5.Mean.Signal5_sPoly_nHistRemo = mean(final_u);
                                Summary5.Std.SampleRecord.Signal5_sPoly_nHistRemo = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary5.Mean.Signal5_nHistRemo = mean(final_u);
                                Summary5.Std.SampleRecord.Signal5_nHistRemo = std(final_u);
                            end
                    end
                    if strcmpi(I.Workspace.Save,'Yes')
                        assignin('base',s2,length(a));
                    end
                    assignin('base',s15,final_u);
                otherwise
                    errordlg('Input either ''Chauvenet'' or ''Histogram'' as the spurious signal detection method',...
                        'Computation failed');
                    return;
            end
        case 'replacement'
            switch lower(method2)
                case 'chauvenet'
                    if strcmpi('default',dev)
                        has_vpasolve = ~isempty(which('vpasolve'));
                        if has_vpasolve ~= 1
                            errordlg('Your MATLAB does not have vpasolve. Chauvenet method cannot be used','Calculation failed');
                            set(handles.chauvenetRadio,'Value',0);
                            return;
                        end
                        syms a
                        n = double(vpasolve(normcdf(a)-normcdf(-a)== lim,a));
                    else
                        n = dev;
                    end
                    sigma_n = std(new_u);
                    cal_u = n*sigma_n;
                    mean_n = mean(new_u);
                    j = 1;
                    count = 0;
                    % Detecting spurious data which lie outside the limits
                    a = [new_u((new_u > (mean_n + cal_u))),new_u((new_u < (mean_n - cal_u)))];
                    % Find their position in the vector
                    pos = (new_u <= (mean_n + cal_u))&((new_u >= (mean_n - cal_u)));
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
                    switch iter
                        case 1
                            Summary1.SpuriousIndex.Chauvenet = find(~pos);
                            if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary1.Mean.Signal1_sDetr_nChau = mean(final_u);
                                Summary1.Std.SampleRecord.Signal1_sDetr_nChau = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary1.Mean.Signal1_sPoly_nChau = mean(final_u);
                                Summary1.Std.SampleRecord.Signal1_sPoly_nChau = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary1.Mean.Signal1_nChau = mean(final_u);
                                Summary1.Std.SampleRecord.Signal1_nChau = std(final_u);
                            end
                        case 2
                            Summary2.SpuriousIndex.Chauvenet = find(~pos);
                            if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary2.Mean.Signal2_sDetr_nChau = mean(final_u);
                                Summary2.Std.SampleRecord.Signal2_sDetr_nChau = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary2.Mean.Signal2_sPoly_nChau = mean(final_u);
                                Summary2.Std.SampleRecord.Signal2_sPoly_nChau = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary2.Mean.Signal2_nChau = mean(final_u);
                                Summary2.Std.SampleRecord.Signal2_nChau = std(final_u);
                            end
                        case 3
                            Summary3.SpuriousIndex.Chauvenet = find(~pos);
                            if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary3.Mean.Signal3_sDetr_nChau = mean(final_u);
                                Summary3.Std.SampleRecord.Signal3_sDetr_nChau = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary3.Mean.Signal3_sPoly_nChau = mean(final_u);
                                Summary3.Std.SampleRecord.Signal3_sPoly_nChau = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary3.Mean.Signal3_nChau = mean(final_u);
                                Summary3.Std.SampleRecord.Signal3_nChau = std(final_u);
                            end
                        case 4
                            Summary4.SpuriousIndex.Chauvenet = find(~pos);
                            if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary4.Mean.Signal4_sDetr_nChau = mean(final_u);
                                Summary4.Std.SampleRecord.Signal4_sDetr_nChau = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary4.Mean.Signal4_sPoly_nChau = mean(final_u);
                                Summary4.Std.SampleRecord.Signal4_sPoly_nChau = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary4.Mean.Signal4_nChau = mean(final_u);
                                Summary4.Std.SampleRecord.Signal4_nChau = std(final_u);
                            end
                        case 5
                            Summary5.SpuriousIndex.Chauvenet = find(~pos);
                            if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary5.Mean.Signal5_sDetr_nChau = mean(final_u);
                                Summary5.Std.SampleRecord.Signal5_sDetr_nChau = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary5.Mean.Signal5_sPoly_nChau = mean(final_u);
                                Summary5.Std.SampleRecord.Signal5_sPoly_nChau = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary5.Mean.Signal5_nChau = mean(final_u);
                                Summary5.Std.SampleRecord.Signal5_nChau = std(final_u);
                            end
                    end
                    if strcmpi(I.Workspace.Save,'Yes')
                        assignin('base',s2,length(a));
                    end
                    assignin('base',s15,final_u);
                case 'histogram'
                    if ~strcmpi(bins,'default')
                        if ~isnumeric(bins)
                            errordlg('Input the bins in histogram method.','Calculation failed');
                            return;
                        end
                    end
                    mean_n = mean(new_u);
                    final_u = new_u;
                    if strcmpi('default',bins)
                        k = 20;
                    else
                        k = bins;
                    end
                    h = histogram(new_u,k);
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
                    pos = [];
                    % Finding the position of the spurious signal in those identified bins
                    for i=1:length(vec)
                        x = h.BinEdges(vec(i):vec(i)+1);
                        pos = [pos,find((new_u > x(1))&(new_u < x(2)))];
                    end
                    a = new_u(pos);
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
                    
                    switch iter
                        case 1
                            Summary1.SpuriousIndex.Histogram = pos;
                            if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary1.Mean.Signal1_sDetr_nHist = mean(final_u);
                                Summary1.Std.SampleRecord.Signal1_sDetr_nHist = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary1.Mean.Signal1_sPoly_nHist = mean(final_u);
                                Summary1.Std.SampleRecord.Signal1_sPoly_nHist = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary1.Mean.Signal1_nHist = mean(final_u);
                                Summary1.Std.SampleRecord.Signal1_nHist = std(final_u);
                            end
                        case 2
                            Summary2.SpuriousIndex.Histogram = pos;
                            if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary2.Mean.Signal2_sDetr_nHist = mean(final_u);
                                Summary2.Std.SampleRecord.Signal2_sDetr_nHist = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary2.Mean.Signal2_sPoly_nHist = mean(final_u);
                                Summary2.Std.SampleRecord.Signal2_sPoly_nHist = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary2.Mean.Signal2_nHist = mean(final_u);
                                Summary2.Std.SampleRecord.Signal2_nHist = std(final_u);
                            end
                        case 3
                            Summary3.SpuriousIndex.Histogram = pos;
                            if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary3.Mean.Signal3_sDetr_nHist = mean(final_u);
                                Summary3.Std.SampleRecord.Signal3_sDetr_nHist = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary3.Mean.Signal3_sPoly_nHist = mean(final_u);
                                Summary3.Std.SampleRecord.Signal3_sPoly_nHist = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary3.Mean.Signal3_nHist = mean(final_u);
                                Summary3.Std.SampleRecord.Signal3_nHist = std(final_u);
                            end
                        case 4
                            Summary4.SpuriousIndex.Histogram = pos;
                            if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary4.Mean.Signal4_sDetr_nHist = mean(final_u);
                                Summary4.Std.SampleRecord.Signal4_sDetr_nHist = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary4.Mean.Signal4_sPoly_nHist = mean(final_u);
                                Summary4.Std.SampleRecord.Signal4_sPoly_nHist = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary4.Mean.Signal4_nHist = mean(final_u);
                                Summary4.Std.SampleRecord.Signal4_nHist = std(final_u);
                            end
                        case 5
                            Summary5.SpuriousIndex.Histogram = pos;
                            if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary5.Mean.Signal5_sDetr_nHist = mean(final_u);
                                Summary5.Std.SampleRecord.Signal5_sDetr_nHist = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary5.Mean.Signal5_sPoly_nHist = mean(final_u);
                                Summary5.Std.SampleRecord.Signal5_sPoly_nHist = std(final_u);
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary5.Mean.Signal5_nHist = mean(final_u);
                                Summary5.Std.SampleRecord.Signal5_nHist = std(final_u);
                            end
                    end
                    if strcmpi(I.Workspace.Save,'Yes')
                        assignin('base',s2,length(a));
                    end
                    assignin('base',s15,final_u);
                otherwise
                    errordlg('Input either ''Chauvenet'' or ''Histogram'' as the spurious signal detection method',...
                        'Computation failed');
                    return;
            end
        case 'na'
            final_u = new_u;
            if strcmpi(I.Workspace.Save,'Yes')
                assignin('base',s2,'NA');
            end
        otherwise
            errordlg('Input for post-processing method of spurious signal missing','Computation failed');
            return;
    end
    
    %% Normality
    if ~strcmpi(I.Normality.ConfidenceLevel,'na')
        alpha = I.Normality.ConfidenceLevel;
        if strcmpi(alpha,'default')
            alpha = 0.95;
        end
        if isnan(alpha)||alpha<0||alpha>1
            errordlg('Enter confidence level between 0 and 1','Computation Failed');
            return;
        end
        NBins = I.Normality.NumberOfBins;
        if strcmpi(NBins,'Default')
            width = 0.4*std(final_u);
            n = (max(final_u)-min(final_u))/width;
            NBins = floor(n);
        end
        final_u1 = final_u - mean(final_u);
        alpha = 1 - alpha; % Finding levelof significance
        Chi_u = chi2gof(final_u1,'alpha',alpha,'NBins',NBins);
        switch lower(method)
            case 'removal'
                switch lower(method2)
                    case 'chauvenet'
                        switch iter
                            case 1
                                if  Chi_u == 0
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary1.Normality.Signal1_sPoly_nChauRemo = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary1.Normality.Signal1_sDetr_nChauRemo = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary1.Normality.Signal1_nChauRemo = 'Normally Distributed';
                                    end
                                    IsNormal = 'Yes';
                                else
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary1.Normality.Signal1_sPoly_nChauRemo = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary1.Normality.Signal1_sDetr_nChauRemo = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary1.Normality.Signal1_nChauRemo = 'Normally Not Distributed';
                                    end
                                    IsNormal = 'No';
                                end
                            case 2
                                if  Chi_u == 0
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary2.Normality.Signal2_sPoly_nChauRemo = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary2.Normality.Signal2_sDetr_nChauRemo = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary2.Normality.Signal2_nChauRemo = 'Normally Distributed';
                                    end
                                    IsNormal = 'Yes';
                                else
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary2.Normality.Signal2_sPoly_nChauRemo = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary2.Normality.Signal2_sDetr_nChauRemo = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary2.Normality.Signal2_nChauRemo = 'Normally Not Distributed';
                                    end
                                    IsNormal = 'No';
                                end
                            case 3
                                if  Chi_u == 0
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary3.Normality.Signal3_sPoly_nChauRemo = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary3.Normality.Signal3_sDetr_nChauRemo = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary3.Normality.Signal3_nChauRemo = 'Normally Distributed';
                                    end
                                    IsNormal = 'Yes';
                                else
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary3.Normality.Signal3_sPoly_nChauRemo = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary3.Normality.Signal3_sDetr_nChauRemo = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary3.Normality.Signal3_nChauRemo = 'Normally Not Distributed';
                                    end
                                    IsNormal = 'No';
                                end
                            case 4
                                if  Chi_u == 0
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary4.Normality.Signal4_sPoly_nChauRemo = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary4.Normality.Signal4_sDetr_nChauRemo = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary4.Normality.Signal4_nChauRemo = 'Normally Distributed';
                                    end
                                    IsNormal = 'Yes';
                                else
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary4.Normality.Signal4_sPoly_nChauRemo = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary4.Normality.Signal4_sDetr_nChauRemo = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary4.Normality.Signal4_nChauRemo = 'Normally Not Distributed';
                                    end
                                    IsNormal = 'No';
                                end
                            case 5
                                if  Chi_u == 0
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary5.Normality.Signal5_sPoly_nChauRemo = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary5.Normality.Signal5_sDetr_nChauRemo = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary5.Normality.Signal5_nChauRemo = 'Normally Distributed';
                                    end
                                    IsNormal = 'Yes';
                                else
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary5.Normality.Signal5_sPoly_nChauRemo = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary5.Normality.Signal5_sDetr_nChauRemo = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary5.Normality.Signal5_nChauRemo = 'Normally Not Distributed';
                                    end
                                    IsNormal = 'No';
                                end
                        end
                        if strcmpi(I.Workspace.Save,'Yes')
                            assignin('base',s3,IsNormal);
                        end
                    case 'histogram'
                        switch iter
                            case 1
                                if  Chi_u == 0
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary1.Normality.Signal1_sPoly_nHistRemo = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary1.Normality.Signal1_sDetr_nHistRemo = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary1.Normality.Signal1_nHistRemo = 'Normally Distributed';
                                    end
                                    IsNormal = 'Yes';
                                else
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary1.Normality.Signal1_sPoly_nHistRemo = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary1.Normality.Signal1_sDetr_nHistRemo = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary1.Normality.Signal1_nHistRemo = 'Normally Not Distributed';
                                    end
                                    IsNormal = 'No';
                                end
                            case 2
                                if  Chi_u == 0
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary2.Normality.Signal2_sPoly_nHistRemo = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary2.Normality.Signal2_sDetr_nHistRemo = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary2.Normality.Signal2_nHistRemo = 'Normally Distributed';
                                    end
                                    IsNormal = 'Yes';
                                else
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary2.Normality.Signal2_sPoly_nHistRemo = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary2.Normality.Signal2_sDetr_nHistRemo = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary2.Normality.Signal2_nHistRemo = 'Normally Not Distributed';
                                    end
                                    IsNormal = 'No';
                                end
                            case 3
                                if  Chi_u == 0
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary3.Normality.Signal3_sPoly_nHistRemo = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary3.Normality.Signal3_sDetr_nHistRemo = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary3.Normality.Signal3_nHistRemo = 'Normally Distributed';
                                    end
                                    IsNormal = 'Yes';
                                else
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary3.Normality.Signal3_sPoly_nHistRemo = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary3.Normality.Signal3_sDetr_nHistRemo = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary3.Normality.Signal3_nHistRemo = 'Normally Not Distributed';
                                    end
                                    IsNormal = 'No';
                                end
                            case 4
                                if  Chi_u == 0
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary4.Normality.Signal4_sPoly_nHistRemo = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary4.Normality.Signal4_sDetr_nHistRemo = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary4.Normality.Signal4_nHistRemo = 'Normally Distributed';
                                    end
                                    IsNormal = 'Yes';
                                else
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary4.Normality.Signal4_sPoly_nHistRemo = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary4.Normality.Signal4_sDetr_nHistRemo = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary4.Normality.Signal4_nHistRemo = 'Normally Not Distributed';
                                    end
                                    IsNormal = 'No';
                                end
                            case 5
                                if  Chi_u == 0
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary5.Normality.Signal5_sPoly_nHistRemo = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary5.Normality.Signal5_sDetr_nHistRemo = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary5.Normality.Signal5_nHistRemo = 'Normally Distributed';
                                    end
                                    IsNormal = 'Yes';
                                else
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary5.Normality.Signal5_sPoly_nHistRemo = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary5.Normality.Signal5_sDetr_nHistRemo = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary5.Normality.Signal5_nHistRemo = 'Normally Not Distributed';
                                    end
                                    IsNormal = 'No';
                                end
                        end
                        if strcmpi(I.Workspace.Save,'Yes')
                            assignin('base',s3,IsNormal);
                        end
                end
            case 'replacement'
                switch lower(method2)
                    case 'chauvenet'
                        switch iter
                            case 1
                                if  Chi_u == 0
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary1.Normality.Signal1_sPoly_nChau = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary1.Normality.Signal1_sDetr_nChau = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary1.Normality.Signal1_nChau = 'Normally Distributed';
                                    end
                                    IsNormal = 'Yes';
                                else
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary1.Normality.Signal1_sPoly_nChau = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary1.Normality.Signal1_sDetr_nChau = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary1.Normality.Signal1_nChau = 'Normally Not Distributed';
                                    end
                                    IsNormal = 'No';
                                end
                            case 2
                                if  Chi_u == 0
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary2.Normality.Signal2_sPoly_nChau = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary2.Normality.Signal2_sDetr_nChau = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary2.Normality.Signal2_nChau = 'Normally Distributed';
                                    end
                                    IsNormal = 'Yes';
                                else
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary2.Normality.Signal2_sPoly_nChau = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary2.Normality.Signal2_sDetr_nChau = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary2.Normality.Signal2_nChau = 'Normally Not Distributed';
                                    end
                                    IsNormal = 'No';
                                end
                            case 3
                                if  Chi_u == 0
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary3.Normality.Signal3_sPoly_nChau = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary3.Normality.Signal3_sDetr_nChau = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary3.Normality.Signal3_nChau = 'Normally Distributed';
                                    end
                                    IsNormal = 'Yes';
                                else
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary3.Normality.Signal3_sPoly_nChau = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary3.Normality.Signal3_sDetr_nChau = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary3.Normality.Signal3_nChau = 'Normally Not Distributed';
                                    end
                                    IsNormal = 'No';
                                end
                            case 4
                                if  Chi_u == 0
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary4.Normality.Signal4_sPoly_nChau = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary4.Normality.Signal4_sDetr_nChau = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary4.Normality.Signal4_nChau = 'Normally Distributed';
                                    end
                                    IsNormal = 'Yes';
                                else
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary4.Normality.Signal4_sPoly_nChau = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary4.Normality.Signal4_sDetr_nChau = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary4.Normality.Signal4_nChau = 'Normally Not Distributed';
                                    end
                                    IsNormal = 'No';
                                end
                            case 5
                                if  Chi_u == 0
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary5.Normality.Signal5_sPoly_nChau = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary5.Normality.Signal5_sDetr_nChau = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary5.Normality.Signal5_nChau = 'Normally Distributed';
                                    end
                                    IsNormal = 'Yes';
                                else
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary5.Normality.Signal5_sPoly_nChau = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary5.Normality.Signal5_sDetr_nChau = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary5.Normality.Signal5_nChau = 'Normally Not Distributed';
                                    end
                                    IsNormal = 'No';
                                end
                        end
                        if strcmpi(I.Workspace.Save,'Yes')
                            assignin('base',s3,IsNormal);
                        end
                    case 'histogram'
                        switch iter
                            case 1
                                if  Chi_u == 0
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary1.Normality.Signal1_sPoly_nHist = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary1.Normality.Signal1_sDetr_nHist = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary1.Normality.Signal1_nHist = 'Normally Distributed';
                                    end
                                    IsNormal = 'Yes';
                                else
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary1.Normality.Signal1_sPoly_nHist = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary1.Normality.Signal1_sDetr_nHist = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary1.Normality.Signal1_nHist = 'Normally Not Distributed';
                                    end
                                    IsNormal = 'No';
                                end
                            case 2
                                if  Chi_u == 0
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary2.Normality.Signal2_sPoly_nHist = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary2.Normality.Signal2_sDetr_nHist = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary2.Normality.Signal2_nHist = 'Normally Distributed';
                                    end
                                    IsNormal = 'Yes';
                                else
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary2.Normality.Signal2_sPoly_nHist = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary2.Normality.Signal2_sDetr_nHist = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary2.Normality.Signal2_nHist = 'Normally Not Distributed';
                                    end
                                    IsNormal = 'No';
                                end
                            case 3
                                if  Chi_u == 0
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary3.Normality.Signal3_sPoly_nHist = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary3.Normality.Signal3_sDetr_nHist = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary3.Normality.Signal3_nHist = 'Normally Distributed';
                                    end
                                    IsNormal = 'Yes';
                                else
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary3.Normality.Signal3_sPoly_nHist = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary3.Normality.Signal3_sDetr_nHist = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary3.Normality.Signal3_nHist = 'Normally Not Distributed';
                                    end
                                    IsNormal = 'No';
                                end
                            case 4
                                if  Chi_u == 0
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary4.Normality.Signal4_sPoly_nHist = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary4.Normality.Signal4_sDetr_nHist = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary4.Normality.Signal4_nHist = 'Normally Distributed';
                                    end
                                    IsNormal = 'Yes';
                                else
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary4.Normality.Signal4_sPoly_nHist = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary4.Normality.Signal4_sDetr_nHist = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary4.Normality.Signal4_nHist = 'Normally Not Distributed';
                                    end
                                    IsNormal = 'No';
                                end
                            case 5
                                if  Chi_u == 0
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary5.Normality.Signal5_sPoly_nHist = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary5.Normality.Signal5_sDetr_nHist = 'Normally Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary5.Normality.Signal5_nHist = 'Normally Distributed';
                                    end
                                    IsNormal = 'Yes';
                                else
                                    if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                        Summary5.Normality.Signal5_sPoly_nHist = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                        Summary5.Normality.Signal5_sDetr_nHist = 'Normally Not Distributed';
                                    elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                        Summary5.Normality.Signal5_nHist = 'Normally Not Distributed';
                                    end
                                    IsNormal = 'No';
                                end
                        end
                        if strcmpi(I.Workspace.Save,'Yes')
                            assignin('base',s3,IsNormal);
                        end
                end
            case 'na'
                switch iter
                    case 1
                        if  Chi_u == 0
                            if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary1.Normality.Signal1_sPoly = 'Normally Distributed';
                            elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary1.Normality.Signal1_sDetr = 'Normally Distributed';
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary1.Normality.Signal1 = 'Normally Distributed';
                            end
                            IsNormal = 'Yes';
                        else
                            if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary1.Normality.Signal1_sPoly = 'Normally Not Distributed';
                            elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary1.Normality.Signal1_sDetr = 'Normally Not Distributed';
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary1.Normality.Signal1 = 'Normally Not Distributed';
                            end
                            IsNormal = 'No';
                        end
                    case 2
                        if  Chi_u == 0
                            if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary2.Normality.Signal2_sPoly = 'Normally Distributed';
                            elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary2.Normality.Signal2_sDetr = 'Normally Distributed';
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary2.Normality.Signal2 = 'Normally Distributed';
                            end
                            IsNormal = 'Yes';
                        else
                            if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary2.Normality.Signal2_sPoly = 'Normally Not Distributed';
                            elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary2.Normality.Signal2_sDetr = 'Normally Not Distributed';
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary2.Normality.Signal2 = 'Normally Not Distributed';
                            end
                            IsNormal = 'No';
                        end
                    case 3
                        if  Chi_u == 0
                            if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary3.Normality.Signal3_sPoly = 'Normally Distributed';
                            elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary3.Normality.Signal3_sDetr = 'Normally Distributed';
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary3.Normality.Signal3 = 'Normally Distributed';
                            end
                            IsNormal = 'Yes';
                        else
                            if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary3.Normality.Signal3_sPoly = 'Normally Not Distributed';
                            elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary3.Normality.Signal3_sDetr = 'Normally Not Distributed';
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary3.Normality.Signal3 = 'Normally Not Distributed';
                            end
                            IsNormal = 'No';
                        end
                    case 4
                        if  Chi_u == 0
                            if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary4.Normality.Signal4_sPoly = 'Normally Distributed';
                            elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary4.Normality.Signal4_sDetr = 'Normally Distributed';
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary4.Normality.Signal4 = 'Normally Distributed';
                            end
                            IsNormal = 'Yes';
                        else
                            if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary4.Normality.Signal4_sPoly = 'Normally Not Distributed';
                            elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary4.Normality.Signal4_sDetr = 'Normally Not Distributed';
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary4.Normality.Signal4 = 'Normally Not Distributed';
                            end
                            IsNormal = 'No';
                        end
                    case 5
                        if  Chi_u == 0
                            if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary5.Normality.Signal5_sPoly = 'Normally Distributed';
                            elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary5.Normality.Signal5_sDetr = 'Normally Distributed';
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary5.Normality.Signal5 = 'Normally Distributed';
                            end
                            IsNormal = 'Yes';
                        else
                            if strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                Summary5.Normality.Signal5_sPoly = 'Normally Not Distributed';
                            elseif strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                Summary5.Normality.Signal5_sDetr = 'Normally Not Distributed';
                            elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                Summary5.Normality.Signal5 = 'Normally Not Distributed';
                            end
                            IsNormal = 'No';
                        end
                end
                if strcmpi(I.Workspace.Save,'Yes')
                    assignin('base',s3,IsNormal);
                end
        end
    end
    if strcmpi(method,'removal')
        filtered_u = final_u;
        flag_norm = 1;
    end
    
    %% Periodicity
    if flag_norm ~= 1
        removePeriodicity = I.Periodicity.RemovePeriodic;
        nb = I.Periodicity.NumberOfBlocks;
        p = I.Periodicity.Overlap;
        nfft = I.Periodicity.DiscreteFFT;
        window = I.Periodicity.Window;
        NR = I.Periodicity.Points;
                
        switch lower(removePeriodicity)
            case 'yes'
                if strcmpi('default',nb)
                    nb = 8;
                end
                if strcmpi('default',p)
                    p = 0.5;
                end
                if strcmpi('default',nfft)
                    nfft = round(max(256,0.1*length(final_u)));
                end
                if strcmpi('default',NR)
                    NR = floor(0.003*length(final_u));
                end
                
                if p>=1 || p <= 0
                    errordlg('The overlap fraction for periodicity should be between 0 and 1','Computation failed');
                    return;
                end
                
                if NR>length(final_u)
                    errordlg('The number of points to be appended should be less than the length of the signal','Computation failed');
                    return;
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
                % Formula for computing the input needed for pwelch
                temp = 2*(1-p)+(nb-1)*p+(1-2*p)*(nb-2);
                n = floor(N1/temp);
                
                switch lower(window)
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
                    otherwise
                        errordlg('Input proper window for testing periodicity','Computation failed');
                        return;
                end
                % Locating the peaks using 'PeakSeek' function
                [loca,peaks] = PeakSeek((pxx),[],mean((pxx)));
                posit = peaks == max(peaks); % Position of the highest peak
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
                if strcmpi(I.Periodicity.MinLimit,'Default')
                    r1 = round(indmin*N1*2/(nfft+1));
                else
                    freq = I.Periodicity.MinLimit;
                    diff = abs(freq-f1);
                    indmin = find(diff == min(diff));
                    r1 = round(indmin*N1*2/(nfft+1));
                end
                
                if strcmpi(I.Periodicity.MaxLimit,'Default')
                    r2 = round(indmax*N1*2/(nfft+1));
                else
                    freq = I.Periodicity.MaxLimit;
                    diff = abs(freq-f1);
                    indmax = find(diff == min(diff));
                    r2 = round(indmax*N1*2/(nfft+1));
                end
                
                
                if strcmpi(I.Periodicity.Attenuation,'Default')
                    scale = 0.2; %where n is order of the filter
                else
                    scale = I.Periodicity.Attenuation;
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
                filtered_u = filtered_u + mean_f;
                if strcmpi(I.Workspace.Save,'Yes')
                    assignin('base',s4,'Yes');
                    assignin('base',s5,f1(locs));
                end
                assignin('base',s15,filtered_u);
                switch lower(method)
                    case 'replacement'
                        switch lower(method2)
                            case 'chauvenet'
                                switch iter
                                    case 1
                                        if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                            Summary1.Mean.Signal1_sDetr_nChau_np = mean(filtered_u);
                                            Summary1.Std.SampleRecord.Signal1_sDetr_nChau_np = std(filtered_u);
                                            Summary1.PeakFrequency.Signal1_sDetr_nChau = f1(locs);
                                            Summary1.PeakValue.Signal1_sDetr_nChau = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                            Summary1.Mean.Signal1_sPoly_nChau_np = mean(filtered_u);
                                            Summary1.Std.SampleRecord.Signal1_sPoly_nChau_np = std(filtered_u);
                                            Summary1.PeakFrequency.Signal1_sPoly_nChau = f1(locs);
                                            Summary1.PeakValue.Signal1_sPoly_nChau = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                            Summary1.Mean.Signal1_nChau_np = mean(filtered_u);
                                            Summary1.Std.SampleRecord.Signal1_nChau_np = std(filtered_u);
                                            Summary1.PeakFrequency.Signal1_nChau = f1(locs);
                                            Summary1.PeakValue.Signal1_nChau = max(peaks);
                                        end
                                    case 2
                                        if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                            Summary2.Mean.Signal2_sDetr_nChau_np = mean(filtered_u);
                                            Summary2.Std.SampleRecord.Signal2_sDetr_nChau_np = std(filtered_u);
                                            Summary2.PeakFrequency.Signal2_sDetr_nChau = f1(locs);
                                            Summary2.PeakValue.Signal2_sDetr_nChau = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                            Summary2.Mean.Signal2_sPoly_nChau_np = mean(filtered_u);
                                            Summary2.Std.SampleRecord.Signal2_sPoly_nChau_np = std(filtered_u);
                                            Summary2.PeakFrequency.Signal2_sPoly_nChau = f1(locs);
                                            Summary2.PeakValue.Signal2_sPoly_nChau = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                            Summary2.Mean.Signal2_nChau_np = mean(filtered_u);
                                            Summary2.Std.SampleRecord.Signal2_nChau_np = std(filtered_u);
                                            Summary2.PeakFrequency.Signal2_nChau = f1(locs);
                                            Summary2.PeakValue.Signal2_nChau = max(peaks);
                                        end
                                    case 3
                                        if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                            Summary3.Mean.Signal3_sDetr_nChau_np = mean(filtered_u);
                                            Summary3.Std.SampleRecord.Signal3_sDetr_nChau_np = std(filtered_u);
                                            Summary3.PeakFrequency.Signal3_sDetr_nChau = f1(locs);
                                            Summary3.PeakValue.Signal3_sDetr_nChau = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                            Summary3.Mean.Signal3_sPoly_nChau_np = mean(filtered_u);
                                            Summary3.Std.SampleRecord.Signal3_sPoly_nChau_np = std(filtered_u);
                                            Summary3.PeakFrequency.Signal3_sPoly_nChau = f1(locs);
                                            Summary3.PeakValue.Signal3_sPoly_nChau = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                            Summary3.Mean.Signal3_nChau_np = mean(filtered_u);
                                            Summary3.Std.SampleRecord.Signal3_nChau_np = std(filtered_u);
                                            Summary3.PeakFrequency.Signal3_nChau = f1(locs);
                                            Summary3.PeakValue.Signal3_nChau = max(peaks);
                                        end
                                    case 4
                                        if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                            Summary4.Mean.Signal4_sDetr_nChau_np = mean(filtered_u);
                                            Summary4.Std.SampleRecord.Signal4_sDetr_nChau_np = std(filtered_u);
                                            Summary4.PeakFrequency.Signal4_sDetr_nChau = f1(locs);
                                            Summary4.PeakValue.Signal4_sDetr_nChau = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                            Summary4.Mean.Signal4_sPoly_nChau_np = mean(filtered_u);
                                            Summary4.Std.SampleRecord.Signal4_sPoly_nChau_np = std(filtered_u);
                                            Summary4.PeakFrequency.Signal4_sPoly_nChau = f1(locs);
                                            Summary4.PeakValue.Signal4_sPoly_nChau = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                            Summary4.Mean.Signal4_nChau_np = mean(filtered_u);
                                            Summary4.Std.SampleRecord.Signal4_nChau_np = std(filtered_u);
                                            Summary4.PeakFrequency.Signal4_nChau = f1(locs);
                                            Summary4.PeakValue.Signal4_nChau = max(peaks);
                                        end
                                    case 5
                                        if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                            Summary5.Mean.Signal5_sDetr_nChau_np = mean(filtered_u);
                                            Summary5.Std.SampleRecord.Signal5_sDetr_nChau_np = std(filtered_u);
                                            Summary5.PeakFrequency.Signal5_sDetr_nChau = f1(locs);
                                            Summary5.PeakValue.Signal5_sDetr_nChau = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                            Summary5.Mean.Signal5_sPoly_nChau_np = mean(filtered_u);
                                            Summary5.Std.SampleRecord.Signal5_sPoly_nChau_np = std(filtered_u);
                                            Summary5.PeakFrequency.Signal5_sPoly_nChau = f1(locs);
                                            Summary5.PeakValue.Signal5_sPoly_nChau = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                            Summary5.Mean.Signal5_nChau_np = mean(filtered_u);
                                            Summary5.Std.SampleRecord.Signal5_nChau_np = std(filtered_u);
                                            Summary5.PeakFrequency.Signal5_nChau = f1(locs);
                                            Summary5.PeakValue.Signal5_nChau = max(peaks);
                                        end
                                end
                            case 'histogram'
                                switch iter
                                    case 1
                                        if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                            Summary1.Mean.Signal1_sDetr_nHist_np = mean(filtered_u);
                                            Summary1.Std.SampleRecord.Signal1_sDetr_nHist_np = std(filtered_u);
                                            Summary1.PeakFrequency.Signal1_sDetr_nHist = f1(locs);
                                            Summary1.PeakValue.Signal1_sDetr_nHist = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                            Summary1.Mean.Signal1_sPoly_nHist_np = mean(filtered_u);
                                            Summary1.Std.SampleRecord.Signal1_sPoly_nHist_np = std(filtered_u);
                                            Summary1.PeakFrequency.Signal1_sPoly_nHist = f1(locs);
                                            Summary1.PeakValue.Signal1_sPoly_nHist = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                            Summary1.Mean.Signal1_nHist_np = mean(filtered_u);
                                            Summary1.Std.SampleRecord.Signal1_nHist_np = std(filtered_u);
                                            Summary1.PeakFrequency.Signal1_nHist = f1(locs);
                                            Summary1.PeakValue.Signal1_nHist = max(peaks);
                                        end
                                    case 2
                                        if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                            Summary2.Mean.Signal2_sDetr_nHist_np = mean(filtered_u);
                                            Summary2.Std.SampleRecord.Signal2_sDetr_nHist_np = std(filtered_u);
                                            Summary2.PeakFrequency.Signal2_sDetr_nHist = f1(locs);
                                            Summary2.PeakValue.Signal2_sDetr_nHist = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                            Summary2.Mean.Signal2_sPoly_nHist_np = mean(filtered_u);
                                            Summary2.Std.SampleRecord.Signal2_sPoly_nHist_np = std(filtered_u);
                                            Summary2.PeakFrequency.Signal2_sPoly_nHist = f1(locs);
                                            Summary2.PeakValue.Signal2_sPoly_nHist = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                            Summary2.Mean.Signal2_nHist_np = mean(filtered_u);
                                            Summary2.Std.SampleRecord.Signal2_nHist_np = std(filtered_u);
                                            Summary2.PeakFrequency.Signal2_nHist = f1(locs);
                                            Summary2.PeakValue.Signal2_nHist = max(peaks);
                                        end
                                    case 3
                                        if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                            Summary3.Mean.Signal3_sDetr_nHist_np = mean(filtered_u);
                                            Summary3.Std.SampleRecord.Signal3_sDetr_nHist_np = std(filtered_u);
                                            Summary3.PeakFrequency.Signal3_sDetr_nHist = f1(locs);
                                            Summary3.PeakValue.Signal3_sDetr_nHist = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                            Summary3.Mean.Signal3_sPoly_nHist_np = mean(filtered_u);
                                            Summary3.Std.SampleRecord.Signal3_sPoly_nHist_np = std(filtered_u);
                                            Summary3.PeakFrequency.Signal3_sPoly_nHist = f1(locs);
                                            Summary3.PeakValue.Signal3_sPoly_nHist = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                            Summary3.Mean.Signal3_nHist_np = mean(filtered_u);
                                            Summary3.Std.SampleRecord.Signal3_nHist_np = std(filtered_u);
                                            Summary3.PeakFrequency.Signal3_nHist = f1(locs);
                                            Summary3.PeakValue.Signal3_nHist = max(peaks);
                                        end
                                    case 4
                                        if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                            Summary4.Mean.Signal4_sDetr_nHist_np = mean(filtered_u);
                                            Summary4.Std.SampleRecord.Signal4_sDetr_nHist_np = std(filtered_u);
                                            Summary4.PeakFrequency.Signal4_sDetr_nHist = f1(locs);
                                            Summary4.PeakValue.Signal4_sDetr_nHist = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                            Summary4.Mean.Signal4_sPoly_nHist_np = mean(filtered_u);
                                            Summary4.Std.SampleRecord.Signal4_sPoly_nHist_np = std(filtered_u);
                                            Summary4.PeakFrequency.Signal4_sPoly_nHist = f1(locs);
                                            Summary4.PeakValue.Signal4_sPoly_nHist = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                            Summary4.Mean.Signal4_nHist_np = mean(filtered_u);
                                            Summary4.Std.SampleRecord.Signal4_nHist_np = std(filtered_u);
                                            Summary4.PeakFrequency.Signal4_nHist = f1(locs);
                                            Summary4.PeakValue.Signal4_nHist = max(peaks);
                                        end
                                    case 5
                                        if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                            Summary5.Mean.Signal5_sDetr_nHist_np = mean(filtered_u);
                                            Summary5.Std.SampleRecord.Signal5_sDetr_nHist_np = std(filtered_u);
                                            Summary5.PeakFrequency.Signal5_sDetr_nHist = f1(locs);
                                            Summary5.PeakValue.Signal5_sDetr_nHist = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                            Summary5.Mean.Signal5_sPoly_nHist_np = mean(filtered_u);
                                            Summary5.Std.SampleRecord.Signal5_sPoly_nHist_np = std(filtered_u);
                                            Summary5.PeakFrequency.Signal5_sPoly_nHist = f1(locs);
                                            Summary5.PeakValue.Signal5_sPoly_nHist = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                            Summary5.Mean.Signal5_nHist_np = mean(filtered_u);
                                            Summary5.Std.SampleRecord.Signal5_nHist_np = std(filtered_u);
                                            Summary5.PeakFrequency.Signal5_nHist = f1(locs);
                                            Summary5.PeakValue.Signal5_nHist = max(peaks);
                                        end
                                end
                            case 'na'
                                switch iter
                                    case 1
                                        if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                            Summary1.Mean.Signal1_sDetr_np = mean(filtered_u);
                                            Summary1.Std.SampleRecord.Signal1_sDetr_np = std(filtered_u);
                                            Summary1.PeakFrequency.Signal1_sDetr = f1(locs);
                                            Summary1.PeakValue.Signal1_sDetr = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                            Summary1.Mean.Signal1_sPoly_np = mean(filtered_u);
                                            Summary1.Std.SampleRecord.Signal1_sPoly_np = std(filtered_u);
                                            Summary1.PeakFrequency.Signal1_sPoly = f1(locs);
                                            Summary1.PeakValue.Signal1_sPoly = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                            Summary1.Mean.Signal1_np = mean(filtered_u);
                                            Summary1.Std.SampleRecord.Signal1_np = std(filtered_u);
                                            Summary1.PeakFrequency.Signal1 = f1(locs);
                                            Summary1.PeakValue.Signal1 = max(peaks);
                                        end
                                    case 2
                                        if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                            Summary2.Mean.Signal2_sDetr_np = mean(filtered_u);
                                            Summary2.Std.SampleRecord.Signal2_sDetr_np = std(filtered_u);
                                            Summary2.PeakFrequency.Signal2_sDetr = f1(locs);
                                            Summary2.PeakValue.Signal2_sDetr = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                            Summary2.Mean.Signal2_sPoly_np = mean(filtered_u);
                                            Summary2.Std.SampleRecord.Signal2_sPoly_np = std(filtered_u);
                                            Summary2.PeakFrequency.Signal2_sPoly = f1(locs);
                                            Summary2.PeakValue.Signal2_sPoly = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                            Summary2.Mean.Signal2_np = mean(filtered_u);
                                            Summary2.Std.SampleRecord.Signal2_np = std(filtered_u);
                                            Summary2.PeakFrequency.Signal2 = f1(locs);
                                            Summary2.PeakValue.Signal2 = max(peaks);
                                        end
                                    case 3
                                        if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                            Summary3.Mean.Signal3_sDetr_np = mean(filtered_u);
                                            Summary3.Std.SampleRecord.Signal3_sDetr_np = std(filtered_u);
                                            Summary3.PeakFrequency.Signal3_sDetr = f1(locs);
                                            Summary3.PeakValue.Signal3_sDetr = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                            Summary3.Mean.Signal3_sPoly_np = mean(filtered_u);
                                            Summary3.Std.SampleRecord.Signal3_sPoly_np = std(filtered_u);
                                            Summary3.PeakFrequency.Signal3_sPoly = f1(locs);
                                            Summary3.PeakValue.Signal3_sPoly = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                            Summary3.Mean.Signal3_np = mean(filtered_u);
                                            Summary3.Std.SampleRecord.Signal3_np = std(filtered_u);
                                            Summary3.PeakFrequency.Signal3 = f1(locs);
                                            Summary3.PeakValue.Signal3 = max(peaks);
                                        end
                                    case 4
                                        if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                            Summary4.Mean.Signal4_sDetr_np = mean(filtered_u);
                                            Summary4.Std.SampleRecord.Signal4_sDetr_np = std(filtered_u);
                                            Summary4.PeakFrequency.Signal4_sDetr = f1(locs);
                                            Summary4.PeakValue.Signal4_sDetr = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                            Summary4.Mean.Signal4_sPoly_np = mean(filtered_u);
                                            Summary4.Std.SampleRecord.Signal4_sPoly_np = std(filtered_u);
                                            Summary4.PeakFrequency.Signal4_sPoly = f1(locs);
                                            Summary4.PeakValue.Signal4_sPoly = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                            Summary4.Mean.Signal4_np = mean(filtered_u);
                                            Summary4.Std.SampleRecord.Signal4_np = std(filtered_u);
                                            Summary4.PeakFrequency.Signal4 = f1(locs);
                                            Summary4.PeakValue.Signal4 = max(peaks);
                                        end
                                    case 5
                                        if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                            Summary5.Mean.Signal5_sDetr_np = mean(filtered_u);
                                            Summary5.Std.SampleRecord.Signal5_sDetr_np = std(filtered_u);
                                            Summary5.PeakFrequency.Signal5_sDetr = f1(locs);
                                            Summary5.PeakValue.Signal5_sDetr = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                            Summary5.Mean.Signal5_sPoly_np = mean(filtered_u);
                                            Summary5.Std.SampleRecord.Signal5_sPoly_np = std(filtered_u);
                                            Summary5.PeakFrequency.Signal5_sPoly = f1(locs);
                                            Summary5.PeakValue.Signal5_sPoly = max(peaks);
                                        elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                            Summary5.Mean.Signal5_np = mean(filtered_u);
                                            Summary5.Std.SampleRecord.Signal5_np = std(filtered_u);
                                            Summary5.PeakFrequency.Signal5 = f1(locs);
                                            Summary5.PeakValue.Signal5 = max(peaks);
                                        end
                                end
                        end
                end
            case 'no'
                filtered_u = final_u;
                if strcmpi(I.Workspace.Save,'Yes')
                    assignin('base',s4,'No');
                    assignin('base',s5,'NA');
                end
            otherwise
                errordlg('Input for removing periodic component missing','Computation failed');
                return;
        end
        
        
        %% Spectral analysis
        
        nb = I.Spectral.NumberOfBlocks;
        p = I.Spectral.Overlap;
        nfft = I.Spectral.DiscreteFFT;
        window = I.Spectral.Window;
        time_shift = I.Spectral.TimeShift;
        N_block = I.Spectral.AutocorrNumOfBlocks;
        N = length(filtered_u);
        
        t1 = t;
        mean_fi = mean(filtered_u);
        filtered_u1 = filtered_u - mean_fi;
        
        if strcmpi('default',nb)
            nb = 8;
        end
        if strcmpi('default',p)
            p = 0.5;
        end
        if strcmpi('default',nfft)
            nfft = round(max(256,0.1*length(filtered_u1)));
        end
        if strcmpi(N_block,'Default')
            x = reshape(filtered_u1,[N,1]);
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
            Rxx = Rxx(1:N);
            for i = 1:N-1
                Rxx(i)=Rxx(i)*N/(N-i);
            end
            Rxx(N)=0;
            auto_new = Rxx/var(filtered_u1);
            lag1 = (1:N);
            tau = lag1/fs;
            % Finding area
            [~,posi] = Trapzarea(auto_new,N,tau);
            L = round(2*posi);
            array = divisor(N);
            if length(array) == 2
                N_new = N -1;
                array = divisor(N_new);
            else
                N_new = N;
            end
            diff = abs(array - L);
            [~,posi] = min(diff);
            L_block = array(posi);
            N_block = N_new/L_block;
        else
            array = divisor(N);
            if length(array) == 2
                N_new = N -1;
                array = divisor(N_new);
            else
                N_new = N;
            end
            L = floor(N_new/N_block);
            diff = abs(array - L);
            [~,posi] = min(diff);
            L_block = array(posi);
            if L_block == 1
                errordlg('Number of blocks for autocorrelation cannot be more than half the length of the signal','Computation failed');
                return;
            end
            N_block = N_new/L_block;
        end
        
        if p>=1 || p <= 0
            errordlg('The overlap fraction for periodicity should be between 0 and 1','Computation failed');
            return;
        end
        
        % Formula for finding the input of pwelch
        temp = 2*(1-p)+(nb-1)*p+(1-2*p)*(nb-2);
        n = floor(N/temp);
        switch lower(window)
            case 'hamming'
                [pxx,f1] = pwelch(filtered_u1,hamming(n),floor(p*n),nfft,fs);
            case 'hann'
                [pxx,f1] = pwelch(filtered_u1,hanning(n),floor(p*n),nfft,fs);
            case 'rectwin'
                [pxx,f1] = pwelch(filtered_u1,rectwin(n),floor(p*n),nfft,fs);
            case 'chebwin'
                [pxx,f1] = pwelch(filtered_u1,chebwin(n),floor(p*n),nfft,fs);
            case 'gausswin'
                [pxx,f1] = pwelch(filtered_u1,gausswin(n),floor(p*n),nfft,fs);
            case 'triang'
                [pxx,f1] = pwelch(filtered_u1,triang(n),floor(p*n),nfft,fs);
            otherwise
                errordlg('Input proper window for finding the integral time scale','Computation failed');
                return;
        end
        [loca,peaks] = PeakSeek((pxx),[],mean((pxx)));
        posit = peaks == max(peaks); % Position of the highest peak
        locs = loca(posit);
        max(peaks);
        f1(locs);
        
        % Computing Autocorrelation
        clear x xtemp SxxAvg Xf Sxx Rxx;
        if length(filtered_u1) ~= L_block*N_block
            filtered_u1_new = filtered_u1(1:end-1);
        else
            filtered_u1_new = filtered_u1;
        end
        x = reshape(filtered_u1_new,[L_block,N_block]);
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
        
        % Now determine the autocorrelation by inverting autospectral density
        % and scaling the results
        Rxx = (1/ts)*ifft(SxxAvg);
        Rxx = Rxx(1:L_block);
        for i = 1:L_block-1
            Rxx(i)=Rxx(i)*L_block/(L_block-i);
        end
        Rxx(L_block)=0;
        acor_new = Rxx/var(filtered_u1);
        lag = (1:L_block);
        tau = lag/fs;
        clear id1 id2 id3;
        
        id1 = find(acor_new < 0,1,'first'); %first zero-crossing
        % If no first zero crossing take the entire vector and then
        % evaluate area under the curve to get integral time scale
        flag1 = 0;
        if isempty(id1)
            id3 = L_block;
            flag1 = 1;
        else
            id2 = find(acor_new(id1:end) > 0,1,'first');%second zero-crossing
            % If no second zero crossing take the entire vector and then
            % evaluate area under the curve to get integral time scale
            if isempty(id2)
                id3 = L_block;
                flag1 = 1;
            else
                id2 = id1 + id2 - 1;
                id3 = find(acor_new(id2:end) < 0,1,'first');%third zero-crossing
                % If no third zero crossing take the entire vector and then
                % evaluate area under the curve to get integral time scale
                if isempty(id3)
                    id3 = L_block;
                    flag1 = 1;
                else
                    id3 = id2 + id3 - 1;
                end
            end
        end
        
        if flag1 == 0
            if abs(acor_new(id3)) > abs(acor_new(id3-1))
                id3 = id3 -1;
            end
        else
            id3 = id3 - 1;
        end
        
        if ~strcmpi(time_shift,'default')
            if  isempty(time_shift)
                errordlg('Input time shift missing','Computation failed');
                return;
            end
            
            % If user enters some random time after the first computation
            % then index will take the nearest value from the time vector
            [~,index] = min(abs(lag-time_shift));
            id3 = index + 1;
            if id3>length(acor_new)
                id3 = length(acor_new);
            end
            if abs(acor_new(id3)) > abs(acor_new(id3-1))
                id3 = id3 -1;
            end
        end
        
        Int2 = trapz(tau(1:id3-1),abs(acor_new(1:id3-1))); % Computing area using trapezoidal rule
        Time = N/fs;
        dt = 1/fs;
        if dt < 2*Int2
            Neff = round(Time/(2*Int2));
        else
            Neff = N;
        end
        
        std_mean = std(filtered_u)/sqrt(Neff);
        if strcmpi(I.Workspace.Save,'Yes')
            assignin('base',s6,Int2);
            assignin('base',s7,mean(filtered_u));
            assignin('base',s8,std(filtered_u));
            assignin('base',s9,kurtosis(filtered_u));
            assignin('base',s10,skewness(filtered_u));
            assignin('base',s11,acor_new);
            assignin('base',s12,tau);
            assignin('base',s13,pxx);
            assignin('base',s14,f1);
        end
        switch iter
            case 1
                Summary1.IntegralTimeScale = Int2;
                Summary1.AutocorrelationCoefficient.Rho = acor_new;
                Summary1.AutocorrelationCoefficient.Tau = tau;
                Summary1.SpectralDensity.Sxx = pxx;
                Summary1.SpectralDensity.Freq = f1;
                switch lower(removePeriodicity)
                    case 'yes'
                        switch lower(method2)
                            case 'chauvenet'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary1.Std.Mean.Signal1_sDetr_nChau_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary1.Std.Mean.Signal1_sPoly_nChau_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary1.Std.Mean.Signal1_nChau_np = std_mean;
                                end
                            case 'histogram'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary1.Std.Mean.Signal1_sDetr_nHist_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary1.Std.Mean.Signal1_sPoly_nHist_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary1.Std.Mean.Signal1_nHist_np = std_mean;
                                end
                            case 'na'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary1.Std.Mean.Signal1_sDetr_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary1.Std.Mean.Signal1_sPoly_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary1.Std.Mean.Signal1_np = std_mean;
                                end
                        end
                    case 'no'
                        switch lower(method2)
                            case 'chauvenet'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary1.Std.Mean.Signal1_sDetr_nChau = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary1.Std.Mean.Signal1_sPoly_nChau = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary1.Std.Mean.Signal1_nChau = std_mean;
                                end
                            case 'histogram'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary1.Std.Mean.Signal1_sDetr_nHist = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary1.Std.Mean.Signal1_sPoly_nHist = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary1.Std.Mean.Signal1_nHist = std_mean;
                                end
                            case 'na'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary1.Std.Mean.Signal1_sDetr = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary1.Std.Mean.Signal1_sPoly = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary1.Std.Mean.Signal1 = std_mean;
                                end
                        end
                end
            case 2
                Summary2.IntegralTimeScale = Int2;
                Summary2.AutocorrelationCoefficient.Rho = acor_new;
                Summary2.AutocorrelationCoefficient.Tau = tau;
                Summary2.SpectralDensity.Sxx = pxx;
                Summary2.SpectralDensity.Freq = f1;
                switch lower(removePeriodicity)
                    case 'yes'
                        switch lower(method2)
                            case 'chauvenet'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary2.Std.Mean.Signal2_sDetr_nChau_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary2.Std.Mean.Signal2_sPoly_nChau_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary2.Std.Mean.Signal2_nChau_np = std_mean;
                                end
                            case 'histogram'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary2.Std.Mean.Signal2_sDetr_nHist_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary2.Std.Mean.Signal2_sPoly_nHist_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary2.Std.Mean.Signal2_nHist_np = std_mean;
                                end
                            case 'na'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary2.Std.Mean.Signal2_sDetr_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary2.Std.Mean.Signal2_sPoly_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary2.Std.Mean.Signal2_np = std_mean;
                                end
                        end
                    case 'no'
                        switch lower(method2)
                            case 'chauvenet'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary2.Std.Mean.Signal2_sDetr_nChau = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary2.Std.Mean.Signal2_sPoly_nChau = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary2.Std.Mean.Signal2_nChau = std_mean;
                                end
                            case 'histogram'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary2.Std.Mean.Signal2_sDetr_nHist = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary2.Std.Mean.Signal2_sPoly_nHist = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary2.Std.Mean.Signal2_nHist = std_mean;
                                end
                            case 'na'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary2.Std.Mean.Signal2_sDetr = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary2.Std.Mean.Signal2_sPoly = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary2.Std.Mean.Signal2 = std_mean;
                                end
                        end
                end
            case 3
                Summary3.IntegralTimeScale = Int2;
                Summary3.AutocorrelationCoefficient.Rho = acor_new;
                Summary3.AutocorrelationCoefficient.Tau = tau;
                Summary3.SpectralDensity.Sxx = pxx;
                Summary3.SpectralDensity.Freq = f1;
                switch lower(removePeriodicity)
                    case 'yes'
                        switch lower(method2)
                            case 'chauvenet'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary3.Std.Mean.Signal3_sDetr_nChau_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary3.Std.Mean.Signal3_sPoly_nChau_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary3.Std.Mean.Signal3_nChau_np = std_mean;
                                end
                            case 'histogram'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary3.Std.Mean.Signal3_sDetr_nHist_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary3.Std.Mean.Signal3_sPoly_nHist_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary3.Std.Mean.Signal3_nHist_np = std_mean;
                                end
                            case 'na'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary3.Std.Mean.Signal3_sDetr_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary3.Std.Mean.Signal3_sPoly_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary3.Std.Mean.Signal3_np = std_mean;
                                end
                        end
                    case 'no'
                        switch lower(method2)
                            case 'chauvenet'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary3.Std.Mean.Signal3_sDetr_nChau = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary3.Std.Mean.Signal3_sPoly_nChau = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary3.Std.Mean.Signal3_nChau = std_mean;
                                end
                            case 'histogram'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary3.Std.Mean.Signal3_sDetr_nHist = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary3.Std.Mean.Signal3_sPoly_nHist = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary3.Std.Mean.Signal3_nHist = std_mean;
                                end
                            case 'na'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary3.Std.Mean.Signal3_sDetr = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary3.Std.Mean.Signal3_sPoly = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary3.Std.Mean.Signal3 = std_mean;
                                end
                        end
                end
            case 4
                Summary4.IntegralTimeScale = Int2;
                Summary4.AutocorrelationCoefficient.Rho = acor_new;
                Summary4.AutocorrelationCoefficient.Tau = tau;
                Summary4.SpectralDensity.Sxx = pxx;
                Summary4.SpectralDensity.Freq = f1;
                switch lower(removePeriodicity)
                    case 'yes'
                        switch lower(method2)
                            case 'chauvenet'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary4.Std.Mean.Signal4_sDetr_nChau_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary4.Std.Mean.Signal4_sPoly_nChau_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary4.Std.Mean.Signal4_nChau_np = std_mean;
                                end
                            case 'histogram'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary4.Std.Mean.Signal4_sDetr_nHist_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary4.Std.Mean.Signal4_sPoly_nHist_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary4.Std.Mean.Signal4_nHist_np = std_mean;
                                end
                            case 'na'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary4.Std.Mean.Signal4_sDetr_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary4.Std.Mean.Signal4_sPoly_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary4.Std.Mean.Signal4_np = std_mean;
                                end
                        end
                    case 'no'
                        switch lower(method2)
                            case 'chauvenet'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary4.Std.Mean.Signal4_sDetr_nChau = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary4.Std.Mean.Signal4_sPoly_nChau = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary4.Std.Mean.Signal4_nChau = std_mean;
                                end
                            case 'histogram'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary4.Std.Mean.Signal4_sDetr_nHist = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary4.Std.Mean.Signal4_sPoly_nHist = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary4.Std.Mean.Signal4_nHist = std_mean;
                                end
                            case 'na'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary4.Std.Mean.Signal4_sDetr = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary4.Std.Mean.Signal4_sPoly = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary4.Std.Mean.Signal4 = std_mean;
                                end
                        end
                end
            case 5
                Summary5.IntegralTimeScale = Int2;
                Summary5.AutocorrelationCoefficient.Rho = acor_new;
                Summary5.AutocorrelationCoefficient.Tau = tau;
                Summary5.SpectralDensity.Sxx = pxx;
                Summary5.SpectralDensity.Freq = f1;
                switch lower(removePeriodicity)
                    case 'yes'
                        switch lower(method2)
                            case 'chauvenet'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary5.Std.Mean.Signal5_sDetr_nChau_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary5.Std.Mean.Signal5_sPoly_nChau_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary5.Std.Mean.Signal5_nChau_np = std_mean;
                                end
                            case 'histogram'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary5.Std.Mean.Signal5_sDetr_nHist_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary5.Std.Mean.Signal5_sPoly_nHist_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary5.Std.Mean.Signal5_nHist_np = std_mean;
                                end
                            case 'na'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary5.Std.Mean.Signal5_sDetr_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary5.Std.Mean.Signal5_sPoly_np = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary5.Std.Mean.Signal5_np = std_mean;
                                end
                        end
                    case 'no'
                        switch lower(method2)
                            case 'chauvenet'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary5.Std.Mean.Signal5_sDetr_nChau = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary5.Std.Mean.Signal5_sPoly_nChau = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary5.Std.Mean.Signal5_nChau = std_mean;
                                end
                            case 'histogram'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary5.Std.Mean.Signal5_sDetr_nHist = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary5.Std.Mean.Signal5_sPoly_nHist = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary5.Std.Mean.Signal5_nHist = std_mean;
                                end
                            case 'na'
                                if strcmpi(I.Stationarity.StationaryMethod,'inbuilt detrend')
                                    Summary5.Std.Mean.Signal5_sDetr = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'polynomial fit')
                                    Summary5.Std.Mean.Signal5_sPoly = std_mean;
                                elseif strcmpi(I.Stationarity.StationaryMethod,'na')
                                    Summary5.Std.Mean.Signal5 = std_mean;
                                end
                        end
                end
        end
    end
    
    %% Uncertainty analysis
    if flag == 1
        const = U.Uncertainty.Coefficient;
        switch iter
            case 1
                u1 = filtered_u;
                expo1 = U.Uncertainty.Exponent1;
                N1 = length(u1);
                res = const.*(u1.^expo1);
                if ~strcmpi(U.Uncertainty.Systematic1,'na')
                    sys1 = U.Uncertainty.Systematic1;
                    temp = (expo1^2)*(sys1^2);
                    out = sqrt(temp);
                end
                mini = N1;
            case 2
                u2 = filtered_u;
                expo2 = U.Uncertainty.Exponent2;
                N2 = length(u2);
                if fs1 ~= fs2
                    errordlg('Sampling frequency of signals are not same','Computation failed');
                    return;
                else
                    mini = min([N1,N2]);
                    u1 = u1(1:mini);
                    t1 = t1(1:mini);
                    u2 = u2(1:mini);
                    t2 = t2(1:mini);
                end
                if ~strcmpi(U.Uncertainty.Systematic2,'na')
                    sys2 = U.Uncertainty.Systematic2;
                    temp = (expo1^2)*(sys1^2)+(expo2^2)*(sys2^2);
                    out = sqrt(temp);
                end
                res = const.*(u1.^expo1).*(u2.^expo2);
            case 3
                u3 = filtered_u;
                expo3 = U.Uncertainty.Exponent3;
                N3 = length(u3);
                if fs1 ~= fs2 && fs2 ~= fs3
                    errordlg('Sampling frequency of signals are not same','Computation failed');
                    return;
                else
                    mini = min([N1,N2,N3]);
                    u1 = u1(1:mini);
                    t1 = t1(1:mini);
                    u2 = u2(1:mini);
                    t2 = t2(1:mini);
                    u3 = u3(1:mini);
                    t3 = t3(1:mini);
                end
                if ~strcmpi(U.Uncertainty.Systematic3,'na')
                    sys3 = U.Uncertainty.Systematic3;
                    temp = (expo1^2)*(sys1^2)+(expo2^2)*(sys2^2)+(expo3^2)*(sys3^2);
                    out = sqrt(temp);
                end
                res = const.*(u1.^expo1).*(u2.^expo2).*(u3.^expo3);
            case 4
                u4 = filtered_u;
                expo4 = U.Uncertainty.Exponent4;
                N4 = length(u4);
                if fs1 ~= fs2 && fs2 ~= fs3 && fs3 ~= fs4
                    errordlg('Sampling frequency of signals are not same','Computation failed');
                    return;
                else
                    mini = min([N1,N2,N3,N4]);
                    u1 = u1(1:mini);
                    t1 = t1(1:mini);
                    u2 = u2(1:mini);
                    t2 = t2(1:mini);
                    u3 = u3(1:mini);
                    t3 = t3(1:mini);
                    u4 = u4(1:mini);
                    t4 = t4(1:mini);
                end
                if ~strcmpi(U.Uncertainty.Systematic4,'na')
                    sys4 = U.Uncertainty.Systematic4;
                    temp = (expo1^2)*(sys1^2)+(expo2^2)*(sys2^2)+(expo3^2)*(sys3^2)+(expo4^2)*(sys4^2);
                    out = sqrt(temp);
                end
                res = const.*(u1.^expo1).*(u2.^expo2).*(u3.^expo3).*(u4.^expo4);
            case 5
                u5 = filtered_u;
                expo5 = U.Uncertainty.Exponent5;
                N5 = length(u5);
                if fs1 ~= fs2 && fs2 ~= fs3 && fs3 ~= fs4 && fs4 ~= fs5
                    errordlg('Sampling frequency of signals are not same','Computation failed');
                    return;
                else
                    mini = min([N1,N2,N3,N4,N5]);
                    u1 = u1(1:mini);
                    t1 = t1(1:mini);
                    u2 = u2(1:mini);
                    t2 = t2(1:mini);
                    u3 = u3(1:mini);
                    t3 = t3(1:mini);
                    u4 = u4(1:mini);
                    t4 = t4(1:mini);
                    u5 = u5(1:mini);
                    t5 = t5(1:mini);
                end
                if ~strcmpi(U.Uncertainty.Systematic5,'na')
                    sys5 = U.Uncertainty.Systematic5;
                    temp = (expo1^2)*(sys1^2)+(expo2^2)*(sys2^2)+(expo3^2)*(sys3^2)+(expo4^2)*(sys4^2)+(expo5^2)*(sys5^2);
                    out = sqrt(temp);
                end
                res = const.*(u1.^expo1).*(u2.^expo2).*(u3.^expo3).*(u4.^expo4).*(u5.^expo5);
        end
        str1 = strcat(U.OutputFileName,'_Final');
        assignin('base',str1,res);
    end
end
if flag == 1
    if strcmpi(U.Uncertainty.InputSystematic,'No')
        out = 0;
    end
    N_block = U.Uncertainty.AutocorrNumOfBlocks;
    time_shift = U.Uncertainty.TimeShift;
    clear N fs x xtemp SxxAvg Xf Sxx Rxx auto_new lag1 array diff;
    N = mini;
    fs = fs1;
    res1 = res - mean(res);
    if strcmpi(N_block,'Default')
        x = reshape(res1,[N,1]);
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
        % and scaling the
        Rxx = (1/ts)*ifft(SxxAvg);
        Rxx = Rxx(1:N);
        for i = 1:N-1
            Rxx(i)=Rxx(i)*N/(N-i);
        end
        Rxx(N)=0;
        auto_new = Rxx/var(res1);
        lag1 = (1:N);
        tau = lag1/fs;
        % Finding area
        [~,posit] = Trapzarea(auto_new,N,tau);
        L = round(2*posit);
        array = divisor(N);
        if length(array) == 2
            N_new = N -1;
            array = divisor(N_new);
        else
            N_new = N;
        end
        diff = abs(array - L);
        [~,posit] = min(diff);
        L_block = array(posit);
        N_block = N_new/L_block;
    else
        array = divisor(N);
        if length(array) == 2
            N_new = N -1;
            array = divisor(N_new);
        else
            N_new = N;
        end
        L = floor(N_new/N_block);
        diff = abs(array - L);
        [~,posit] = min(diff);
        L_block = array(posit);
        if L_block == 1
            errordlg('Number of blocks for autocorrelation cannot be more than half the length of the signal','Computation failed');
            return;
        end
        N_block = N_new/L_block;
    end
    
    % Computing Autocorrelation
    clear x xtemp SxxAvg Xf Sxx Rxx;
    if length(res1) ~= L_block*N_block
        res1_new = res1(1:end-1);
    else
        res1_new = res1;
    end
    x = reshape(res1_new,[L_block,N_block]);
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
    
    % Now determine the autocorrelation by inverting autospectral density
    % and scaling the results
    clear acor_new lag;
    Rxx = (1/ts)*ifft(SxxAvg);
    Rxx = Rxx(1:L_block);
    for i = 1:L_block-1
        Rxx(i)=Rxx(i)*L_block/(L_block-i);
    end
    Rxx(L_block)=0;
    acor_new = Rxx/var(res1);
    lag = (1:L_block);
    tau = lag/fs;
    clear id1 id2 id3;
    
    id1 = find(acor_new < 0,1,'first'); %first zero-crossing
    % If no first zero crossing take the entire vector and then
    % evaluate area under the curve to get integral time scale
    flag2 = 0;
    if isempty(id1)
        id3 = L_block;
        flag2 = 1;
    else
        id2 = find(acor_new(id1:end) > 0,1,'first');%second zero-crossing
        % If no second zero crossing take the entire vector and then
        % evaluate area under the curve to get integral time scale
        if isempty(id2)
            id3 = L_block;
            flag2 = 1;
        else
            id2 = id1 + id2 - 1;
            id3 = find(acor_new(id2:end) < 0,1,'first');%third zero-crossing
            % If no third zero crossing take the entire vector and then
            % evaluate area under the curve to get integral time scale
            if isempty(id3)
                id3 = L_block;
                flag2 = 1;
            else
                id3 = id2 + id3 - 1;
            end
        end
    end
    
    if flag2 == 0
        if abs(acor_new(id3)) > abs(acor_new(id3-1))
            id3 = id3 -1;
        end
    else
        id3 = id3 - 1;
    end
    
    if ~strcmpi(time_shift,'default')
        if  isempty(time_shift)
            errordlg('Input time shift missing','Computation failed');
            return;
        end
        % If user enters some random time after the first computation
        % then index will take the nearest value from the time vector
        [~,index] = min(abs(lag-time_shift));
        id3 = index + 1;
        if id3>length(acor_new)
            id3 = length(acor_new);
        end
        if abs(acor_new(id3)) > abs(acor_new(id3-1))
            id3 = id3 -1;
        end
    end
    Int2 = trapz(tau(1:id3-1),abs(acor_new(1:id3-1)));
    
    std_sample = std(res);
    T1 = length(u1)/fs1;
    dt = 1/fs;
    if dt < 2*Int2
        Neff = round(Time/(2*Int2));
    else
        Neff = N;
    end
    std_mean = std_sample/sqrt(Neff);
    total = sqrt(out^2 + (std_mean)^2);
    
    expan = 2*total;
    
    if strcmpi(U.SecondCentral.Normal,'yes')
        UncertaintySummary.SecondOrderUncert.NormDist = sqrt(4*Int2/T1); % Second order uncertainty or result considering normal distribution
    end
    if strcmpi(U.ThirdCentral.Normal,'yes')
        UncertaintySummary.ThirdOrderUncert.NormDist = 0; % Third order uncertainty or result considering normal distribution
    end
    if strcmpi(U.FourthCentral.Normal,'yes')
        UncertaintySummary.FourthOrderUncert.NormDist = sqrt(22*Int2/T1);% Fourth order uncertainty or result considering normal distribution
    end
    if strcmpi(U.SecondCentral.Formula,'yes')
        tempo = (mean(res1.^4)/(mean(res1.^2)^2))-1;
        UncertaintySummary.SecondOrderUncert.Formula = sqrt(2*Int2*tempo/T1);
    end
    if strcmpi(U.ThirdCentral.Formula,'yes')
        tempo = (mean(res1.^6)/(mean(res1.^3)^2))-1;
        UncertaintySummary.ThirdOrderUncert.Formula = sqrt(2*Int2*tempo/T1);
    end
    if strcmpi(U.FourthCentral.Formula,'yes')
        tempo = (mean(res1.^8)/(mean(res1.^4)^2))-1;
        UncertaintySummary.FourthOrderUncert.Formula = sqrt(2*Int2*tempo/T1);
    end
    UncertaintySummary.TotalMeanUncert = total;
    UncertaintySummary.ExpandedMeanUncert = expan;
    UncertaintySummary.TotalSystematicUncert = out;
    UncertaintySummary.IntegralTimeScale = Int2;
    UncertaintySummary.Std.SampleRecord = std_sample;
    UncertaintySummary.Std.Mean = std_mean;
    UncertaintySummary.Neff = Neff;
    UncertaintySummary.AutocorrelationCoefficient.Rho = acor_new;
    UncertaintySummary.AutocorrelationCoefficient.Tau = tau;
    str2 = strcat(U.OutputFileName,'_Auto_Rho');
    str3 = strcat(U.OutputFileName,'_Auto_Tau');
    if strcmpi(I.Workspace.Save,'Yes')
        assignin('base',str2,acor_new);
        assignin('base',str3,tau);
    end
    if strcmpi(U.Result.Save,'yes')
        save(strcat(U.OutputFileName,'.mat'),'UncertaintySummary');
    end
end
%% Saving result

for iter = 1:arg-1
    saveOption_new = saveOption{iter};
    name_new = name{iter};
    outputFileName = strcat(name_new,'.mat');
    switch iter
        case 1
            if strcmpi(saveOption_new,'yes')
                save(outputFileName,'Summary1');
            end
        case 2
            if strcmpi(saveOption_new,'yes')
                save(outputFileName,'Summary2');
            end
        case 3
            if strcmpi(saveOption_new,'yes')
                save(outputFileName,'Summary3');
            end
        case 4
            if strcmpi(saveOption_new,'yes')
                save(outputFileName,'Summary4');
            end
        case 5
            if strcmpi(saveOption_new,'yes')
                save(outputFileName,'Summary5');
            end
    end
end


set(0,'DefaultFigureVisible','on')
end

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
end

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
end

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
end

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


end

