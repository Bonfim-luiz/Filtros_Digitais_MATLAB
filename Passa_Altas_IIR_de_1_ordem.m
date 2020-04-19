% Plots em magnitude (Magnitude x Ω – frequência normalizada, 0 ≤ Ω ≤ 1)
% e em decibéis (Ganho em dB x Ω – frequência normalizada, 10-2 ≤ Ω ≤ 10^0 ) 
% da resposta em frequência |HPA(ejw)|^2 de um Filtro Passa-Altas IIR de 1ª ordem
% para valores de  = 0.25, 0.45 e 0.75. 

w = 0:pi/255:pi;
% Função de transferência
H1 = freqz([0.625 -0.625], [1 -0.25],w);
H2 = freqz([0.725 -0.725], [1 -0.45],w);
H3 = freqz([0.875 -0.875], [1 -0.75],w);
% Cálculo da Magnitude
m1 = abs(H1);
m2 = abs(H2);
m3 = abs(H3);
% Magnitude ao quadrado
n1 = (m1.^2);
n2 = (m2.^2);
n3 = (m3.^2);
% Cálculo da Magnitude em dB
dB1 = mag2db(m1);
dB2 = mag2db(m2);
dB3 = mag2db(m3);
% Plot da Resposta em Magnitude
figure(1);plot(w/pi,n1,'r-',w/pi,n2,'b--',w/pi,n3,'c--');
ylabel('Magnitude');
xlabel('Frequência Angular Normalizada (\omega / \pi)');
legend('\alpha = 0.25','\alpha = 0.45','\alpha = 0.75');
ylim([0 1.1]);
xlim([0 1]);
% Plot da Resposta em frequência
figure(2); semilogx(w/pi,dB1,'r-', w/pi,dB2,'b--',w/pi,dB3,'c--');
ylabel('Magnitude (dB)');
xlabel('Frequência Angular Normalizada (\omega / \pi)');
legend('\alpha = 0.25','\alpha = 0.45','\alpha = 0.75');
ylim([-30 10]);
xlim([0.01 1]);
