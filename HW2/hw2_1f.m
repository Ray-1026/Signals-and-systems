close all;

n=-5:6;
x=((n>=-1)*1)-((n>=3)*1);
h=[0 0 0 1 -1 2 0 1 0 0 0];

y=conv(x, h, 'same');

figure(1)
stem(n, y)

xlim([-5, 6])
ylim([-2, 4])
xlabel('n')
ylabel('y[n]')
title('HW2-1(f)')