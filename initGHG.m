%initialize

historicCH4emit = csvread('histCH4emit.csv');
histCH4conc = csvread('histCH4conc.csv');
historicN2Oemit = csvread('histN2Oemit.csv');
histN2Oconc = csvread('histN2Oconc.csv');
historicSF6emit = csvread('histSF6emit.csv');
histSF6conc = csvread('histSF6conc.csv');
historicSemit = csvread('histSemit.csv');

for s=1:NScen
    CH4scen(s) = (100-NScen+floor(NScen/2)+s)/100;
    N2Oscen(s) = (100-NScen+floor(NScen/2)+s)/100;
    SF6scen(s) = (100-NScen+floor(NScen/2)+s)/100;
end

CH4emit= zeros(NYear,NScen);
N2Oemit= zeros(NYear,NScen);
SF6emit= zeros(NYear,NScen);
for s=1:NScen
    CH4emit(1:NHistYear,s)=historicCH4emit;
    N2Oemit(1:NHistYear,s)=historicN2Oemit;
    SF6emit(1:NHistYear,s)=historicSF6emit;
end

for t=NHistYear+1:NYear
    for s=1:NScen
        CH4emit(t,s) = CH4scen(s)*CH4emit(t-1,s);
        N2Oemit(t,s) = N2Oscen(s)*N2Oemit(t-1,s);
        SF6emit(t,s) = SF6scen(s)*SF6emit(t-1,s);
    end
end

otherGHGparam



