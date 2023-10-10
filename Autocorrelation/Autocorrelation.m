clc;
clear;

[x,Fs]=audioread('Violin-Wikipedia_1---11kHz---One Note.wav');
%sound(x);
nsamps= length(x);
t= 1/Fs * (1:nsamps);
[rxx,lags]= xcorr(x(1:300));

[pk,loc]= findpeaks(rxx,'SortStr','descend');
p=1; % which max peak after the max peak in lag=0
l=2*p+1;

lag_peak= loc(l);

f0= Fs/lags(lag_peak);
disp(f0)

subplot(2,1,1)
plot(t,x)
title('Plot of audio signal')

subplot(2,1,2)
plot(lags,rxx)
title('Autcorrolation')
xlabel('Lag')
ylabel('Corr')
