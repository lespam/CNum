f = @(t,y) 2*(t+1).*y
y = @(t) 1+exp(t.*t + 2*t)

f(0:2,1:3)

[T,W] = mEE(f, 1, [0,1], 10)

plot(T, y(T), '-g');
hold on
plot(T, W, '.k');
hold off;
legend('y (exact)', 'w (aprox.)')
