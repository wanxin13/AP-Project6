function [commodity] = loadStockData3(path)

commodity = xlsread(path,3,'B2:AG553');
