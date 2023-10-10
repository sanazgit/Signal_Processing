clear

[x,Fs]=audioread('DTMF1(2).wav');

T = 1/Fs;  
L=length(x);
t = (0:L-1)*T;               


Y= fft(x);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);


%*******With hanning

x= x .* hanning(L);

Y2=fft(x);
Pa = abs(Y2/L);
Pb = Pa(1:L/2+1);
Pb(2:end-1) = 2*Pb(2:end-1);


f = Fs*(0:(L/2))/L;

figure

subplot(1,2,1), plot(f,P1),title('DTMF_ WH'),xlabel('f (Hz)'),ylabel('|P1(f)|');hold on
subplot(1,2,2), plot(f,Pb),title('DTMF_ H'),xlabel('f (Hz)'),ylabel('|Pb(f)|');hold off






