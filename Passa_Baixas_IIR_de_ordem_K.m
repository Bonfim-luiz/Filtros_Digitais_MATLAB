% Plots em magnitude (Magnitude x Ω – frequência normalizada, 0 ≤ Ω ≤ 1) e em 
% decibéis (Ganho em dB x Ω – frequência normalizada, 10^-2 ≤ Ω ≤ 10^0 ) da 
% resposta em frequência |HPB(ejw)|^2 de um Filtro Passa-Baixas IIR de ordem-K, 
% para valores de K = 1 e K = 5, wc = 0.3π.

w = 0:pi/255:pi;
% Determinação de C e alpha
K1 = 1;
K2 = 5;
omegac = 0.3*pi;
C1 = 2^((K1-1)/K1);
alpha1 = (1+(1-C1)*cos(omegac)-sin(omegac)*(2*C1-C1*exp(2))*exp(1/2))/(1-C1+cos(omegac));
C2 = 2^((K2-1)/K2);
alpha2 = (1+(1-C2)*cos(omegac)-sin(omegac)*(2*C2-C2*exp(2))*exp(1/2))/(1-C2+cos(omegac));
% Função
s = tf('s');
% Numerador
P1 = (((1-alpha1)/2)*s+(1-alpha1)/2)^1;
P2 = (((1-alpha2)/2)*s+(1-alpha2)/2)^5;
% Denominador
Q1 = (s-alpha1)^1;
Q2 = (s-alpha2)^5;
% Coeficientes
[num1,den1] = tfdata((P1/Q1),'v');
[num2,den2] = tfdata((P2/Q2),'v');
%Resposta em frequência
H1 = freqz(num1,den1,w);
H2 = freqz(num2,den2,w);
% Cálculo da Magnitude
m1 = (abs(H1));
m2 = (abs(H2));
% Magnitude ao quadrado
n1 = (m1.^2);
n2 = (m2.^2);
% Cálculo da Magnitude em dB
dB1 = mag2db(m1);
dB2 = mag2db(m2);
% Plot da Resposta em Magnitude
figure(1); plot(w/pi,n1,'r-', w/pi,n2,'b--');
ylabel('Magnitude');
xlabel('Frequência Angular Normalizada (\omega / \pi) e \omega c = 0.3 \pi');
legend('K = 1','K = 5');
xlim([0 1]);
ylim([0 1.1]);
% Plot da Resposta em frequência em dB
figure(2); semilogx(w/pi,dB1,'r-', w/pi,dB2,'b--');
ylabel('Magnitude (dB)');
xlabel('Frequência Angular Normalizada (\omega / \pi) e \omega c = 0.3 \pi');
legend('K = 1','K = 5');
xlim([0.01 1]);
ylim([-20 5]);
