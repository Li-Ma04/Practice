figure




subplot(5,6,1)
plot(state.time/10e5,state.Aiso)
xlabel('Time (Ma)')
ylabel('δ^{13}C (‰)')
hold on
box on
%%
subplot(5,6,2)
plot(state.time/10e5,state.CO2atm/10e-7)
xlabel('Time (Ma)')
ylabel('CO_{2} (ppm)')
hold on
box on
%%
subplot(5,6,3)
plot(state.time/10e5,state.O2_A/present.O2_A)
xlabel('Time (Ma)')
ylabel('O_{2} (atmosphere) (PAL)')
hold on
box on
%%
subplot(5,6,4)
plot(state.time/10e5,state.O2_DP/present.O2_A)
xlabel('Time (Ma)')
ylabel('O_{2} (Deep ocean) (PAL)')
hold on
box on
%%
subplot(5,6,5)
plot(state.time/10e5,state.Dist_Preac_Burial)
xlabel('Time (Ma)')
ylabel('Distal shelf P burial (mol yr^{-1})')
hold on
box on
%%
subplot(5,6,6)
plot(state.time/10e5,state.GAST-273.15)
xlabel('Time (Ma)')
ylabel('Global average surface temperature (℃)')
hold on
box on





subplot(5,6,7)
plot(state.time/10e5,state.SRP_DP)
xlabel('Time (Ma)')
ylabel('Soluble Reactive Phosphorous (Deep ocean)')
hold on
box on
subplot(5,6,8)
plot(state.time/10e5,state.River_SRP)
xlabel('Time (Ma)')
ylabel('Riverine P input')
hold on
box on
%%
subplot(5,6,9)
plot(state.time/10e5,state.CP_Dist)
xlabel('Time (Ma)')
ylabel('C:P ratio (Distal)')
hold on
box on
%%
subplot(5,6,10)
plot(state.time/10e5,state.CP_Deep)
xlabel('Time (Ma)')
ylabel('C:P ratio (Deep ocean)')
hold on
box on
%%
subplot(5,6,11)
plot(state.time/10e5,state.CP_Prox)
xlabel('Time (Ma)')
ylabel('C:P ratio (proximal)')
hold on
box on
%%
subplot(5,6,12)
plot(state.time/10e5,state.CPanoxic)
xlabel('Time (Ma)')
ylabel('C:P ratio (anoxic)')
hold on
box on





subplot(5,6,13)
plot(state.time/10e5,state.Deep_Preac_Burial)
xlabel('Time (Ma)')
ylabel('Reactive Phosphorous Burial (Deep ocean)')
hold on
box on
subplot(5,6,14)
plot(state.time/10e5,state.Dist_Preac_Burial)
xlabel('Time (Ma)')
ylabel('Reactive Phosphorous Burial (Distal)')
hold on
box on
%%
subplot(5,6,15)
plot(state.time/10e5,state.Prox_Preac_Burial)
xlabel('Time (Ma)')
ylabel('Reactive Phosphorous Burial (Proximal)')
hold on
box on
%%
subplot(5,6,16)
plot(state.time/10e5,state.Total_POC_Burial)
xlabel('Time (Ma)')
ylabel('Total_POC_Burial')
hold on
box on
%%





subplot(5,6,17)
plot(state.time/10e5,state.Atmos_Weather)
xlabel('Time (Ma)')
ylabel('Atmosphere Weather')
hold on
box on
%%
subplot(5,6,18)
plot(state.time/10e5,state.A)
xlabel('Time (Ma)')
ylabel('inorganic carbon reservoir')
hold on
box on
%%
subplot(5,6,19)
plot(state.time/10e5,state.Fmocb)
xlabel('Time (Ma)')
ylabel('Total organic carbon burial')
hold on
box on
%%
subplot(5,6,20)
plot(state.time/10e5,state.forg)
xlabel('Time (Ma)')
ylabel('Total Organic carbon burial rate')
hold on
box on






subplot(5,6,21)
plot(state.time/10e5,state.D)
xlabel('Time (Ma)')
ylabel('Degassing rate (relative to present)')
hold on
box on
%%
subplot(5,6,22)
plot(state.time/10e5,state.fbiota)
xlabel('Time (Ma)')
ylabel('Biological weathering enhancement (relative to present)')
hold on
box on
%%
subplot(5,6,23)
plot(state.time/10e5,state.EXPOSED)
xlabel('Time (Ma)')
ylabel('Exposed landmass (relative to present)')
hold on
box on
%%
subplot(5,6,24)
plot(state.time/10e5,state.C)
xlabel('Time (Ma)')
ylabel('Crustal carbon reservoir (relative to present)')
hold on
box on






subplot(5,6,25)
plot(state.time/10e5,state.NO3_Pconc)
xlabel('Time (Ma)')
ylabel('NO_{3} (proximal)')
hold on
box on


