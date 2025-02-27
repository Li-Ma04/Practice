%% Alcott et al., Nat Geo 2024
% Model based on Slomp and VanCappellen, 2007, Biogeosciences; Tsandev et
% al., 2008, GBC; Tsandev and Slomp, 2009, EPSL. Alcott et al., 2019
% Model equations (do not run this script)

function dy = Alcott_et_al_2024_NatGeo(t,y)
% Set up dy array
dy = zeros(41,1) ;

%%% Set up Global parameters
global stepnumber
global pars
global workingstate
global starting
global per
global present
global sensparams

%% Reservoirs
Water_P = y(1) ;
Water_D = y(2) ;
Water_S = y(3) ;
Water_DP = y(4) ;
POC_P = y(5) ;
POC_D = y(6) ;
POC_S = y(7) ;
POC_DP = y(8) ;
O2_DP = y(12) ;
SRP_P = y(13) ;
OP_P = y(14) ;
SRP_D = y(15) ;
OP_D = y(16) ;
SRP_S = y(17) ;
OP_S = y(18) ;
SRP_DP = y(19) ;
OP_DP = y(20) ;
O2_A = y(21) ;
A = y(22) ;
Aiso = y(23) ;

%%%% Nitrate ;
NO3_P = y(24) ;
NO3_D = y(25) ;
NO3_S = y(26) ;
NO3_DP = y(27) ;

%%%% NH4
NH4_P = y(28) ;
NH4_D = y(29) ;
NH4_S = y(30) ;
NH4_DP = y(31) ;

%%%%%
% totalN_P = y(32) ;
% N_15N_P = y(33) ;
% totalN_D = y(34) ;
% N_15N_D = y(35) ;
% 
% %%%% 
% totalN_S = y(36) ;
% N_15N_S = y(37) ;
% totalN_DP = y(38) ;
% N_15N_DP = y(39) ;



%%%% TN
%  NO3_total = y(41) ;
% %NH4_total = y(42) ;
 N_total = y(40) ;
 N_15N = y(41) ;
% NH4_15N = y(35) ;





% Linear relationship for oxygen content in boxes in contact with atmosphere 
O2_P = ( present.O2_P * ( O2_A / present.O2_A ) ) ;
O2_S = ( present.O2_S * ( O2_A / present.O2_A ) ) ;
O2_D = ( present.O2_D * ( O2_A / present.O2_A ) );



Norm_O2_P = O2_P / present.O2_P ;
Norm_O2_D = O2_D / present.O2_D ;
Norm_O2_S = O2_S / present.O2_S ;
Norm_O2_DP = O2_DP / present.O2_DP ;


%% Forcings

Pforce = per.P ;
carbconst = 0.9 ;
silconst = 0.33 ;


%%%%% define off and on ramps
  tgeol = t/1e6 ; % For now but set to 570 for neoprot
  turn_on = sigmf(tgeol,[1e-1 -4100]) ;
  turn_off = 1 - turn_on ;

if per.runcontrol == 0
    
    EXPOSED = 1 ; %Rough estimate of rapid emergence prior to GOE
    D = 1 ;
    pars.CPanoxic_prox = 106 ;
    pars.CPanoxic_dist = 106 ;
    pars.CPanoxic_deep = 106 ;
    C = 1 ;
    pars.fbiota = 1 ;
    locb = 1;
    %NH4_O = 1 ;
    %S_O =1 ;
    %tgeol = 0 ;
    %Fungi = 1 ;

    
else
    EXPOSED = ( interp1([-4.2e9 -3e9 (-1e9*sensparams.EXPtiming) -1.7e9 -1.6e9 0],[sensparams.EXP sensparams.EXP sensparams.EXP2 1 1 1],t) )*turn_on + 1*turn_off ; %Rough estimate of rapid emergence prior to GOE
    D = ( interp1([-4.2e9 -3e9 -2e9 0],[12 5 2 1],t) * sensparams.D )*turn_on + 1*turn_off ;
    pars.CPanoxic_prox = sensparams.CP*turn_on + 106*turn_off ;
    pars.CPanoxic_dist = sensparams.CP*turn_on + 106*turn_off ;
    pars.CPanoxic_deep = sensparams.CP*turn_on + 106*turn_off ;
    C = ( interp1([per.C_HW_2006_time],[per.C_HW_2006_data],t)^ sensparams.C )*turn_on  +  1*turn_off;
    pars.fbiota  =( interp1([-4.2e9 -450e6 -350e6 0],[sensparams.fbiota sensparams.fbiota 1 1],t) )*turn_on  +  1*turn_off ;
    locb = ( interp1([-4.2e9 -450e6 -350e6 0], [0 0 1 1],t) )*turn_on + 1*turn_off ;
    %NH4_O = ( interp1([-4.2e9 -3.2e9 -2e9 0], [0 0 1 1],t) )*turn_on + 1*turn_off ;
     %S_O = ( interp1([-4.2e9 -3.2e9 -2.6e9 -1.8e9 -0.8e9 0], [0 1 1 0.6 0.3 1],t) )*turn_on + 1*turn_off ;
    
    
 
%     EXPOSED = interp1([-4.2e9 -3e9 (-1e9*sensparams.EXPtiming) -1.7e9 -1.6e9 0],[sensparams.EXP sensparams.EXP sensparams.EXP2 1 1 1],t) ; %Rough estimate of rapid emergence prior to GOE
%     D = interp1([-4.2e9 -3e9 -2e9 0],[12 5 2 1],t) * sensparams.D;
%     pars.CPanoxic_prox = sensparams.CP ;
%     pars.CPanoxic_dist = sensparams.CP ;
%     pars.CPanoxic_deep = sensparams.CP ;
%     C = interp1([per.C_HW_2006_time],[per.C_HW_2006_data],t)^ sensparams.C ;
%     pars.fbiota = interp1([-4.2e9 -450e6 -350e6 0],[sensparams.fbiota sensparams.fbiota 1 1],t) ;
%     locb = interp1([-4.2e9 -450e6 -350e6 0], [0 0 1 1],t) ;
    





   
     

end


U = 1 ;
PG = 1 ;



%% Concentrations 
present.Conc_O2_deep = present.O2_DP / starting.Water_DP ;
present.Conc_O2_S = present.O2_S / starting.Water_S ;
present.Conc_O2_D = present.O2_D / starting.Water_D ;
present.Conc_O2_P = present.O2_P / starting.Water_P ;

O2_Pconc = O2_P / Water_P ;
O2_Dconc = O2_D / Water_D ;
O2_Sconc = O2_S / Water_S ;
O2_DPconc = O2_DP/Water_DP;                        
OP_Dconc  = y(16)/y(2);                           
OP_Pconc  = y(14)/y(1); 
OP_Sconc  = y(18)/y(3);
OP_DPconc  = y(20)/y(4);                          
SRP_DPconc = y(19)/y(4);                           
SRP_Dconc = y(15)/y(2);                            
SRP_Pconc = y(13)/y(1);                            
SRP_Sconc = y(17)/y(3);  
    
%N cycle
NO3_Pconc = y(24)/y(1) ;
NO3_Dconc = y(25)/y(2) ;
NO3_Sconc = y(26)/y(3) ;
NO3_DPconc = y(27)/y(4) ;
NH4_Pconc = y(28)/y(1) ;
NH4_Dconc = y(29)/y(2) ;
NH4_Sconc = y(30)/y(3) ;
NH4_DPconc = y(31)/y(4) ;
    



%% Oceanic Water Cycle
%%% As in Slomp and Van Cappellen, 2007

%River flow entering Water_P
River_Water = 37e12 ; %Berner and Berner1996

%flow from Water_P to Water_D
Water_P_D = River_Water ; 

%Coastal Upwelling
Water_DP_D = pars.kWF6 * Water_DP ; %12Sv -  Brink et al1995

%flow from Water_D to Water_S
Water_D_S = Water_P_D + Water_DP_D ;

%Oceanic Upwelling
Water_DP_S = Water_DP* pars.kWF5 ; %120Sv - Brink et al1995

%downwelling (Water_S to Water_DP)
Water_S_DP = pars.kWF4 * Water_S ;

%Evaporation from Water_S
Evaporation_Water = River_Water ;

%% Hydrological Cycle

%Proximal Zone
dy(1) = River_Water - Water_P_D ;

%Distal Zone
dy(2) = Water_P_D + Water_DP_D - Water_D_S ;

%Surface Ocean
dy(3) = Water_DP_S + Water_D_S - Water_S_DP - Evaporation_Water ;

%Deep Ocean
dy(4) = Water_S_DP - Water_DP_S - Water_DP_D ;


%% Normalised to present day reservoirs
Norm_SRP_P = SRP_P / present.SRP_P ;
Norm_SRP_D = SRP_D / present.SRP_D ;
Norm_SRP_S = SRP_S / present.SRP_S ;
Norm_OP_P = OP_P / present.OP_P ;
Norm_OP_D = OP_D / present.OP_D ;
Norm_OP_S = OP_S / present.OP_S ;
Norm_POC_P = POC_P / present.POC_P ;
Norm_POC_D = POC_D / present.POC_D ;
Norm_POC_S = POC_S / present.POC_S ;
Norm_POC_DP = POC_DP / present.POC_DP ;
Norm_NO3_P = NO3_P / present.NO3_P ;
Norm_O2_A = O2_A / present.O2_A ;
Norm_O2_A = O2_A / present.O2_A ;
Norm_O2_A = O2_A / present.O2_A ;
Norm_O2_A = O2_A / present.O2_A ;

%% Marine Carbon Cycle


%%%%%%%%%%%%%%%%%%%%%Proximal zone
%%%%%%%%%Carbon Cycle
% Primary production in Proximal
%PP_P = pars.kPhotoprox * Norm_SRP_P * pars.Redfield_CP ;

%Primary production in Proximal
 total_N_Pconc = ( y(24) + y(28) ) /y(1) ;
 norm_total_N_Pconc = total_N_Pconc / ( (present.NO3_P + present.NH4_P) /starting.Water_P )  ;
 
 
%PP_P = starting.Prox_Prod_Photo * min(Norm_SRP_P,norm_total_N_Pconc);只能比总量或浓度
 
 %Define the transition interval range
transition_threshold_P = total_N_Pconc / 16; % The limit of phosphorus and nitrogen equality
transition_range_P = 0.1 * transition_threshold_P; % transition interval range


if SRP_Pconc < (transition_threshold_P - transition_range_P)
    % Phosphorus limitation
    PP_P = starting.Prox_Prod_Photo * Norm_SRP_P ;

elseif SRP_Pconc > (transition_threshold_P + transition_range_P)
    % nitrogen limitation
    PP_P = starting.Prox_Prod_Photo * norm_total_N_Pconc; 

else
    % In the transition interval, the effects of phosphorus and nitrogen are considered proportionally
    proportion_P_P = (transition_threshold_P + transition_range_P - SRP_Pconc) / (2 * transition_range_P);
    proportion_N_P = 1 - proportion_P_P;

    PP_P =starting.Prox_Prod_Photo * (proportion_P_P * Norm_SRP_P + proportion_N_P * norm_total_N_Pconc);
end

% POC mineralisation in Proximal
POC_Min_P = pars.kminprox * Norm_POC_P ;

% POC export from Proximal to Distal
OP_P_D = Water_P_D * OP_Pconc ;
XP_P_D = OP_P_D * pars.Redfield_CP ; 

% Proximal sediment POC burial
POC_P_Burial = pars.Prox_C_Bur * PP_P ; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%Distal zone
%%%%%%%%%%%%%%%%%%%%%Carbon Cycle

% Primary Production in Distal
%PP_D = pars.kPhotodist * Norm_SRP_D * pars.Redfield_CP ; 

%Primary production in Distal
 total_N_Dconc = ( y(25) + y(29) ) /y(2) ;
 norm_total_N_Dconc = total_N_Dconc / ( (present.NO3_D + present.NH4_D) /starting.Water_D )  ;
 
%PP_D = starting.PP_D_0 * min(Norm_SRP_D,norm_total_N_Dconc) ;

transition_threshold_D = total_N_Dconc / 16; 
transition_range_D = 0.1 * transition_threshold_D; 


if SRP_Dconc < (transition_threshold_D - transition_range_D)

    PP_D =starting.PP_D_0 * Norm_SRP_D ;  

elseif SRP_Dconc > (transition_threshold_D + transition_range_D)

    PP_D = starting.PP_D_0 * norm_total_N_Dconc ; 

else

    proportion_P_D = (transition_threshold_D + transition_range_D - SRP_Dconc) / (2 * transition_range_D);
    proportion_N_D = 1 - proportion_P_D;

    PP_D = starting.PP_D_0 * (proportion_P_D * Norm_SRP_D  + proportion_N_D * norm_total_N_Dconc);
end

% POC mineralisation in Distal
POC_Min_D = pars.kmindist * Norm_POC_D ; 

% POC Export from Distal to Surface
OP_D_S = Water_D_S * OP_Dconc ;
XP_D_S = OP_D_S * pars.Redfield_CP ; 

% Distal sediment POC burial
POC_D_Burial = pars.Dist_C_Bur * ( XP_P_D + PP_D ) ; 

%%%%%%%%%%%%%%%%%%%%Surface zone
%%%%%%%%%%%%%%Carbon Cycle

% Primary Production in Surface
%PP_S = pars.kPhotosurf * Norm_SRP_S * pars.Redfield_CP ; 

% Primary production in surface 
total_N_Sconc = ( y(26) + y(30) ) /y(3) ;
norm_total_N_Sconc = total_N_Sconc / ( (present.NO3_S + present.NH4_S) /starting.Water_S )  ;
PP_S_0 = 3.8688e15 ;

%PP_S = PP_S_0 * min(Norm_SRP_S,norm_total_N_Sconc) ;


transition_threshold_S = total_N_Sconc / 16; 
transition_range_S = 0.1 * transition_threshold_S; 


if SRP_Sconc < (transition_threshold_S - transition_range_S)

    PP_S = PP_S_0 * Norm_SRP_S ;  

elseif SRP_Sconc > (transition_threshold_S + transition_range_S)

    PP_S =PP_S_0 * norm_total_N_Sconc ; 

else

    proportion_P_S = (transition_threshold_S + transition_range_S - SRP_Sconc) / (2 * transition_range_S);
    proportion_N_S = 1 - proportion_P_S;

    PP_S = PP_S_0 * (proportion_P_S * Norm_SRP_S  + proportion_N_S * norm_total_N_Sconc );
end

% POC mineralisation in Surface
POC_Min_S = pars.kminsurf * Norm_POC_S ; 

% POC export from Surface to Deep
XP_S_DP = pars.Surf_Deep_XP * ( XP_D_S + PP_S ) ; 

%%%%%%%%%%%%%%%%%%%%Deep ocean zone
%%%%%%%%%%%%%Carbon Cycle
% POC respiration in Water_DP
POC_DP_Resp = pars.kCF12 * Norm_POC_DP ; 

%% Deep Carbon Burial

if O2_DPconc < present.Conc_O2_deep
    
    % Deep sediment POP burial
    % Redox dependancy is set up according to Slomp and VC, 2007 and Tsandev et al., 2009. 
    OP_DP_Burial = ( pars.kPOP_Bur_Deep * XP_S_DP / pars.CPoxic ) * ( (1-per.POP_deep_feedback) + (per.POP_deep_feedback * O2_DPconc / present.Conc_O2_deep ));
    
    % Deep sediment FeP burial
    P_FeP_DP = pars.kFeP_Deep * ( O2_DPconc / present.Conc_O2_deep );
    
    % Deep sediment POC burial
    POC_DP_Burial = OP_DP_Burial * ( ( pars.CPanoxic_deep * pars.CPoxic ) / ( ( ( O2_DPconc / present.Conc_O2_deep ) * pars.CPanoxic_deep ) + ( ( 1 - ( O2_DPconc / present.Conc_O2_deep ) ) * pars.CPoxic ) ) ) ;
        
else
     OP_DP_Burial= pars.kPOP_Bur_Deep * XP_S_DP / pars.CPoxic;  
     P_FeP_DP = pars.kFeP_Deep ;
     POC_DP_Burial = pars.CPoxic * OP_DP_Burial ;    
end


%Carbon Proximal Zone
dy(5) = PP_P - POC_Min_P - POC_P_Burial  - XP_P_D ;

%Carbon Distal Zone
dy(6) = XP_P_D + PP_D - POC_D_Burial - POC_Min_D - XP_D_S ; 

%Carbon Surface Ocean
dy(7) = XP_D_S + PP_S - POC_Min_S - XP_S_DP ;

%Carbon Deep Ocean
dy(8) = XP_S_DP - POC_DP_Resp - POC_DP_Burial ;

POCTotal = PP_P - POC_Min_P - POC_P_Burial  - XP_P_D + XP_P_D + PP_D - POC_D_Burial - POC_Min_D - XP_D_S +XP_D_S + PP_S - POC_Min_S - XP_S_DP + XP_S_DP - POC_DP_Resp - POC_DP_Burial;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Oxygen Cycle

% fanoxic parameters (From Watson et al., 2017)
kanox = 10 ; 
O2O20 = Norm_O2_A ;
kU = 0.4 ;

%fanoxic calculation from Watson et al., 2017
%proximal zone
% newp_P = 117 * min(total_N_Pconc/16,SRP_Pconc) ; 
% newp_P0 = 117 * min( ( (present.NO3_P + present.NH4_P) /starting.Water_P )/16,(present.SRP_P/starting.Water_P)) ;
% Norm_newp_P = newp_P / newp_P0 ;
% fanoxicprox = 1 / ( 1 + exp(-kanox * ( kU * Norm_newp_P - O2O20 ) ) ) ; 
% % %%%%distal zone
% newp_D = 117 * min(total_N_Dconc/16,SRP_Dconc) ; 
% newp_D0 = 117 * min( ( (present.NO3_D + present.NH4_D) /starting.Water_D )/16,(present.SRP_D/starting.Water_D)) ;
% Norm_newp_D = newp_D / newp_D0 ;
% fanoxicdist = 1 / ( 1 + exp(-kanox * ( kU * Norm_newp_D - O2O20 ) ) ) ; 
% 
% fanoxicprox = 1 / ( 1 + exp(-kanox * ( kU * Norm_SRP_P - O2O20 ) ) ) ; 
% fanoxicdist = 1 / ( 1 + exp(-kanox * ( kU * Norm_SRP_D - O2O20 ) ) ) ; 
% 
% 
% present.fanoxicprox = 0.0025 ;
% present.fanoxicdist = 0.0025 ;
% starting.fanoxic = 0.0025 ;

%Concentration of oxygen 
O2_Sconc = O2_S/Water_S ;

%O2 Downwelling
O2_S_DP = Water_S_DP * O2_Sconc ;  

%O2 coastal upwelling
O2_DP_D =  Water_DP_D * O2_DPconc; 

%O2 oceanic upwelling
O2_DP_S = Water_DP_S * O2_DPconc; 

%Aerobic O2 respiration
Respiration_O21 = pars.kCF12 * Norm_POC_DP / pars.Redfield_CO2; % Preliminary Respiration quanitity before Monod inclusion
KmO2 = 0.0001 ; % monod constant for oxic respiration in mol/m3 
Mon_O2_deep = O2_DPconc / ( KmO2 + O2_DPconc ) ;
Respiration_O2 = Respiration_O21 * Mon_O2_deep ;

FeO = pars.FeO * D * ( O2_DPconc / present.Conc_O2_deep ) ;

%% Oxygen dys

%Oxygen Deep Ocean 
dy(12) = - Respiration_O2 - O2_DP_S - O2_DP_D + O2_S_DP - FeO ;

Atmos_Weather = pars.O2_A_Weathering * (sqrt(O2_A/ present.O2_A)) * EXPOSED ;

Total_POC_Burial = POC_P_Burial + POC_D_Burial + POC_DP_Burial ; 

if Norm_O2_A <= 1e-10
    Norm_O2_A1 = 1e-10 ;
else
    Norm_O2_A1 = real(Norm_O2_A) ;
end

save = sigmf((log10(Norm_O2_A1)),[3,-5]) ;

FrgfO2 = pars.rgf * D * save ;
Frgf = pars.rgf * D ;

% Land Corg burial 
Flocb = pars.Flocb_0 * locb ;

%% Oxygen atmosphere
dy(21) = Total_POC_Burial - Atmos_Weather - FrgfO2 + Flocb ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Carbon isotope

%Oxidative weathering
Foxidw = Atmos_Weather ; %Used to match oxidative weathering for the oxygen model

%CO2 ppm calculation
CO2 = (A / starting.A_0)^2 ;
CO2ppm = CO2 * 280 ;

%%%%%%% atmospheric fraction of total CO2, atfrac(A)
atfrac0 = 0.01614 ;
%%%%%%% variable
atfrac = atfrac0 * (A/starting.A_0) ;

%%%%%%%% calculations for pCO2, pO2
RCO2 = (A/starting.A_0)*(atfrac/atfrac0) ;
CO2atm = RCO2*(280e-6) ;

%Climate temp adjustment from COPSE
kclim = 5 ; %Kelvin

%COPSE method of temperature.
constant = 7.4 ;
GAST = 288 + (kclim * (  ( log(RCO2) ) / log(2) )) - (( constant * ( tgeol / -570 ) )) ;

%%%% relcalculate low lat temp for surface processes 
tgrad = 0.66 ;
tgrad = 1 ;
tc = 288*(1-tgrad) ;
Tsurf = GAST*tgrad + tc + 10 ; %%% low lat temp 25C at present
DT = GAST - 288 ;
DTsurf = Tsurf - 298 ;

%Basalt weathering temp dependance
fTbas = exp(pars.kTbas * (DT))  ;

%Granite weathering temp dependance
fTgran = exp(pars.kTgran * (DT))  ;

%Additional weathering flux dependances

f_T_bas =  exp(0.0608*(DTsurf)) * ( (1 + 0.038*(DTsurf))^0.65 ) ; %%% 42KJ/mol
f_T_gran =  exp(0.0724*(DTsurf)) * ( (1 + 0.038*(DTsurf))^0.65 ) ; %%% 50 KJ/mol
g_T = exp( 0.05*DTsurf ) ; %close fit to COPSE but doesnt go below zero

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if f_T_bas <=0
    f_T_bas = 0 ;
else
    f_T_bas = f_T_bas ;
end
if f_T_gran <=0
    f_T_gran = 0 ;
else
    f_T_gran = f_T_gran ;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Weathering
Fcarbw = pars.Fcarbw_0 * ( C ) * (U^carbconst) * PG * pars.fbiota * g_T * EXPOSED ; 
Fbasw = pars.k_basw * PG * pars.fbiota * f_T_bas * EXPOSED ;
Fgranw = pars.k_granw * (U^silconst) * PG * pars.fbiota * f_T_gran * EXPOSED ;
Fsilw = Fgranw + Fbasw ;

%Total weathering
Fw = Fcarbw + Fsilw ; 

%Carbonate carbon degassing
Fccdeg = pars.Fccdeg_0 * D * C ; %6e12 used by Shields et al for NeoProt.

Focdeg = pars.Focdeg_0 * D  ;

%Total organic carbon burial
Fmocb = (POC_P_Burial + POC_D_Burial + POC_DP_Burial) ; %Used to match organic carbon burial in the current model

%Carbonate burial
Fmccb = Fw ; 

%Sea floor weathering
Fsfw = pars.Fsfw_0 * D * exp(pars.kTsfw * (DT));

%Carbon isotope fractionations for 1 box COPSE
dG = -25 ;
dC = 1 ;
dA = Aiso ;
DB = 25 ;
dM = -5 ; %Mantle value

%%%% carbonate fractionation
delta_o = atfrac*( (9483/GAST)  - 23.89 ) ; 
d_mccb = delta_o + 15.1 - (4232/GAST) ; %%%% calcite burial
delta_mccb = dA ;

%%%% marine organic
capdelB_0 = 33 ;
Jparam =  5 ;
e_B_co2 = -9 / sqrt(RCO2) ;
e_o2 = Jparam * ( (O2_A/starting.O2_A) - 1) ;
DB = capdelB_0 + e_B_co2 + e_o2 ;
%%%% final calc
d_mocb = d_mccb - DB ;
delta_mocb = dA + d_mocb ;
% d_mocb = dA ;

%%%% land plant
capdelP_0 = 19 ;
capdelP = capdelP_0 + e_o2;
%%%% atmospheric
delta_a = (atfrac-1)*( (9483/GAST)  - 23.89 ) ; 
%%%% final calc
d_locb = delta_a - capdelP ;
delta_locb = dA + d_locb ;

dy(22) = Foxidw  + Focdeg + Fcarbw + Fccdeg - Fmocb - Fmccb - Fsfw + Frgf - Flocb ;
dy(23) = ((Foxidw*dG) + (Focdeg*dG) + (Fcarbw*dC) + (Fccdeg*dC) + (Frgf*dM) - (Fmocb*delta_mocb) - (Fmccb*delta_mccb) - (Fsfw*delta_mccb) - (Flocb*(delta_locb)) )/A ;

%% P Cycle

% SRP upwelling Water_DP to Water_S
SRP_DP_S = SRP_DPconc * Water_DP_S ; 

% SRP upwelling Water_DP to Water_D
SRP_DP_D = Water_DP_D * SRP_DPconc ; 

%% Proximal Coastal
%O2 limit for scavenging
scavlim = 1e-3 ;
Pfrac_silw = 2/12 ;
Pfrac_carbw = 5/12 ;
Pfrac_oxidw = 5/12 ;

% Forcing to vary Riverine P input.
River_SRP = pars.River_SRP_0 * Pforce * ( (Pfrac_silw * (Fsilw/pars.Fsilw_0) ) + ( Pfrac_carbw * (Fcarbw/pars.Fcarbw_0) ) + ( Pfrac_oxidw * (Foxidw/pars.O2_A_Weathering) ) ) *EXPOSED;

% Primary Production proximal
P_PP_P =  PP_P/pars.Redfield_CP ; 

% POP mineralisation
OP_P_Min = Norm_OP_P * pars.kPrel_prox  ; 

% SRP transport from Proximal to Distal
SRP_P_D = SRP_Pconc * Water_P_D ;
NO3_P_D = NO3_Pconc * Water_P_D ;

% Proximal sediment POP burial 
OP_P_Burial = pars.Prox_C_Bur * PP_P * ( ( (O2_Pconc / present.Conc_O2_P) / pars.CPoxic ) + ( ( 1 - (O2_Pconc / present.Conc_O2_P ) ) / pars.CPanoxic_prox )) ;

% Proximal FeP burial
P_FeP_P = pars.kFePprox * SRP_P * (O2_Pconc / present.Conc_O2_P);

% Proximal CaP burial
P_AuthP_P = pars.kCaP_P * OP_P_Min * (O2_Pconc / present.Conc_O2_P) ; %NEW

%% Distal Coastal

% Primary Production in Water_D
P_PP_D = PP_D / pars.Redfield_CP ; 

% POP mineralisation in Water_D
OP_D_Min = Norm_OP_D * pars.kPrel_dist ; 

% SRP transport Water_D to Water_S
SRP_D_S = SRP_Dconc * Water_D_S ;

% Distal sediment POP burial
OP_D_Burial = pars.kPOPDOADist * (PP_D + XP_P_D) * ( (( O2_Dconc / present.Conc_O2_D) / pars.CPoxic ) + (( 1 - (O2_Dconc / present.Conc_O2_D ) ) / pars.CPanoxic_dist ))  ;


% Distal sediment FeP burial
P_FeP_D = pars.kFePDOADist * SRP_D * (O2_Dconc / present.Conc_O2_D) ; 

% Distal Sediment CaP burial
P_AuthP_D = pars.kCaPDOADist * OP_D_Min * (O2_Dconc / present.Conc_O2_D) ;

%% Surface Ocean

% Primary Production 
P_PP_S = PP_S / pars.Redfield_CP; % Links P to C cycle

% POP mineralisation 
OP_S_Min = Norm_OP_S * pars.kPrel_surf ; 

% SRP downwelling from Water_S to Water_DP
SRP_S_DP = SRP_Sconc * Water_S_DP ;

% POP export from Water_S to Water_DP
OP_S_DP = pars.kCF11 * ( PP_S + XP_D_S ) / pars.Redfield_CP ; % Links P to C cycle

% Scavenging flux of FeP from surface ocean.
eSCAV_SURF = 1 / ( 1 + exp(5000*(O2_DPconc - scavlim ))) ; % Simple logistic curve, similar to Reinhard et al., 2017
Fe_SCAV_SURF = min( eSCAV_SURF * SRP_DP_S * per.sig_SCAV , 4.5e10 ); % upper limit variable

%% Deep Ocean

% POP mineralisation in Water_DP
OP_DP_Min = pars.kPrel_deep * OP_DP ;

% Deep sediment CaP burial
% Redox dependancy is set up according to Slomp and VC, 2007 and Tsandev et al., 2009. 
P_AuthP_DP =  pars.fPF34 * OP_DP_Min * ( (1-per.CaP_deep_feedback) + ( per.CaP_deep_feedback * ( O2_DPconc/present.Conc_O2_deep ) ) ) ; 



%% Phosphorus Differentials

%SRP Proximal
dy(13) = River_SRP - P_PP_P + OP_P_Min - P_FeP_P - P_AuthP_P - SRP_P_D ; 

%POP Proximal
dy(14) = P_PP_P - OP_P_Min - OP_P_Burial - OP_P_D  ;

%SRP Distal
dy(15) = SRP_P_D - P_PP_D + OP_D_Min - P_FeP_D - P_AuthP_D - SRP_D_S + SRP_DP_D ;

%POP Distal
dy(16) = OP_P_D + P_PP_D - OP_D_Min - OP_D_Burial - OP_D_S ;

%SRP Surface Ocean
dy(17) = SRP_D_S - P_PP_S + OP_S_Min - SRP_S_DP + SRP_DP_S ;

%POP Surface Ocean
dy(18) = OP_D_S + P_PP_S - OP_S_Min - OP_S_DP;

%SRP Deep Ocean
dy(19) = SRP_S_DP + OP_DP_Min - P_FeP_DP - P_AuthP_DP - SRP_DP_S - SRP_DP_D - Fe_SCAV_SURF;

%POP Deep Ocean
dy(20) = OP_S_DP - OP_DP_Min - OP_DP_Burial ;

%     
total_marine_POP = OP_P_Min + OP_D_Min + OP_S_Min + OP_DP_Min ;
total_marine_PPP = P_PP_P + P_PP_D + P_PP_S ;

total_marine_POC = POC_Min_P + POC_Min_D+ POC_Min_S+ POC_DP_Resp ;
total_marine_PP = PP_P + PP_D + PP_S ;
%%%% Nitrogen fluxes


%%%%% artificual floor for NO3
N_P = y(24) + y(28) ; %% Sum of NO3 and NH4 in Proximal
present.N_P = present.NO3_P + present.NH4_P ; %%% N reservoir present day sizes
N_D = y(25) + y(29) ; 
present.N_D = present.NO3_D + present.NH4_D ; 
N_S = y(26) + y(30) ; 
present.N_S = present.NO3_S + present.NH4_S ;


NO3_floor = -5 ;
NH4_floor = -8 ;


River_NO3 = 1.5e12 * (Foxidw/pars.O2_A_Weathering) *EXPOSED; %%% guess for now
River_NH4 = 1e11 * (Foxidw/pars.O2_A_Weathering) *EXPOSED;
pars.Redfield_NP = 16 ;
% Primary Production  
% Primary Production in Proximal

N_PP_P = P_PP_P*pars.Redfield_NP;
NO3_PP_P = NO3_P/N_P * N_PP_P ;
NH4_PP_P = NH4_P/N_P * N_PP_P ;   
% Primary Production in Distal
N_PP_D = P_PP_D*pars.Redfield_NP ;  
NO3_PP_D = NO3_D/N_D * N_PP_D ;
NH4_PP_D = NH4_D/N_D * N_PP_D ;
% Primary Production in Surface Ocean
N_PP_S = P_PP_S*pars.Redfield_NP;  
NO3_PP_S = NO3_S/N_S * N_PP_S ;
NH4_PP_S = NH4_S/N_S * N_PP_S ;

% PON mineralisation 

% PON mineralisation in Proximal
PON_Min_P = OP_P_Min*pars.Redfield_NP;
   % PON mineralisation in Distal
PON_Min_D = OP_D_Min*pars.Redfield_NP ;
    % PON mineralisation in Surface Ocean
PON_Min_S = OP_S_Min*pars.Redfield_NP;	
% PON mineralisation in Deep Ocean
PON_Min_DP = OP_DP_Min*pars.Redfield_NP ; 

% PON mineralisation in Deep Ocean
PON_bury_P = POC_P_Burial/pars.Redfield_CP ; 
% PON mineralisation in Deep Ocean
PON_bury_D = POC_D_Burial/pars.Redfield_CP ;
% PON mineralisation in Deep Ocean
PON_bury_DP = POC_DP_Burial/pars.Redfield_CP ;


%%%% N transport 
%%% from Proximal to Distal
NO3_P_D = NO3_Pconc * Water_P_D ;
NH4_P_D = NH4_Pconc * Water_P_D ;
%%% from Distal to Surface Ocean
NO3_D_S = NO3_Dconc * Water_D_S ; 
NH4_D_S = NH4_Dconc * Water_D_S ;
%%% from Surface Ocean to deep Ocean
NO3_S_DP = NO3_Sconc * Water_S_DP ;
NH4_S_DP = NH4_Sconc * Water_S_DP ;
%%% N upwelling Water_DP to Water_D
NO3_DP_D = NO3_DPconc * Water_DP_D ; 
NH4_DP_D = NH4_DPconc * Water_DP_D ; 
%%% N upwelling Water_DP to Water_S
NO3_DP_S = NO3_DPconc * Water_DP_S ; 
NH4_DP_S = NH4_DPconc * Water_DP_S ; 


%%%%% CURRENTLY FIXED



%%NH4 produced by N2 fixation in different zone

NH4_PNfix = 0.1e12  ;
NH4_DNfix = 2.3e12  ;
NH4_SNfix = 10e12  ;
%%%%%%%%%% Proximal
NH4_Nfix_P = NH4_PNfix /(0.8+exp(0.4*(N_P/SRP_P-16)));
%NH4_Nfix_P = NH4_PNfix *((present.N_P/present.SRP_P)/(N_P/SRP_P));
%%%%%%%%% Distal
NH4_Nfix_D = NH4_DNfix / (0.8+exp(0.4*(N_D/SRP_D-16)));
%NH4_Nfix_D = NH4_DNfix *((present.N_D/present.SRP_D)/(N_D/SRP_D));
%%%% Surface Ocean
NH4_Nfix_S = NH4_SNfix / (0.8+exp(0.4*(N_S/SRP_S-16)));
%NH4_Nfix_S = NH4_SNfix *((present.N_S/present.SRP_S)/(N_S/SRP_S));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Variable nitrification
%%%%% Proximal
pars.KmNH4 = 0 ;%值越大，硝化约小，氨越多，氮越多
NO3_PNitri = 4.52e12 ; %Present level
NO3_Nitri_P = NO3_PNitri * (O2_Pconc / present.Conc_O2_P ) * (NH4_Pconc/starting.NH4_Pconc)  ;
%NO3_Nitri_P_N2O = NO3_Nitri_P * pars.KmNH4;
%%%% Distal
NO3_DNitri = 8.19e13 ;
NO3_Nitri_D = NO3_DNitri * (O2_Dconc / present.Conc_O2_D ) * (NH4_Dconc/starting.NH4_Dconc) ;
%NO3_Nitri_D_N2O = NO3_Nitri_D * pars.KmNH4;
%%%%% Surface Ocean
NO3_SNitri = 5.15e14 ;
NO3_Nitri_S = NO3_SNitri *  (O2_Sconc / present.Conc_O2_S ) * (NH4_Sconc/starting.NH4_Sconc)  ; 
%NO3_Nitri_S_N2O = NO3_Nitri_S * pars.KmNH4;
%%%%% Deep Ocean
NO3_DPNitri = 8.14e13 ;
NO3_Nitri_DP = NO3_DPNitri * (O2_DPconc / present.Conc_O2_deep ) * (NH4_DPconc/starting.NH4_DPconc)  ; 
%NO3_Nitri_DP_N2O = NO3_Nitri_DP * pars.KmNH4;
%%%%%%%%%%%%%%%%%%%%%%%%%%%Loss of NO3 during denitrification in different zone	

NO3_Pdenit = 0.45e12 ;
NO3_Ddenit = 3.7e12 ;
NO3_DPdenit = 7.7e12  ;
%fraction = 0.3 * (NO3_Nitri_P / NO3_PNitri);

%%%%% Proximal
NO3_denit_P_water = 0.3 * NO3_Pdenit * (NO3_Nitri_P / NO3_PNitri)* (NO3_Pconc/starting.NO3_Pconc)* (1+ (1 - (O2_Pconc / present.Conc_O2_P ))) ;
NO3_denit_P_sediment = 0.7 * NO3_Pdenit * (NO3_Pconc/starting.NO3_Pconc)*  (1+ (1 - (O2_Pconc / present.Conc_O2_P )))  ;
%NO3_denit_P = NO3_denit_P_water + NO3_denit_P_sediment;
%%%%%%% Distal
NO3_denit_D_water =0.3* NO3_Ddenit* (NO3_Nitri_D / NO3_DNitri) * (NO3_Dconc/starting.NO3_Dconc)*  (1+ (1 - (O2_Dconc / present.Conc_O2_D )));
NO3_denit_D_sediment =0.7* NO3_Ddenit * (NO3_Dconc/starting.NO3_Dconc)*  (1+ (1 - (O2_Dconc / present.Conc_O2_D )))  ;
%NO3_denit_D = NO3_denit_D_water + NO3_denit_D_sediment;
%%%%%%% Deep Ocean
NO3_denit_DP_water =0.3* NO3_DPdenit * (NO3_Nitri_DP / NO3_DPNitri)  * (NO3_DPconc/starting.NO3_DPconc)* (1+ (1 - (O2_DPconc / present.Conc_O2_deep )));
NO3_denit_DP_sediment =0.7* NO3_DPdenit * (NO3_DPconc/starting.NO3_DPconc)* (1+ (1 - (O2_DPconc / present.Conc_O2_deep )));
%NO3_denit_DP = NO3_denit_DP_water + NO3_denit_DP_sediment;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NH3_PPhoto = 0.2e11 ; %Present level
% NH3_Photo_P = NH3_PPhoto * (NH4_Pconc/starting.NH4_Pconc) * (1+ (1 - (O2_Pconc / present.Conc_O2_P )));
% %%%% Distal
% 
% NH3_DPhoto = 1.5e11 ; %Present level
% NH3_Photo_D = NH3_DPhoto * (NH4_Dconc/starting.NH4_Dconc) *  (1+ (1 - (O2_Dconc / present.Conc_O2_D ))) ;
% 
% %%%%% Surface Ocean
% NH3_SPhoto = 3.5e11 ; %Present level
% NH3_Photo_S = NH3_SPhoto * (NH4_Sconc/starting.NH4_Sconc) * (1+ (1 - (O2_Sconc / present.Conc_O2_S ))) ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NH3_DNRA_P = NO3_denit_P * 0.15;
% %%%% Distal
% NH3_DNRA_D = NO3_denit_D * 0.2 ;
% 
% % %%%%% Surface Ocean
% NH3_DNRA_DP = NO3_denit_DP * 0.3 ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Limitation
%%%%% Proximal
total_P = SRP_P + (N_P/16);

P_P_limitation = (SRP_P / total_P) * 100;
P_N_limitation = ((N_P/16) / total_P) * 100;

P_change = N_P / SRP_P ;
%%%%% Distal
total_D = SRP_D + (N_D/16);

D_P_limitation = (SRP_D / total_D) * 100;
D_N_limitation = ((N_D/16) / total_D) * 100;

D_change = N_D / SRP_D ;
%%%%% Surface Ocean
total_S = SRP_S + (N_S/16);

S_P_limitation = (SRP_S / total_S) * 100;
S_N_limitation = ((N_S/16) / total_S) * 100;

S_change = N_S / SRP_S ;
%%%%%  Deep Ocean
N_DP =  y(27) + y(31) ;
total_DP = SRP_DP + (N_DP/16);

DP_P_limitation = (SRP_DP / total_DP) * 100;
DP_N_limitation = ((N_DP/16) / total_DP) * 100;

DP_change = N_DP / SRP_DP ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%N Flux
dy(24) = River_NO3 - NO3_P_D + NO3_Nitri_P - NO3_PP_P - NO3_denit_P_water -NO3_denit_P_sediment ;                        

%%NO3 Distal
dy(25) = NO3_P_D - NO3_D_S + NO3_DP_D + NO3_Nitri_D - NO3_PP_D - NO3_denit_D_water -NO3_denit_D_sediment;

%%NO3 Surface Ocean
dy(26) = NO3_D_S - NO3_S_DP + NO3_DP_S  + NO3_Nitri_S - NO3_PP_S ;

%%NO3 Deep Ocean
dy(27) = NO3_S_DP - NO3_DP_S - NO3_DP_D + NO3_Nitri_DP- NO3_denit_DP_water -NO3_denit_DP_sediment ;

%%NH4 Proximal
dy(28) = River_NH4 - NH4_P_D + PON_Min_P - NH4_PP_P + NH4_Nfix_P - NO3_Nitri_P ;

%%NH4 Distal
dy(29) = NH4_P_D - NH4_D_S + NH4_DP_D + PON_Min_D - NH4_PP_D + NH4_Nfix_D - NO3_Nitri_D ;

%%NH4 Surface Ocean
dy(30) = NH4_D_S - NH4_S_DP + NH4_DP_S + PON_Min_S - NH4_PP_S + NH4_Nfix_S - NO3_Nitri_S ;

%%NH4 Deep Ocean
dy(31) = NH4_S_DP - NH4_DP_S - NH4_DP_D + PON_Min_DP - NO3_Nitri_DP ;


% %% nitrogen fractionation
% d15N_denit = 15 ;
% d15N_Nitri = 0;
% d15N_NO3_PP = 0 ;
% d15N_NH4_PP = 0 ;
% d15N_PON = 0 ;
% %%%%River input
% d15N_NO3_Riv = 5 ;
% d15N_NH4_Riv = 3 ;
% %%%%%%%%%% N fix
% d15N_Nfix = 0 ;
% %%%%%%%%% Nitrification
% % delta_Nitri_P = NH4_15N_P - d15N_Nitri ; 
% % delta_Nitri_D = NH4_15N_D - d15N_Nitri ;
% % delta_Nitri_S = NH4_15N_S - d15N_Nitri ;
% % delta_Nitri_DP = NH4_15N_DP - d15N_Nitri ;
% %%%%%%%%%%%%Water column denitrification
% delta_Wdenit_P = N_15N_P-d15N_denit ;
% delta_Wdenit_D = N_15N_D-d15N_denit ;
% %delta_Wdenit_S = N_15N_S-d15N_denit ;
% delta_Wdenit_DP = N_15N_DP-d15N_denit ;
% %%%%%%%%%%%NO3 Primary production
% % delta_NO3PP_P = NO3_15N_P - d15N_NO3_PP;
% % delta_NO3PP_D = NO3_15N_D - d15N_NO3_PP;
% % delta_NO3PP_S = NO3_15N_S - d15N_NO3_PP;
% % %%%%%%%%%%NH4 Primary production
% % delta_NH4PP_P = NH4_15N_P - d15N_NH4_PP;
% % delta_NH4PP_D = NH4_15N_D - d15N_NH4_PP;
% % delta_NH4PP_S = NH4_15N_S - d15N_NH4_PP;
% % %%%%%%%%%%PON
% % delta_PON_P = NH4_15N_P- d15N_PON;
% % delta_PON_D = NH4_15N_D- d15N_PON ;
% % delta_PON_S = NH4_15N_S- d15N_PON ;
% % delta_PON_DP = NH4_15N_DP- d15N_PON ;
% 
% %%%%%%%%%Proximal
% NO3_bury_P = NH4_PP_P + NO3_PP_P - PON_Min_P ;
% dy(32) = dy(24)+dy(28);                        
% 
% %%
% dy(33) = (River_NO3*d15N_NO3_Riv + River_NH4*d15N_NH4_Riv - NO3_P_D*N_15N_P - NH4_P_D*N_15N_P + NH4_Nfix_P*d15N_Nfix - NO3_denit_P_water*delta_Wdenit_P - NO3_denit_P_sediment*N_15N_P - NO3_bury_P*N_15N_P)/totalN_P ;
% 
% %%NO3 Surface Ocean
% NO3_bury_D = NH4_PP_D + NO3_PP_D - PON_Min_D ;
% %dy(34) = NO3_P_D - NO3_D_S + NO3_DP_D + NH4_P_D - NH4_D_S + NH4_DP_D + NH4_Nfix_D - NO3_denit_D_water - NO3_denit_D_sediment - PON_bury_D;
% dy(34) =  dy(25)+dy(29); 
% % %%NO3 Deep Ocean
% dy(35) = (NO3_P_D *N_15N_P  - NO3_D_S *  N_15N_D + NO3_DP_D * N_15N_DP + NH4_P_D * N_15N_P - NH4_D_S * N_15N_D + NH4_DP_D * N_15N_DP+ NH4_Nfix_D*N_15N_D - NO3_denit_D_water*delta_Wdenit_D - NO3_denit_D_sediment*N_15N_D - NO3_bury_D*N_15N_D)/totalN_D ;
%  
% % %%NH4 Proximal
% 
% %dy(36) = NO3_D_S - NO3_S_DP + NO3_DP_S + NH4_D_S - NH4_S_DP + NH4_DP_S + NH4_Nfix_S ;
% dy(36) =  dy(26)+dy(30); 
% % %%NO3 Deep Ocean
% dy(37) = (NO3_D_S*  N_15N_D - NO3_S_DP*  N_15N_S + NO3_DP_S*  N_15N_DP + NH4_D_S*  N_15N_D - NH4_S_DP*  N_15N_S + NH4_DP_S*  N_15N_DP + NH4_Nfix_S*  N_15N_S  )/totalN_S ;
% % 
% % %%NH4 Surface Ocean
% NO3_bury_DP = NH4_PP_S + NO3_PP_S - PON_Min_S - PON_Min_DP ;
% %dy(38) = NO3_S_DP - NO3_DP_S - NO3_DP_D + NH4_S_DP - NH4_DP_S - NH4_DP_D - NO3_denit_DP_water - NO3_denit_DP_sediment - PON_bury_DP;
% dy(38) =  dy(27)+dy(31); 
% % %%NO3 Deep Ocean
% dy(39) = (NO3_S_DP*  N_15N_S - NO3_DP_S*  N_15N_DP - NO3_DP_D*  N_15N_DP + NH4_S_DP*  N_15N_S - NH4_DP_S*  N_15N_DP - NH4_DP_D*  N_15N_DP - NO3_denit_DP_water*  delta_Wdenit_DP - NO3_denit_DP_sediment*  N_15N_DP - NO3_bury_DP*  N_15N_DP)/totalN_DP ;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Nitrogen Differentials

total_marine_Nfix = NH4_Nfix_P + NH4_Nfix_D + NH4_Nfix_S ;
total_marine_Wdenit = NO3_denit_P_water + NO3_denit_D_water + NO3_denit_DP_water;
total_marine_Sdenit = NO3_denit_P_sediment + NO3_denit_D_sediment+ NO3_denit_DP_sediment;
total_marine_Nitri = NO3_Nitri_P + NO3_Nitri_D + NO3_Nitri_S + NO3_Nitri_DP ;
total_marine_PON = PON_Min_P + PON_Min_D + PON_Min_S + PON_Min_DP ;
total_marine_PPNH4 = NH4_PP_P + NH4_PP_D + NH4_PP_S ;
total_marine_PPNO3 = NO3_PP_P + NO3_PP_D + NO3_PP_S ; 
N_balance = River_NH4 + River_NO3 + total_marine_Nfix - total_marine_Wdenit - total_marine_Sdenit + total_marine_PON - total_marine_PPNH4 - total_marine_PPNO3;
total_marine_NO3 = (NO3_P + NO3_D + NO3_S + NO3_DP)/(Water_P+Water_D+Water_S+Water_DP);
total_marine_NH4 = (NH4_P + NH4_D + NH4_S + NH4_DP)/(Water_P+Water_D+Water_S+Water_DP);
total_marine_SRP = (SRP_P + SRP_D + SRP_S + SRP_DP)/(Water_P+Water_D+Water_S+Water_DP);
NP_change = (total_marine_NO3 + total_marine_NH4 )/total_marine_SRP;
%total_marine_N2O = NO3_Nitri_P_N2O +NO3_Nitri_D_N2O+NO3_Nitri_S_N2O+NO3_Nitri_DP_N2O;
%%%%%%%%%%%%%%%%%%%%%Total N in seawater


%%%%%%%%%%%%%%%%%%%%%Total d15N in seawater
d15N_NO3_Riv = 5 ;
d15N_NH4_Riv = 5 ;
d15N_Nfix = 0 ;
delta_Wdenit = N_15N - 15 ;
delta_N2Odenit = N_15N - 20 ;

% Wdenit = interp1([-4.2e9 -3e9 -2.8e9 -2.6e9 -2.5e9 0], [0 0 1 1 0.3 0.3],t) ;
% fraction = Wdenit  ;
total_marine_bury = total_marine_PPNH4 + total_marine_PPNO3 - total_marine_PON;
dy(40) = River_NH4 + River_NO3 + total_marine_Nfix - total_marine_Wdenit - total_marine_Sdenit - total_marine_bury;
dy(41) = (River_NH4 * d15N_NH4_Riv + River_NO3 * d15N_NO3_Riv + total_marine_Nfix * d15N_Nfix - total_marine_Wdenit * delta_Wdenit - total_marine_Sdenit * N_15N - total_marine_bury * N_15N)/N_total;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % dy(34) = ((River_NO3*d15N_Riv) + (total_marine_Nitri*NH4_15N) - (total_marine_PPNO3*NO3_15N) - (total_marine_denit*NO3_15N)) / NO3_total;
% % dy(35) = ((River_NH4*d15N_Riv) + (total_marine_Nfix*d15N_Nfix) - (total_marine_Nitri*NH4_15N) + (total_marine_PON*d15N_PON) - (total_marine_PPNH4*NH4_15N)) / NH4_total;
% dy(41) = River_NO3 + total_marine_Nitri - total_marine_PPNO3 - total_marine_denit;
% dy(42) = River_NH4 + total_marine_Nfix - total_marine_Nitri + total_marine_PON - total_marine_PPNH4 ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  total_marine_N = NO3_P + NO3_D + NO3_S + NO3_DP + NH4_P + NH4_D + NH4_S + NH4_DP ;
  total_marine_PPN = N_PP_P + N_PP_D + N_PP_S ;
  total_marine_NB = total_marine_PON - total_marine_PPNH4 - total_marine_PPNO3 ;   
  BLANCE = total_marine_PON - total_marine_PPN ;
  total_marine_OPBurial = OP_P_Burial + OP_D_Burial + OP_DP_Burial ;
  total_marine_KW = P_FeP_P + P_AuthP_P + P_FeP_D + P_AuthP_D + P_FeP_DP + P_AuthP_DP ;
  P_balance = River_SRP - total_marine_KW - total_marine_OPBurial ;
  total_marine_P = SRP_P + SRP_D + SRP_S + SRP_DP + OP_P + OP_D + OP_S + OP_DP ;
ML = P_balance - (dy(13)+dy(14)+dy(15)+dy(16)+dy(17)+dy(18)+dy(19)+dy(20)) ;
ML1 = N_balance - (dy(24)+dy(25)+dy(26)+dy(27)+dy(28)+dy(29)+dy(30)+dy(31)) ;




%% Saving data
workingstate.FrgfO2(stepnumber,1) = FrgfO2 ;

workingstate.O2_DP(stepnumber,1) = O2_DP ;
workingstate.O2_A(stepnumber,1) = O2_A ;
workingstate.PP_P(stepnumber,1) = PP_P ;
workingstate.PP_D(stepnumber,1) = PP_D ;
workingstate.PP_S(stepnumber,1) = PP_S ;
workingstate.POC_S(stepnumber,1) = POC_S ;


workingstate.SRP_Pconc(stepnumber,1) = SRP_Pconc ;
workingstate.SRP_Dconc(stepnumber,1) = SRP_Dconc ;
workingstate.SRP_Sconc(stepnumber,1) = SRP_Sconc ;
workingstate.SRP_DPconc(stepnumber,1) = SRP_DPconc ;
workingstate.OP_Pconc(stepnumber,1) = OP_Pconc ;
workingstate.OP_Dconc(stepnumber,1) = OP_Dconc ;
workingstate.OP_Sconc(stepnumber,1) = OP_Sconc ;
workingstate.OP_DPconc(stepnumber,1) = OP_DPconc ;
workingstate.River_SRP(stepnumber,1) = River_SRP ;

%workingstate.CP_Dist(stepnumber,1) = ( ( ( 1-fanoxicdist ) * pars.CPoxic ) + ( fanoxicdist * pars.CPanoxic_dist ) ) ;
workingstate.CP_Dist(stepnumber,1) = ( ( (min(O2_Dconc,2) / present.Conc_O2_D) * pars.CPoxic ) + ( ( 1 - (min(O2_Dconc,2) / present.Conc_O2_D )) * pars.CPanoxic_dist ) ) ;
workingstate.CP_Deep(stepnumber,1) = POC_DP_Burial / OP_DP_Burial ;
%workingstate.CP_Prox(stepnumber,1) = ( ( ( 1-fanoxicprox ) * pars.CPoxic ) + ( fanoxicprox * pars.CPanoxic_prox ) ) ;
workingstate.CP_Prox(stepnumber,1) = ( ( (min(O2_Pconc,2) / present.Conc_O2_P) * pars.CPoxic ) + ( ( 1 - (min(O2_Pconc,2) / present.Conc_O2_P )) * pars.CPanoxic_prox ) ) ;
workingstate.Deep_Preac_Burial(stepnumber,1) = P_AuthP_DP + P_FeP_DP + OP_DP_Burial ;
workingstate.Dist_Preac_Burial(stepnumber,1) = P_AuthP_D + P_FeP_D + OP_D_Burial ;
workingstate.Prox_Preac_Burial(stepnumber,1) = P_AuthP_P + P_FeP_P + OP_P_Burial ;
% workingstate.fanoxicdist(stepnumber,1) = fanoxicdist ;
% workingstate.fanoxicprox(stepnumber,1) = fanoxicprox ;
%workingstate.fanoxicsurf(stepnumber,1) = fanoxicsurf ;

workingstate.Atmos_Weather(stepnumber,1) = Atmos_Weather ;

workingstate.CO2ppm(stepnumber,1) = CO2ppm ;
workingstate.CO2atm(stepnumber,1) = CO2atm ;
workingstate.GAST(stepnumber,1) = GAST ;
workingstate.A(stepnumber,1) = A ;
workingstate.Aiso(stepnumber,1) = Aiso ;
workingstate.Fmocb(stepnumber,1) = Fmocb ;

workingstate.fbiota(stepnumber,1) = pars.fbiota ;
workingstate.D(stepnumber,1) = D ;
workingstate.C(stepnumber,1) = C ;
workingstate.EXPOSED(stepnumber,1) = EXPOSED ;
workingstate.CPanoxic(stepnumber,1) = pars.CPanoxic_deep ;

workingstate.forg(stepnumber,1) = Fmocb / (Fmccb+Fmocb+Fsfw);

workingstate.Total_POC_Burial(stepnumber,1) = Total_POC_Burial ;
workingstate.OP_D_Min(stepnumber,1) = OP_D_Min ;
workingstate.OP_P_Min(stepnumber,1) = OP_P_Min ;
workingstate.OP_S_Min(stepnumber,1) = OP_S_Min ;
workingstate.OP_DP_Min(stepnumber,1) = OP_DP_Min ;
workingstate.POC_Min_S(stepnumber,1) = POC_Min_S ;

%%%% nitrate
workingstate.NO3_Pconc(stepnumber,1) = NO3_Pconc ;
workingstate.NO3_Dconc(stepnumber,1) = NO3_Dconc ;
workingstate.NO3_Sconc(stepnumber,1) = NO3_Sconc ;
workingstate.NO3_DPconc(stepnumber,1) = NO3_DPconc ;
workingstate.NH4_Pconc(stepnumber,1) = NH4_Pconc ;
workingstate.NH4_Dconc(stepnumber,1) = NH4_Dconc ;
workingstate.NH4_Sconc(stepnumber,1) = NH4_Sconc ;
workingstate.NH4_DPconc(stepnumber,1) = NH4_DPconc ;

%%%% total marine N

workingstate.River_NO3(stepnumber,1) = River_NO3 ;
workingstate.NO3_P_D(stepnumber,1) = NO3_P_D ;
%workingstate.River_NH4(stepnumber,1) = River_NH4 ;
workingstate.NH4_P_D(stepnumber,1) = NH4_P_D ;

workingstate.NO3_D_S(stepnumber,1) = NO3_D_S ;
workingstate.NO3_DP_D(stepnumber,1) = NO3_DP_D ;
workingstate.NH4_D_S(stepnumber,1) = NH4_D_S ;
workingstate.NH4_DP_D(stepnumber,1) = NH4_DP_D ;
 
workingstate.NO3_S_DP(stepnumber,1) = NO3_S_DP ;
workingstate.NO3_DP_S(stepnumber,1) = NO3_DP_S ;
workingstate.NH4_S_DP(stepnumber,1) = NH4_S_DP ;
workingstate.NH4_DP_S(stepnumber,1) = NH4_DP_S ;

 workingstate.NH4_Nfix_P(stepnumber,1) = NH4_Nfix_P ;
 workingstate.NH4_Nfix_D(stepnumber,1) = NH4_Nfix_D ;
 workingstate.NH4_Nfix_S(stepnumber,1) = NH4_Nfix_S ;
 
 workingstate.NO3_Nitri_P(stepnumber,1) = NO3_Nitri_P ;
 workingstate.NO3_Nitri_D(stepnumber,1) = NO3_Nitri_D ;
 workingstate.NO3_Nitri_S(stepnumber,1) = NO3_Nitri_S ;
 workingstate.NO3_Nitri_DP(stepnumber,1) = NO3_Nitri_DP ;

%  workingstate.NO3_denit_P(stepnumber,1) = NO3_denit_P ;
%  workingstate.NO3_denit_D(stepnumber,1) = NO3_denit_D ;
%  workingstate.NO3_denit_S(stepnumber,1) = NO3_denit_S ;
%  workingstate.NO3_denit_DP(stepnumber,1) = NO3_denit_DP ;

 workingstate.NO3_denit_P_water(stepnumber,1) = NO3_denit_P_water ;
 workingstate.NO3_denit_D_water(stepnumber,1) = NO3_denit_D_water ;
 %workingstate.NO3_denit_S_water(stepnumber,1) = NO3_denit_S_water ;
 workingstate.NO3_denit_DP_water(stepnumber,1) = NO3_denit_DP_water ;

 workingstate.NO3_denit_P_sediment(stepnumber,1) = NO3_denit_P_sediment ;
 workingstate.NO3_denit_D_sediment(stepnumber,1) = NO3_denit_D_sediment ;
% workingstate.NO3_denit_S_sediment(stepnumber,1) = NO3_denit_S_sediment ;
 workingstate.NO3_denit_DP_sediment(stepnumber,1) = NO3_denit_DP_sediment ;

 workingstate.PON_Min_P(stepnumber,1) = PON_Min_P ;
 workingstate.PON_Min_D(stepnumber,1) = PON_Min_D ;
 workingstate.PON_Min_S(stepnumber,1) = PON_Min_S ;
 workingstate.PON_Min_DP(stepnumber,1) = PON_Min_DP ;


 workingstate.N_PP_P(stepnumber,1) = N_PP_P ;
 workingstate.N_PP_D(stepnumber,1) = N_PP_D ;
 workingstate.N_PP_S(stepnumber,1) = N_PP_S ;

 workingstate.NH4_PP_P(stepnumber,1) = NH4_PP_P ;
 workingstate.NH4_PP_D(stepnumber,1) = NH4_PP_D ;
 workingstate.NH4_PP_S(stepnumber,1) = NH4_PP_S ;
 
 workingstate.NO3_PP_P(stepnumber,1) = NO3_PP_P ;
 workingstate.NO3_PP_D(stepnumber,1) = NO3_PP_D ;
 workingstate.NO3_PP_S(stepnumber,1) = NO3_PP_S ;
 
 
  workingstate.total_marine_N(stepnumber,1) = total_marine_N ;
 %workingstate.total_marine_denit(stepnumber,1) = total_marine_denit ;
  workingstate.total_marine_Nfix(stepnumber,1) = total_marine_Nfix ;
 workingstate.total_marine_Nitri(stepnumber,1) = total_marine_Nitri ;
  workingstate.total_marine_bury(stepnumber,1) = total_marine_bury ;

 
  workingstate.total_marine_PON(stepnumber,1) = total_marine_PON ;
  workingstate.total_marine_PPN(stepnumber,1) = total_marine_PPN ;
  workingstate.total_marine_PPNH4(stepnumber,1) = total_marine_PPNH4 ;
  workingstate.total_marine_PPNO3(stepnumber,1) = total_marine_PPNO3 ;
 
   workingstate.Fsilw(stepnumber,1) = Fsilw ;
  workingstate.Fcarbw(stepnumber,1) = Fcarbw ;
  workingstate.Foxidw(stepnumber,1) = Foxidw ;
workingstate.Tsurf(stepnumber,1) = Tsurf ;
workingstate.OP_P_Burial(stepnumber,1) = OP_P_Burial ;
workingstate.OP_D_Burial(stepnumber,1) = OP_D_Burial ;

workingstate.O2_Pconc(stepnumber,1) = O2_Pconc ;
workingstate.O2_Dconc(stepnumber,1) = O2_Dconc ;
workingstate.O2_Sconc(stepnumber,1) = O2_Sconc ;
workingstate.O2_DPconc(stepnumber,1) = O2_DPconc ;

%%%%%%%%%%%%%%%%%%%%%%
workingstate.P_P_limitation(stepnumber,1) = P_P_limitation ;
workingstate.D_P_limitation(stepnumber,1) = D_P_limitation ;
workingstate.S_P_limitation(stepnumber,1) = S_P_limitation ;
workingstate.DP_P_limitation(stepnumber,1) = DP_P_limitation ;

workingstate.P_N_limitation(stepnumber,1) = P_N_limitation ;
workingstate.D_N_limitation(stepnumber,1) = D_N_limitation ;
workingstate.S_N_limitation(stepnumber,1) = S_N_limitation ;
workingstate.DP_N_limitation(stepnumber,1) = DP_N_limitation ;




workingstate.P_change(stepnumber,1) = P_change ;
workingstate.D_change(stepnumber,1) = D_change ;
workingstate.S_change(stepnumber,1) = S_change ;
workingstate.DP_change(stepnumber,1) = DP_change ;

workingstate.N_P(stepnumber,1) = N_P ;
workingstate.N_D(stepnumber,1) = N_D ;
workingstate.N_S(stepnumber,1) = N_S ;
workingstate.N_DP(stepnumber,1) = N_DP ;

%workingstate.fraction(stepnumber,1) = fraction ;
workingstate.DB(stepnumber,1) = DB ;
workingstate.N_balance(stepnumber,1) = N_balance ;
% workingstate.d15N_TN(stepnumber,1) = d15N_TN ;
workingstate.N_total(stepnumber,1) = N_total ;
workingstate.N_15N(stepnumber,1) = N_15N ;
% workingstate.TN_total(stepnumber,1) = TN_total ;
workingstate.NO3_P(stepnumber,1) = NO3_P  ;
workingstate.NH4_P(stepnumber,1) = NH4_P  ;
workingstate.NO3_S(stepnumber,1) = NO3_S  ;
workingstate.NH4_S(stepnumber,1) = NH4_S  ;
% workingstate.totalN_P(stepnumber,1) = totalN_P  ;
% workingstate.totalN_D(stepnumber,1) = totalN_D  ;
% workingstate.totalN_S(stepnumber,1) = totalN_S  ;
% workingstate.totalN_DP(stepnumber,1) = totalN_DP  ;
% 
% workingstate.N_15N_P(stepnumber,1) = N_15N_P  ;
% workingstate.N_15N_D(stepnumber,1) = N_15N_D  ;
% workingstate.N_15N_S(stepnumber,1) = N_15N_S  ;
% workingstate.N_15N_DP(stepnumber,1) = N_15N_DP  ;

 %workingstate.NO3_total(stepnumber,1) = NO3_total  ;
%workingstate.NH4_total(stepnumber,1) = NH4_total  ;
 %workingstate.NO3_15N(stepnumber,1) = NO3_15N  ;
 %workingstate.NH4_15N(stepnumber,1) = NH4_15N  ;
 
  workingstate.total_marine_NO3(stepnumber,1) = total_marine_NO3  ;
workingstate.total_marine_NH4(stepnumber,1) = total_marine_NH4  ;
 workingstate.total_marine_SRP(stepnumber,1) = total_marine_SRP  ;
 workingstate.NP_change(stepnumber,1) = NP_change  ;

%%%%%%% record time
workingstate.time(stepnumber,1) = t ;

%%% final action: record current model step
stepnumber = stepnumber + 1 ;


t;


end
