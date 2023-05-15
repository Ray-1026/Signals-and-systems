close all

omega=-3*pi:pi/4:3*pi;
x=(pi/4)*sin(5*omega/2)./sin(omega/2);
idx=find(omega==0);
x(idx)=pi*5/4;

figure(1)
stem(omega, abs(x))
xlim([-10, 10])
ylim([-0.5, 4])
title('|X(exp(j\Omega))|')
xlabel('\Omega')
ylabel('|X(exp(j\Omega))|')

figure(2)
stem(omega, angle(x))
xlim([-10, 10])
ylim([-0.5, 4])
title('arg(X(exp(j\Omega)))')
xlabel('\Omega')
ylabel('arg(X(exp(j\Omega)))')