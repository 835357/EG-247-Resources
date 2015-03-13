% ex4.7
% Q.1

% eq = (V/R1)*s*w*L/(R2 + s*L)
syms s 
%iL = ((32/10)*1e-3) / (20 + s*1e-3) 



 
%%
% find roots
r = roots([1e-3, 20])
%r =  -20000

V1 = (3.2)/(s  + 20000);

%%
% try Inverse laplace - doesn't work!
syms t;
v = ilaplace(V1)*heaviside(t) 
% v = exp(t*(- 0.71 + 0.31*i))*(0.31 + 0.92*i) + exp(t*(- 0.71 - 0.31*i))*(0.31 - 0.92*i) + 1.36*exp(-6.57*t)
%%
% Plot result
ezplot(v)
%%
% If you can find a solution I'll buy you a coffee!