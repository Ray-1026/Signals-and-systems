clear all

w=[0.1:0.1:10000];
s=j*w;

Ha=200./((s+1).*(s+10).*(s+100));

abs_Ha=abs(Ha);
dB_Ha=20*log10(abs_Ha);
pha_Ha=phase(Ha)*180/pi;

Hb=400000.*(s+2)./((s+20).*(s.*s+s+400000));

abs_Hb=abs(Hb);
dB_Hb=20*log10(abs_Hb);
pha_Hb=phase(Hb)*180/pi;

figure(1);
subplot(121);
semilogx(w, dB_Ha);
xlabel('Angular frequency');
ylabel('dB');
title('Magnitude of Frequency Response');

subplot(122);
semilogx(w, pha_Ha);
xlabel('Angular Frequency');
ylabel('Degree');
title('Phase of Frequency Response');

figure(2)
subplot(121);
semilogx(w, dB_Hb);
xlabel('Angular frequency');
ylabel('dB');
title('Magnitude of Frequency Response');

subplot(122);
semilogx(w, pha_Hb);
xlabel('Angular Frequency');
ylabel('Degree');
title('Phase of Frequency Response');