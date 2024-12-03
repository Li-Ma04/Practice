figure
load('15N.mat')
d15Ntime = -1 * data(:,1);
d15Norg = data(:,2);
d15Nbulk = data(:,3);

subplot(2, 5, 1); % 创建 4 行 1 列的子图，第一行
hold on; % 保持图像
scatter(d15Ntime, d15Norg,5,'o')
hold on
scatter(d15Ntime, d15Nbulk,5,'+')
hold on

plot(state.time/10e5, state.NO3_15N_P, 'r', 'DisplayName', 'P');

hold off;

xlabel('Time');
ylabel('δ^{15}NO3 (‰)');
title('Proximal');
legend('org','bulk')
grid on;

% 绘制 D 图

subplot(2, 5, 2); % 第二行
hold on; % 保持图像
plot(state.time/10e5, state.NO3_15N_D, 'r', 'DisplayName', 'P');

hold off;

xlabel('Time');
ylabel('δ^{15}NO3 (‰)');
title('Distal');
grid on;
%%%%%%%%%%%%%%
subplot(2, 5, 3); % 第二行
hold on; % 保持图像
plot(state.time/10e5, state.NO3_15N_S, 'r', 'DisplayName', 'P');

hold off;

xlabel('Time');
ylabel('δ^{15}NO3 (‰)');
title('surface');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2, 5, 4); % 第二行
hold on; % 保持图像
plot(state.time/10e5, state.NO3_15N_DP, 'r', 'DisplayName', 'P');

hold off;

xlabel('Time');
ylabel('δ^{15}NO3 (‰)');
title('Deep ocean');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2, 5, 5); % 第二行
hold on; % 保持图像
plot(state.time/10e5, state.NH4_15N_P, 'r', 'DisplayName', 'P');

hold off;

xlabel('Time');
ylabel('δ^{15}NH4 (‰)');
title('Proximal');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2, 5, 6); % 第二行
hold on; % 保持图像
plot(state.time/10e5, state.NH4_15N_D, 'r', 'DisplayName', 'P');

hold off;

xlabel('Time');
ylabel('δ^{15}NH4 (‰)');
title('Distal');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2, 5, 7); % 第二行
hold on; % 保持图像
plot(state.time/10e5, state.NH4_15N_S, 'r', 'DisplayName', 'P');

hold off;

xlabel('Time');
ylabel('δ^{15}NH4 (‰)');
title('surface');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2, 5, 8); % 第二行
hold on; % 保持图像
plot(state.time/10e5, state.NH4_15N_DP, 'r', 'DisplayName', 'P');

hold off;

xlabel('Time');
ylabel('δ^{15}NH4 (‰)');
title('Deep ocean');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2, 5, 9); % 第二行
hold on; % 保持图像
plot(state.time/10e5, state.N_total, 'r', 'DisplayName', 'P');

hold off;

xlabel('Time');
ylabel('N_total');

grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2, 5, 10); % 第二行
hold on; % 保持图像
plot(state.time/10e5, state.N_15N, 'r', 'DisplayName', 'P');

hold off;

xlabel('Time');
ylabel('δ^{15}N (‰)');

grid on;
