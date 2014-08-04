%initKaya
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.0-matlab-global
%
%This script is part of FUND 4.0 MG
%It initializes variables and sets parameters
%
%Richard Tol, 28 August 2014
%This code is protected by the MIT License

histPopulation = csvread('histPopulation.csv');
histGDP = csvread('histGDP.csv');
histYpC = histGDP./histPopulation;
histEnergy = csvread('histEnergy.csv');
histEnInt = histEnergy./histGDP;
histCO2Int = historicCO2emit./histEnergy;

Y= zeros(NYear,NScen);

CobbDouglasparam

TFP(1,1) = (histGDP(1)/histPopulation(1))^LabourElast * (Depreciation/SavingsRate)^(1-LabourElast);
K(1,1) = SavingsRate*histGDP(1)/Depreciation;
Y(1,1) = TFP(1,1)*histPopulation(1)^LabourElast*K(1,1)^(1-LabourElast);

gTFP = 0.0075;

for t=2:NHistYear
    TFP(t,1) = (1+gTFP)*TFP(t-1,1);
end

CalibTFP

%for s=1:NScen
 %    Popscen(s) = (99+s)/100;
  %   TFPscen(s) = gTFP*(1-NScen+floor(NScen/2)+s)/1;
 %    EIscen(s) = (100-NScen+s)/100;
 %    CO2scen(s) = (100-NScen+s)/100;
%end

for s=2:NScen
    TFP(:,s) = TFP(:,1);
end

Population= zeros(NYear,NScen);
EnInt = zeros(NYear,NScen);
Energy = zeros(NYear,NScen);
CO2Int = zeros(NYear,NScen);
for s=1:NScen
    Population(1:NHistYear,s)=histPopulation;
    EnInt(1:NHistYear,s)=histEnInt;
    CO2Int(1:NHistYear,s)=histCO2Int;
end

Energy(1,1) = EnInt(1,1)*Y(1,1);
CO2emit(1,1) = CO2Int(1,1)*Energy(1,1);

for t=NHistYear+1:NYear
    for s=1:NScen
        Population(t,s) = (1+SRESdPop(s,ts))*Population(t-1,s);
        TFP(t,s) = (1+SRESdInc(s,ts))*TFP(t-1,s);
        EnInt(t,s)= (1+SRESdEnInt(s,ts))*EnInt(t-1,s);
        CO2Int(t,s)= (1+SRESdCO2Int(s,ts))*CO2Int(t-1,s);
    end
end
