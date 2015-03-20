%% Week 3: Solution 7
syms s;
%% student number 835357
R1 = 80*10^3; 
R2 = 30*10^3;
R3 = 50*10^3;

C1 = 35*10^(-9);
C2 = 70*10^(-9);
%%
den = R1*((1/R1+ 1/R2 + 1/R3 + s*C1)*(s*R3*C2) + 1/R2);
den = simplify(den)
pretty(den)
% 
% Result is: (10330176681277349609375*s*((5289050460814003*s)/151115727451828646838272 + 4857642606076849/73786976294838206464))/36893488147419103232 + 8/3
%%
% Simplify coefficient of s^2
a = 10330176681277349609375*5289050460814003/(151115727451828646838272*36893488147419103232)
% Simplify coefficient of s
b = 10330176681277349609375*4857642606076849/(73786976294838206464*36893488147419103232)
%
denG = [a, b, 8/3];
numG = -1;
sym2poly(den)

%% Plot
w = 1:10:10000;
%
% $$G(j\omega) = \frac{-1}{a\omega^2 - jb\omega + 5}$$
%
Gs = -1./(a*w.^2 - j.*b.*w + 8/3);
%
semilogx(w, abs(Gs))
xlabel('Radian frequency w (rad/s')
ylabel('|Vout/Vin|')
title('Magnitude Vout/Vin vs. Radian Frequency')
grid
