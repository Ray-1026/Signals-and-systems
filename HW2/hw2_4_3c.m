close all;

t=-4:0.01:4;
h=exp(-t).*(heaviside(t)-heaviside(t-1));
x=heaviside(t+1)-heaviside(t-1);

y=conv(x, h, 'same')*0.01;

figure(1)
plot(t, y)

xlim([-4, 4])
ylim([-1, 1])
xlabel('t')
ylabel('y(t)')
title('3(c)')