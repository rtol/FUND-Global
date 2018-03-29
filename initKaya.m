%initKaya
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.1-matlab-global
%
%This script is part of FUND 4.0 MG
%It initializes variables and sets parameters
%
%Richard Tol, 25 March 2018
%This code is protected by the MIT License

TFP = zeros(NYear,NScen);
K = zeros(NYear,NScen);
Y = zeros(NYear,NScen);

TFP(1,1) = (histGDP(1)/histPopulation(1))^LabourElast * (Depreciation/SavingsRate)^(1-LabourElast);
K(1,1) = SavingsRate*histGDP(1)/Depreciation;
Y(1,1) = TFP(1,1)*histPopulation(1)^LabourElast*K(1,1)^(1-LabourElast);

gTFP = 0.0075;

for t=2:NHistYear
    TFP(t,1) = (1+gTFP)*TFP(t-1,1);
end

CalibTFP

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
    ts = t-NHistYear;
    for s=1:NSRES
        Population(t,s) = (1+SRESdPop(s,ts))*Population(t-1,s);
        TFP(t,s) = (1+SRESdInc(s,ts))*TFP(t-1,s);
        EnInt(t,s)= (1+SRESdEnInt(s,ts))*EnInt(t-1,s);
        CO2Int(t,s)= (1+SRESdCO2Int(s,ts))*CO2Int(t-1,s);
    end
    for s=NSRES+1:NScen
        Population(t,s) = (1+SSPdPop(s-NSRES,ts))*Population(t-1,s);
        TFP(t,s) = (1+SSPdInc(s-NSRES,ts))*TFP(t-1,s);
        EnInt(t,s)= (1+SSPdEnInt(s-NSRES,ts))*EnInt(t-1,s);
        CO2Int(t,s)= (1+SSPdCO2Int(s-NSRES,ts))*CO2Int(t-1,s);
    end
end
