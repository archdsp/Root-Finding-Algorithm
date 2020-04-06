n = 5;
x_l = 0.6;
x_u = 0.8;
root = bisection(n, x_l, x_u);
fprintf(1, "반복횟수 = %d, 범위 [%f, %f], 추정된 근 = %f\n", n, x_l, x_u, root);


% 5회부터 100회까지 반복 횟수를 변화해가며 그래프 작성
x = 5:1:100;
y = arrayfun(@(x_i)  bisection(x_i, x_l, x_u), x);
plot(x, y)

% f(x) = sin(sqrt(x)) - x;
function y = f(x)
y = sin(sqrt(x)) - x;
end

% bisection
function mid = bisection(n, left, right)
mid = 0;
for i = 1:n
    mid = (left + right) / 2;    
    if f(left) * f(mid) > 0
        left = mid;
    else
        right = mid;
    end
end
end

