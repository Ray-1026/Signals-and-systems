%%%  (e) Downsampling the music. The orignal music has the sampling rate
%%%      of 48kHz. What happens if you lower the sampling rate to 24kHz or
%%%      even lower? 
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

%% Low-pass filtering
b_lpf = fir1(64, 11.025e3/(Fs/2));
ys_lpf_fil = conv(ys, b_lpf, 'same');

%% Downsampling by ds
ds = 2;
ys_fil_ds = ys_lpf_fil(1:ds:end);

sound(ys_fil_ds, Fs/2);

%% Save data
filename = '..\audio\ds2110550093.ogg';
audiowrite(filename, ys_fil_ds, Fs/ds);