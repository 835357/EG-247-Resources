%% Lab Exercise 13
% State space model parameters
%
% Prepared for EG-247 by C.P. Jobling
%
%% RLC Model Parameters
% Note: I use Cap to avoid conflict with Output matrix C defined later
Cap = 1;   % F 
R = 1;   % Ohm
L = 1; % H

%% State equations
A = [-R/L, -1/L; 1/Cap, 0]
B = [1/L; 0]
C = [1, 0]
D = 0

%% Y = (C(sI - A)^-1B + D)U(s) 
syms s t;
Y = ((C*([s, 0; 0, s] - A)^-1)*B + D)%*heaviside(s)

%Y = heaviside(s)/(s^2 + s + 1)
Y = 1/(s^2 + s + 1)
y = ilaplace(Y)
% y = (2*3^(1/2)*exp(-t/2)*sin((3^(1/2)*t)/2))/3

y = ((2*3^(1/2)*exp(-t/2)*sin((3^(1/2)*t)/2))/3)*heaviside(t)


%% Plot
figure(1)
subplot(2,1,1);
ezplot(y,[0,5]),grid
title('Step response Vc v Time for RLC circuit')
ylabel('Vc (V)')
xlabel('Time t (s)')


%% Transition matrix

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
y1 = C*x + D*heaviside(t)

%% Plot
subplot(2,1,2);
ezplot(y1,[0,5]),grid
title('Step response Vc v Time for RLC circuit')
ylabel('Vc (V)')
xlabel('Time t (s)')
