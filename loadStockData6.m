function [dates,portfolio] = loadStockData6(path)

portfolio = xlsread(path,4,'AC11:BA1095');

date = xlsread(path,2,'A4:A1077');
date = num2str(date);
dates = datenum(date,'yyyymm');