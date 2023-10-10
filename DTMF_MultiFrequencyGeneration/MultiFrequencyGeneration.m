Fs = 8000;                    % Sampling frequency
T = 1/Fs;                     % Sampling period
L = 4000;                     % Length of signal
t = (0:L-1)*T;                % Time vector



A = [4 6 8];

A= A / max(abs(A));

S = A(1,1)*sin(2*pi*800*t)+ A(1,2)*sin(2*pi*1500*t)+ A(1,3)*sin(2*pi*2300*t) ;          


filename = 'Multi-Frequency.wav';
audiowrite(filename,S,Fs);

[S,Fs] = audioread(filename);
sound(S,Fs);

S=S .* hanning(length(S));


Y=fft(S);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;
plot(f,P1) 
title('Multi-Frequency Generation')
xlabel('f (Hz)')
ylabel('|P1(f)|')