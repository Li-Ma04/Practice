figure

subplot(2,2,1)

% 定义6种固定不同的颜色 (例如红色、绿色、蓝色、青色、洋红、黄色)
colors = [
    1 0 0;   % 红色
    0 1 0;   % 绿色
    0 0 1;   % 蓝色
    0 1 1;   % 青色
    1 0 1;   % 洋红色
    1 1 0;   % 黄色
];

% 前两条线为虚线
p1 = semilogy(state.time/10e5, state.River_NH4, 'LineStyle', '--', 'Color', colors(1,:));
hold on;
p2 = semilogy(state.time/10e5, state.NH4_P_D, 'LineStyle', '--', 'Color', colors(2,:));

% 后四条线为实线
p3 = semilogy(state.time/10e5, state.PON_Min_P, 'LineStyle', '-', 'Color', colors(3,:));
p4 = semilogy(state.time/10e5, state.NH4_PP_P, 'LineStyle', '-', 'Color', colors(4,:));
p5 = semilogy(state.time/10e5, state.NH4_Nfix_P, 'LineStyle', '-', 'Color', colors(5,:));
p6 = semilogy(state.time/10e5, state.NO3_Nitri_P, 'LineStyle', '-', 'Color', colors(6,:));

% 添加标签和盒线
xlabel('Time (Ma)');
ylabel('NH4 proximal ');
box on;

% 使用图例，将 `state` 后面的信息作为图例项
legend({'River NH4', 'NH4 P D', 'PON Min P', 'NH4 PP P', 'NH4 Nfix P', 'NO3 Nitri P'});

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,2)

% 定义相同的6种固定不同的颜色
colors = [
    1 0 0;   % 红色
    0 1 0;   % 绿色
    0 0 1;   % 蓝色
    0 1 1;   % 青色
    1 0 1;   % 洋红色
    1 1 0;   % 黄色
];

% 前三条线为虚线，且颜色与前面保持一致，不与同图的其他线条重复
p1 = semilogy(state.time/10e5, state.NH4_P_D, 'LineStyle', '--', 'Color', colors(2,:)); % 绿色，与前面一致
hold on;
p2 = semilogy(state.time/10e5, state.NH4_D_S, 'LineStyle', '--', 'Color', colors(3,:)); % 蓝色，不与同图其他线重复
p3 = semilogy(state.time/10e5, state.NH4_DP_D, 'LineStyle', '--', 'Color', colors(4,:)); % 青色，不与同图其他线重复

% 后四条线为实线，且颜色不重复
p4 = semilogy(state.time/10e5, state.PON_Min_D, 'LineStyle', '-', 'Color', colors(5,:));  % 洋红色，不与同图其他线重复
p5 = semilogy(state.time/10e5, state.NH4_PP_D, 'LineStyle', '-', 'Color', colors(6,:));  % 黄色，不与同图其他线重复
p6 = semilogy(state.time/10e5, state.NH4_Nfix_D, 'LineStyle', '-', 'Color', colors(1,:));  % 红色，不与同图其他线重复
p7 = semilogy(state.time/10e5, state.NO3_Nitri_D, 'LineStyle', '-', 'Color', [0.5 0.5 0.5]);  % 新颜色，灰色

% 添加标签和盒线
xlabel('Time (Ma)');
ylabel('NH4 distal');
box on;

% 使用图例，将 `state` 后面的信息作为图例项
legend({'NH4 P D', 'NH4 D S', 'NH4 DP D', 'PON Min D', 'NH4 PP D', 'NH4 Nfix D', 'NO3 Nitri D'});



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,3)

% 定义相同的6种固定不同的颜色
colors = [
    1 0 0;   % 红色
    0 1 0;   % 绿色
    0 0 1;   % 蓝色
    0 1 1;   % 青色
    1 0 1;   % 洋红色
    1 1 0;   % 黄色
];

% 前三条线为虚线，且颜色与前面保持一致，不与同图的其他线条重复
p1 = semilogy(state.time/10e5, state.NH4_D_S, 'LineStyle', '--', 'Color', colors(3,:)); % 蓝色，与前面保持一致
hold on;
p2 = semilogy(state.time/10e5, state.NH4_S_DP, 'LineStyle', '--', 'Color', colors(1,:)); % 红色，避免重复
p3 = semilogy(state.time/10e5, state.NH4_DP_S, 'LineStyle', '--', 'Color', colors(2,:)); % 绿色，避免重复

% 后四条线为实线，且颜色不重复
p4 = semilogy(state.time/10e5, state.PON_Min_S, 'LineStyle', '-', 'Color', colors(4,:));  % 青色，避免重复
p5 = semilogy(state.time/10e5, state.NH4_PP_S, 'LineStyle', '-', 'Color', colors(5,:));  % 洋红色，与前面保持一致
p6 = semilogy(state.time/10e5, state.NH4_Nfix_S, 'LineStyle', '-', 'Color', colors(6,:));  % 黄色，与前面保持一致
p7 = semilogy(state.time/10e5, state.NO3_Nitri_S, 'LineStyle', '-', 'Color', [0.5 0.5 0.5]);  % 新颜色，灰色，避免重复

% 添加标签和盒线
xlabel('Time (Ma)');
ylabel('NH4 surface');
box on;

% 使用图例，将 `state` 后面的信息作为图例项
legend({'NH4 D S', 'NH4 S DP', 'NH4 DP S', 'PON Min S', 'NH4 PP S', 'NH4 Nfix S', 'NO3 Nitri S'});

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,4)

% 定义相同的6种固定不同的颜色
colors = [
    1 0 0;   % 红色
    0 1 0;   % 绿色
    0 0 1;   % 蓝色
    0 1 1;   % 青色
    1 0 1;   % 洋红色
    1 1 0;   % 黄色
];

% 前两条线为虚线，且颜色与前面保持一致，不与同图的其他线条重复
p1 = semilogy(state.time/10e5, state.NH4_S_DP, 'LineStyle', '--', 'Color', colors(1,:)); % 红色，与前面保持一致
hold on;
p2 = semilogy(state.time/10e5, state.NH4_DP_S, 'LineStyle', '--', 'Color', colors(2,:)); % 绿色，与前面保持一致

% 后三条线为实线，且颜色不重复
p3 = semilogy(state.time/10e5, state.NH4_DP_D, 'LineStyle', '--', 'Color', colors(3,:));  % 蓝色，保持一致
p4 = semilogy(state.time/10e5, state.PON_Min_DP, 'LineStyle', '-', 'Color', colors(4,:));  % 青色，保持一致
p5 = semilogy(state.time/10e5, state.NO3_Nitri_DP, 'LineStyle', '-', 'Color', [0.5 0.5 0.5]);  % 灰色，避免重复

% 添加标签和盒线
xlabel('Time (Ma)');
ylabel('NH4 deep ocean');
box on;

% 使用图例，将 `state` 后面的信息作为图例项
legend({'NH4 S DP', 'NH4 DP S', 'NH4 DP D', 'PON Min DP', 'NO3 Nitri DP'});







