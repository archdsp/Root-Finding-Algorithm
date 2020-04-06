n = 5;
x0 = 0.5;

syms x 
fx = sin(sqrt(x)) - x; 
f_prime = diff(fx,x);

root = newton_rapson(fx, f_prime, n, x0);
fprintf(1, "반복횟수 = %d, 초기값 = %f, 추정된 근 = %f\n", n, x0, root);
 
% 5회부터 10회까지 반복 횟수를 변화해가며 그래프 작성
x_range = 5:1:100;
y = arrayfun(@(x_i)  newton_rapson2(x_i, x0), x_range);
plot(x_range, y)

function y = f(x)
y = sin(sqrt(x)) - x;
end

function y = f_p(x)
y = cos(x^(1/2))/(2*x^(1/2)) - 1;
end

function root = newton_rapson(f, f_prime, n, x0)
root = x0;
for i = 1:nD
    root = root - (subs(f, 'x', root) / subs(f_prime, 'x', root));
end
root = double(root);
end

%% symbolic 을 이용한 계산이 느리기 때문에 도함수를 직접 써서 계산합니다
function root = newton_rapson2(n, x0)
root = x0;
for i = 1:n
    root = root - (f(root) / f_p(root));
end
end
