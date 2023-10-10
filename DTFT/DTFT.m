clc;
clear;

w= -pi: 0.01: pi;
alfha= 0.7;

magnitude= 1 ./ sqrt((1- alfha * cos(w)).^2 + (alfha * sin(w)).^2);
phase= -atan((alfha .* sin(w))./ (1 - alfha .* cos(w)));

subplot(2,1,1);
plot(magnitude)
title('Subplot 1: magnitude')
subplot(2,1,2);
plot(phase)
title('Subplot 2: phase')



