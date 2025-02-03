figure

subplot(3,3,1)
semilogy(state.time/10e5,state.NO3_Pconc)
hold on
semilogy(state.time/10e5,state.NO3_Dconc)
semilogy(state.time/10e5,state.NO3_Sconc)
semilogy(state.time/10e5,state.NO3_DPconc)
xlabel('Time (Ma)')
ylabel('NO3 (mmol/L)')
legend('NO3 (Prox)','NO3 (dist)','NO3 (surf)','NO3 (deep)')

hold on
box on
%%
subplot(3,3,2)
semilogy(state.time/10e5,state.NH4_Pconc)
hold on
semilogy(state.time/10e5,state.NH4_Dconc)
semilogy(state.time/10e5,state.NH4_Sconc)
semilogy(state.time/10e5,state.NH4_DPconc)
xlabel('Time (Ma)')
ylabel('NH4 (mmol/L)')
legend('NH4 (Prox)','NH4 (dist)','NH4 (surf)','NH4 (deep)')
hold on
box on
%%
subplot(3,3,3)
semilogy(state.time/10e5,state.NH4_Nfix_P)
hold on
semilogy(state.time/10e5,state.NH4_Nfix_D)
semilogy(state.time/10e5,state.NH4_Nfix_S)

xlabel('Time (Ma)')
ylabel('Nitrogen fixation(mol)')
legend('Prox','dist','surf')
hold on
box on
%%
subplot(3,3,4)
semilogy(state.time/10e5,state.NO3_Nitri_P)
hold on
semilogy(state.time/10e5,state.NO3_Nitri_D)
semilogy(state.time/10e5,state.NO3_Nitri_S)
semilogy(state.time/10e5,state.NO3_Nitri_DP)

xlabel('Time (Ma)')
ylabel('Nitrification(mol)')
legend('Prox','dist','surf','deep')
hold on
box on
%%
subplot(3,3,5)
semilogy(state.time/10e5,state.NO3_denit_P_water)
hold on
semilogy(state.time/10e5,state.NO3_denit_D_water)
%semilogy(state.time/10e5,state.NO3_denit_S_water)
semilogy(state.time/10e5,state.NO3_denit_DP_water)

xlabel('Time (Ma)')
ylabel('Water denitrification(mol)')
legend('Prox','dist','deep')
hold on
box on
%%
subplot(3,3,7)
plot(state.time/10e5,state.PON_Min_P)
hold on
plot(state.time/10e5,state.PON_Min_D)
plot(state.time/10e5,state.PON_Min_S)
plot(state.time/10e5,state.PON_Min_DP)

xlabel('Time (Ma)')
ylabel('Norg mineralization(mol)')
legend('Prox','dist','surf','deep')
hold on
box on

%%
subplot(3,3,8)
plot(state.time/10e5,state.N_PP_P)
hold on
plot(state.time/10e5,state.N_PP_D)
plot(state.time/10e5,state.N_PP_S)


xlabel('Time (Ma)')
ylabel('Primary production nitrogen(mol)')
legend('Prox','dist','surf')
hold on
box on
 %%%
% subplot(4,3,9)
% semilogy(state.time/10e5,state.NH4_PP_P)
% hold on
% semilogy(state.time/10e5,state.NH4_PP_D)
% semilogy(state.time/10e5,state.NH4_PP_S)
% 
% 
% xlabel('Time (Ma)')
% ylabel('Ammonia to PPN(mol)')
% legend('Prox','dist','surf')
% hold on
% box on
% %%
% subplot(4,3,10)
% semilogy(state.time/10e5,state.NO3_PP_P)
% hold on
% semilogy(state.time/10e5,state.NO3_PP_D)
% semilogy(state.time/10e5,state.NO3_PP_S)
% xlabel('Time (Ma)')
% ylabel('Nitrate to PPN(mol)')
% legend('Prox','dist','surf')
% hold on
% box on

subplot(3,3,6)
semilogy(state.time/10e5,state.NO3_denit_P_sediment)
hold on
semilogy(state.time/10e5,state.NO3_denit_D_sediment)
%semilogy(state.time/10e5,state.NO3_denit_S_sediment)
semilogy(state.time/10e5,state.NO3_denit_DP_sediment)

xlabel('Time (Ma)')
ylabel('sediment denit(mol)')
legend('Prox','dist','deep')
hold on
box on
%%
subplot(3,3,9)

semilogy(state.time/10e5,state.total_marine_PON)
hold on
semilogy(state.time/10e5,state.total_marine_PPN)

xlabel('Time (Ma)')
ylabel('Total production and mineralization N (mol)')
legend('Total min','Total PPN')
hold on
box on


print(gcf, 'myplot.emf', '-dmeta',"-r600");




