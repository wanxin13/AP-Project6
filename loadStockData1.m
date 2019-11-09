function [dates,industry] = loadStockData1(path)

industry = xlsread(path,1,'B5:AE1089');

date = xlsread(path,1,'A5:A1089');
date = num2str(date);
dates = datenum(date,'yyyymm');
