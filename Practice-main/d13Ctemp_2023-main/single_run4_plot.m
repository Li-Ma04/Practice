figure



subplot(2,2,1)
plot(state.time/10e5,state.D)
xlabel('Time (Ma)')
ylabel('Degassing rate (relative to present)')
hold on
box on
%%
subplot(2,2,2)
plot(state.time/10e5,state.fbiota)
xlabel('Time (Ma)')
ylabel('Biological weathering enhancement (relative to present)')
hold on
box on
%%
subplot(2,2,3)
plot(state.time/10e5,state.EXPOSED)
xlabel('Time (Ma)')
ylabel('Exposed landmass (relative to present)')
hold on
box on
%%
subplot(2,2,4)
plot(state.time/10e5,state.C)
xlabel('Time (Ma)')
ylabel('Crustal carbon reservoir (relative to present)')
hold on
box on


