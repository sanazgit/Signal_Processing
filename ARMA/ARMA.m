clc;
clear;

y= zeros(1,20);

y(1,1)=0.2;
y(1,2)= 0.1;
y(1,3)=0.55;

for n=4:20
    y(1,n)= 0.5*y(1,n-1)+ 0.1*y(1,n-3);      
end

plot(y);
title('ARMA')
xlabel('n');
ylabel('y[n]');

fvtool(y,'impulse')