clear;
clc;

[x,Fs]=audioread('Speech-16kHz.wav');

T = 1/Fs;  
L=length(x);
t = (0:L-1)*T; 

% figure; 
% subplot(2,1,1)
% plot(t,x,'k','linewidth',1)
% xlabel('TIME')
% ylabel('SIGNAL')
% 
% Y= fft(x,L);
% PSD= Y.*conj(Y)/L;
% freq= 1/(T*L)*(0:L);
% 
% I= 1:floor(L/2);
% 
% subplot(2,1,2)
% plot(freq(I), PSD(I))
% xlabel('Frequency')
% ylabel('Power of each frequency')

% =========== Design a Filter

k1= floor (L*150/Fs);
k2= floor (L*300/Fs);
k3= floor (L*2500/Fs);
k4= floor (L*3000/Fs);
k5= floor (L/2);
% kc= L/2;
f1= zeros(1,1228);
%f2= rand(1,615);
f3= ones(1,9021);
%f4= rand(1,2050);
f5= zeros(1, k5-9021);

Fk=[f1,f3,f5];

% % ============== 
plot(Fk)
% X=PSD'.*fk;
% 
% xf= real(ifft(X));
% xmax=xf/max(abs(xf));
% filename = 'Filtered_Speech.wav';
% audiowrite(filename,xmax,Fs);
% 
% [S,Fs] = audioread(filename);
% %sound(S,Fs);




