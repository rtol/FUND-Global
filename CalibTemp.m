%CalibTemp
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.0-matlab-global
%
%This script is part of FUND 4.0 MG
%It calibrates the sensitivity of temperature to radiative forcing
%
%Richard Tol, 6 August 2014
%This code is protected by the MIT License

%first pass
for t=2:NHistYear
     RadForc(t,1) = RadiativeForcing(CO2conc(t,1),CH4conc(t,1),N2Oconc(t,1),SF6conc(t,1),CFC11conc(t,1),CFC12conc(t,1),Semit(t,1),trO3radforc(t,1));
     [atmtemp(t,1) oceantemp(t,1)] = ST(atmtemp(t-1,1),oceantemp(t-1,1),RadForc(t,1));
end

%calibrate
while abs(atmtemp(NHistYear,1)-AtmTemp2010) > 0.01,
         STpar(1) = STpar(1)*AtmTemp2010/atmtemp(NHistYear,1);
         for t=2:NHistYear
                [atmtemp(t,1) oceantemp(t,1)] = ST(atmtemp(t-1,1),oceantemp(t-1,1),RadForc(t,1));
         end
end

ClimSens = STpar(1)*CO2RF*log(2);
