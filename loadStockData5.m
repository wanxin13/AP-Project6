function [dates,portfolio] = loadStockData5(path)

portfolio = xlsread(path,4,'B11:Z1095');

date = xlsread(path,2,'A4:A1077');
date = num2str(date);
dates = datenum(date,'yyyymm');