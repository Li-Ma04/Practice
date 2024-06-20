figure




subplot(3,2,1)
plot(state.time/10e5,state.Aiso)
xlabel('Time (Ma)')
ylabel('δ^{13}C (‰)')
hold on
box on
%%
subplot(3,2,2)
plot(state.time/10e5,state.CO2atm/10e-7)
xlabel('Time (Ma)')
ylabel('CO_{2} (ppm)')
hold on
box on
%%
subplot(3,2,3)
plot(state.time/10e5,state.O2_A/present.O2_A)
xlabel('Time (Ma)')
ylabel('O_{2} (atmosphere) (PAL)')
hold on
box on
%%
subplot(3,2,4)
plot(state.time/10e5,state.O2_DP/present.O2_A)
xlabel('Time (Ma)')
ylabel('O_{2} (Deep ocean) (PAL)')
hold on
box on
%%
subplot(3,2,5)
plot(state.time/10e5,state.Dist_Preac_Burial)
xlabel('Time (Ma)')
ylabel('Distal shelf P burial (mol yr^{-1})')
hold on
box on
%%
subplot(3,2,6)
plot(state.time/10e5,state.GAST-273.15)
xlabel('Time (Ma)')
ylabel('Global average surface temperature (℃)')
hold on
box on


