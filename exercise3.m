n = 5;
x_l = 0.6;
x_u = 0.8;
root = false_position(n, x_l, x_u);
fprintf(1, "반복횟수 = %d, 범위 [%f, %f], 추정된 근 = %f\n", n, x_l, x_u, root);
 
% 5회부터 100회까지 반복 횟수를 변화해가며 그래프 작성
x = 5:1:100;
y = arrayfun(@(x_i)  false_position(x_i, x_l, x_u), x);
plot(x, y)

function y = f(x)
y = sin(sqrt(x)) - x;
end

% false_position
function root = false_position(n, left, right)
mid = 0;
root = 0;
for i = 1:n
    mid = (f(right) - f(left)) / (right - left);
    root = left - (f(left) / mid);
    if f(left) * f(root) < 0 || f(root) * f(right) > 0
        right = root;
    else
        left = root;
    end
end
end

