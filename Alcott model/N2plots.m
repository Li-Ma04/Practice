
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


%% Confidence intervals
NO3_Pconc95quant = quantile(NO3_PconcCI,[0.05 0.95]);
NO3_Dconc95quant = quantile(NO3_DconcCI,[0.05 0.95]);
NO3_Sconc95quant = quantile(NO3_SconcCI,[0.05 0.95]);
NO3_DPconc95quant = quantile(NO3_DPconcCI,[0.05 0.95]);
NH4_Pconc95quant = quantile(NH4_PconcCI,[0.05 0.95]);
NH4_Dconc95quant = quantile(NH4_DconcCI,[0.05 0.95]);
NH4_Sconc95quant = quantile(NH4_SconcCI,[0.05 0.95]);
NH4_DPconc95quant = quantile(NH4_DPconcCI,[0.05 0.95]);


%% Medians
NO3_Pconc95median = quantile(NO3_PconcCI,[0.5]);
NO3_Dconc95median = quantile(NO3_DconcCI,[0.5]);
NO3_Sconc95median = quantile(NO3_SconcCI,[0.5]);
NO3_DPconc95median = quantile(NO3_DPconcCI,[0.5]);
NH4_Pconc95median = quantile(NH4_PconcCI,[0.5]);
NH4_Dconc95median = quantile(NH4_DconcCI,[0.5]);
NH4_Sconc95median = quantile(NH4_SconcCI,[0.5]);
NH4_DPconc95median = quantile(NH4_DPconcCI,[0.5]);


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

%NO3_Pconc
% load('Havigd13C.mat')
% d13Ctime = -1 * Havigd13C(:,1);
% d13Ccalcite = Havigd13C(:,2);
% d13Cdolomite = Havigd13C(:,3);
% d13Cother = Havigd13C(:,4);

subplot(4,2,1)


plot((sens.time_myr),(NO3_Pconc95median),'linewidth',3,'color',c_mean)
hold on
plot((sens.time_myr),(NO3_Pconc95quant),'linewidth',1,'color',c_range)
hold on
box on
xlabel('Time (Ma)'),ylabel('NO3 Pconc (mM)')

%CO2



subplot(4,2,2)
plot((sens.time_myr),(NO3_Dconc95median),'linewidth',3,'color',c_mean)
hold on
plot((sens.time_myr),(NO3_Dconc95quant),'linewidth',1,'color',c_range)
hold on
box on
xlabel('Time (Ma)'),ylabel('NO3 Dconc (mM)')

%Atmos O2

subplot(4,2,3)
plot((sens.time_myr),(NO3_Sconc95median),'linewidth',3,'color',c_mean)
hold on
plot((sens.time_myr),(NO3_Sconc95quant),'linewidth',1,'color',c_range)
hold on
box on
xlabel('Time (Ma)'),ylabel('NO3 Sconc (mM)')

%O2 Deep
subplot(4,2,4)
plot((sens.time_myr),(NO3_DPconc95median),'linewidth',3,'color',c_mean)
hold on
plot((sens.time_myr),(NO3_DPconc95quant),'linewidth',1,'color',c_range)
hold on
box on
xlabel('Time (Ma)'),ylabel('NO3 DPconc (mM)')

%P burial

subplot(4,2,5)
plot((sens.time_myr),(NH4_Pconc95median),'linewidth',3,'color',c_mean)
hold on
plot((sens.time_myr),(NH4_Pconc95quant),'linewidth',1,'color',c_range)
hold on
box on
xlabel('Time (Ma)'),ylabel('NH4 Pconc (mM)')

%P deep
subplot(4,2,6)
plot((sens.time_myr),(NH4_Dconc95median),'linewidth',3,'color',c_mean)
hold on
plot((sens.time_myr),(NH4_Dconc95quant),'linewidth',1,'color',c_range)
hold on
box on
xlabel('Time (Ma)'),ylabel('NH4 Dconc (mM)')


%fanoxic
subplot(4,2,7)
plot((sens.time_myr),(NH4_Sconc95median),'linewidth',3,'color',c_mean)
hold on
plot((sens.time_myr),(NH4_Sconc95quant),'linewidth',1,'color',c_range)
hold on
box on
xlabel('Time (Ma)'),ylabel('NH4 Sconc (mM)')

%Temperature
subplot(4,2,8)
plot((sens.time_myr),(NH4_DPconc95median),'linewidth',3,'color',c_mean)
hold on
plot((sens.time_myr),(NH4_DPconc95quant),'linewidth',1,'color',c_range)
hold on
box on
xlabel('Time (Ma)'),ylabel('NH4 DPconc (mM)')
