%%%% Carbon cycle box model for undergraduate and masters students - Global biogeochemical cycles
%%%% Uses a simple forwards Euler method 
%%%% Based on the schematic of Ciais et al. (2013) and on previous models of Rob Newton and David Bice
%%%% Coded by Benjamin Mills (b.mills@leeds.ac.uk)

%%%% When the computer sees the '%' sign it skips to the next line without
%%%% reading any of the text. The text is refered to as 'comments' and are
%%%% notes to the human user explaining the function of the code
%%%% Good code has lots of comments

%%%% Set number of model steps
nsteps = 2600 ;
%%%% Set timestep size (dt, in years)
dt = 0.1 ;

%%%% load anthropogenic data
mydata = xlsread('Anthro_CO2_Input.xlsx') ;
x1=mydata(:,1) ;
x1=[1750:0.1:2010],x1=x1';
y1=interp1(mydata(:,1),mydata(:,3),x1);
z1=interp1(mydata(:,1),mydata(:,4),x1);
data=[x1 y1 z1];

%%%% Make an empty array to hold the model results (this speeds up the code, because we now just have to change the values instead of making a new array each timestep)
%%%% NaN is 'Not a Number' and is a useful way to entering a 'nothing' value that won't be mistaken for a genuine zero
Atmospheric_CO2 = NaN(1,nsteps) ;
Atmospheric_CO2_ppm = NaN(1,nsteps) ;
Surface_Ocean_DIC = NaN(1,nsteps) ;
Deep_Ocean_DIC = NaN(1,nsteps) ;
Ocean_Biota = NaN(1,nsteps) ;
Terrestrial_Biota = NaN(1,nsteps) ;
Soil = NaN(1,nsteps) ;
t = NaN(1,nsteps) ;
pH = NaN(1,nsteps) ;
Global_Temperature = NaN(1,nsteps) ;

%%%% Set the starting values of the model reservoirs (in Gt of carbon)
Atmospheric_CO2(1) = 589 ;
Surface_Ocean_DIC(1) = 900 ;
Deep_Ocean_DIC(1) = 37100 ;
Ocean_Biota(1) = 3 ;
Terrestrial_Biota(1) = 550 ; 
Soil(1) = 1500 ; 

%%%% Set starting time (year AD)
t(1) = 1750 ;


%%%% Start model loop, and loop 'nsteps' times. Everything in the loop is indented to the right so we can keep track of which loop we are in 
for n = 1:nsteps
     
    %%%% Calculate model parameters and processes at this timestep
    %%%% All are in GtC per year
    
    %%%% Global parameters
    %%%% conversiton from moles to ppm
    Atmospheric_CO2_ppm(n) = Atmospheric_CO2(n) / 2.12 ; 
	
	%%%% Anthro_CO2_Input
	Fossil_fuel_flux(n)= data(n,2) ;
	Land_use_change(n)= data(n,3) ;

    %%%% climate sensitivity and temperature
    Climate_Sensitivity = 3 ;
    Global_Temperature_Change = Climate_Sensitivity * log( Atmospheric_CO2_ppm(n) / 280 ) / log(2) ; 
    
    %%%% Terrestrial parameters
    Resp_T_Sensitivity = 0.01 ;
     
    %%%% Terrestrial processes
    F_Terrestrial_Photosynthesis = 110 * ( Atmospheric_CO2_ppm(n) / 280 )^0.25 ;
    F_Terrestrial_Biota_Respiration = 0.5 * F_Terrestrial_Photosynthesis ;
    F_Soil_Respiration = 54 * ( Soil(n) / Soil(1) ) * ( 1 + ( Resp_T_Sensitivity * Global_Temperature_Change ) ) ;
    F_Litter_Fall = 55 * ( Terrestrial_Biota(n) / Terrestrial_Biota(1) ) ;
    F_Runoff = 1 * ( Soil(n) / Soil(1) ) ;
    
    %%%% Volcanic outgassing flux
    F_Volcanic_CO2 = 0.1 ;
	
    %%%% Surface ocean processes
    F_Ocean_Photosynthesis = 50 ;
    F_Ocean_Respiration = 37 ;
    F_Downwelling = 90 * ( Surface_Ocean_DIC(n) / Surface_Ocean_DIC(1) ) ;

    %%%% Deep ocean processes
    F_Remineralization = 13 ;
    F_Upwelling = 103 * ( Deep_Ocean_DIC(n) / Deep_Ocean_DIC(1) ) ;
    F_Burial = 0.1 ;
    
    %%%% Carbonate chemistry parameters
    Surface_Volume = 3.63e16 ;
    Surface_C_Concentration = Surface_Ocean_DIC(n) * 8.33e13 / Surface_Volume ;
    Surface_Alk = 2.24265;
    Global_Temperature(n) = 288 + Global_Temperature_Change ;
    k_1 = 8.73e-7 ;
    k_ao = 0.278 ;
    k_carb = 0.000575 + 0.000006 * ( Global_Temperature(n) - 278 ) ;
    KCO2 = 0.035 + 0.0019 * ( Global_Temperature(n) - 278 ) ;
    
    %%%% Carbonate speciation
    Ocean_HCO3 = ( Surface_C_Concentration - ( Surface_C_Concentration^2 - Surface_Alk * ( 2 * Surface_C_Concentration - Surface_Alk ) * ( 1 - 4 * k_carb ) )^0.5  ) / ( 1 - 4 * k_carb ) ;
    Ocean_CO3 = ( Surface_Alk - Ocean_HCO3 ) / 2 ;
    Ocean_H = k_carb * k_1 * Ocean_HCO3 / Ocean_CO3 ;
    pH(n) = -1 * log10(Ocean_H) ;
    
    %%%% Air-sea exchange  
    Ocean_pCO2 = 280 * KCO2 * ( ( Ocean_HCO3^2 ) / Ocean_CO3 ) ;
    F_CO2_Exchange = k_ao * ( Atmospheric_CO2_ppm(n) - Ocean_pCO2 ) ;
    
        
    
    %%%% Update the model reservoirs by adding and subtracting sources and sinks
    %%%% We multiply by dt because each source or sink process is defined in Gt of carbon per year
    %%%% On the final model step (n = steps) we do not calculate the future reservoir sizes, hence the 'if' statement
    
    if n < nsteps
        Atmospheric_CO2(n+1) = Atmospheric_CO2(n) + ( F_Soil_Respiration + F_Terrestrial_Biota_Respiration + F_Volcanic_CO2 - F_CO2_Exchange - F_Terrestrial_Photosynthesis ) * dt + 0.8 * Fossil_fuel_flux(n) + 0.75 * Land_use_change(n);

        Surface_Ocean_DIC(n+1) = Surface_Ocean_DIC(n) + ( F_Ocean_Respiration + F_Upwelling + F_Runoff + F_CO2_Exchange - F_Downwelling - F_Ocean_Photosynthesis ) * dt ;

        Deep_Ocean_DIC(n+1) = Deep_Ocean_DIC(n) + ( F_Downwelling + F_Remineralization - F_Upwelling - F_Burial ) * dt ;

        Ocean_Biota(n+1) = Ocean_Biota(n) + ( F_Ocean_Photosynthesis - F_Ocean_Respiration - F_Remineralization ) * dt ;

        Terrestrial_Biota(n+1) = Terrestrial_Biota(n) + ( F_Terrestrial_Photosynthesis - F_Terrestrial_Biota_Respiration - F_Litter_Fall ) * dt ;

        Soil(n+1) = Soil(n) + ( F_Litter_Fall - F_Soil_Respiration - F_Runoff ) * dt + 0.25 * Land_use_change(n) + 0.2 * Fossil_fuel_flux(n) ;

        %%%% Update model time 
        t(n+1) = t(n) + dt ;
    end
    
%%%% 'end' tells the computer to go back to the start until nsteps is reached
end



%%%% Now the model has finished we can plot the results
%%%% The following code makes a new figure with 6 subplots that show the
%%%% variations in the major reservoirs (although pCO2 is used instead of CO2 in Gt for convenience)
figure
subplot(2,3,1)
plot(t,Atmospheric_CO2_ppm)
hold on 
box on
xlabel('Year')
ylabel('Atmospheric CO_{2} (ppm)')
%%%%
subplot(2,3,2)
plot(t,Surface_Ocean_DIC)
hold on 
box on
xlabel('Year')
ylabel('Surface Oceean DIC (Gt)')
%%%%
subplot(2,3,3)
plot(t,Deep_Ocean_DIC)
hold on 
box on
xlabel('Year')
ylabel('Deep Ocean DIC (Gt)')
%%%%
subplot(2,3,4)
plot(t,Ocean_Biota)
hold on 
box on
xlabel('Year')
ylabel('Ocean Biota Carbon (Gt)')
%%%%
subplot(2,3,5)
plot(t,Terrestrial_Biota)
hold on 
box on
xlabel('Year')
ylabel('Terrestrial Biota Carbon (Gt)')
%%%%
subplot(2,3,6)
plot(t,Soil)
hold on 
box on
xlabel('Year')
ylabel('Soil Carbon *Gt)')
%%%%



