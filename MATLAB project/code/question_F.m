%%% (f) Compression of the music. Use the above filtering or
%%%     downsampling or other skills you have to compress the music as much
%%%     as possible without lossing the audio quality too much. 
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

%% Compress the music
anti_alias = fir1(64, 7350/(Fs/2));
ys_anti = conv(ys, anti_alias, 'same');

ds = 3;
ys_res = ys_anti(1:ds:end);

Ys_res = fftshift(fft(ys_res));
Ys_res(1 : fix(441808/8)) = 0;
Ys_res(fix(441808*7/8) : 441808) = 0;
ys_res2 = real(ifft(ifftshift(Ys_res)));

sound(ys_res2, Fs/ds);

%% Save audio file
filename = '..\audio\compress110550093.ogg';
audiowrite(filename, ys_res2, Fs/ds);