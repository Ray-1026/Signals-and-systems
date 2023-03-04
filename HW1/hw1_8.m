F=0.1;

n_1=-8:1:8;
w_1=zeros(1, length(n_1));

n_2=-8:0.001:8;
w_2=zeros(1, length(n_2));

for i=1:length(n_1)
    if (-0.5/F)<=n_1(i) && n_1(i)<=(0.5/F)
        w_1(i)=cos(2*pi*F*n_1(i));
    else
        w_1(i)=0;
    end
end

for i=1:length(n_2)
    if (-0.5/F)<=n_2(i) && n_2(i)<=(0.5/F)
        w_2(i)=cos(2*pi*F*n_2(i));
    else
        w_2(i)=0;
    end
end

figure(1)
plot(n_1, w_1)
hold on
plot(n_2, w_2)
hold off

xlim([-8, 8])
ylim([-2, 2])
xlabel('time(s)')
ylabel('amplitude of cos')
title('HW1-8')
legend('low sample freq(n_1 = 1)', 'high sample freq(n_2 = 0.001)')