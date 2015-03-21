%% Lab Exercise 15 - Convolution
% Plot convolution of a pieewise linear function.
%
% Prepared for EG-247 by Chris P. Jobling
syms h u tau t;
h(t) = exp(-t);    %*(heaviside(t)-heaviside(t-1));
u(t) = 1;           %*heaviside(t)- heaviside(t-1);
%% First segment
% Integration from 0 to t:
conv1(t) = int(h(t-tau)*u(tau),tau,0,t)
%% Second segment
% Integration from t - 1 to 1:
conv2(t) = int(h(t-tau)*u(tau),tau,t-1,1)
%% Plot
y(t) = conv1(t)*((heaviside(t)-heaviside(t-1))) + conv2(t)*(heaviside(t-1)- heaviside(t-2)) 
ezplot(y(t), [0,2])
grid
