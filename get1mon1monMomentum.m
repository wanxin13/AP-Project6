function [r_mom] = get1mon1monMomentum(industry,T)

% worst three
s = zeros(T,3);
I = zeros(T,3);
for t = 1:T
    [s(t,:),I(t,:)] = mink(industry(t,:),3);
end
 % best three
s_m = zeros(T,3);
I_m = zeros(T,3);
for t = 1:T
    [s_m(t,:),I_m(t,:)] = mink(-industry(t,:),3);
end
 %momentum portfolio from 192608
r_mom = zeros(T-1,1);
for t = 1:T-1
   r_mom(t,1) = (1/3)*(industry(t+1,I_m(t,1))+industry(t+1,I_m(t,2))+industry(t+1,I_m(t,3))-industry(t+1,I(t,1))-industry(t+1,I(t,2))-industry(t+1,I(t,3)));
end