% Plots em magnitude (Magnitude x Ω – frequência normalizada, 0 ≤ Ω ≤ 1) e em 
% decibéis (Ganho em dB x Ω – frequência normalizada, 10^-2 ≤ Ω ≤ 10^0) da resposta
% em frequência |HPB(ejw)|^2 de um Filtro Passa-Faixas IIR de ordem-K, para valores 
% de K = 1, 3 e 5, α = 0.25 e varie β = 0.35, wc = 0.4π.

w = 0:pi/255:pi;
alpha = 0.25;
beta = 0.35;
K1 = 1;
K2 = 3;
K3 = 5;
% Função
s = tf('s');
% Numerador
P1 = (((1-alpha)/2)*s^2-(1-alpha)/2);
P2 = (((1-alpha)/2)*s^2-(1-alpha)/2);
P3 = (((1-alpha)/2)*s^2-(1-alpha)/2);
% Denominador
Q1 = ((s^2)-(beta*(1+alpha)*s)+alpha);
Q2 = ((s^2)-(beta*(1+alpha)*s)+alpha);
Q3 = ((s^2)-(beta*(1+alpha)*s)+alpha);
% Coeficientes
[num1,den1] = tfdata((P1/Q1)^K1,'v');
[num2,den2] = tfdata((P2/Q2)^K2,'v');
[num3,den3] = tfdata((P3/Q3)^K3,'v');
%Resposta em frequencia
H1 = freqz(num1,den1,w);
H2 = freqz(num2,den2,w);
H3 = freqz(num3,den3,w);
% Cálculo da Magnitude
m1 = (abs(H1));
m2 = (abs(H2));
m3 = (abs(H3));
% Magnitude ao quadrado
n1 = (m1.^2);
n2 = (m2.^2);
n3 = (m3.^2);
% Cálculo da Magnitude em dB
dB1 = mag2db(m1);
dB2 = mag2db(m2);
dB3 = mag2db(m3);
% Plot da Resposta em Magnitude
figure(1); plot(w/pi,n1,'r-', w/pi,n2,'b--',w/pi,n3,'c--');
ylabel('Magnitude');
xlabel('Frequência Angular Normalizada (\omega / \pi), \alpha = 0.25 e \beta = 0.35');
legend('K = 1','K = 3','K = 5');
xlim([0 1]);
ylim([0 1.1]);
% Plot da Resposta em frequência em dB
figure(2); semilogx(w/pi,dB1,'r-', w/pi,dB2,'b--',w/pi,dB3,'c--');
ylabel('Magnitude (dB)');
xlabel('Frequência Angular Normalizada (\omega / \pi), \alpha = 0.25 e \beta = 0.35');
legend('K = 1','K = 3','K = 5');
xlim([0.01 1]);
ylim([-30 5]);
