%initCO2
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.0-matlab-global
%
%This script is part of FUND 4.0 MG
%It initializes variables and sets parameters
%
%Richard Tol, 28 August 2014
%This code is protected by the MIT License

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

for i=1:4,
    SRESLU(i,:) = SRESLU(i,:)*SRESLU(i,1)*historicLUemit(NHistYear-20);
end

for t=NHistYear+1:NYear-1
    ts = floor((t-NHistYear)/10)+3;
    for s=1:NScen
         LUemit(t,s) = SRESLU(s,ts);
    end
end

for s=1:NScen
    LUemit(NYear,s) = SRESLU(s,ts);
end

CO2param



