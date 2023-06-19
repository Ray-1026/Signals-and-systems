%%%% Matlab assignment to understand how to process an audio signal (e.g.
%%%% music) using digital signal processing. 
%%%%  (a) Read the data (2-channel stereo music) using Matlab' audioread.
%%%%       Show the time waveform and its Frequency-domain representations
%%%%       using FFT. For simplicity, we will process one channel ONLY
%%%%       (i.e., mono tone).
%%%%  (b) Effects of noise on the music. Add a Guassian white noise to the
%%%%      original signal such that the signal-to-noise ratio is 30 dB. The maximum signal amplitude is assumed to be 1.
%%%%  (c) Test your hearing frequency band. Add a single tone (i.e., a
%%%%      single frequency, cosine signal) to the original data such that
%%%%      you CANNOT hear this single tone. That is, you hear the same as
%%%%      the original music. How to add this single tone?
%%%%  (d) Effects of filtering on the music. Apply the low-pass filter and
%%%%  high-pass filter to listen what is the differnece between them?
%%%%  (e) Downsampling the music. The orignal music has the sampling rate
%%%%  of 48kHz. What happens if you lower the sampling rate to 24kHz or
%%%%  even lower? 
%%%%  (f)  Compression of the music. Use the above filtering or
%%%%  downsampling or other skills you have to compress the music as much
%%%%  as possible without lossing the audio quality too much. 

%%%%  Signals and Systems, Spring 2023, Geng-Shi Jeng, NYCU, Taiwan.
 
clear all

%%% Load audio file 
filen = 'IfIcan.mp3';
audioinfo(filen)

[y,Fs] = audioread(filen);  % y has two channels, Fs is the sampling rate

N = size(y,1);              % Length of the audio signal 
t = [0:1/Fs:(N-1)/Fs];      % Time index 

%%% This frequency index is for the FT result after applying "fftshift"
%%% (i.e., the negative frequency in the beginning --> 0 --> positive
%%% frequency). The frequency index is dependent on whether the number of
%%% samples is even or odd. 

if mod(N,2) == 0   % N is even 
    f = -1*Fs/2*(N-2)/N: Fs/N: Fs/2;
else  % N is odd
    f = -1*Fs/2*(N-1)/N: Fs/N: Fs/2*(N-1)/N;
end

%%%% This is the olde version index which is not absolutely correct but is
%%%% VERY CLOSE when the number of samples is much larger.
%%%% f = ([0:1:N-1]/N-0.5)*Fs; % Frequency index (from -Fs/2:1/N*Fs:(N-1)/N*Fs-Fs/2)


ys = y(:,1);  % we only process one of two channels between both are very similar. 

%%% Add noise (Gaussian white noise)
SNR = 30;
noise_var = 10^(-SNR/10);
ys_noise = ys + sqrt(noise_var)*randn(N,1);  % add noise 

%%% Add an inaudible signal with single frequency. 
fc = 40*10^3;   % The frequency of this cosine wave (you CAN change this value)
amp = 0.1;  % amplitude of the cosine wave (DON'T CHANGE this value for your hearing safty)

ys_inau = ys + amp*cos(2*pi*fc*[0:1:N-1]'/Fs); % Add this cosine signal to the orignal music. 

% Play the sound
sound(ys,Fs)   

%%% Export the prcoessed audio with .ogg format
filename = 'org.ogg'; 
audiowrite(filename,ys,Fs)

