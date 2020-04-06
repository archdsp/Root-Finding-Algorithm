n = 5;
x0 = 0.5;
x1 = 0.8;
root = secant(n, x0, x1);
fprintf(1, "반복횟수 = %d, 초기값 = %f, %f 추정된 근 = %f\n", n, x0, x1, root);

% 5회부터 100회까지 반복 횟수를 변화해가며 그래프 작성
x = 5:1:100;
y = arrayfun(@(x_i)  secant(x_i, x0, x1), x);
plot(x, y)

function y = f(x)
y = sin(sqrt(x)) - x;
end

function root = secant(n, x0, x1)
root = x0;
for i=1:n
    if f(x1) == f(x0)
        return
    end
    new_x = x1 - (f(x1) * ((x1 - x0)) / (f(x1) - f(x0)));
    x0 = x1;
    x1 =  new_x;    
end
root = x1;
end