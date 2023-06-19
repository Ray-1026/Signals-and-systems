%%% (d) Filter the music. Apply the low-pass filter and 
%%%     high-pass filter to listen what is the difference
clear all

%% Load audio file
file = '..\IfIcan.mp3';
audioinfo(file)

[y, Fs] = audioread(file);

N = size(y, 1);
t = 0:1/Fs:(N-1)/Fs;

ys = y(:, 1);
Ys = fftshift(fft(ys));
Ys_mag = abs(Ys);

% frequency index for the FT result after applying "fftshift"
if mod(N,2) == 0
    f = -1*Fs/2*(N-2)/N: Fs/N: Fs/2;
else
    f = -1*Fs/2*(N-1)/N: Fs/N: Fs/2*(N-1)/N;
end

%% Filter
b_lpf = fir1(64, 10*10^3/(Fs/2));
b_hpf = fir1(64, 0.5*10^3/(Fs/2), 'high');

%% Plot the frequency response of two filters
figure(1)
freqz(b_lpf)
title('Low-pass filtering')

figure(2)
freqz(b_hpf)
title('High-pass filtering')

%% Use convolution to do filtering
ys_lpf_fil = conv(ys, b_lpf, 'same');
ys_hpf_fil = conv(ys, b_hpf, 'same');

Ys_lpf_fil = fftshift(fft(ys_lpf_fil));
Ys_lpf_fil_mag = abs(Ys_lpf_fil);

Ys_hpf_fil = fftshift(fft(ys_hpf_fil));
Ys_hpf_fil_mag = abs(Ys_hpf_fil);

figure(3)
plot(f, Ys_mag)
hold on
plot(f, Ys_lpf_fil_mag)
hold off
title('Low-pass Filter with cut-off frequency being 10kHz')
legend('before filtering', 'after filtering')
xlabel('frequency')
ylabel('magnitude')

figure(4)
plot(f, Ys_mag)
hold on
plot(f, Ys_hpf_fil_mag)
hold off
title('High-pass Filter with cut-off frequenct being 500Hz')
legend('before filtering', 'after filtering')
xlabel('frequency')
ylabel('magnitude')

%% Output the audio files
filename_lpf = '..\audio\lpf110550093.ogg';
audiowrite(filename_lpf, ys_lpf_fil, Fs);

filename_hpf = '..\audio\hpf110550093.ogg';
audiowrite(filename_hpf, ys_hpf_fil, Fs);
