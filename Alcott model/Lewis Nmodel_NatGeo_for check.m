%%NH4 produced by N2 fixation in different zone
NH4_PNfix = 0.1e12  ;%morden level
NH4_DNfix = 2.3e12  ;
NH4_SNfix = 10e12  ;

%%%%%%%%%% Proximal
NH4_Nfix_P = NH4_PNfix /(0.8+exp(0.4*(N_P/SRP_P-16)));

%%%%%%%%% Distal
NH4_Nfix_D = NH4_DNfix / (0.8+exp(0.4*(N_D/SRP_D-16)));

%%%% Surface Ocean
NH4_Nfix_S = NH4_SNfix / (0.8+exp(0.4*(N_S/SRP_S-16)));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% nitrification in different zone
%%%%% Proximal
NO3_PNitri = 4.52e12 ; %morden level
NO3_Nitri_P = NO3_PNitri * (O2_Pconc / present.Conc_O2_P ) * (NH4_Pconc/starting.NH4_Pconc)  ;%Affected by NH4+,and oxygen

%%%% Distal
NO3_DNitri = 8.19e13 ;
NO3_Nitri_D = NO3_DNitri * (O2_Dconc / present.Conc_O2_D ) * (NH4_Dconc/starting.NH4_Dconc) ;

%%%%% Surface Ocean
NO3_SNitri = 5.15e14 ;
NO3_Nitri_S = NO3_SNitri *  (O2_Sconc / present.Conc_O2_S ) * (NH4_Sconc/starting.NH4_Sconc)  ; 

%%%%% Deep Ocean
NO3_DPNitri = 8.14e13 ;
NO3_Nitri_DP = NO3_DPNitri * (O2_DPconc / present.Conc_O2_deep ) * (NH4_DPconc/starting.NH4_DPconc)  ; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%Loss of NO3 during denitrification in different zone	
NO3_Pdenit = 0.45e12 ;
NO3_Ddenit = 3.7e12 ;
NO3_DPdenit = 7.7e12  ;

%%%%% Proximal
NO3_denit_P_water = 0.3 * NO3_Pdenit * (NO3_Nitri_P / NO3_PNitri)* (NO3_Pconc/starting.NO3_Pconc)* (1+ (1 - (O2_Pconc / present.Conc_O2_P ))) ; %Affected by nitrification rate,NO₃⁻,and oxygen
NO3_denit_P_sediment = 0.7 * NO3_Pdenit * (NO3_Pconc/starting.NO3_Pconc)*  (1+ (1 - (O2_Pconc / present.Conc_O2_P )))  ;%Affected by NO₃⁻,and oxygen

%%%%%%% Distal
NO3_denit_D_water =0.3* NO3_Ddenit* (NO3_Nitri_D / NO3_DNitri) * (NO3_Dconc/starting.NO3_Dconc)*  (1+ (1 - (O2_Dconc / present.Conc_O2_D )));
NO3_denit_D_sediment =0.7* NO3_Ddenit * (NO3_Dconc/starting.NO3_Dconc)*  (1+ (1 - (O2_Dconc / present.Conc_O2_D )))  ;

%%%%%%% Deep Ocean
NO3_denit_DP_water =0.3* NO3_DPdenit * (NO3_Nitri_DP / NO3_DPNitri)  * (NO3_DPconc/starting.NO3_DPconc)* (1+ (1 - (O2_DPconc / present.Conc_O2_deep )));
NO3_denit_DP_sediment =0.7* NO3_DPdenit * (NO3_DPconc/starting.NO3_DPconc)* (1+ (1 - (O2_DPconc / present.Conc_O2_deep )));

%%%%%%%%%%%%%%%%%%%%%Total d15N in seawater
d15N_NO3_Riv = 5 ;
d15N_NH4_Riv = 3 ;
d15N_Nfix = 0 ;
delta_Wdenit = N_15N - 15 ;

total_marine_bury = total_marine_PPNH4 + total_marine_PPNO3 - total_marine_PON; %The total primary N production minus organic N mineralization represents the total buried N.

dy(40) = River_NH4 + River_NO3 + total_marine_Nfix - total_marine_Wdenit - total_marine_Sdenit - total_marine_bury; 
dy(41) = (River_NH4 * d15N_NH4_Riv + River_NO3 * d15N_NO3_Riv + total_marine_Nfix * d15N_Nfix - total_marine_Wdenit * delta_Wdenit - total_marine_Sdenit * N_15N - total_marine_bury * N_15N )/N_total;



