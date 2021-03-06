%% Calculation of Fourier coefficients for Square Wave
%
% Note the Fourier Series coefficients are computed using the period and
% fundamental frequency rather than the radian measures given in the
% lecture.
%
% Prepared for EG-247 Signals and Systems
% by Chris Jobling
%
clear all
%
%% Initialize problem
syms t n A
%% Set up problem
f = 1000;         % Hz
T0 = 1/f;          % s
omega_0 = 2*pi/T0; % rad/s
%% Define harmonics
k_max = 11;
%% Define f(t)
%
% !!!IMPORTANT!!!: the signal definition must cover [0 to T0] 
%
ft = A.*t.*(heaviside(t)-heaviside(t-T0/4))+ (A.*T0/2 - A.*t).*(heaviside(t-T0/4)-heaviside(t-3*T0/4)) + (A.*t - A*T0).*(heaviside(t-3*T0/4)-heaviside(t-T0)); %% Compute TFS
%
% Note that this can take considerable time (6 minutes or more) so be patient!
%
[a0, ak, bk, w] = TrigFourierSeries(ft, T0, k_max)
%% Reconstruct f(t) from harmonic sine functions
Ft = a0/2;
for k=1:k_max
    Ft = Ft + ak(k)*cos(w(k)*t) + bk(k)*sin(w(k)*t);
end
Ft
%% Make numeric
a0_num = subs(a0,A,1.0);
ak_num = subs(ak,A,1.0);
bk_num = subs(bk,A,1.0);
% print using 4 sig digits
a0_num = vpa(a0_num, 4)
ak_num = vpa(ak_num, 4)
bk_num = vpa(bk_num, 4)
%% plot result
ezplot(subs(Ft,A,1),[0,2*T0])
hold on
%% plot original signal
% (we could use |heaviside| for this as well)
%

A = 1;
t = linspace(0,2*T0,100);
ft = A.*t.*(heaviside(t)-heaviside(t-T0/4))+ (A.*T0/2 - A.*t).*(heaviside(t-T0/4)-heaviside(t-3*T0/4)) + (A.*t - A*T0).*(heaviside(t-3*T0/4)-heaviside(t-T0)); %% Compute TFS
%
plot(t,ft,'red')

grid
title('Square Wave Reconstructed from Sinewaves')
hold off

