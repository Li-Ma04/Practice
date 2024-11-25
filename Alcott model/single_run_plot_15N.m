figure
load('15N.mat')
d15Ntime = -1 * data(:,1);
d15Norg = data(:,2);
d15Nbulk = data(:,3);

subplot(1, 2, 1); % 创建 4 行 1 列的子图，第一行
hold on; % 保持图像
scatter(d15Ntime, d15Norg,5,'o')
hold on
scatter(d15Ntime, d15Nbulk,5,'+')
hold on

plot(state.time/10e5, state.d15N, 'r', 'DisplayName', 'P');

hold off;

xlabel('Time');
ylabel('δ^{15}N (‰)');
title('Proximal area');
legend('org','bulk')
grid on;

% 绘制 D 图

subplot(1, 2, 2); % 第二行
hold on; % 保持图像
plot(state.time/10e5, state.d15N_TN, 'r', 'DisplayName', 'P');

hold off;

xlabel('Time');
ylabel('Relative proportion (%)');
title('Distal area');
legend('Location', 'best');
grid on;


