
syms s Vout;
eq1 = (Vout - 1 -3/s)/(1/s + 2 + s/2) + (Vout)/(1) + (Vout)/(s/2) == 0
solve(eq1,Vout)
%ans = (2*s^2 + 6*s)/(s^3 + 8*s^2 + 10*s + 4)
% if the numerator is split in two term the result will be equal to the eq.
% 4.6
%pretty(ans)

%%
% find roots
r = roots([1, 8, 10, 4])
% (s  + 6.5708)*(s + 0.7146 - 0.3132i)*(s + 0.7146 + 0.3132i) 
expand((s + 0.7146 - 0.3132i)*(s + 0.7146 + 0.3132i))
% ans = s^2 + (3573*s)/2500 + 3043737/5000000
% (s  + 6.5708)*(s^2 + 1.43*s +0.61)
V1 = (2*s^2 + 6*s)/((s  + 6.5708)*(s^2 + 1.43*s +0.61));

%%
% form quadatic
q = (s-r(2))*(s-r(3))
%(s + 0.7146 - 0.3132i)*(s + 0.7146 + 0.3132i) 
%%
% Simplify expression for q and convert coefficients to 2 places of decimals
q = vpa(simplify(q),3)
%%
% form V(s)
%
V = vpa((2*s*(s + 3))/((s - r(1))*q),3)
% V and V1 are equal
%%
% Get partial fraction expansion

V = feval(symengine,'partfrac',V)
%V = (0.31 + 0.92*i)/(s + 0.71 - 0.31*i) + 1.36/(s + 6.57) + (0.31 - 0.92*i)/(s + 0.71 + 0.31*i)
%%
% try Inverse laplace - doesn't work!
syms t;
v = ilaplace(V)*heaviside(t) 
% v = exp(t*(- 0.71 + 0.31*i))*(0.31 + 0.92*i) + exp(t*(- 0.71 - 0.31*i))*(0.31 - 0.92*i) + 1.36*exp(-6.57*t)
%%
% Plot result
ezplot(v)
%%
% If you can find a solution I'll buy you a coffee!