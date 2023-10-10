clear;
clc;

[x,Fs]=audioread('ECG of Heart - 100Hz.wav');

T = 1/Fs;  
L=length(x);
t = (0:L-1)*T;   


figure; 
subplot(2,1,1)
plot(t,x,'k','linewidth',1)
xlabel('TIME')
ylabel('SIGNAL')
           

Y= fft(x,L);


PSD= Y.*conj(Y)/L;
freq= 1/(T*L)*(0:L);

I= 1:floor(L/2);

subplot(2,1,2)
plot(freq(I), PSD(I))
xlabel('Frequency')
ylabel('Power of each frequency')

% =========== Design a Filter

f1= zeros(1,6);

coef1= polyfit([0.5,1],[0,1],1);
a1= coef1(1);
b1= coef1(2);

x1= 0.6:1:0.9;
f2= a1*x1+b1;

f3= ones(1,34);

coef2= polyfit([35,40],[1,0],1);
a2= coef2(1);
b2= coef2(2);

x2= 36:1:39;
f4= -a2*x2+b2;

f5=zeros(1,Fs/2-40);

fk= [f1,f2,f3,f4,f5];

% ============== 

X=Y.*fk;

xf= real(ifft(X));
xmax=xf/max(abs(xf));
filename = 'Filtered_ECG.wav';
audiowrite(filename,xmax,Fs);

% [S,Fs] = audioread(filename);
% sound(S,Fs);

