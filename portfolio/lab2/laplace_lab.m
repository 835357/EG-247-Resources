%% Using MATLAB to Solve Laplace Transforms
%
% Inspired by Steven Karris, Signals and Systems: With MATLAB Computing and Simulink 
% Modelling, 5th Edition, Orchard Publications, 2012. 
% Ebook: <http://site.ebrary.com/lib/swansea/docDetail.action?docID=10547416 Karris, Signals and Systems>
%
%% The Laplace Transform
% MATLAB provides functions for computing Laplace Transforms in the
% Symbolic Toolbox. 
% 
% View (and read!) the documentation for |laplace|
doc laplace
%% Tranform Tables
% Let's start our exploration by verifying some simple transforms from the
% tables
syms s t f(t) a b n;
%% 
% Dirac Delta
% $$\delta(t)$$
delta(t) = dirac(t);
laplace(delta(t))
%%
% Unit Step
% $$u_0(t)$$
u0(t) = heaviside(t);
laplace(u0(t))
%% Unit Ramp 
% $$u_1(t)$$
u1(t) = t*u0(t);
laplace(u1(t))
%% Parabolic function
% $$u_2(t)$$
u2(t) = t^2*u0(t);
laplace(u2(t))
%% General power of t 
% $$u_n(t)$$
un(t) = (t^n)*u0(t);
laplace(un(t))
%% What is gamma?
% See the development in Section 2.3.3 of the textbook
% $$\Gamma (n + 1) = n!$$
%
factorial(5) == gamma(5 + 1) % In MATLAB 1 == TRUE
%%
laplace((t^5)*u0(t))
%% Delayed delta
% $$\delta(t - a)$$
laplace(delta(t-a))
%% Example 1
% 
% Use MATLAB to find the laplace transforms of exp(-a*t)*u0(t), t*exp(a*t),
% t^3*exp(b*t)*u0(t), cos(b*t)*u0(t), sin(b*t)*u0(t)

laplace(exp(-a*t)*u0(t))
%ans = 1/(a + s)
laplace(t*exp(a*t))
% ans = 1/(a - s)^2
laplace(t^3*exp(b*t)*u0(t))
% ans = 6/(b - s)^4
laplace(cos(b*t)*u0(t))
% ans = s/(b^2 + s^2)
laplace(sin(b*t)*u0(t))
% ans = b/(b^2 + s^2)

%% Example 2
%
% Find the Laplace Transform of (t^n)*exp(-b*t)*u0(t)

laplace((t^n)*exp(-b*t)*u0(t))
%ans = piecewise([-1 < real(n), gamma(n + 1)/(b + s)^(n + 1)])

%% Example 3
%
% Use matlab to compute the Laplace Transfrom of
% exp(-a*t)*sin(omega*t)*u0(t) and exp(-a*t)*cos(omega*t)*u0(t)

syms omega
laplace(exp(-a*t)*sin(omega*t)*u0(t))
%ans = omega/((a + s)^2 + omega^2)
laplace(exp(-a*t)*cos(omega*t)*u0(t))
% ans = (a + s)/((a + s)^2 + omega^2)

%% Laplace Transform Properties
% Give examples to prove each of the following:
% # The Linearity Property
% # The Time Shifting Property
% # The Frequency Shifting Property
% # The Scaling Property
% # The Transform of First, Second and nth-Order Time Derviatives
% # The Integration in Time Domain Property
%% Example 4
%
% Calculate the Laplace Transform of a rectangular pulse with a height 2
% that starts at t = 1 seconds and ends at t = 3 seconds. Plot the pulse.

pulse = 2* (heaviside(t - 1) - heaviside(t - 3));
v1 = laplace(pulse)
% v1 = (2*exp(-s))/s - (2*exp(-3*s))/s
ezplot(v1,[-4, 4]),grid

%% Example 5
%
% Plot a piecewise-linear signal that starts at 0
% when t=0, goes to -1 at t = 1, +1 at t = 2, and returns to 0 at t = 3.
% Calculate the Laplace Transform of the waveform.

v2 = -1*heaviside(t)+ 2*heaviside(t-1) - 1*heaviside(t-2)
ezplot(v2,[-4, 4]),grid
laplace(v2)
%ans = (2*exp(-2*s))/s - exp(-s)/s - exp(-3*s)/s

%% Example 6
%
% Give the laplace transform of the waveform in Example 5 assuming that it
% repeats every 3 seconds.
% L{f(t + nT)} = L{f(t)}/(1-exp(-sn))
% ans = (2*exp(-2*s))/s - exp(-s)/s - exp(-3*s)/s)/(1-exp(-3*s))

%% Example 7
%
% Use MATLAB to plot a fully rectified sinusoidal signal abs(sin wt) over
% 3 full cycles. Find the Laplace Transform of this Signal.
v3 = abs(sin(2*pi/3*t))
ezplot(v3,[-4,4])
 
laplace(v3)
% ans = (2*pi*coth((3*s)/4))/(3*(s^2 + (4*pi^2)/9))
 
%% Homework
%
% Chose one example from each of the End of Chapter Exercises 2.8 Q1-Q7
% and validate the solution using MATLAB.

%Q1.
% a. 12
laplace(12*heaviside(t))
%ans = 12/s
%
%b.6*heaviside(t)
laplace(6*heaviside(t))
%ans = 6/s
%
%c.24*heaviside(t-12)
laplace(24*heaviside(t-12))
%ans = (24*exp(-12*s))/s
%
%d.5*t*heaviside(t)
laplace(5*t*heaviside(t))
%ans = 5/s^2
%
%e.4*t^5*heaviside(t)
laplace(4*t^5*heaviside(t))
%ans = 480/s^6