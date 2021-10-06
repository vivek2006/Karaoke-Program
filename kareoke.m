clc;
clear all;
close all;
fs=44100;
samples = [1,2*fs];

[y, fs] = audioread('sample1.wav');
[M,N]=size(y);
if N==1
error('music is not stereo')
elseif N>2
error('music has more than two channels')
end
left_channel = y(:,1);
right_channel = y(:,2);
unvoiced=(left_channel-right_channel)/2;
subplot(2,2,1)
plot(y);
title('original song')
subplot(2,2,2)
plot(left_channel);title('left channel music');
subplot(2,2,3)
plot(right_channel);title('right channel music');
subplot(2,2,4)
plot(unvoiced);title('Song without Vocals');
sound(unvoiced,44100)
audiowrite(unvoiced,fs)