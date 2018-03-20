%Laboratorio 20/marzo/2018

%opts = odeset('RelTol',1e-4,'Refine',1,'Maxstep',1);
%[T,W] = ode45(@(t,y)t.*y+t.^3,[0,1],opts);
f = @(t,y) 10*(1-y)
y0 = 0.5;
I = [0,1];
tol = 1e-4;
[ T, W ] = mRK23( f, y0, I, tol )

plot(T, W, '-*')