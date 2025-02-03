
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%   Plotting script   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Need to transpose initially to get Confidence intervals
NO3_PconcCI = real(sens.NO3_Pconc.');
NO3_DconcCI = real(sens.NO3_Dconc.');
NO3_SconcCI = real(sens.NO3_Sconc.');
NO3_DPconcCI = real(sens.NO3_DPconc.');
NH4_PconcCI = real(sens.NH4_Pconc.');
NH4_DconcCI = real(sens.NH4_Dconc.');
NH4_SconcCI = real(sens.NH4_Sconc.');
NH4_DPconcCI = real(sens.NH4_DPconc.');
P_changeCI = real(sens.P_change.');
D_changeCI = real(sens.D_change.');
S_changeCI = real(sens.S_change.');
DP_changeCI = real(sens.DP_change.');
N_15NCI = real(sens.N_15N.');
NO3_denit_P_waterCI = real(sens.NO3_denit_P_water.');
NO3_denit_D_waterCI = real(sens.NO3_denit_D_water.');
NO3_denit_DP_waterCI = real(sens.NO3_denit_DP_water.');
NO3_Nitri_PCI = real(sens.NO3_Nitri_P.');
NO3_Nitri_DCI = real(sens.NO3_Nitri_D.');
NO3_Nitri_SCI = real(sens.NO3_Nitri_S.');
NO3_Nitri_DPCI = real(sens.NO3_Nitri_DP.');

%% Confidence intervals
NO3_Pconc95quant = quantile(NO3_PconcCI,[0.05 0.95]);
NO3_Dconc95quant = quantile(NO3_DconcCI,[0.05 0.95]);
NO3_Sconc95quant = quantile(NO3_SconcCI,[0.05 0.95]);
NO3_DPconc95quant = quantile(NO3_DPconcCI,[0.05 0.95]);
NH4_Pconc95quant = quantile(NH4_PconcCI,[0.05 0.95]);
NH4_Dconc95quant = quantile(NH4_DconcCI,[0.05 0.95]);
NH4_Sconc95quant = quantile(NH4_SconcCI,[0.05 0.95]);
NH4_DPconc95quant = quantile(NH4_DPconcCI,[0.05 0.95]);
P_change95quant = quantile(P_changeCI,[0.05 0.95]);
D_change95quant = quantile(D_changeCI,[0.05 0.95]);
S_change95quant = quantile(S_changeCI,[0.05 0.95]);
DP_change95quant = quantile(DP_changeCI,[0.05 0.95]);
N_15N95quant = quantile(N_15NCI,[0.05 0.95]);
NO3_denit_P_water95quant = quantile(NO3_denit_P_waterCI,[0.05 0.95]);
NO3_denit_D_water95quant = quantile(NO3_denit_D_waterCI,[0.05 0.95]);
NO3_denit_DP_water95quant = quantile(NO3_denit_DP_waterCI,[0.05 0.95]);
NO3_Nitri_P95quant = quantile(NO3_Nitri_PCI,[0.05 0.95]);
NO3_Nitri_D95quant = quantile(NO3_Nitri_DCI,[0.05 0.95]);
NO3_Nitri_S95quant = quantile(NO3_Nitri_SCI,[0.05 0.95]);
NO3_Nitri_DP95quant = quantile(NO3_Nitri_DPCI,[0.05 0.95]);


%% Medians
NO3_Pconc95median = quantile(NO3_PconcCI,[0.5]);
NO3_Dconc95median = quantile(NO3_DconcCI,[0.5]);
NO3_Sconc95median = quantile(NO3_SconcCI,[0.5]);
NO3_DPconc95median = quantile(NO3_DPconcCI,[0.5]);
NH4_Pconc95median = quantile(NH4_PconcCI,[0.5]);
NH4_Dconc95median = quantile(NH4_DconcCI,[0.5]);
NH4_Sconc95median = quantile(NH4_SconcCI,[0.5]);
NH4_DPconc95median = quantile(NH4_DPconcCI,[0.5]);
P_change95median = quantile(P_changeCI,[0.5]);
D_change95median = quantile(D_changeCI,[0.5]);
S_change95median = quantile(S_changeCI,[0.5]);
DP_change95median = quantile(DP_changeCI,[0.5]);
N_15N95median = quantile(N_15NCI,[0.5]);
NO3_denit_P_water95median = quantile(NO3_denit_P_waterCI,[0.5]);
NO3_denit_D_water95median = quantile(NO3_denit_D_waterCI,[0.5]);
NO3_denit_DP_water95median = quantile(NO3_denit_DP_waterCI,[0.5]);
NO3_Nitri_P95median = quantile(NO3_Nitri_PCI,[0.5]);
NO3_Nitri_D95median = quantile(NO3_Nitri_DCI,[0.5]);
NO3_Nitri_S95median = quantile(NO3_Nitri_SCI,[0.5]);
NO3_Nitri_DP95median = quantile(NO3_Nitri_DPCI,[0.5]);

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

%NO3_Pconc
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

% 子图 1: NO3_Pconc, NO3_Dconc, NO3_Sconc, NO3_DPconc
subplot(3,2,1)
fill([sens.time_myr; flip(sens.time_myr)],[NO3_Pconc95quant(1, :), flip(NO3_Pconc95quant(2, :))],colors(1, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
hold on;
semilogy(sens.time_myr, NO3_Pconc95median, 'linewidth', 1.5, 'color', colors(1, :), 'DisplayName', 'P Median');

fill([sens.time_myr; flip(sens.time_myr)],[NO3_Dconc95quant(1, :), flip(NO3_Dconc95quant(2, :))],colors(2, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
semilogy(sens.time_myr, NO3_Dconc95median, 'linewidth', 1.5, 'color', colors(2, :), 'DisplayName', 'D Median');

fill([sens.time_myr; flip(sens.time_myr)],[NO3_Sconc95quant(1, :), flip(NO3_Sconc95quant(2, :))],colors(3, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
semilogy(sens.time_myr, NO3_Sconc95median, 'linewidth', 1.5, 'color', colors(3, :), 'DisplayName', 'S Median');

fill([sens.time_myr; flip(sens.time_myr)],[NO3_DPconc95quant(1, :), flip(NO3_DPconc95quant(2, :))],colors(4, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
semilogy(sens.time_myr, NO3_DPconc95median, 'linewidth', 1.5, 'color', colors(4, :), 'DisplayName', 'DP Median');

box on;
set(gca, 'YScale', 'log');
%yticks([1e-6,1e-5, 1e-4, 1e-3, 1e-2]);
xlim([-4e3 0]);
yticks([1e-8, 1e-6, 1e-4, 1e-2, 1e0]); % 设置指定刻度
ylim([1e-9 1e0]);
xlabel('Time (Ma)');
ylabel('NO3 Conc (mM)');
legend('Location', 'best');

% 子图 2: NH4_Pconc, NH4_Dconc, NH4_Sconc, NH4_DPconc
subplot(3,2,2)
fill([sens.time_myr; flip(sens.time_myr)],[NH4_Pconc95quant(1, :), flip(NH4_Pconc95quant(2, :))],colors(1, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
hold on;
semilogy(sens.time_myr, NH4_Pconc95median, 'linewidth', 1.5, 'color', colors(1, :));

fill([sens.time_myr; flip(sens.time_myr)],[NH4_Dconc95quant(1, :), flip(NH4_Dconc95quant(2, :))],colors(2, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
semilogy(sens.time_myr, NH4_Dconc95median, 'linewidth', 1.5, 'color', colors(2, :));

fill([sens.time_myr; flip(sens.time_myr)],[NH4_Sconc95quant(1, :), flip(NH4_Sconc95quant(2, :))],colors(3, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
semilogy(sens.time_myr, NH4_Sconc95median, 'linewidth', 1.5, 'color', colors(3, :));

fill([sens.time_myr; flip(sens.time_myr)],[NH4_DPconc95quant(1, :), flip(NH4_DPconc95quant(2, :))],colors(4, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
semilogy(sens.time_myr, NH4_DPconc95median, 'linewidth', 1.5, 'color', colors(4, :));
set(gca, 'YScale', 'log');
%yticks([1e-6, 1e-5,1e-4, 1e-3, 1e-2]);
xlim([-4e3 0]);
yticks([1e-6, 1e-4, 1e-2,1e0]); % 设置指定刻度
ylim([1e-7 1e0]);
box on;
xlabel('Time (Ma)');
ylabel('NH4 Conc (mM)');

% 子图 3: Redfield N:P limitation
subplot(3,2,3)
fill([sens.time_myr; flip(sens.time_myr)],[log10(P_change95quant(1, :)), flip(log10(P_change95quant(2, :)))],colors(1, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
hold on;
plot(sens.time_myr, log10(P_change95median), 'linewidth', 1.5, 'color', colors(1, :));

fill([sens.time_myr; flip(sens.time_myr)],[log10(D_change95quant(1, :)), flip(log10(D_change95quant(2, :)))],colors(2, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
plot(sens.time_myr, log10(D_change95median), 'linewidth', 1.5, 'color', colors(2, :));

fill([sens.time_myr; flip(sens.time_myr)],[log10(S_change95quant(1, :)), flip(log10(S_change95quant(2, :)))],colors(3, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
plot(sens.time_myr, log10(S_change95median), 'linewidth', 1.5, 'color', colors(3, :));

fill([sens.time_myr; flip(sens.time_myr)],[log10(DP_change95quant(1, :)), flip(log10(DP_change95quant(2, :)))],colors(4, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
plot(sens.time_myr, log10(DP_change95median), 'linewidth', 1.5, 'color', colors(4, :));
xlim([-4e3 0]);
box on;
yline(log10(16), '--k', 'LineWidth', 2);
xlabel('Time (Ma)');
ylabel('Redfield N:P limitation');

load('15N.mat')
N_15Ntime = -1 * data(:,1);
N_15Norg = data(:,2);
N_15Nbulk = data(:,3);
subplot(3,2,4)
scatter(N_15Ntime, N_15Norg, 3, 'o', 'DisplayName', 'org');
hold on;
scatter(N_15Ntime, N_15Nbulk, 3, '+', 'DisplayName', 'bulk');
fill([sens.time_myr; flip(sens.time_myr)],[N_15N95quant(1, :), flip(N_15N95quant(2, :))],colors(1, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
plot(sens.time_myr, N_15N95median, 'linewidth', 1.5, 'color', colors(1, :));
box on;
xlim([-4e3 0]);
xlabel('Time (Ma)');
ylabel('δ^{15}N (‰)');

% 子图 5: Denitrification
% 子图 5: Denitrification
subplot(3,2,6)

fill([sens.time_myr; flip(sens.time_myr)],[NO3_denit_P_water95quant(1, :), flip(NO3_denit_P_water95quant(2, :))],colors(1, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
hold on;
semilogy(sens.time_myr, NO3_denit_P_water95median, 'linewidth', 1.5, 'color', colors(1, :));

fill([sens.time_myr; flip(sens.time_myr)],[NO3_denit_D_water95quant(1, :), flip(NO3_denit_D_water95quant(2, :))],colors(2, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
semilogy(sens.time_myr, NO3_denit_D_water95median, 'linewidth', 1.5, 'color', colors(2, :));

fill([sens.time_myr; flip(sens.time_myr)],[NO3_denit_DP_water95quant(1, :), flip(NO3_denit_DP_water95quant(2, :))],colors(4, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
semilogy(sens.time_myr, NO3_denit_DP_water95median, 'linewidth', 1.5, 'color', colors(4, :));
set(gca, 'YScale', 'log');
%yticks([1e-1, 1e2,1e5, 1e8, 1e11, 1e14]);
%yticks([1e-1, 1e2,1e5, 1e8, 1e11, 1e14]);
xlim([-4e3 0]);
yticks([1e-5, 1e0, 1e5, 1e10, 1e15]); % 设置指定刻度
ylim([1e-7 1e15]);
box on;
xlabel('Time (Ma)');
ylabel('Denitrification');

% 子图 6: Nitrification
subplot(3,2,5)

fill([sens.time_myr; flip(sens.time_myr)],[NO3_Nitri_P95quant(1, :), flip(NO3_Nitri_P95quant(2, :))],colors(1, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
hold on;
semilogy(sens.time_myr, NO3_Nitri_P95median, 'linewidth', 1.5, 'color', colors(1, :));

fill([sens.time_myr; flip(sens.time_myr)], [NO3_Nitri_D95quant(1, :), flip(NO3_Nitri_D95quant(2, :))],colors(2, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
semilogy(sens.time_myr, NO3_Nitri_D95median, 'linewidth', 1.5, 'color', colors(2, :));

fill([sens.time_myr; flip(sens.time_myr)], [NO3_Nitri_S95quant(1, :), flip(NO3_Nitri_S95quant(2, :))],colors(3, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
semilogy(sens.time_myr, NO3_Nitri_S95median, 'linewidth', 1.5, 'color', colors(3, :));

fill([sens.time_myr; flip(sens.time_myr)],[NO3_Nitri_DP95quant(1, :), flip(NO3_Nitri_DP95quant(2, :))],colors(4, :), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
semilogy(sens.time_myr, NO3_Nitri_DP95median, 'linewidth', 1.5, 'color', colors(4, :));
set(gca, 'YScale', 'log');
xlim([-4e3 0]);
%yticks([1e3, 1e6,1e9, 1e12, 1e15]);
yticks([1e5, 1e10, 1e15]); % 设置指定刻度
ylim([1e1 1e17]);
box on;
xlabel('Time (Ma)');
ylabel('Nitrification');

% 导出为矢量图
exportgraphics(gcf, 'Figure3.pdf', 'ContentType', 'vector');
