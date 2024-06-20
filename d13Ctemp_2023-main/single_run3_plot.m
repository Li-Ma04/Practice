figure



subplot(2,2,1)
plot(state.time/10e5,state.Atmos_Weather)
xlabel('Time (Ma)')
ylabel('Atmosphere Weather')
hold on
box on
%%
subplot(2,2,2)
plot(state.time/10e5,state.A)
xlabel('Time (Ma)')
ylabel('inorganic carbon reservoir')
hold on
box on
%%
subplot(2,2,3)
plot(state.time/10e5,state.Fmocb)
xlabel('Time (Ma)')
ylabel('Total organic carbon burial')
hold on
box on
%%
subplot(2,2,4)
plot(state.time/10e5,state.forg)
xlabel('Time (Ma)')
ylabel('Total Organic carbon burial rate')
hold on
box on


