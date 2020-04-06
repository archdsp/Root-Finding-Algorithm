syms f(x);
syms g(x);

f(x) = sin(sqrt(x)) - x
x = 0:0.01:2;
y = f(x);
plot(x, y);

line = refline(0,0)
