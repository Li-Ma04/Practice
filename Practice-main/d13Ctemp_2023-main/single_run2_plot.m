figure



subplot(2,2,1)
plot(state.time/10e5,state.Deep_Preac_Burial)
xlabel('Time (Ma)')
ylabel('Reactive Phosphorous Burial (Deep ocean)')
hold on
box on
subplot(2,2,2)
plot(state.time/10e5,state.Dist_Preac_Burial)
xlabel('Time (Ma)')
ylabel('Reactive Phosphorous Burial (Distal)')
hold on
box on
%%
subplot(2,2,3)
plot(state.time/10e5,state.Prox_Preac_Burial)
xlabel('Time (Ma)')
ylabel('Reactive Phosphorous Burial (Proximal)')
hold on
box on
%%
subplot(2,2,4)
plot(state.time/10e5,state.Total_POC_Burial)
xlabel('Time (Ma)')
ylabel('Total_POC_Burial')
hold on
box on
%%


