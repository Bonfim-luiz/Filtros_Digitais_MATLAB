% Um IIR Passa-Baixa, com fc = 500 Hz, banda de passagem f ≤ 500 Hz.
% Aproximação Elíptica.
% Frequência de amostragem seja de fa = 44100 Hz.
% Plot da resposta em frequência em Magnitude (dB x frequência normalizada)
% e a resposta de fase (fase em radianos x frequência normalizada).

format long;
fc = 500;
fa = 44100;
wc = (2*fc)/fa;
Rp = 0.5;
[a, b] = ellip(4, Rp, 50, wc);
figure(1);
freqz(a, b);
title('Elliptic IIR Lowpass filter');
xlim([0 1]);
ylim([-90 10]);
subplot(2,1,2);
ylim([-350 50]);
xlim([0 1]);
