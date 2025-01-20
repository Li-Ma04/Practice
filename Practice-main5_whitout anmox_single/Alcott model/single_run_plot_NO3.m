figure

subplot(2,2,1)

% 定义相同的6种固定不同的颜色
colors = [
    1 0 0;   % 红色
    0 1 0;   % 绿色
    0 0 1;   % 蓝色
    0 1 1;   % 青色
    1 0 1;   % 洋红色
    1 1 0;   % 黄色
];

% 前两条线为虚线
p1 = semilogy(state.time/10e5, state.River_NO3, 'LineStyle', '--', 'Color', colors(1,:)); % 红色虚线
hold on;
p2 = semilogy(state.time/10e5, state.NO3_P_D, 'LineStyle', '--', 'Color', colors(2,:));   % 绿色虚线

% 后三条线为实线
p3 = semilogy(state.time/10e5, state.NO3_denit_P, 'LineStyle', '-', 'Color', colors(3,:)); % 蓝色实线
p4 = semilogy(state.time/10e5, state.NO3_Nitri_P, 'LineStyle', '-', 'Color', colors(4,:)); % 青色实线
p5 = semilogy(state.time/10e5, state.NO3_PP_P, 'LineStyle', '-', 'Color', colors(5,:));   % 洋红色实线

% 添加标签、图例和盒线
xlabel('Time (Ma)');
ylabel('NO3 Proximal ');
legend({'R-NO3', 'NO3P-D', 'NO3denit', 'NO3nitri', 'NO3pp'});
box on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

% 前三条线为虚线
p1 = semilogy(state.time/10e5, state.NO3_P_D, 'LineStyle', '--', 'Color', colors(1,:)); % 红色
hold on;
p2 = semilogy(state.time/10e5, state.NO3_D_S, 'LineStyle', '--', 'Color', colors(2,:)); % 绿色
p3 = semilogy(state.time/10e5, state.NO3_DP_D, 'LineStyle', '--', 'Color', colors(6,:)); % 蓝色

% 后三条线为实线
p4 = semilogy(state.time/10e5, state.NO3_denit_D, 'LineStyle', '-', 'Color', colors(3,:)); % 青色
p5 = semilogy(state.time/10e5, state.NO3_Nitri_D, 'LineStyle', '-', 'Color', colors(4,:)); % 洋红色
p6 = semilogy(state.time/10e5, state.NO3_PP_D, 'LineStyle', '-', 'Color', colors(5,:));   % 黄色

% 添加标签、图例和盒线
xlabel('Time (Ma)');
ylabel('NO3 distal');
legend({'NO3P-D', 'NO3 D S', 'NO3 DP D', 'NO3 denit', 'NO3 nitri', 'NO3 PP D'});
box on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

% 前三条线为虚线
p1 = semilogy(state.time/10e5, state.NO3_D_S, 'LineStyle', '--', 'Color', colors(1,:)); % 红色
hold on;
p2 = semilogy(state.time/10e5, state.NO3_S_DP, 'LineStyle', '--', 'Color', colors(2,:)); % 绿色
p3 = semilogy(state.time/10e5, state.NO3_DP_S, 'LineStyle', '--', 'Color', colors(6,:)); % 蓝色

% 后三条线为实线
p4 = semilogy(state.time/10e5, state.NO3_denit_S, 'LineStyle', '-', 'Color', colors(3,:)); % 青色
p5 = semilogy(state.time/10e5, state.NO3_Nitri_S, 'LineStyle', '-', 'Color', colors(4,:)); % 洋红色
p6 = semilogy(state.time/10e5, state.NO3_PP_S, 'LineStyle', '-', 'Color', colors(5,:));   % 黄色

% 添加标签、图例和盒线
xlabel('Time (Ma)');
ylabel('NO3 surface');
legend({'NO3 D S', 'NO3 S DP', 'NO3 DP S', 'NO3 denit', 'NO3 nitri', 'NO3 PP S'});
box on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

% 前三条线为虚线
p1 = semilogy(state.time/10e5, state.NO3_S_DP, 'LineStyle', '--', 'Color', colors(1,:)); % 红色虚线
hold on;
p2 = semilogy(state.time/10e5, state.NO3_DP_S, 'LineStyle', '--', 'Color', colors(2,:)); % 绿色虚线
p3 = semilogy(state.time/10e5, state.NO3_DP_D, 'LineStyle', '--', 'Color', colors(6,:)); % 蓝色虚线

% 后两条线为实线
p4 = semilogy(state.time/10e5, state.NO3_denit_DP, 'LineStyle', '-', 'Color', colors(3,:)); % 青色实线
p5 = semilogy(state.time/10e5, state.NO3_Nitri_DP, 'LineStyle', '-', 'Color', colors(4,:)); % 洋红色实线

% 添加标签、图例和盒线
xlabel('Time (Ma)');
ylabel('NO3 deep ocean');
legend({'NO3 S DP', 'NO3 DP S', 'NO3 DP D', 'NO3 denit', 'NO3 nitri'});
box on;







