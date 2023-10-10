clc;close all; clear all;

[x,Fs]=audioread('S21_Male_FarsDat_TwoSentence-8kHz.wav');

N=10;
Re=0.1;
fl=300;
fh=3000;


[b a]=butter(N,fl/(fh/2),'high');
[H w]=freqz(b,a,1024);


y1=filter(b,a,x);
filename1 = 'ButterFil_S21_Male_FarsDat_TwoSentence-8kHz.wav';
audiowrite(filename1,y1,Fs);

%cheby1 ****************************************************

[b1 a1]=cheby1(N,Re,fl/(fh/2),'high');
[H1 w1]=freqz(b1,a1,1024);

y2=filter(b1,a1,x);
filename1 = 'ChebyFil_S21_Male_FarsDat_TwoSentence-8kHz.wav';
audiowrite(filename1,y2,Fs);
sound(y2,Fs);


subplot(2,1,1)
plot(w,abs(H))
subplot(2,1,2)
plot(w1,abs(H1))



