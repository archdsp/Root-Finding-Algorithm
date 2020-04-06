n = 5;
x0 = 0.5;
root = fixed_point(n, x0);
fprintf(1, "반복횟수 = %d, 초기값 = %f, 추정된 근 = %f\n", n, x0, root);

% 5회부터 100회까지 반복 횟수를 변화해가며 그래프 작성
x = 5:1:100;
y = arrayfun(@(x_i)  fixed_point(x_i, x0), x);
plot(x, y)

function root = fixed_point(n, x0)
root = x0;
for i=1:n
    root = sin(sqrt(root));
end
end