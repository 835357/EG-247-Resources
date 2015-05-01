Fs = 8000;
Ts = 1/Fs;
a = sin(2*pi*261.62*[0:Ts:0.5]);
a_sharp = sin(2*pi*466.1*[0:Ts:0.5]);
b = sin(2*pi*493.88*[0:Ts:0.5]);
c = sin(2*pi*523.25*[0:Ts:0.5]);
c_sharp = sin(2*pi*554.36*[0:Ts:0.5]);
d = sin(2*pi*587.33*[0:Ts:0.5]);
d_sharp = sin(2*pi*622.25*[0:Ts:0.5]);
e = sin(2*pi*659.25*[0:Ts:0.5]);
f = sin(2*pi*698.45*[0:Ts:0.5]);
f_sharp = sin(2*pi*739.98*[0:Ts:0.5]);
g = sin(2*pi*783.99*[0:Ts:0.5]);
g_sharp = sin(2*pi*830.6*[0:Ts:0.5]);

wait = zeros(1,length(0:Ts:1));

tune = [e,e,b,c,d,e,d,c,b,a,a,c,e,d,c,b,c,d,e,c,a,a];
% tetris there almost

%tune = [f,c,d,c,d,e]; %835357
audiowrite('ex24.wav',tune,Fs);


[x,Fs] = audioread('ex24.wav');

sound(x,Fs)