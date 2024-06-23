figure



subplot(3,2,1)
plot(state.time/10e5,state.SRP_DP)
xlabel('Time (Ma)')
ylabel('Soluble Reactive Phosphorous (Deep ocean)')
hold on
box on
subplot(3,2,2)
plot(state.time/10e5,state.River_SRP)
xlabel('Time (Ma)')
ylabel('Riverine P input')
hold on
box on
%%
subplot(3,2,3)
plot(state.time/10e5,state.CP_Dist)
xlabel('Time (Ma)')
ylabel('C:P ratio (Distal)')
hold on
box on
%%
subplot(3,2,4)
plot(state.time/10e5,state.CP_Deep)
xlabel('Time (Ma)')
ylabel('C:P ratio (Deep ocean)')
hold on
box on
%%
subplot(3,2,5)
plot(state.time/10e5,state.CP_Prox)
xlabel('Time (Ma)')
ylabel('C:P ratio (proximal)')
hold on
box on
%%
subplot(3,2,6)
plot(state.time/10e5,state.CPanoxic)
xlabel('Time (Ma)')
ylabel('C:P ratio (anoxic)')
hold on
box on


