close all;

t=-4:0.01:4;

x=cos(pi*t).*(heaviside(t+1)-heaviside(t-1));
h=heaviside(t+1)-heaviside(t-1);

y=conv(x, h, 'same')*0.01;

figure(1)
plot(t, y)

xlim([-4, 4])
ylim([-0.5, 0.5])
xlabel('t')
ylabel('y(t)')
title('3(b)')