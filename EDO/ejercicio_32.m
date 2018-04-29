format long;
clear all;
close all;
clc;

%Ejercicio 3_2
%PVI
f = @(t, y) y + 2*exp(-1*t);
y0 = 1;
I = [0,1];
h1 = 1/10;
m1 = 1/h1;
[T,Wt1,kt1] = mTrapE_estados(f, y0, I, m1);

%Solucion exacta
y = @(t) (2-exp(-2*t))*exp(t);

%error global 1
Et_1=abs(y(1)-Wt1(end));

%hacemos h mas pequena
h2 = h1*0.5;
m2 = 1/h2;
[T,Wt2,kt2] = mTrapE_estados(f, y0, I, m2);

%error global 2
Et_2=abs(y(1)-Wt2(end));

%Runge-Kutta 4
[T,Wrk1,krk1] = mRK4_estados(f, y0, I, m1);

%error global 1
Erk4_1=abs(y(1)-Wrk1(end));

l = {'Error (global en t = 1)';'numero de estados'};
Trapecio_h1 = [Et_1; kt1];
Trapecio_h2 = [Et_2;kt2];
RK4_h1 = [Erk4_1;krk1];

T = table(l,Trapecio_h1,Trapecio_h2,RK4_h1)