%initGHG
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.1-matlab-global
%
%This script is part of FUND 4.0 MG
%It initializes variables and sets parameters
%
%Richard Tol, 25 March 2018
%This code is protected by the MIT License

CH4emit= zeros(NYear,NScen);
N2Oemit= zeros(NYear,NScen);
SF6emit= zeros(NYear,NScen);
CFC11emit= zeros(NYear,NScen);
CFC12emit= zeros(NYear,NScen);
trO3radforc= zeros(NYear,NScen);

for s=1:NScen
    CH4emit(1:NHistYear,s)=historicCH4emit;
    N2Oemit(1:NHistYear,s)=historicN2Oemit;
    SF6emit(1:NHistYear,s)=historicSF6emit;
    CFC11emit(1:NHistYear,s)=histCFC11emit;
    CFC12emit(1:NHistYear,s)=histCFC12emit;
    trO3radforc(1:NHistYear,s)=histO3radforc;
end

for t=NHistYear+1:NYear
    for s=1:NSRES
        ts = t-NHistYear;
        CH4emit(t,s) = (1+SRESdCH4(s,ts))*CH4emit(t-1,s);
        N2Oemit(t,s) = (1+SRESdN2O(s,ts))*N2Oemit(t-1,s);
        SF6emit(t,s) = (1+SRESdSF6(s,ts))*SF6emit(t-1,s);
        CFC11emit(t,s) = (1+SRESdCFC(s,ts))*CFC11emit(t-1,s);
        CFC12emit(t,s) = (1+SRESdCFC(s,ts))*CFC12emit(t-1,s);
        trO3radforc(t,s) = (1+SRESdO3(s,ts))*trO3radforc(t-1,s);
    end
    for s=NSRES+1:NScen
        ts = t-NHistYear;
        CH4emit(t,s) = (1+SSPdCH4(s-NSRES,ts))*CH4emit(t-1,s);
        N2Oemit(t,s) = (1+SSPdN2O(s-NSRES,ts))*N2Oemit(t-1,s);
        SF6emit(t,s) = (1+SSPdSF6(s-NSRES,ts))*SF6emit(t-1,s);
        CFC11emit(t,s) = (1+SSPdCFC(s-NSRES,ts))*CFC11emit(t-1,s);
        CFC12emit(t,s) = (1+SSPdCFC(s-NSRES,ts))*CFC12emit(t-1,s);
        trO3radforc(t,s) = (1+SSPdO3(s-NSRES,ts))*trO3radforc(t-1,s);
    end
end

CH4conc = zeros(NYear,NScen);
CH4conc(1,1) = CH41750;
N2Oconc = zeros(NYear,NScen);
N2Oconc(1,1) = N2O1750;
SF6conc = zeros(NYear,NScen);
SF6conc(1,1) = SF61750;
CFC11conc = zeros(NYear,NScen);
CFC12conc = zeros(NYear,NScen);