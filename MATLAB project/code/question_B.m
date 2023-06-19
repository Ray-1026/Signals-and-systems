%%% (b) Effects of noise on the music. Add a Guassian white noise to the
%%%     original signal such that the signal-to-noise ratio is 30 dB. 
%%%     The maximum signal amplitude is assumed to be 1.
clear all

%% Load audio file
file = '..\IfIcan.mp3';
audioinfo(file)

[y, Fs] = audioread(file);

N = size(y, 1);
t = 0:1/Fs:(N-1)/Fs;

ys = y(:, 1);

% frequency index for the FT result after applying "fftshift"
if mod(N,2) == 0
    f = -1*Fs/2*(N-2)/N: Fs/N: Fs/2;
else
    f = -1*Fs/2*(N-1)/N: Fs/N: Fs/2*(N-1)/N;
end

%% Add a Gaussian white noise
SNR = 30;
noice_var = 10^(-SNR/10);
ys_noise = ys + sqrt(noice_var)*randn(N, 1);

ys_noise(ys_noise<-1) = -1;
ys_noise(ys_noise>1) = 1;

Ys = fftshift(fft(ys));
Ys_mag = abs(Ys);
Ys_noise = fftshift(fft(ys_noise));
Ys_noise_mag = abs(Ys_noise);

figure(1)
plot(f, Ys_noise_mag)
hold on
plot(f, Ys_mag)
hold off
legend('with adding noise', 'without adding noise')
title('Frequency-domain Representation')
xlabel('frequency')
ylabel('magnitude')

%% Play the sound with adding Gaussian white noise
sound(ys_noise, Fs);

%% Output the file
filename = '..\audio\noise30dB110550093.ogg';
audiowrite(filename, ys_noise, Fs);