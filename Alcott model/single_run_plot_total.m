figure


% 绘制 S 图
subplot(2, 2, 1); % 第三行
hold on; % 保持图像
plot(state.time/10e5, state.total_marine_NO3, 'r', 'DisplayName', 'P');
hold off;

xlabel('Time');
ylabel('NO3');
title('NO3');

grid on;

% 绘制 DP 图
subplot(2, 2, 2); % 第四行
hold on; % 保持图像
plot(state.time/10e5, state.total_marine_NH4, 'r', 'DisplayName', 'P');
hold off;

xlabel('Time');
ylabel('NH4');
title('NH4');
grid on;


subplot(2, 2, 3);
hold on; % 保持图像
semilogy(state.time/10e5, log10(state.NP_change), 'r', 'DisplayName', 'P'); % P_change 使用红色
yline(log10(16), '--k', 'LineWidth', 2);


hold off;

% 添加标签和标题
xlabel('Time');
ylabel('The ratio of N to P (log10)');
title('N : P Over Time');
grid on; % 添加网格


subplot(2, 2, 4); % 第四行
hold on; % 保持图像
plot(state.time/10e5, state.total_marine_SRP, 'r', 'DisplayName', 'P');
hold off;

xlabel('Time');
ylabel('SRP');
title('SRP');
grid on;

print(gcf, 'myplot.emf', '-dmeta',"-r600");
