close all

n=0:18;
x=2*sin(14*pi*n/19)+cos(10*pi*n/19)+1;
X=fft(x)/length(n);

mag_X=abs(X);

tol=1e-6;
X(mag_X<tol)=0;
arg_X=angle(X);

figure(1)
stem(n, x)
xlabel('n')
ylabel('x[n]')
title('x[n]')
xlim([-0.5, 18.5])
ylim([-2.5, 3])

figure(2)
stem(n, mag_X)
xlabel('k')
ylabel('|X[k]|')
title('|X[k]|')
xlim([-0.5, 18.5])
ylim([-0.5, 1.5])

figure(3)
stem(n, arg_X)
xlabel('k')
ylabel('arg{X[k]}')
title('arg{X[k]}')
xlim([-0.5, 18.5])
ylim([-2.5, 2.5])