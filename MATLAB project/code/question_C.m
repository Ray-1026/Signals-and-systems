%%%  (c) Test your hearing frequency band. Add a single tone (i.e., a
%%%      single frequency, cosine signal) to the original data such that
%%%      you CANNOT hear this single tone. That is, you hear the same as
%%%      the original music.
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

%% Add an inaudible signal with single frequency
fc = 27000;
amp = 0.1;

ys_inau = ys + amp*cos(2*pi*fc*[0:1:N-1]'/Fs);
ys_inau(ys_inau>1) = 1;
ys_inau(ys_inau<-1) = -1;

Ys = fftshift(fft(ys));
Ys_mag = abs(Ys);
Ys_inau = fftshift(fft(ys_inau));
Ys_inau_mag = abs(Ys_inau);

figure(1)
subplot(2, 1, 1)
plot(f, Ys_mag)
subtitle('without adding noise')
xlabel('frequency')
ylabel('magnitude')
title('Frequency-domain Representation')
subplot(2, 1, 2)
plot(f, Ys_inau_mag)
subtitle('with adding noise')
xlabel('frequency')
ylabel('magnitude')

%% Output the file
filename = '..\audio\inaudible110550093.ogg';
audiowrite(filename, ys_inau, Fs);