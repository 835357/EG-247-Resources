%% Lab Exercise 15 - Convolution
% Plot convolution of a piecewise linear function.
%
% Prepared for EG-247 by Chris P. Jobling
%
%u(t) = heaviside(t)
%
%ic(t) - ir(t) = 0
%C*Vc'(t) - (Vin(t) - Vc(t))/R =0
%
%s*Vc(s) = Vin(s)/RC - Vc(s)/RC
%Vc(s) = 1/(s + 1/RC)*Vin(s)/RC
%
%Vc(t) = Vin(t)/RC * exp(-t/RC) = h(t)
%
%R(s) = H(s)U(s)
%R(t) = h(t)*u(t)
%R(t) = int{u(tau - t)h(tau),tau,0,t}

syms h tau t s
h(t) = (1*exp(-t))*heaviside(t);
u(t) = heaviside(t);
%% First segment
% Integration from 0 to t:
%conv1 = int(1*exp(-tau),tau,0,t)
H = laplace(h(t))
U = laplace(u(t))
V =H*U
v = ilaplace(V)
%% Plot

ezplot(v,[0,5])
grid
