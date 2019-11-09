% main.m
% This script when run should compute all values and make all plots
% required by the project.
% To do so, you must fill the functions in the functions/ folder,
% and create scripts in the scripts/ folder to make the required
% plots.

% Add folders to path
addpath('./functions/','./scripts/');

% Add plot defaults
plotDefaults;

%% Exercise a
T = 1085;
N = 30;
[dates,industry] = loadStockData1('C:\Users\wc145\Desktop\ECON676\PS6\Problem_Set6.xls');
% momentum 1-month, 1-month
[r_mom] = get1mon1monMomentum(industry,T);
ave_mom = mean(r_mom);
t_mom = ave_mom*sqrt(T-1)/std(r_mom);
annual_SR = sqrt(12)*(ave_mom)/std(r_mom);
std_mom = std(r_mom);

%% Exercise b
T = 1085;
N = 30;
[dates,industry] = loadStockData1('C:\Users\wc145\Desktop\ECON676\PS6\Problem_Set6.xls');
[dates,rmrf,rsmb,rhml,rf,rumd] = loadStockData2('C:\Users\wc145\Desktop\ECON676\PS6\Problem_Set6.xls');
 % data missing in umd(momentum factor)
for i = 1:T
    if rumd(i,1) == -999
        rumd(i,1) = NaN;
    end
end
[sigma_mu,sigma_2,sigma_3] = getMomComponents(industry,T,N,rmrf,rf);

%% Exercise c
T = 1085;
N = 30;
[dates,industry] = loadStockData1('C:\Users\wc145\Desktop\ECON676\PS6\Problem_Set6.xls');
% momentum 12-month, 1-month
[r_mom] = get12mon1monMomentum(industry,T);
ave_mom = mean(r_mom);
t_mom = ave_mom*sqrt(T-12)/std(r_mom);
annual_SR = sqrt(12)*(ave_mom)/std(r_mom);
std_mom = std(r_mom);

%% Exercise d
T = 1085;
N = 30;
[dates,industry] = loadStockData1('C:\Users\wc145\Desktop\ECON676\PS6\Problem_Set6.xls');
% momentum 11-month, 1-month, skip the recent information
[r_mom] = get1211mon1monMomentum(industry,T);
ave_mom = mean(r_mom);
t_mom = ave_mom*sqrt(T-12)/std(r_mom);
annual_SR = sqrt(12)*(ave_mom)/std(r_mom);
std_mom = std(r_mom);

%% Exercise e
T = 1085;
N = 30;
[dates,industry] = loadStockData1('C:\Users\wc145\Desktop\ECON676\PS6\Problem_Set6.xls');
[dates,rmrf,rsmb,rhml,rf,rumd] = loadStockData2('C:\Users\wc145\Desktop\ECON676\PS6\Problem_Set6.xls');
 % data missing in umd(momentum factor)
for i = 1:T
    if rumd(i,1) == -999
        rumd(i,1) = NaN;
    end
end
% momentum 1-month, 1-month, RMRF, SMB, HML
[r_mom_1_1] = get1mon1monMomentum(industry,T);
beta_1_1 = zeros(4,1);
results1_1 = fitlm([rmrf(2:end,1),rsmb(2:end,1),rhml(2:end,1)],r_mom_1_1);
% momentum 12-month, 1-month
[r_mom_12_1] = get12mon1monMomentum(industry,T);
beta_12_1 = zeros(4,1);
results12_1= fitlm([rmrf(13:end,1),rsmb(13:end,1),rhml(13:end,1)],r_mom_12_1);
% momentum 11-month, 1-month, skip the recent information
[r_mom_11_1] = get1211mon1monMomentum(industry,T);
beta_11_1 = zeros(4,1);
results11_1= fitlm([rmrf(13:end,1),rsmb(13:end,1),rhml(13:end,1)],r_mom_11_1);

%% Exercise f
T = 1085;
N = 30;
[dates,industry] = loadStockData1('C:\Users\wc145\Desktop\ECON676\PS6\Problem_Set6.xls');
[dates,rmrf,rsmb,rhml,rf,rumd] = loadStockData2('C:\Users\wc145\Desktop\ECON676\PS6\Problem_Set6.xls');
 % data missing in umd(momentum factor)
for i = 1:T
    if rumd(i,1) == -999
        rumd(i,1) = NaN;
    end
end
% momentum 1-month, 1-month, RMRF, SMB, HML, UMD
[r_mom_1_1] = get1mon1monMomentum(industry,T);
beta_1_1 = zeros(5,1);
results_1_1= fitlm([rmrf(2:end,1),rsmb(2:end,1),rhml(2:end,1),rumd(2:end,1)],r_mom_1_1);
% momentum 12-month, 1-month
[r_mom_12_1] = get12mon1monMomentum(industry,T);
beta_12_1 = zeros(5,1);
results_12_1 = fitlm([rmrf(13:end,1),rsmb(13:end,1),rhml(13:end,1),rumd(13:end,1)],r_mom_12_1);
% momentum 11-month, 1-month, skip the recent information
[r_mom_11_1] = get1211mon1monMomentum(industry,T);
beta_11_1 = zeros(5,1);
results_11_1 = fitlm([rmrf(13:end,1),rsmb(13:end,1),rhml(13:end,1),rumd(13:end,1)],r_mom_11_1);

%% Exercise g
% data from 1970 to 2015
T1 = 1085;
T = 552;
N = 32;
[dates,industry] = loadStockData1('C:\Users\wc145\Desktop\ECON676\PS6\Problem_Set6.xls');
[commodity] = loadStockData3('C:\Users\wc145\Desktop\ECON676\PS6\Problem_Set6.xls');
[dates,rmrf,rsmb,rhml,rf,rumd] = loadStockData4('C:\Users\wc145\Desktop\ECON676\PS6\Problem_Set6.xls');
 % data missing in umd(momentum factor)
for i = 1:T
    if rumd(i,1) == -999
        rumd(i,1) = NaN;
    end
end
% momentum 1-month, 1-month, RMRF, SMB, HML
[r_mom_1_1] = get1mon1monMomentum(industry,T1);
[r_mom_1_1_c] = get1mon1monMomentum(commodity,T);
cov_1_1 = corr(r_mom_1_1(523:1073,1),r_mom_1_1_c);
beta_1_1 = zeros(4,1);
[beta_1_1(:,1)] = regress(r_mom_1_1_c,[ones(T-1,1),rmrf(2+522:end,1),rsmb(2+522:end,1),rhml(2+522:end,1)]);
beta_1_1_2 = zeros(5,1);
[beta_1_1_2(:,1)] = regress(r_mom_1_1_c,[ones(T-1,1),rmrf(2+522:end,1),rsmb(2+522:end,1),rhml(2+522:end,1),rumd(2+522:end,1)]);
% momentum 12-month, 1-month
[r_mom_12_1] = get12mon1monMomentum(industry,T1);
[r_mom_12_1_c] = get12mon1monMomentum(commodity,T);
cov_12_1 = corr(r_mom_12_1(535-12:1074-12,1),r_mom_12_1_c);
beta_12_1 = zeros(4,1);
[beta_12_1(:,1)] = regress(r_mom_12_1_c,[ones(T-12,1),rmrf(13+522:end,1),rsmb(13+522:end,1),rhml(13+522:end,1)]);
beta_12_1_2 = zeros(5,1);
[beta_12_1_2(:,1)] = regress(r_mom_12_1_c,[ones(T-12,1),rmrf(13+522:end,1),rsmb(13+522:end,1),rhml(13+522:end,1),rumd(13+522:end,1)]);
% momentum 11-month, 1-month, skip the recent information
[r_mom_11_1] = get1211mon1monMomentum(industry,T1);
[r_mom_11_1_c] = get1211mon1monMomentum(commodity,T);
cov_11_1 = corr(r_mom_11_1(535-12:1074-12,1),r_mom_11_1_c);
beta_11_1 = zeros(4,1);
[beta_11_1(:,1)] = regress(r_mom_11_1_c,[ones(T-12,1),rmrf(13+522:end,1),rsmb(13+522:end,1),rhml(13+522:end,1)]);
beta_11_1_2 = zeros(5,1);
[beta_11_1_2(:,1)] = regress(r_mom_11_1_c,[ones(T-12,1),rmrf(13+522:end,1),rsmb(13+522:end,1),rhml(13+522:end,1),rumd(13+522:end,1)]);
% factor 12,1 COM explain 12,1 IND
beta_12_1_new = zeros(5,1);
[beta_12_1_new(:,1)] = regress(r_mom_12_1(535-12:1074-12,1),[ones(T-12,1),rmrf(13+522:end,1),rsmb(13+522:end,1),rhml(13+522:end,1),r_mom_12_1_c]);
% 12,1 IND explain 12,1 COM
beta_12_1_new_1 = zeros(5,1);
[beta_12_1_new_1(:,1)] = regress(r_mom_12_1_c,[ones(T-12,1),rmrf(13+522:end,1),rsmb(13+522:end,1),rhml(13+522:end,1),r_mom_12_1(535-12:1074-12,1)]);

%% Exercise h
T = 1085;
N = 25;
L = 4;
[dates,portfolio1] = loadStockData5('C:\Users\wc145\Desktop\ECON676\PS6\Problem_Set6.xls');
[dates,portfolio2] = loadStockData6('C:\Users\wc145\Desktop\ECON676\PS6\Problem_Set6.xls');
[dates,portfolio3] = loadStockData7('C:\Users\wc145\Desktop\ECON676\PS6\Problem_Set6.xls');
[dates,rmrf,rsmb,rhml,rf,rumd] = loadStockData2('C:\Users\wc145\Desktop\ECON676\PS6\Problem_Set6.xls');

a = find(portfolio1 <= -99.9 );
portfolio1(a) = NaN;
a = find(portfolio2 <= -99.9 );
portfolio2(a) = NaN;
a = find(portfolio3 <= -99.9 );
portfolio3(a) = NaN;

% data missing in umd(momentum factor)
for i = 1:T
    if rumd(i,1) == -999
        rumd(i,1) = NaN;
    end
end
[W_normal_1,p_1] = getGRS(portfolio1,N,rmrf, rsmb, rhml, rumd, rf, T, L);
[W_normal_2,p_2] = getGRS(portfolio2,N,rmrf, rsmb, rhml, rumd, rf, T, L);
[W_normal_3,p_3] = getGRS(portfolio3,N,rmrf, rsmb, rhml, rumd, rf, T, L);