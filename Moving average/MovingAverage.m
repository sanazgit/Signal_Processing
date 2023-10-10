clc;
clear,

rng(1,'twister')


% Making Signal
Fs=32000;
nbit= 16;
f0=1000;
Ts= 1/Fs;

t= 0:Ts:0.005;

L= length(t);

x= 0.5*sin(2*pi*f0*t);

Xn= x + 0.1 * randn(1,L);


% Add MA Filter

for n= 1:161 

    sum= 0;

    for k=0:10

     z=n-k;
     
     if z>0 %ignore negative n
         sum= sum + Xn(1,z);   
     end
     
    end

  y(1,n)= 1/11*sum;
 
end

plot(Xn);
hold on
plot(y,'r');
title('MA')
xlabel('n');
ylabel('y[n]');


