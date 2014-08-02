%initialize

historicCO2emit = csvread('histCO2emit.csv');
historicLUemit = csvread('histLUemit.csv');
histCO2conc = csvread('histCO2conc.csv');

for s=1:NScen
      LUscen(s) = (100-NScen+floor(NScen/2)+s)/100;
end

CO2emit= zeros(NYear,NScen);
LUemit= zeros(NYear,NScen);
for s=1:NScen
     LUemit(1:NHistYear,s)=historicLUemit;
end

for t=NHistYear+1:NYear
    for s=1:NScen
        LUemit(t,s)    = LUscen(s)*LUemit(t-1,s);
    end
end

CO2param



