
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%   Plotting script   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Need to transpose initially to get Confidence intervals
NH4_Nfix_SCI = real(sens.NH4_Nfix_S.');
NO3_Nitri_SCI = real(sens.NO3_Nitri_S.');
NO3_denit_SCI = real(sens.NO3_denit_S.');
d15NCI = real(sens.d15N.');
O2_PconcCI = real(sens.O2_Pconc.');
O2_DconcCI = real(sens.O2_Dconc.');
O2_SconcCI = real(sens.O2_Sconc.');
O2_DPconcCI = real(sens.O2_DPconc.');


%% Confidence intervals
NH4_Nfix_S95quant = quantile(NH4_Nfix_SCI,[0.05 0.95]);
NO3_Nitri_S95quant = quantile(NO3_Nitri_SCI,[0.05 0.95]);
NO3_denit_S95quant = quantile(NO3_denit_SCI,[0.05 0.95]);
d15N95quant = quantile(d15NCI,[0.05 0.95]);
O2_Pconc95quant = quantile(O2_PconcCI,[0.05 0.95]);
O2_Dconc95quant = quantile(O2_DconcCI,[0.05 0.95]);
O2_Sconc95quant = quantile(O2_SconcCI,[0.05 0.95]);
O2_DPconc95quant = quantile(O2_DPconcCI,[0.05 0.95]);


%% Medians
NH4_Nfix_S95median = quantile(NH4_Nfix_SCI,[0.5]);
NO3_Nitri_S95median = quantile(NO3_Nitri_SCI,[0.5]);
NO3_denit_S95median = quantile(NO3_denit_SCI,[0.5]);
d15N95median = quantile(d15NCI,[0.5]);
O2_Pconc95median = quantile(O2_PconcCI,[0.5]);
O2_Dconc95median = quantile(O2_DconcCI,[0.5]);
O2_Sconc95median = quantile(O2_SconcCI,[0.5]);
O2_DPconc95median = quantile(O2_DPconcCI,[0.5]);


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

%NH4_Nfix_S
% load('Havigd13C.mat')
% d13Ctime = -1 * Havigd13C(:,1);
% d13Ccalcite = Havigd13C(:,2);
% d13Cdolomite = Havigd13C(:,3);
% d13Cother = Havigd13C(:,4);

subplot(4,2,1)


plot((sens.time_myr),(NH4_Nfix_S95median),'linewidth',3,'color',c_mean)
hold on
plot((sens.time_myr),(NH4_Nfix_S95quant),'linewidth',1,'color',c_range)
hold on
box on
xlabel('Time (Ma)'),ylabel('Surface nitrogen fixation (mol)')

%CO2



subplot(4,2,2)
plot((sens.time_myr),(NO3_Nitri_S95median),'linewidth',3,'color',c_mean)
hold on
plot((sens.time_myr),(NO3_Nitri_S95quant),'linewidth',1,'color',c_range)
hold on
box on
xlabel('Time (Ma)'),ylabel('Surface nitrification (mol)')

%Atmos O2

subplot(4,2,3)
plot((sens.time_myr),(NO3_denit_S95median),'linewidth',3,'color',c_mean)
hold on
plot((sens.time_myr),(NO3_denit_S95quant),'linewidth',1,'color',c_range)
hold on
box on
xlabel('Time (Ma)'),ylabel('Surface denitrification (mol)')

%O2 Deep

load('15N.mat')
d15Ntime = -1 * data(:,1);
d15Norg = data(:,2);
d15Nbulk = data(:,3);


subplot(4,2,4)
scatter(d15Ntime, d15Norg,5,'o')
hold on
scatter(d15Ntime, d15Nbulk,5,'+')
hold on
plot((sens.time_myr),(d15N95median),'linewidth',3,'color',c_mean)
hold on
plot((sens.time_myr),(d15N95quant),'linewidth',1,'color',c_range)
hold on
box on
xlim([-4e3 0]);
legend('org','bulk')
xlabel('Time (Ma)'),ylabel('δ^{15}N (‰)')

%P burial

subplot(4,2,5)
plot((sens.time_myr),(O2_Pconc95median),'linewidth',3,'color',c_mean)
hold on
plot((sens.time_myr),(O2_Pconc95quant),'linewidth',1,'color',c_range)
hold on
box on
xlabel('Time (Ma)'),ylabel('O2 Pconc (mmol/L)')

%P deep
subplot(4,2,6)
plot((sens.time_myr),(O2_Dconc95median),'linewidth',3,'color',c_mean)
hold on
plot((sens.time_myr),(O2_Dconc95quant),'linewidth',1,'color',c_range)
hold on
box on
xlabel('Time (Ma)'),ylabel('O2 Dconc (mmol/L)')


%fanoxic
subplot(4,2,7)
plot((sens.time_myr),(O2_Sconc95median),'linewidth',3,'color',c_mean)
hold on
plot((sens.time_myr),(O2_Sconc95quant),'linewidth',1,'color',c_range)
hold on
box on
xlabel('Time (Ma)'),ylabel('O2 Sconc (mmol/L)')

%Temperature
subplot(4,2,8)
plot((sens.time_myr),(O2_DPconc95median),'linewidth',3,'color',c_mean)
hold on
plot((sens.time_myr),(O2_DPconc95quant),'linewidth',1,'color',c_range)
hold on
box on
xlabel('Time (Ma)'),ylabel('O2 DPconc (mmol/L)')
