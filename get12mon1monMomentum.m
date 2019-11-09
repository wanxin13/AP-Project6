function [r_mom] = get12mon1monMomentum(industry,T)

% worst three
s = zeros(T,3);
I = zeros(T,3);
for t = 13:T
    [s(t,:),I(t,:)] = mink(sum(industry(t-12:t-1,:)),3);
end
 % best three
s_m = zeros(T,3);
I_m = zeros(T,3);
for t = 13:T
    [s_m(t,:),I_m(t,:)] = mink(-sum(industry(t-12:t-1,:)),3);
end
 %momentum portfolio from 192608
r_mom = zeros(T-12,1);
for t = 1:T-12
   r_mom(t,1) = (1/3)*(industry(t+12,I_m(t+12,1))+industry(t+12,I_m(t+12,2))+industry(t+12,I_m(t+12,3))-industry(t+12,I(t+12,1))-industry(t+12,I(t+12,2))-industry(t+12,I(t+12,3)));
end