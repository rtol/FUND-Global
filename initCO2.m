%initialize

historicCO2emit = csvread('histCO2emit.csv');
historicLUemit = csvread('histLUemit.csv');

for s=1:NScen
    CO2scen(s) = (100-NScen+floor(NScen/2)+s)/100;
    LUscen(s) = (100-NScen+floor(NScen/2)+s)/100;
end

CO2emit= zeros(NYear,NScen);
LUemit= zeros(NYear,NScen);
for s=1:NScen
    CO2emit(1:NHistYear,s)=historicCO2emit;
    LUemit(1:NHistYear,s)=historicLUemit;
end

for t=NHistYear+1:NYear
    for s=1:NScen
        CO2emit(t,s) = CO2scen(s)*CO2emit(t-1,s);
        LUemit(t,s)    = LUscen(s)*LUemit(t-1,s);
    end
end

CO2param



