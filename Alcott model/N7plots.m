
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%   Plotting script   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Need to transpose initially to get Confidence intervals
NO3_PP_PCI = real(sens.NO3_PP_P.');
NO3_PP_DCI = real(sens.NO3_PP_D.');
NO3_PP_SCI = real(sens.NO3_PP_S.');
NO3_DPconcCI = real(sens.NO3_DPconc.');
NH4_Nfix_PCI = real(sens.NH4_Nfix_P.');
NH4_Nfix_DCI = real(sens.NH4_Nfix_D.');
NH4_Nfix_SCI = real(sens.NH4_Nfix_S.');
NH4_DPconcCI = real(sens.NH4_DPconc.');
PON_Min_PCI = real(sens.PON_Min_P.');
PON_Min_DCI = real(sens.PON_Min_D.');
PON_Min_SCI = real(sens.PON_Min_S.');
PON_Min_DPCI = real(sens.PON_Min_DP.');
N_totalCI = real(sens.N_total.');
NH4_PP_PCI = real(sens.NH4_PP_P.');
NH4_PP_DCI = real(sens.NH4_PP_D.');
NH4_PP_SCI = real(sens.NH4_PP_S.');
O2_PconcCI = real(sens.O2_Pconc.');
O2_DconcCI = real(sens.O2_Dconc.');
O2_SconcCI = real(sens.O2_Sconc.');
O2_DPconcCI = real(sens.O2_DPconc.');

%% Confidence intervals
NO3_PP_P95quant = quantile(NO3_PP_PCI,[0.05 0.95]);
NO3_PP_D95quant = quantile(NO3_PP_DCI,[0.05 0.95]);
NO3_PP_S95quant = quantile(NO3_PP_SCI,[0.05 0.95]);
NO3_DPconc95quant = quantile(NO3_DPconcCI,[0.05 0.95]);
NH4_Nfix_P95quant = quantile(NH4_Nfix_PCI,[0.05 0.95]);
NH4_Nfix_D95quant = quantile(NH4_Nfix_DCI,[0.05 0.95]);
NH4_Nfix_S95quant = quantile(NH4_Nfix_SCI,[0.05 0.95]);
NH4_DPconc95quant = quantile(NH4_DPconcCI,[0.05 0.95]);
PON_Min_P95quant = quantile(PON_Min_PCI,[0.05 0.95]);
PON_Min_D95quant = quantile(PON_Min_DCI,[0.05 0.95]);
PON_Min_S95quant = quantile(PON_Min_SCI,[0.05 0.95]);
PON_Min_DP95quant = quantile(PON_Min_DPCI,[0.05 0.95]);
N_total95quant = quantile(N_totalCI,[0.05 0.95]);
NH4_PP_P95quant = quantile(NH4_PP_PCI,[0.05 0.95]);
NH4_PP_D95quant = quantile(NH4_PP_DCI,[0.05 0.95]);
NH4_PP_S95quant = quantile(NH4_PP_SCI,[0.05 0.95]);
O2_Pconc95quant = quantile(O2_PconcCI,[0.05 0.95]);
O2_Dconc95quant = quantile(O2_DconcCI,[0.05 0.95]);
O2_Sconc95quant = quantile(O2_SconcCI,[0.05 0.95]);
O2_DPconc95quant = quantile(O2_DPconcCI,[0.05 0.95]);


%% Medians
NO3_PP_P95median = quantile(NO3_PP_PCI,[0.5]);
NO3_PP_D95median = quantile(NO3_PP_DCI,[0.5]);
NO3_PP_S95median = quantile(NO3_PP_SCI,[0.5]);
NO3_DPconc95median = quantile(NO3_DPconcCI,[0.5]);
NH4_Nfix_P95median = quantile(NH4_Nfix_PCI,[0.5]);
NH4_Nfix_D95median = quantile(NH4_Nfix_DCI,[0.5]);
NH4_Nfix_S95median = quantile(NH4_Nfix_SCI,[0.5]);
NH4_DPconc95median = quantile(NH4_DPconcCI,[0.5]);
PON_Min_P95median = quantile(PON_Min_PCI,[0.5]);
PON_Min_D95median = quantile(PON_Min_DCI,[0.5]);
PON_Min_S95median = quantile(PON_Min_SCI,[0.5]);
PON_Min_DP95median = quantile(PON_Min_DPCI,[0.5]);
N_total95median = quantile(N_totalCI,[0.5]);
NH4_PP_P95median = quantile(NH4_PP_PCI,[0.5]);
NH4_PP_D95median = quantile(NH4_PP_DCI,[0.5]);
NH4_PP_S95median = quantile(NH4_PP_SCI,[0.5]);
O2_Pconc95median = quantile(O2_PconcCI,[0.5]);
O2_Dconc95median = quantile(O2_DconcCI,[0.5]);
O2_Sconc95median = quantile(O2_SconcCI,[0.5]);
O2_DPconc95median = quantile(O2_DPconcCI,[0.5]);

global starting
%%%%%% define colours
colors = [0.2 0.6 0.6; % 配色1
          0.6 0.2 0.6; % 配色2
          0.6 0.6 0.2; % 配色3
          0.2 0.2 0.6]; % 配色4

%%%% output to screen
fprintf('running sens plotting script... \t')
tic

%%%% make column vector
sens.time_myr = sens.time(:,1) /1e6 ;
%% Call in data
figure('Color',[0.80 0.80 0.70])

%N_total
% load('Havigd13C.mat')
% d13Ctime = -1 * Havigd13C(:,1);
% d13Ccalcite = Havigd13C(:,2);
% d13Cdolomite = Havigd13C(:,3);
% d13Cother = Havigd13C(:,4);

subplot(3,2,1)
% 定义配色矩阵
colors = [0.2 0.6 0.6; % 配色1: P
          0.6 0.2 0.6; % 配色2: D
          0.6 0.6 0.2; % 配色3: S
          0.2 0.2 0.6]; % 配色4: DP

% 子图 1: N_total, NO3_PP_D, NO3_PP_S, NO3_DPconc
subplot(3,2,1)
fill([sens.time_myr; flip(sens.time_myr)],[N_total95quant(1, :), flip(N_total95quant(2, :))],colors(1, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
hold on;
plot(sens.time_myr, N_total95median, 'linewidth', 1.5, 'color', colors(1, :));
box on;
xlim([-4e3 0]);
set(gca, 'YScale', 'log');
yticks([1e15, 1e16, 1e17]); % 设置指定刻度
ylim([1e15 1e17]);
xlabel('Time (Ma)');
ylabel('Total N');

subplot(3,2,2)
fill([sens.time_myr; flip(sens.time_myr)],[NH4_Nfix_P95quant(1, :), flip(NH4_Nfix_P95quant(2, :))],colors(1, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
hold on;
plot(sens.time_myr, NH4_Nfix_P95median, 'linewidth', 1.5, 'color', colors(1, :));

fill([sens.time_myr; flip(sens.time_myr)],[NH4_Nfix_D95quant(1, :), flip(NH4_Nfix_D95quant(2, :))],colors(2, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
plot(sens.time_myr, NH4_Nfix_D95median, 'linewidth', 1.5, 'color', colors(2, :));

fill([sens.time_myr; flip(sens.time_myr)],[NH4_Nfix_S95quant(1, :), flip(NH4_Nfix_S95quant(2, :))],colors(3, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
plot(sens.time_myr, NH4_Nfix_S95median, 'linewidth', 1.5, 'color', colors(3, :));



%yticks([1e-6, 1e-5,1e-4, 1e-3, 1e-2]);
xlim([-4e3 0]);
yticks([0, 2e12, 4e12, 6e12, 8e12, 10e12, 12e12, 14e12]); % 设置指定刻度
ylim([0 14e12]);
box on;
xlabel('Time (Ma)');
ylabel('Nfix');


subplot(3,2,3)
fill([sens.time_myr; flip(sens.time_myr)],[PON_Min_P95quant(1, :), flip(PON_Min_P95quant(2, :))],colors(1, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
hold on;
semilogy(sens.time_myr, PON_Min_P95median, 'linewidth', 1.5, 'color', colors(1, :));

fill([sens.time_myr; flip(sens.time_myr)],[PON_Min_D95quant(1, :), flip(PON_Min_D95quant(2, :))],colors(2, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
semilogy(sens.time_myr, PON_Min_D95median, 'linewidth', 1.5, 'color', colors(2, :));

fill([sens.time_myr; flip(sens.time_myr)],[PON_Min_S95quant(1, :), flip(PON_Min_S95quant(2, :))],colors(3, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
semilogy(sens.time_myr, PON_Min_S95median, 'linewidth', 1.5, 'color', colors(3, :));

fill([sens.time_myr; flip(sens.time_myr)],[PON_Min_DP95quant(1, :), flip(PON_Min_DP95quant(2, :))],colors(4, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
semilogy(sens.time_myr, PON_Min_DP95median, 'linewidth', 1.5, 'color', colors(4, :));
xlim([-4e3 0]);
yticks([1e8, 1e10, 1e12, 1e14, 1e16]); % 设置指定刻度
ylim([1e8 1e16]);
box on;
set(gca, 'YScale', 'log');
xlabel('Time (Ma)');
ylabel('Nmin');




subplot(3,2,4)
fill([sens.time_myr; flip(sens.time_myr)],[NO3_PP_P95quant(1, :), flip(NO3_PP_P95quant(2, :))],colors(1, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
hold on;
semilogy(sens.time_myr,NO3_PP_P95median, 'linewidth', 1.5, 'color', colors(1, :), 'DisplayName', 'P Median');

fill([sens.time_myr; flip(sens.time_myr)],[NO3_PP_D95quant(1, :), flip(NO3_PP_D95quant(2, :))],colors(2, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
semilogy(sens.time_myr, NO3_PP_D95median, 'linewidth', 1.5, 'color', colors(2, :), 'DisplayName', 'D Median');

fill([sens.time_myr; flip(sens.time_myr)],[NO3_PP_S95quant(1, :), flip(NO3_PP_S95quant(2, :))],colors(3, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
semilogy(sens.time_myr, NO3_PP_S95median, 'linewidth', 1.5, 'color', colors(3, :), 'DisplayName', 'S Median');
box on;
set(gca, 'YScale', 'log');
%yticks([1e-6,1e-5, 1e-4, 1e-3, 1e-2]);
xlim([-4e3 0]);
yticks([1e6,1e8, 1e10, 1e12, 1e14, 1e16]); % 设置指定刻度
ylim([1e6 1e16]);
xlabel('Time (Ma)');
ylabel('NO3PP');
legend('Location', 'best');

% 子图 2: NH4_Nfix_P, NH4_Nfix_D, NH4_Nfix_S, NH4_DPconc

% 子图 3: Redfield N:P limitation



% 子图 5: Denitrification
% 子图 5: Denitrification
subplot(3,2,5)

fill([sens.time_myr; flip(sens.time_myr)],[NH4_PP_P95quant(1, :), flip(NH4_PP_P95quant(2, :))],colors(1, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
hold on;
semilogy(sens.time_myr, NH4_PP_P95median, 'linewidth', 1.5, 'color', colors(1, :));

fill([sens.time_myr; flip(sens.time_myr)],[NH4_PP_D95quant(1, :), flip(NH4_PP_D95quant(2, :))],colors(2, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
semilogy(sens.time_myr, NH4_PP_D95median, 'linewidth', 1.5, 'color', colors(2, :));

fill([sens.time_myr; flip(sens.time_myr)],[NH4_PP_S95quant(1, :), flip(NH4_PP_S95quant(2, :))],colors(4, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
semilogy(sens.time_myr, NH4_PP_S95median, 'linewidth', 1.5, 'color', colors(4, :));
set(gca, 'YScale', 'log');
%yticks([1e-1, 1e2,1e5, 1e8, 1e11, 1e14]);
%yticks([1e-1, 1e2,1e5, 1e8, 1e11, 1e14]);
xlim([-4e3 0]);
yticks([1e8,1e10, 1e12, 1e14, 1e15]); % 设置指定刻度
ylim([1e8 1e15]);
box on;
xlabel('Time (Ma)');
ylabel('NH4PP');

% 子图 6: Nitrification
subplot(3,2,6)

fill([sens.time_myr; flip(sens.time_myr)],[O2_Pconc95quant(1, :), flip(O2_Pconc95quant(2, :))],colors(1, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
hold on;
semilogy(sens.time_myr, O2_Pconc95median, 'linewidth', 1.5, 'color', colors(1, :));

fill([sens.time_myr; flip(sens.time_myr)], [O2_Dconc95quant(1, :), flip(O2_Dconc95quant(2, :))],colors(2, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
semilogy(sens.time_myr, O2_Dconc95median, 'linewidth', 1.5, 'color', colors(2, :));

fill([sens.time_myr; flip(sens.time_myr)], [O2_Sconc95quant(1, :), flip(O2_Sconc95quant(2, :))],colors(3, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
semilogy(sens.time_myr, O2_Sconc95median, 'linewidth', 1.5, 'color', colors(3, :));

fill([sens.time_myr; flip(sens.time_myr)],[O2_DPconc95quant(1, :), flip(O2_DPconc95quant(2, :))],colors(4, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
semilogy(sens.time_myr, O2_DPconc95median, 'linewidth', 1.5, 'color', colors(4, :));
set(gca, 'YScale', 'log');
xlim([-4e3 0]);
yticks([1e-10,1e-8, 1e-6, 1e-4, 1e-2, 1e0]); % 设置指定刻度
ylim([1e-10 1e0]);
%yticks([1e3, 1e6,1e9, 1e12, 1e15]);
box on;
xlabel('Time (Ma)');
ylabel('O2');

% 导出为矢量图
exportgraphics(gcf, 'Figure5.pdf', 'ContentType', 'vector');
