function [W_normal,p] = getGRS(portfolio,n,rmrf, rsmb, rhml, rumd,r_f,T,L) 

for j = 1:n
    R_p(:,j) = portfolio(:,j)-r_f;
end
% time series regression
beta = zeros(5,n);
residual = zeros(T,n);
for j = 1:n
    [beta(:,j),~,residual(:,j)] = regress(R_p(:,j),[ones(T,1) rmrf, rsmb, rhml, rumd]);
end
Cov = zeros(n,n);
Cov_inv = zeros(n,n);
Cov = cov(residual,'partialrows');
Cov_inv = inv(Cov);
alpha = zeros(n,1);
for i = 1:n
    alpha(i,1) = beta(1,i);
end
Omega = zeros(4,4);
Omega_inv = zeros(4,4);
Omega = cov([rmrf,rsmb,rhml,rumd],'partialrows');
Omega_inv = inv(Omega);
mu = [nanmean(rmrf), nanmean(rsmb), nanmean(rhml), nanmean(rumd)];
W = alpha'*Cov_inv*alpha/(1+mu*Omega_inv*mu');
W_normal = T*(T-n-L)*W/(n*(T-L-1));
p = fcdf(W_normal,n,T-n-L,'upper');