function [dates,portfolio] = loadStockData7(path)

portfolio = xlsread(path,4,'BD11:CB1095');

date = xlsread(path,2,'A4:A1077');
date = num2str(date);
dates = datenum(date,'yyyymm');