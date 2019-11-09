function [sigma_mu,sigma_2,sigma_3] = getMomComponents(industry,T,N,rmrf,rf)
% cross-sectional variance of the 30 industry sample means
mu = mean(industry);
sigma_mu = var(mu);
 % beta using market model
beta = zeros(2,N);
residual = zeros(T,N);
for i = 1:N   
    [beta(:,i),~,residual(:,i)] = regress(industry(:,i)-rf,[ones(T,1),rmrf]);
end
sigma_beta = var(beta(2,:));
cov_market = cov(rmrf(1:end-1,1),rmrf(2:end,1));
sigma_2 = sigma_beta*cov_market(1,2);
 % autocov for each industry residual
s = 0;
cov_res = zeros(2,2,N);
for i = 1:N
    cov_res(:,:,i) = cov(residual(1:end-1,i),residual(2:end,i));
    s = s + cov_res(1,2,i);
end
sigma_3 = s/N;
