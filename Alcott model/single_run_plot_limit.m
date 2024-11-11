figure

subplot(3, 2, 1); % 创建 4 行 1 列的子图，第一行
hold on; % 保持图像
plot(state.time/10e5, state.P_P_limitation, 'r', 'DisplayName', 'P');
plot(state.time/10e5, state.P_N_limitation, 'b', 'DisplayName', 'N');
hold off;

xlabel('Time');
ylabel('Relative proportion (%)');
title('Proximal area');
legend('Location', 'best');
grid on;

% 绘制 D 图
subplot(3, 2, 2); % 第二行
hold on; % 保持图像
plot(state.time/10e5, state.D_P_limitation, 'r', 'DisplayName', 'P');
plot(state.time/10e5, state.D_N_limitation, 'b', 'DisplayName', 'N');
hold off;

xlabel('Time');
ylabel('Relative proportion (%)');
title('Distal area');
legend('Location', 'best');
grid on;

% 绘制 S 图
subplot(3, 2, 3); % 第三行
hold on; % 保持图像
plot(state.time/10e5, state.S_P_limitation, 'r', 'DisplayName', 'P');
plot(state.time/10e5, state.S_N_limitation, 'b', 'DisplayName', 'N');
hold off;

xlabel('Time');
ylabel('Relative proportion (%)');
title('Surface Ocean');
legend('Location', 'best');
grid on;

% 绘制 DP 图
subplot(3, 2, 4); % 第四行
hold on; % 保持图像
plot(state.time/10e5, state.DP_P_limitation, 'r', 'DisplayName', 'P');
plot(state.time/10e5, state.DP_N_limitation, 'b', 'DisplayName', 'N');
hold off;

xlabel('Time');
ylabel('Relative proportion (%)');
title('Deep ocean');
legend('Location', 'best');
grid on;


subplot(3, 2, 5);
hold on; % 保持图像
semilogy(state.time/10e5, log10(state.P_change), 'r', 'DisplayName', 'P'); % P_change 使用红色
semilogy(state.time/10e5, log10(state.D_change), 'g', 'DisplayName', 'D'); % D_change 使用绿色
semilogy(state.time/10e5, log10(state.S_change), 'b', 'DisplayName', 'S'); % S_change 使用蓝色
semilogy(state.time/10e5, log10(state.DP_change), 'm', 'DisplayName', 'DP'); % DP_change 使用洋红色
yline(log10(16), '--k', 'LineWidth', 2);


hold off;

% 添加标签和标题
xlabel('Time');
ylabel('The ratio of N to P (log10)');
title('N : P Over Time');
legend('Location', 'best'); % 显示图例
grid on; % 添加网格


subplot(3, 2, 6);
hold on; % 保持图像
semilogy(state.time/10e5, log10(state.N_P), 'r', 'DisplayName', 'P'); % N_P 使用红色
semilogy(state.time/10e5, log10(state.N_D), 'g', 'DisplayName', 'D'); % N_D 使用绿色
semilogy(state.time/10e5, log10(state.N_S), 'b', 'DisplayName', 'S'); % N_S 使用蓝色
semilogy(state.time/10e5, log10(state.N_DP), 'm', 'DisplayName', 'DP'); % N_DP 使用洋红色
hold off;

% 添加标签和标题
xlabel('Time');
ylabel('mol');
title('Bioavailability N Over Time');
legend('Location', 'best'); % 显示图例
grid on;

print(gcf, 'myplot.emf', '-dmeta',"-r600");
