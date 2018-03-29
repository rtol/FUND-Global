%initCO2
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.1-matlab-global
%
%This script is part of FUND 4.0 MG
%It initializes variables and sets parameters
%
%Richard Tol, 28 March 2018
%This code is protected by the MIT License

CO2emit= zeros(NYear,NScen);
LUemit= zeros(NYear,NScen);

for s=1:NScen
     LUemit(1:NHistYear,s)=historicLUemit;
end

for i=1:NSRES,
    SRESLU(i,:) = SRESLU(i,:)/SRESLU(i,1)*historicLUemit(NHistYear-20);
end
for i=1:NSSP,
    SSPLU(i,:) = SSPLU(i,:)/SSPLU(i,1)*historicLUemit(NHistYear-20);
end

for t=NHistYear+1:NYear-1
    ts = floor((t-NHistYear)/10)+3;
    for s=1:NSRES
         LUemit(t,s) = SRESLU(s,ts);
    end
    for s=NSRES+1:NScen
        LUemit(t,s) = SSPLU(s-NSRES,ts-1);
    end
end

for s=1:NSRES
    LUemit(NYear,s) = SRESLU(s,ts);
end
for s=NSRES+1:NScen
    LUemit(NYear,s) = SSPLU(s-NSRES,ts-1);
end

MRHbox = zeros(NYear,NScen,NBox);
MRHbox(1,1,:) = MRH1750;
CO2conc = zeros(NYear,NScen);
CO21750 = sum(MRH1750);
CO2conc(1,1) = CO21750;

pH = zeros(NYear,NScen);
pH(1) = pH1750;

