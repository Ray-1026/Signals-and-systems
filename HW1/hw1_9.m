%9(a)
t=-5:0.01:10;
x=zeros(1, length(t));

for i=1:length(t)
    if 0<=t(i) && t(i)<=3
        x(i)=10;
    end
end

%9(b)
y=zeros(1, length(t));
r=randn(1, length(t));

for i=1:length(t)
    y(i)=x(i)+r(i);
end

%9(c)
SNR=20*log10(max(y)/std(r));
disp(SNR);

figure(1)
plot(t, x)
hold on
plot(t, y)
hold off

xlim([-5, 10])
ylim([-5, 15])
xlabel('time(s)')
ylabel('output signal')
title('HW1-9')
legend('x(t)', 'x(t) with noise')
