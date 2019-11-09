function [dates,rmrf,rsmb,rhml,rf,rumd] = loadStockData4(path)

rmrf = xlsread(path,2,'B4:B1077');
rsmb = xlsread(path,2,'C4:C1077');
rhml = xlsread(path,2,'D4:D1077');
rf = xlsread(path,2,'E4:E1077');
rumd = xlsread(path,2,'F4:F1077');

date = xlsread(path,2,'A4:A1077');
date = num2str(date);
dates = datenum(date,'yyyymm');