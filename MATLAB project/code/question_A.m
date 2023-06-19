%%%  (a) Read the data (2-channel stereo music) using Matlab's audioread.
%%%      Show the time waveform and its Frequency-domain representations
%%%      using FFT. For simplicity, we will process one channel ONLY
%%%      (i.e., mono tone).
clear all

%% Load audio file
file = '..\IfIcan.mp3';
audioinfo(file)

[y, Fs] = audioread(file);

N = size(y, 1);
t = 0:1/Fs:(N-1)/Fs;

%% Plot the time waveform
ys = y(:, 1);

figure(1)
plot(t, ys);
xlim([0, 31])
ylim([-1, 1])
xlabel('Time(s)')
ylabel('Amplitude')
title('Time Waveform')

%% Plot frequency-domain representation
Ys = fftshift(fft(ys));
Ys_mag = abs(Ys);

% frequency index for the FT result after applying "fftshift"
if mod(N,2) == 0
    f = -1*Fs/2*(N-2)/N: Fs/N: Fs/2;
else
    f = -1*Fs/2*(N-1)/N: Fs/N: Fs/2*(N-1)/N;
end

figure(2)
plot(f, Ys_mag)
xlabel('frequency')
ylabel('magnitude')
title('Frequency-domain Representation')

%% Write this MONO music to a new file and save it as .OGG format
filename = '..\audio\org110550093.ogg';
audiowrite(filename, ys, Fs);