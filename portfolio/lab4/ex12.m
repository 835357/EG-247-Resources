%% Lab Exercise 12
% State space model parameters
%
% Prepared for EG-247 by C.P. Jobling
%
%% RLC Model Parameters
% Note: I use Cap to avoid conflict with Output matrix C defined later
Cap = 1/2;   % F 
R = 3;   % Ohm
L = 1; % H

%% State equations
% With the equations that defines the behaviour of each components of the circuit 
% VR(t) = R*i(t)
% VL(t) = L*i'(t)
% VC'(t) = i(t)/C
% Put all togheter is possible to find state equation of the system 
% Li(t) = -R*i(t) - Vc(t) + Vs(t)
% and then put it in the matrix form 
%[i'(t);VC'(t)]=A*[i(t);VC(t)]+B[Vs(t)]

A = [-R/L, -1/L; 1/Cap, 0]
B = [1/L; 0]
% After find the state-equation for the system is possible to retrive any
% relevant information about the system behaviour by a second matrix
%[Y]=C*[i(t);VC(t)]+D[X]
C = [1, 0]
D = 0

%% Transition matrix
syms t
phi_t = expm(A*t)

%% Initial conditions
x0 = [0; 1/2];

%% Unforced response
xu = phi_t * x0

%% Forced response
syms t tau
xf = phi_t * int(expm(-A*tau)*B*heaviside(tau),tau,0,t)
xf = simplify(xf)

%% State response
x = xu + xf

%% Output response
y = C*x + D*heaviside(t)

%% Plot
ezplot(y,[0,5]),grid
title('Step response Vc v Time for RLC circuit')
ylabel('Vc (V)')
xlabel('Time t (s)')

laplace(expm(A*t))
%ans = [ 2/(s + 2) - 1/(s + 1), 1/(s + 2) - 1/(s + 1)]
%      [ 2/(s + 1) - 2/(s + 2), 2/(s + 1) - 1/(s + 2)]
syms s;
ilaplace(([[s 0];[0 s]] - A )^-1)
%ans = [   2*exp(-2*t) - exp(-t),   exp(-2*t) - exp(-t)]
%      [ 2*exp(-t) - 2*exp(-2*t), 2*exp(-t) - exp(-2*t)]

% contrary
