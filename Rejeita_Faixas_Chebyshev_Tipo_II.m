% Um IIR Rejeita-Faixa, para passagem em f ≤ 500 e f ≥ 5000 Hz.
% Aproximação Chebyshev Tipo II
% Frequência de amostragem seja de fa = 44100 Hz.
% Plot da resposta em frequência em Magnitude (dB x frequência normalizada)
% e a resposta de fase (fase em radianos x frequência normalizada).

format long;
fc1 = 500;
fc2 = 5000;
fa = 44100;
wc = [(2*fc1)/fa (2*fc2)/fa];
[b, a] = cheby2(4,50,[wc(1) wc(2)],'stop');
figure(1);
freqz(b, a);
title('Type II Chebyshev IIR Bandstop Filter');
xlim([0 1]);
ylim([-100 10]);

