% Plots em magnitude (Magnitude x Ω – frequência normalizada, 0 ≤ Ω ≤ 1) e em 
% decibéis (Ganho em dB x Ω – frequência normalizada, 10-2 ≤ Ω ≤ 100) da resposta
% em frequência | HPB(ejw) | 2de um Filtro Rejeita-Faixas IIR de 2ª ordem para 
% valores de β = 0.55 e varie α = 0.15, 0.5 e 0.85; depois fixe α = 0.45 e 
% varie β = 0.15, 0.5 e 0.85.

w = 0:pi/255:pi;
% Função de transferência - Parte I - Alpha variável e beta fixo
H1 = freqz([(1+0.15)/2 -2*(0.55)*(1+0.15)/2 (1+0.15)/2], [1 -0.55*(1+0.15) 0.15],w);
H2 = freqz([(1+0.50)/2 -2*(0.55)*(1+0.50)/2 (1+0.50)/2], [1 -0.55*(1+0.50) 0.50],w);
H3 = freqz([(1+0.85)/2 -2*(0.55)*(1+0.85)/2 (1+0.85)/2], [1 -0.55*(1+0.85) 0.85],w);
% Função de transferência - Parte I - Alpha fixo e beta variável
H4 = freqz([(1+0.45)/2 -2*(0.15)*(1+0.45)/2 (1+0.45)/2], [1 -0.15*(1+0.45) 0.45],w);
H5 = freqz([(1+0.45)/2 -2*(0.50)*(1+0.45)/2 (1+0.45)/2], [1 -0.50*(1+0.45) 0.45],w);
H6 = freqz([(1+0.45)/2 -2*(0.85)*(1+0.45)/2 (1+0.45)/2], [1 -0.85*(1+0.45) 0.45],w);
% Cálculo da Magnitude
m1 = abs(H1);
m2 = abs(H2);
m3 = abs(H3);
m4 = abs(H4);
m5 = abs(H5);
m6 = abs(H6);
% Magnitude ao quadrado
n1 = (m1.^2);
n2 = (m2.^2);
n3 = (m3.^2);
n4 = (m4.^2);
n5 = (m5.^2);
n6 = (m6.^2);
% Cálculo da Magnitude em dB
dB1 = mag2db(m1);
dB2 = mag2db(m2);
dB3 = mag2db(m3);
dB4 = mag2db(m4);
dB5 = mag2db(m5);
dB6 = mag2db(m6);
% Plot da Resposta em Magnitude
figure(1); plot(w/pi,n1,'r-', w/pi,n2,'b--',w/pi,n3,'c--');
ylabel('Magnitude');
xlabel('Frequência Angular Normalizada (\omega / \pi) e \beta = 0.55');
legend('\alpha = 0.15','\alpha = 0.50','\alpha = 0.85');
xlim([0 1]);
ylim([0 1.1]);
% Plot da Resposta em frequência em dB
figure(2); semilogx(w/pi,dB1,'r-', w/pi,dB2,'b--',w/pi,dB3,'c--');
ylabel('Magnitude (dB)');
xlabel('Frequência Angular Normalizada (\omega / \pi) e \beta = 0.55');
legend('\alpha = 0.15','\alpha = 0.50','\alpha = 0.85');
xlim([0.01 1]);
ylim([-20 5]);
% Plot da Resposta em Magnitude
figure(3); plot(w/pi,n4,'r-', w/pi,n5,'b--',w/pi,n6,'c--');
ylabel('Magnitude');
xlabel('Frequência Angular Normalizada (\omega / \pi) e \alpha = 0.45');
legend('\beta = 0.15','\beta = 0.50','\beta = 0.85');
xlim([0 1]);
ylim([0 1.1]);
% Plot da Resposta em frequência em dB
figure(4); plot(w/pi,dB4,'r-', w/pi,dB5,'b--',w/pi,dB6,'c--');
ylabel('Magnitude (dB)');
xlabel('Frequência Angular Normalizada (\omega / \pi) e \alpha = 0.45');
legend('\beta = 0.15','\beta = 0.50','\beta = 0.85');
xlim([0.01 1]);
ylim([-20 5]);
