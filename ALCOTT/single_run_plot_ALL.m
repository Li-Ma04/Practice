figure

subplot(3,2,1)
plot(ans.state.time/10e5,ans.state.Aiso)
xlabel('Time (Ma)')
ylabel('δ^{13}C (‰)')
hold on
box on
%%
subplot(3,2,2)
plot(ans.state.time/10e5,ans.state.CO2atm/10e-7)
xlabel('Time (Ma)')
ylabel('CO_{2} (ppm)')
hold on
box on
%%
subplot(3,2,3)
plot(ans.state.time/10e5,ans.state.O2_A/present.O2_A)
xlabel('Time (Ma)')
ylabel('O_{2} (atmosphere) (PAL)')
hold on
box on
%%
subplot(3,2,4)
plot(ans.state.time/10e5,ans.state.O2_DP/present.O2_A)
xlabel('Time (Ma)')
ylabel('O_{2} (Deep ocean) (PAL)')
hold on
box on
%%
subplot(3,2,5)
plot(ans.state.time/10e5,ans.state.Dist_Preac_Burial)
xlabel('Time (Ma)')
ylabel('Distal shelf P burial (mol yr^{-1})')
hold on
box on
%%
subplot(3,2,6)
plot(ans.state.time/10e5,ans.state.GAST-273.15)
xlabel('Time (Ma)')
ylabel('Global average surface temperature (℃)')
hold on
box on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,1)
plot(ans.state.time/10e5,ans.state.D)
xlabel('Time (Ma)')
ylabel('Degassing rate (relative to present)')
hold on
box on
%%
subplot(2,2,2)
plot(ans.state.time/10e5,ans.state.fbiota)
xlabel('Time (Ma)')
ylabel('Biological weathering enhancement (relative to present)')
hold on
box on
%%
subplot(2,2,3)
plot(ans.state.time/10e5,ans.state.EXPOSED)
xlabel('Time (Ma)')
ylabel('Exposed landmass (relative to present)')
hold on
box on
%%
subplot(2,2,4)
plot(ans.state.time/10e5,ans.state.C)
xlabel('Time (Ma)')
ylabel('Crustal carbon reservoir (relative to present)')
hold on
box on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,2,1)
plot(ans.state.time/10e5,ans.state.SRP_DP)
xlabel('Time (Ma)')
ylabel('Soluble Reactive Phosphorous (Deep ocean)')
hold on
box on
subplot(3,2,2)
plot(ans.state.time/10e5,ans.state.River_SRP)
xlabel('Time (Ma)')
ylabel('Riverine P input')
hold on
box on
%%
subplot(3,2,3)
plot(ans.state.time/10e5,ans.state.CP_Dist)
xlabel('Time (Ma)')
ylabel('C:P ratio (Distal)')
hold on
box on
%%
subplot(3,2,4)
plot(ans.state.time/10e5,ans.state.CP_Deep)
xlabel('Time (Ma)')
ylabel('C:P ratio (Deep ocean)')
hold on
box on
%%
subplot(3,2,5)
plot(ans.state.time/10e5,ans.state.CP_Prox)
xlabel('Time (Ma)')
ylabel('C:P ratio (proximal)')
hold on
box on
%%
subplot(3,2,6)
plot(ans.state.time/10e5,ans.state.CPanoxic)
xlabel('Time (Ma)')
ylabel('C:P ratio (anoxic)')
hold on
box on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,1)
plot(ans.state.time/10e5,ans.state.Deep_Preac_Burial)
xlabel('Time (Ma)')
ylabel('Reactive Phosphorous Burial (Deep ocean)')
hold on
box on
subplot(2,2,2)
plot(ans.state.time/10e5,ans.state.Dist_Preac_Burial)
xlabel('Time (Ma)')
ylabel('Reactive Phosphorous Burial (Distal)')
hold on
box on
%%
subplot(2,2,3)
plot(ans.state.time/10e5,ans.state.Prox_Preac_Burial)
xlabel('Time (Ma)')
ylabel('Reactive Phosphorous Burial (Proximal)')
hold on
box on
%%
subplot(2,2,4)
plot(ans.state.time/10e5,ans.state.Total_POC_Burial)
xlabel('Time (Ma)')
ylabel('Total_POC_Burial')
hold on
box on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,1)
plot(ans.state.time/10e5,ans.state.Atmos_Weather)
xlabel('Time (Ma)')
ylabel('Atmosphere Weather')
hold on
box on
%%
subplot(2,2,2)
plot(ans.state.time/10e5,ans.state.A)
xlabel('Time (Ma)')
ylabel('inorganic carbon reservoir')
hold on
box on
%%
subplot(2,2,3)
plot(ans.state.time/10e5,ans.state.Fmocb)
xlabel('Time (Ma)')
ylabel('Total organic carbon burial')
hold on
box on
%%
subplot(2,2,4)
plot(ans.state.time/10e5,ans.state.forg)
xlabel('Time (Ma)')
ylabel('Total Organic carbon burial rate')
hold on
box on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

