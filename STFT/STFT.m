clear;clc;

[x,Fs]=audioread('Speech-8kHz.wav');
L_total=length(x); % Total signal length
N=256; 			% Frame Size  ( Length )
R=floor(N/2);	% Frame Shift ( Step )
M=floor( (L_total-N)/R + 1 ); % Number of Frames

X_spec= zeros(N,M-1);
x=x./max(abs(x)); % Normalised Signal

for m=1:M-1
    
   x_one_frame = x(1+(m)*R : N+(m)*R );
   win= hanning(length(x_one_frame));
   Xk= fft((x_one_frame.*win),N);
   
   Xk_db= 20*log10(eps + abs(Xk));
   
   X_spec(:,m)= Xk_db;
   
end

subplot(2,1,1)
imagesc(X_spec); title('2D plot of STFT')
% image(X_spec)
xlabel('Time')
ylabel('Frequency')

subplot(2,1,2)
mesh(X_spec); title('3D plot of STFT')
xlabel('Time')
ylabel('Frequency')
zlabel('Power of Frequency')

 