%% Lab Exercise 15 - Convolution
% Plot convolution of a pieewise linear function.
%
% Prepared for EG-247 by Chris P. Jobling
syms h u tau t;
h(t) = 2;    %*(heaviside(t)-heaviside(t-1));
u(t) = 1;           %*heaviside(t)- heaviside(t-2);
%% First segment
% Integration from 0 to t:
conv1(t) = int(2,tau,0,t)
%% Second segment
% Integration from 1 to 2:
conv2(t) = int(2,tau,1,2)

%% Third segment
% Integration from t - 2 to 2:
conv3(t) = int(2,tau,t-1,2)

%% Plot
y(t) = conv1(t)*((heaviside(t)-heaviside(t-1))) + conv2(t)*(heaviside(t-1)- heaviside(t-2)) + conv3(t)*(heaviside(t-2)- heaviside(t-3))
ezplot(y(t), [0,4])
grid
