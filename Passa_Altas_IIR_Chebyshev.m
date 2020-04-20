% Highpass IIR, com fc = 2500 Hz, banda de passagem f ≥ 2500 Hz.
% Aproximação Chebyshev
% Frequência de amostragem seja de fa = 44100 Hz.
% Plot da resposta em frequência em Magnitude (dB x frequência normalizada)
% e a resposta de fase (fase em radianos x frequência normalizada).

[N,Wn] = cheb1ord(0.18,0.18,0.5,30,'s');
[B,A] = cheby1(4,0.5,Wn,'s');
[BT,AT] = lp2hp(B,A,0.18);
[num,den] = bilinear(BT,AT,1);
figure(1);
freqz(num, den);
title('Type I Chebyshev IIR Highpass Filter');
ylim([-30 5]);
xlim([0 1]);
