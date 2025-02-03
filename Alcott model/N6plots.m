
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%   Plotting script   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Need to transpose initially to get Confidence intervals
d13CCI = real(sens.Aiso.');
CO2CI = real(sens.CO2atm.');
O2ACI = real(sens.O2_A.');
O2DPCI = real(sens.O2_DP.');
Dist_Preac_BurialCI = real(sens.Dist_Preac_Burial.');
PP_SCI = real(sens.PP_S.');



%% Confidence intervals
d13C95quant = quantile(d13CCI,[0.05 0.95]);
CO295quant = quantile(CO2CI,[0.05 0.95]);
O2A95quant = quantile(O2ACI,[0.05 0.95]);
O2DP95quant = quantile(O2DPCI,[0.05 0.95]);
Dist_Preac_Burial95quant = quantile(Dist_Preac_BurialCI,[0.05 0.95]);
PP_S95quant = quantile(PP_SCI,[0.05 0.95]);


%% Medians
d13C95median = quantile(d13CCI,[0.5]);
CO295median = quantile(CO2CI,[0.5]);
O2A95median = quantile(O2ACI,[0.5]);
O2DP95median = quantile(O2DPCI,[0.5]);
Dist_Preac_Burial95median = quantile(Dist_Preac_BurialCI,[0.5]);
PP_S95median = quantile(PP_SCI,[0.5]);


global starting

%%%%%% Define colours
c_mean = [0.2 0.6 0.6];  % 中位数颜色
c_std = [0.3 0.7 0.7];
c_range = [0.4 0.8 0.8]; % 置信区间颜色

%%%% Output to screen
fprintf('Running sens plotting script... \t')
tic

%%%% Make column vector
sens.time_myr = sens.time(:, 1)/1e6;

%% Call in data
figure('Color', [0.80 0.80 0.70]);

% d13C data
load('Havigd13C.mat');
d13Ctime = -1 * Havigd13C(:, 1);
d13Ccalcite = Havigd13C(:, 2);
d13Cdolomite = Havigd13C(:, 3);
d13Cother = Havigd13C(:, 4);

% Subplot for d13C
subplot(3, 2, 1);
scatter(d13Ctime, d13Ccalcite, 3, 'o');
hold on;
scatter(d13Ctime, d13Cdolomite, 3, '+');
hold on;
scatter(d13Ctime, d13Cother, 3, '*');
hold on;

% Fill for 95% confidence interval (fix dimensions)
fill([sens.time_myr; flip(sens.time_myr)], ... % 时间数据
     [d13C95quant(1, :)'; flip(d13C95quant(2, :)')], ... % 上下限数据
     c_range, 'FaceAlpha', 0.2, 'EdgeColor', 'none');
hold on;

% Median line
plot(sens.time_myr, d13C95median, 'linewidth', 3, 'color', c_mean);


xlim([-4e3 0]);
ylim([-25 20])
legend('calcite','dolomite','other')
xlabel('Time (Ma)')
ylabel('δ^{13}C (‰)')




%CO2
load('CO2proxy')


subplot(3,2,2)
box on
xlabel('Time (Ma)')
ylabel('CO2')
%%%% plot this model
x_fill = [sens.time_myr(:); flip(sens.time_myr(:))];
y_fill = [(CO295quant(1, :)'*1e6); flip(CO295quant(2, :)'*1e6)];
fill(x_fill, y_fill, c_range, 'FaceAlpha', 0.2, 'EdgeColor', 'none');
hold on;

semilogy((sens.time_myr),(CO295median*1e6),'linewidth',3,'color',c_mean)
hold on

semilogy(1e3*HighTime,HighCO2*1e6,'linewidth',1,'color','k','LineStyle', '--')
hold on
semilogy(1e3*LowTime,LowCO2*1e6,'linewidth',1,'color','k','LineStyle', '--')
xlim([-4e3 0]);
set(gca, 'YScale', 'log'); % 确保使用对数刻度
yticks([1e1, 1e2, 1e3, 1e4, 1e5, 1e6, 1e7]); % 设置指定刻度
ylim([10 1e7]);
xlabel('Time (Ma)')
ylabel('CO2 (PPM) ')


%Atmos O2
load('AtmosO2proxy.mat')
O2_A_min = min((sens.O2_A/3.7e19),[],2) ;
O2_A_max = max((sens.O2_A/3.7e19),[],2) ;

subplot(3,2,3)
box on
xlabel('Time (Ma)')
ylabel('PAL O2')
%%%% plot this model
fill([sens.time_myr; flip(sens.time_myr)], [(O2A95quant(1, :)'/ 3.7e19); flip((O2A95quant(2, :)'/ 3.7e19))], ...
     c_range, 'FaceAlpha', 0.2, 'EdgeColor', 'none');
hold on;
semilogy((sens.time_myr),(O2A95median/3.7e19),'linewidth',3,'color',c_mean)
hold on
semilogy(AtmosO2proxtime, AtmosO2proxlow,'linewidth',1,'color','k','LineStyle', '--')
hold on
semilogy(AtmosO2proxtime,AtmosO2proxhigh,'linewidth',1,'color','k','LineStyle', '--')
xlim([-4e3 0]);
set(gca, 'YScale', 'log'); % 确保使用对数刻度
yticks([1e-6, 1e-4, 1e-2, 1e0]); % 指定 Y 轴刻度
ylim([1e-7, 10]);
xlabel('Time (Ma)')
ylabel('O2 atmosphere PAL')


%O2 Deep
subplot(3,2,4)
box on
fill([sens.time_myr; flip(sens.time_myr)], [(O2DP95quant(1, :)'/ 2.21e17); flip((O2DP95quant(2, :)'/ 2.21e17))], ...
     c_range, 'FaceAlpha', 0.2, 'EdgeColor', 'none');
hold on;
semilogy((sens.time_myr),(O2DP95median/2.21e17),'linewidth',3,'color',c_mean)
xlim([-4e3 0]);
set(gca, 'YScale', 'log');
yticks([1e-8,1e-6, 1e-4, 1e-2, 1e0]); % 指定 Y 轴刻度
ylim([1e-9 10])
xlabel('Time (Ma)')
ylabel('deep O2 PAL')


%P burial
load('ReinhardPdata.mat')

XXX = [Time Reinhard_P] ;
ZZ = XXX(~any(isnan(XXX)| isinf( XXX ), 2 ),: ) ;
x = ZZ(:,1) ;
y = ZZ(:,2) ;
edges = (0:50:4e3);
[~,~,loc]=histcounts(x,edges);
%meany = accumarray(loc(:),y(:))./accumarray(loc(:),1);

bin_count = accumarray(loc(:), 1); % 每个分箱中的数据点数量
bin_sum = accumarray(loc(:), y(:)); % 每个分箱的 y 值总和
meany = bin_sum ./ bin_count; % 计算平均值

% 替换无效值
meany(bin_count == 0) = NaN; % 确保没有数据的分箱中值为 NaN
meany(meany <= 0) = NaN; % 确保对数计算中没有非正数

% 计算时间区间的中点
xmid = 0.5 * (edges(1:end-1) + edges(2:end));
xmid = xmid.'; % 转置为列向量
xmid = xmid(1:end-10,:);

% 对数据进行插值以填补断点
meany_filled = fillmissing(meany, 'linear'); % 线性插值补全 NaN
log_meany_filled = log10(meany_filled);



subplot(3,2,5)
box on
xlabel('Time (Ma)')
yyaxis right
% scatter((-1*Time), logReinhard_P,5)
% hold on
plot((-1 * xmid), log_meany_filled, 'linewidth', 2, 'color', 'k');
ylim([-3 1])

yyaxis left
set(gca, 'YScale', 'log')
ylabel('P burial')
fill([sens.time_myr; flip(sens.time_myr)], ...
     [Dist_Preac_Burial95quant(1, :)'; flip(Dist_Preac_Burial95quant(2, :)')], ...
     c_range, 'FaceAlpha', 0.2, 'EdgeColor', 'none');
hold on;
plot((sens.time_myr),(Dist_Preac_Burial95median),'linewidth',3,'color',c_mean)


xlim([-4e3 0]);
set(gca, 'YScale', 'log'); % 确保 Y 轴为对数刻度
yticks([1e6,1e7, 1e8, 1e9, 1e10, 1e11, 1e12, 1e13]); % 指定 Y 轴刻度
ylim([1e6 1e13]);
xlabel('Time (Ma)')
ylabel('Distal P burial (mol/yr)')


%P deep
subplot(3,2,6)
box on
fill([sens.time_myr; flip(sens.time_myr)],[(PP_S95quant(1, :)'); flip((PP_S95quant(2, :)'))], ...
     c_range, 'FaceAlpha', 0.2, 'EdgeColor', 'none');
hold on;
semilogy((sens.time_myr),PP_S95median,'linewidth',3,'color',c_mean)

set(gca, 'YScale', 'log');
xlim([-4e3 0]);
%ylim([1e-3 5])
yticks([1e11,1e12, 1e13, 1e14, 1e15, 1e16]); % 指定 Y 轴刻度
ylim([1e11 1e16]);
xlabel('Time (Ma)')
ylabel('Primary production (mol)')

exportgraphics(gcf, 'Figure4.pdf', 'ContentType', 'vector');



