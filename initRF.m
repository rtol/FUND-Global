%initRF
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.1-matlab-global
%
%This script is part of FUND 4.0 MG
%It initializes variables and sets parameters
%
%Richard Tol, 28 March 2018
%This code is protected by the MIT License

Semit= zeros(NYear,NScen);
for s=1:NScen
    Semit(1:NHistYear,s)=historicSemit;
end

for t=NHistYear+1:NYear
    for s=1:NSRES
        Semit(t,s) = (1+SRESdS(s,ts))*Semit(t-1,s);
    end
    for s=NSRES+1:NScen
        Semit(t,s) = (1+SSPdS(s-NSRES,ts))*Semit(t-1,s);
    end
end

RadForc = zeros(NYear,NScen);
RadForc(1,1) = RadiativeForcing(CO2conc(1,1),CH4conc(1,1),N2Oconc(1,1),SF6conc(1,1),CFC11conc(1,1),CFC12conc(1,1),historicSemit(1),histO3radforc(1));
