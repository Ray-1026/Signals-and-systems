close all

M=[8, 20, 100];

%% time domain
n=-150:150;

x=cos((7*pi/16)*n)+cos((9*pi/16)*n);

w1=rectangularPulse(-1*M(1), M(1), n);
y1=x.*w1;

w2=rectangularPulse(-1*M(2), M(2), n);
y2=x.*w2;

w3=rectangularPulse(-1*M(3), M(3), n);
y3=x.*w3;

%% frquency domain
omega=-pi:0.01:pi;

X=DTFT(x, n, omega);

W1=DTFT(w1, n, omega);
Y1=DTFT(y1, n, omega);

W2=DTFT(w2, n, omega);
Y2=DTFT(y2, n, omega);

W3=DTFT(w3, n, omega);
Y3=DTFT(y3, n, omega);

%% figure 1
figure(1)
subplot(3, 2, 1)
plot(n, x)
xlim([-200, 200])
ylim([-2.5, 2.5])
title('x[n]')
xlabel('n')

subplot(3, 2, 2)
plot(omega, abs(X))
xlim([-4, 4])
ylim([0, 200])
title('X(exp(j\Omega))')
xlabel('\Omega')

subplot(3, 2, 3)
plot(n, w1)
xlim([-200, 200])
ylim([0, 1.5])
title('w[n]')
xlabel('n')

subplot(3, 2, 4)
plot(omega, abs(W1))
xlim([-4, 4])
ylim([0, 20])
title('W(exp(j\Omega))')
xlabel('\Omega')

subplot(3, 2, 5)
plot(n, y1)
xlim([-200, 200])
ylim([-2.5, 2.5])
title('y[n]=x[n]w[n]')
xlabel('n')

subplot(3, 2, 6)
plot(omega, abs(Y1))
xlim([-4, 4])
ylim([0, 15])
title('Y(exp(j\Omega))')
xlabel('\Omega')

%% figure 2
figure(2)
subplot(3, 2, 1)
plot(n, x)
xlim([-200, 200])
ylim([-2.5, 2.5])
title('x[n]')
xlabel('n')

subplot(3, 2, 2)
plot(omega, abs(X))
xlim([-4, 4])
ylim([0, 200])
title('X(exp(j\Omega))')
xlabel('\Omega')

subplot(3, 2, 3)
plot(n, w2)
xlim([-200, 200])
ylim([0, 1.5])
title('w[n]')
xlabel('n')

subplot(3, 2, 4)
plot(omega, abs(W2))
xlim([-4, 4])
ylim([0, 45])
title('W(exp(j\Omega))')
xlabel('\Omega')

subplot(3, 2, 5)
plot(n, y2)
xlim([-200, 200])
ylim([-2.5, 2.5])
title('y[n]=x[n]w[n]')
xlabel('n')

subplot(3, 2, 6)
plot(omega, abs(Y2))
xlim([-4, 4])
ylim([0, 25])
title('Y(exp(j\Omega))')
xlabel('\Omega')

%% figure 3
figure(3)
subplot(3, 2, 1)
plot(n, x)
xlim([-200, 200])
ylim([-2.5, 2.5])
title('x[n]')
xlabel('n')

subplot(3, 2, 2)
plot(omega, abs(X))
xlim([-4, 4])
ylim([0, 200])
title('X(exp(j\Omega))')
xlabel('\Omega')

subplot(3, 2, 3)
plot(n, w3)
xlim([-200, 200])
ylim([0, 1.5])
title('w[n]')
xlabel('n')

subplot(3, 2, 4)
plot(omega, abs(W3))
xlim([-4, 4])
ylim([0, 250])
title('W(exp(j\Omega))')
xlabel('\Omega')

subplot(3, 2, 5)
plot(n, y3)
xlim([-200, 200])
ylim([-2.5, 2.5])
title('y[n]=x[n]w[n]')
xlabel('n')

subplot(3, 2, 6)
plot(omega, abs(Y3))
xlim([-4, 4])
ylim([0, 150])
title('Y(exp(j\Omega))')
xlabel('\Omega')

%% function
function X = DTFT(x, n, W)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% X = DTFT values computed at W (1xNw)
% x = Time sampled signal (1xNn)
% n = sample time vector (1xNn)
% W = frequency location vector (1xNw)
% Nw: The length of W
% Nn: The length of n
X_tmp = exp(-1j*(W.' * n)) * x.';
X = X_tmp.';
end