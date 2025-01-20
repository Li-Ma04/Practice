
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%   Plotting script   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Need to transpose initially to get Confidence intervals
P_changeCI = real(sens.P_change.');
D_changeCI = real(sens.D_change.');
S_changeCI = real(sens.S_change.');
DP_changeCI = real(sens.DP_change.');
N_PCI = real(sens.N_P.');
N_DCI = real(sens.N_D.');
N_SCI = real(sens.N_S.');
N_DPCI = real(sens.N_DP.');


%% Confidence intervals
P_change95quant = quantile(P_changeCI,[0.05 0.95]);
D_change95quant = quantile(D_changeCI,[0.05 0.95]);
S_change95quant = quantile(S_changeCI,[0.05 0.95]);
DP_change95quant = quantile(DP_changeCI,[0.05 0.95]);
N_P95quant = quantile(N_PCI,[0.05 0.95]);
N_D95quant = quantile(N_DCI,[0.05 0.95]);
N_S95quant = quantile(N_SCI,[0.05 0.95]);
N_DP95quant = quantile(N_DPCI,[0.05 0.95]);


%% Medians
P_change95median = quantile(P_changeCI,[0.5]);
D_change95median = quantile(D_changeCI,[0.5]);
S_change95median = quantile(S_changeCI,[0.5]);
DP_change95median = quantile(DP_changeCI,[0.5]);
N_P95median = quantile(N_PCI,[0.5]);
N_D95median = quantile(N_DCI,[0.5]);
N_S95median = quantile(N_SCI,[0.5]);
N_DP95median = quantile(N_DPCI,[0.5]);


global starting
%%%%%% define colours
c_mean = [0.2 0.6 0.6] ;
c_std = [0.3 0.7 0.7] ;
c_range = [ 0.4 0.8 0.8] ;

%%%% output to screen
fprintf('running sens plotting script... \t')
tic

%%%% make column vector
sens.time_myr = sens.time(:,1) /1e6 ;
%% Call in data
figure('Color',[0.80 0.80 0.70])

%P_change
% load('Havigd13C.mat')
% d13Ctime = -1 * Havigd13C(:,1);
% d13Ccalcite = Havigd13C(:,2);
% d13Cdolomite = Havigd13C(:,3);
% d13Cother = Havigd13C(:,4);

subplot(4,2,1)


plot((sens.time_myr),log10(P_change95median),'linewidth',3,'color',c_mean)
hold on
plot((sens.time_myr),log10(P_change95quant),'linewidth',1,'color',c_range)
hold on
box on
yline(log10(16), '--k', 'LineWidth', 2);

xlabel('Time (Ma)'),ylabel('N:P in P box (log10)')

%CO2



subplot(4,2,2)
plot((sens.time_myr),log10(D_change95median),'linewidth',3,'color',c_mean)
hold on
plot((sens.time_myr),log10(D_change95quant),'linewidth',1,'color',c_range)
hold on
box on
yline(log10(16), '--k', 'LineWidth', 2);
xlabel('Time (Ma)'),ylabel('N:P in D box (log10)')

%Atmos O2

subplot(4,2,3)
plot((sens.time_myr),log10(S_change95median),'linewidth',3,'color',c_mean)
hold on
plot((sens.time_myr),log10(S_change95quant),'linewidth',1,'color',c_range)
hold on
box on
yline(log10(16), '--k', 'LineWidth', 2);
xlabel('Time (Ma)'),ylabel('N:P in S box (log10)')

%O2 Deep
subplot(4,2,4)
plot((sens.time_myr),log10(DP_change95median),'linewidth',3,'color',c_mean)
hold on
plot((sens.time_myr),log10(DP_change95quant),'linewidth',1,'color',c_range)
hold on
box on
yline(log10(16), '--k', 'LineWidth', 2);
xlabel('Time (Ma)'),ylabel('N:P in DP box (log10)')

%P burial

subplot(4,2,5)
plot((sens.time_myr),(N_P95median),'linewidth',3,'color',c_mean)
hold on
plot((sens.time_myr),(N_P95quant),'linewidth',1,'color',c_range)
hold on
box on
xlabel('Time (Ma)'),ylabel('Bioavailable N in P box (mol)')

%P deep
subplot(4,2,6)
plot((sens.time_myr),(N_D95median),'linewidth',3,'color',c_mean)
hold on
plot((sens.time_myr),(N_D95quant),'linewidth',1,'color',c_range)
hold on
box on
xlabel('Time (Ma)'),ylabel('Bioavailable N in D box (mol)')


%fanoxic
subplot(4,2,7)
plot((sens.time_myr),(N_S95median),'linewidth',3,'color',c_mean)
hold on
plot((sens.time_myr),(N_S95quant),'linewidth',1,'color',c_range)
hold on
box on
xlabel('Time (Ma)'),ylabel('Bioavailable N in S box (mol)')

%Temperature
subplot(4,2,8)
plot((sens.time_myr),(N_DP95median),'linewidth',3,'color',c_mean)
hold on
plot((sens.time_myr),(N_DP95quant),'linewidth',1,'color',c_range)
hold on
box on
xlabel('Time (Ma)'),ylabel('Bioavailable N in DP box (mol)')
