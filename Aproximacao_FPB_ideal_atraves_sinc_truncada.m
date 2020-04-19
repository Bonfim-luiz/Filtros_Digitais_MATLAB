% Aproximação de um FPB ideal através da sinc truncada, plotando a
% resposta em frequência para N = 10, 20, 40 e 50.

N1 = 10;
N2 = 20;
N3 = 40;
N4 = 50;
n = 0:0.1:30;

% Resposta em frequência
h1 = sinc(n - N1/2);
h2 = sinc(n - N2/2);
h3 = sinc(n - N3/2);
h4 = sinc(n - N4/2);

% Plot da Resposta em Magnitude
figure(1); plot(n,h1,'r-',n,h2,'b--',n,h3,'c--',n,h4,'g--');
title('Aproximação Fase Linear FPB ideal')
ylabel('Magnitude');
xlabel('Frequência');
legend('K=10','K=20','K=40','K=50');
xlim([0 30]);
ylim([-0.3 1.1]);
