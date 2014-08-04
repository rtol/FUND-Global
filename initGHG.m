%initGHG
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.0-matlab-global
%
%This script is part of FUND 4.0 MG
%It initializes variables and sets parameters
%
%Richard Tol, 28 August 2014
%This code is protected by the MIT License

historicCH4emit = csvread('histCH4emit.csv');
histCH4conc = csvread('histCH4conc.csv');
historicN2Oemit = csvread('histN2Oemit.csv');
histN2Oconc = csvread('histN2Oconc.csv');
historicSF6emit = csvread('histSF6emit.csv');
histSF6conc = csvread('histSF6conc.csv');
histCFC11emit = csvread('histCFC11emit.csv');
histCFC11conc = csvread('histCFC11conc.csv');
histCFC12emit = csvread('histCFC12emit.csv');
histCFC12conc = csvread('histCFC12conc.csv');
histO3radforc = csvread('histO3radforc.csv');

%for s=1:NScen
%  CH4scen(s) = (100-NScen+floor(NScen/2)+s)/100;
%    N2Oscen(s) = (100-NScen+floor(NScen/2)+s)/100;
 %   SF6scen(s) = (100-NScen+floor(NScen/2)+s)/100;
   % CFC11scen(s) = (101-s)/100;
    %CFC12scen(s) = (101-s)/100;
    %trO3scen(s) = (100-NScen+floor(NScen/2)+s)/100;
%end

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
    for s=1:NScen
        ts = t-NHistYear;
        CH4emit(t,s) = (1+SRESdCH4(s,ts))*CH4emit(t-1,s);
        N2Oemit(t,s) = (1+SRESdN2O(s,ts))*N2Oemit(t-1,s);
        SF6emit(t,s) = (1+SRESdSF6(s,ts))*SF6emit(t-1,s);
        CFC11emit(t,s) = (1+SRESdCFC(s,ts))*CFC11emit(t-1,s);
        CFC12emit(t,s) = (1+SRESdCFC(s,ts))*CFC12emit(t-1,s);
        trO3radforc(t,s) = (1+SRESdO3(s,ts))*trO3radforc(t-1,s);
    end
end

otherGHGparam