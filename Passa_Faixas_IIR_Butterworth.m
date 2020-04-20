% IIR Passa-Faixa, com banda de passagem 500 ≤ f ≤ 5000 Hz.
% Aproximação Butterworth.
% Frequência de amostragem seja de fa = 44100 Hz.
% Plot da resposta em frequência em Magnitude (dB x frequência normalizada)
% e a resposta de fase (fase em radianos x frequência normalizada).

format long;
fc1 = 500;
fc2 = 5000;
fa = 44100;
wc = [(2*fc1)/fa (2*fc2)/fa];
[a,b] = butter(4,wc,"bandpass");
figure(1);
freqz(a, b);
title('Butterworth IIR Bandpass Filter');
ylim([-200 50]);
