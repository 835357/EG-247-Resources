%% EG-247 Signals and Systems: Lab 1: Part 1
% 
% This script file demonstrates the use of the |heaviside| and |dirac|
% functions. To run the code select the commands in the cells.
%
% This is also an example of the use of the publishing feature of MATLAB.
% 
%% The Unit Step Function
%
% In the notes we define the unit step function as
% 
% $${u_0}(t) = \left\{ {\begin{array}{*{20}{c}}
% {0\quad t < 0}\\
% {1\quad t > 0}
% \end{array}} \right.$$
%
% In MATLAB the unit step is defined using the |heaviside| function
%doc heaviside
%%
% We can thus define and plot the unit step $u_0(t)$ with the command
syms t;
heaviside(t);
ezplot(ans,[-1,1]),grid
%%
% If we are only interested in the value of the function at a particular
% instant of time we can pass a number as the argument:
[heaviside(-1),heaviside(0),heaviside(1)]
% Not that |heaviside(0)| returns the value $1/2$ which is not
% mathematically correct. The unit step function $u_o(t)$ is undefined at
% $t=0$.
%% 
% The basic signal operations work as you'd expect
A = 2; T = 2;
v1 = A*heaviside(t - T);
ezplot(v1,[-1, 4]),grid
%% Part 1
% To validate Figure 1.8 in the textbook Karris (page 1-4) use the |heaviside|
% and |ezplot| functions to plot each of the following:
%
% # $-Au_0(t)$ 
A = 2; T = 2;
v1 = A*heaviside(t);
ezplot(v1,[-4, 4]),grid
% # $-Au_0(t-T)$ 
A = 2; T = 2;
v1 = A*heaviside(t - T);
ezplot(v1,[-4, 4]),grid
% # $-Au_0(t+T)$ 
A = 2; T = 2;
v1 = A*heaviside(t + T);
ezplot(v1,[-4, 4]),grid
% # $Au_0(-t)$
A = 2; T = 2;
v1 = A*heaviside(-t);
ezplot(v1,[-4, 4]),grid
% # $Au_0(-t+T)$
A = 2; T = 2;
v1 = A*heaviside(-t + T);
ezplot(v1,[-4, 4]),grid
% # $Au_0(-t-T)$
A = 2; T = 2;
v1 = A*heaviside(-t - T);
ezplot(v1,[-4, 4]),grid
% # $-Au_0(-t)$ 
A = 2; T = 2;
v1 = -A*heaviside(-t);
ezplot(v1,[-4, 4]),grid
% # $-Au_0(-t+T)$ 
A = 2; T = 2;
v1 = -A*heaviside(-t + T);
ezplot(v1,[-4, 4]),grid
% # $-Au_0(-t-T)$
A = 2; T = 2;
v1 = -A*heaviside(-t - T);
ezplot(v1,[-4, 4]),grid
%% Part 2
% Use the |heaviside| and |ezplot| functionshow that $u_0(t) - u_0(t - 1)$ 
% represents the rectangular pulse shown in
% Figure 1.9 of the textbook.
A = 2; T = 2;
v1 = A*heaviside(t);
v2 = A*heaviside(t - 1);
ezplot(v1-v2,[-4, 4]),grid
%% Part 3
% Use the |heaviside| and |ezplot| functions to validate equations
% 1.13 v(t) = A[u_o(t) - 2*u_0(t-T) + 2 *u_0(t-2T)+...]
A = 2; T = 2;
v1 = A*(heaviside(t) - 2*heaviside(t-T) + 2*heaviside(t-2*T));
ezplot(v1,[0, 4]),grid
% 1.14 i(t) =A*u_0(t + T/2) - A*u_0(t - T/2),
A = 2; T = 2;
v1 = A*heaviside(t + T/2) - A*heaviside(t - T/2);
ezplot(v1,[-4, 4]),grid
% 1.17 =(2/T *t +1)*[u_0(t + T/2)-u_0(t)] + (-2/T *t +1)*[u_0(t) - u_0(t_T/2)]
A = 2; T = 2;
v1 = ((2/T)*t +1)*(heaviside(t + T/2)-heaviside(t)) + ((-2/T)*t +1)*(heaviside(t) - heaviside(t - T/2));
ezplot(v1,[-4, 4]),grid
% 1.18. v(t) = (2*t +1)u_0(t)-2*(t-1)u_0(t-1) -tu_0(t-2) + (t-3)u_0(t-3)
A = 2; T = 2;
v1 = (2*t +1)*heaviside(t)-2*(t-1)*heaviside(t-1) -t*heaviside(t-2) + (t-3)*heaviside(t-3);
ezplot(v1,[-4, 4]),grid
%% The Ramp Function
% The integral of the *unit step* function is the *ramp function*
% 
% $$u_1(t) = \int_{-\infty}^{t} u_0(\tau)d\tau$$
%
% Gives
%
% $${u_1}(t) = \left\{ {\begin{array}{*{20}{c}}
% {0\quad t < 0}\\
% {t\quad t > 0}
% \end{array}} \right. = t{u_0}(t)$$
% 
% To verify this result:
syms tau
int(heaviside(tau),-inf, t)
%%
% Plot the ramp function
ezplot(t*heaviside(t),[-1,5]),grid
%
%% Part 4
% Use |ezplot| to plot $u_2(t)$ and $u_3(t)$ as defined on Page 1-10 of the
% textbook.
% Don't Forget to Save Your Work!
syms tau
int(tau*heaviside(tau),-inf, t)
%ans = piecewise([t < 0, 0], [0 <= t, (t^2*heaviside(t))/2])
ezplot((t^2*heaviside(t))/2,[-1,5]),grid

syms tau
int((tau^2*heaviside(tau))/2,-inf, t)
%ans = piecewise([t < 0, 0], [0 <= t, (t^3*heaviside(t))/6])
ezplot((t^3*heaviside(t))/6,[-1,5]),grid

%% The Dirac Delta Function
% $\delta(t)$ is the derivative of $u_0(t)$
diff(heaviside(t),t)
%% 
% It's not easy to plot the dirac delta function. We have to cheat a little
td = [-1,0,1]; delta = [0,1,0];
stem(td,delta);

    
%% Part 5
% Use Matlab to solve Examples 1.8 and 1.9 from the textbook.
% example 1.8a 3*t^4*dirac(t-1)
td = [-1,0,1]; delta = [0,0,3*(1)^4];
stem(td,delta);
% example 1.8b int t*dirac(t-2)
syms tau
int((tau*dirac(tau-2)),-inf, t)
%ans = 2*heaviside(t - 2)
ezplot(2*heaviside(t - 2),[-1,5]),grid

% example 1.8c t^2*delta'(t-3)
diff(dirac(t),t)
%ans = dirac(t, 1)
%%
%example 1.9
v2 = 2*t*heaviside(t+1) - 2*t*heaviside(t-1) + 2*heaviside(t-1) + (-t + 3)*heaviside(t-2) + (t-4)*heaviside(t-4) + (-t +5)*heaviside(t-5) + (t-5)*heaviside(t-7);
ezplot(v2,[-1,7]),grid