figure

subplot(4,4,1)
plot(state.time/10e5,state.Aiso)
xlabel('Time (Ma)')
ylabel('δ^{13}C (‰)')
hold on
box on
%%
subplot(4,4,2)
plot(state.time/10e5,state.CO2atm*1e6)
xlabel('Time (Ma)')
ylabel('CO_{2} (ppm)')
hold on
box on
%%
subplot(4,4,3)
semilogy(state.time/10e5,state.O2_A/3.7e19)
xlabel('Time (Ma)')
ylabel('O_{2} (atmosphere) (PAL)')
hold on
box on
%%
subplot(4,4,4)
plot(state.time/10e5,state.O2_DP/2.21e17)
xlabel('Time (Ma)')
ylabel('O_{2} (Deep ocean) (PAL)')
hold on
box on
%%
subplot(4,4,5)
plot(state.time/10e5,state.GAST-273.15)
xlabel('Time (Ma)')
ylabel('Global average surface temperature (℃)')
hold on
box on
%%
subplot(4,4,6)
plot(state.time/10e5,state.Prox_Preac_Burial)
hold on
plot(state.time/10e5,state.Dist_Preac_Burial)
hold on
plot(state.time/10e5,state.Deep_Preac_Burial)
hold on
box on
xlabel('Time (Ma)'),ylabel('P burial (mol yr^{-1})'),legend('Proximal shelf','Distal shelf','Deep ocean')
%%%
subplot(4,4,7)
plot(state.time/10e5,state.CP_Prox)
hold on
plot(state.time/10e5,state.CP_Dist)
hold on
plot(state.time/10e5,state.CP_Deep)
hold on
plot(state.time/10e5,state.CPanoxic)
hold on
box on
xlabel('Time (Ma)'),ylabel('C:P ratio'),legend('Proximal shelf','Distal shelf','Deep ocean','Anoxic')
%%
subplot(4,4,8)
plot(state.time/10e5,state.Fmocb)
hold on
plot(state.time/10e5,state.Atmos_Weather)
hold on
box on
xlabel('Time (Ma)'),ylabel('TOC burial and Weathering'),legend('Total organic carbon burial','Oxidative Weathering')
%%%
subplot(4,4,9)
semilogy(state.time/10e5,state.SRP_Pconc)
hold on
semilogy(state.time/10e5,state.SRP_Dconc)
semilogy(state.time/10e5,state.SRP_Sconc)
semilogy(state.time/10e5,state.SRP_DPconc)
xlabel('Time (Ma)')
ylabel('SRP')
legend('SRP (Prox)','SRP (dist)','SRP (surf)','SRP (deep)')
hold on
box on
%%
subplot(4,4,10)
plot(state.time/10e5,state.PP_P)
hold on
plot(state.time/10e5,state.PP_D)
hold on
plot(state.time/10e5,state.PP_S)
hold on
xlabel('Time (Ma)')
ylabel('primary production')
legend('proximal','distal','surface')
hold on
box on
%%
subplot(4,4,11)
plot(state.time/10e5,state.A)
xlabel('Time (Ma)')
ylabel('inorganic carbon reservoir')
hold on
box on
%%
subplot(4,4,12)
plot(state.time/10e5,state.D)
xlabel('Time (Ma)')
ylabel('Degassing rate (relative to present)')
hold on
box on
%%
subplot(4,4,13)
plot(state.time/10e5,state.fbiota)
hold on
plot(state.time/10e5,state.EXPOSED)
hold on
plot(state.time/10e5,state.C)
hold on
box on
xlabel('Time (Ma)'),ylabel('focrce'),legend('Biological weathering enhancement','Exposed landmass','Crustal carbon reservoir')
%%

subplot(4,4,14)
plot(state.time/10e5,state.O2_Pconc)
hold on
plot(state.time/10e5,state.O2_Dconc)
hold on
plot(state.time/10e5,state.O2_Sconc)
hold on
plot(state.time/10e5,state.O2_DPconc)
hold on
box on
xlabel('Time (Ma)'),ylabel('O2 conc'),legend('proximal','distal','surface','deep ocean')
%%

%%%
subplot(4,4,15)
semilogy(state.time/10e5,state.NO3_Pconc)
hold on
semilogy(state.time/10e5,state.NO3_Dconc)
semilogy(state.time/10e5,state.NO3_Sconc)
semilogy(state.time/10e5,state.NO3_DPconc)
xlabel('Time (Ma)')
ylabel('NO3 (mmol/l)')
legend('NO3 (Prox)','NO3 (dist)','NO3 (surf)','NO3 (deep)')
hold on
box on

%%%
subplot(4,4,16)
semilogy(state.time/10e5,state.NH4_Pconc)
hold on
semilogy(state.time/10e5,state.NH4_Dconc)
semilogy(state.time/10e5,state.NH4_Sconc)
semilogy(state.time/10e5,state.NH4_DPconc)
xlabel('Time (Ma)')
ylabel('NH4 (mmol/l)')
legend('NH4 (Prox)','NH4 (dist)','NH4 (surf)','NH4 (deep)')
hold on
box on




%subplot(5,6,25)
%plot(state.time/10e5,state.NO3_Pconc)
%xlabel('Time (Ma)')
%ylabel('NO_{3} (proximal)')
%hold on
%box on


