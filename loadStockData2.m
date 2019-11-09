function [dates,rmrf,rsmb,rhml,rf,rumd] = loadStockData2(path)

rmrf = xlsread(path,2,'B4:B1088');
rsmb = xlsread(path,2,'C4:C1088');
rhml = xlsread(path,2,'D4:D1088');
rf = xlsread(path,2,'E4:E1088');
rumd = xlsread(path,2,'F4:F1088');

date = xlsread(path,2,'A4:A1088');
date = num2str(date);
dates = datenum(date,'yyyymm');