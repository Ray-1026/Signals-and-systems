close all

w=-3*pi/4:pi/16:3*pi/4;

x=(pi/16)*(sin(10*w)./sin(2*w));
idx=find(w==0);
x(idx)=5*pi/16;

figure(1)
stem(w, abs(x))
xlim([-3, 3])
ylim([-0.5, 4])
title('|X(jw)|')
xlabel('w')
ylabel('|X(jw)|')

figure(2)
stem(w, angle(x))
xlim([-3, 3])
ylim([-0.5, 4])
title('arg(X(jw))')
xlabel('w')
ylabel('arg(X(jw))')