figure

subplot(5,3,1)
plot(state.time/10e5,state.Aiso)
xlabel('Time (Ma)')
ylabel('δ^{13}C (‰)')
hold on
box on
%%
subplot(5,3,2)
plot(state.time/10e5,state.CO2atm/10e-7)
xlabel('Time (Ma)')
ylabel('CO_{2} (ppm)')
hold on
box on
%%
subplot(5,3,3)
plot(state.time/10e5,state.O2_A/present.O2_A)
xlabel('Time (Ma)')
ylabel('O_{2} (atmosphere) (PAL)')
hold on
box on
%%
subplot(5,3,4)
plot(state.time/10e5,state.O2_DP/present.O2_A)
xlabel('Time (Ma)')
ylabel('O_{2} (Deep ocean) (PAL)')
hold on
box on
%%
subplot(5,3,5)
plot(state.time/10e5,state.GAST-273.15)
xlabel('Time (Ma)')
ylabel('Global average surface temperature (℃)')
hold on
box on
%%
subplot(5,3,6)
plot(state.time/10e5,state.Prox_Preac_Burial)
hold on
plot(state.time/10e5,state.Dist_Preac_Burial)
hold on
plot(state.time/10e5,state.Deep_Preac_Burial)
hold on
box on
xlabel('Time (Ma)'),ylabel('P burial (mol yr^{-1})'),legend('Proximal shelf','Distal shelf','Deep ocean')
%%%
subplot(5,3,7)
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
subplot(5,3,8)
plot(state.time/10e5,state.Total_POC_Burial)
hold on
plot(state.time/10e5,state.Fmocb)
hold on
plot(state.time/10e5,state.Atmos_Weather)
hold on
box on
xlabel('Time (Ma)'),ylabel('x'),legend('Total POC Burial','Total organic carbon burial','Atmosphere Weather')
%%%
subplot(5,3,9)
plot(state.time/10e5,state.SRP_DP)
xlabel('Time (Ma)')
ylabel('Soluble Reactive Phosphorous (Deep ocean)')
hold on
box on
%%
subplot(5,3,10)
plot(state.time/10e5,state.River_SRP)
xlabel('Time (Ma)')
ylabel('Riverine P input')
hold on
box on
%%
subplot(5,3,11)
plot(state.time/10e5,state.A)
xlabel('Time (Ma)')
ylabel('inorganic carbon reservoir')
hold on
box on
%%
subplot(5,3,12)
plot(state.time/10e5,state.D)
xlabel('Time (Ma)')
ylabel('Degassing rate (relative to present)')
hold on
box on
%%
subplot(5,3,13)
plot(state.time/10e5,state.fbiota)
hold on
plot(state.time/10e5,state.EXPOSED)
hold on
plot(state.time/10e5,state.C)
hold on
box on
xlabel('Time (Ma)'),ylabel(''),legend('Biological weathering enhancement','Exposed landmass','Crustal carbon reservoir')
%%

subplot(5,3,15)
plot(state.time/10e5,state.fanoxicprox)
hold on
plot(state.time/10e5,state.fanoxicdist)
hold on
box on
xlabel('Time (Ma)'),ylabel('f'),legend('proximal anoxic','distal anoxic')
%%


%subplot(5,6,25)
%plot(state.time/10e5,state.NO3_Pconc)
%xlabel('Time (Ma)')
%ylabel('NO_{3} (proximal)')
%hold on
%box on


