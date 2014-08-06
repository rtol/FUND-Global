%CalibCH4
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.0-matlab-global
%
%This script is part of FUND 4.0 MG
%It calibrates the atmospheric lifetime of methane
%
%Richard Tol, 6 August 2014
%This code is protected by the MIT License

%first pass
for t=2:NHistYear
     CH4conc(t,1) = (1-CH4life)*CH4conc(t-1,1) + CH4life*CH41750 + CH4convert*historicCH4emit(t-1);
end

%calibrate
CH4aux = CH4life;

while abs(CH4conc(NHistYear)-CH42010) > 1,
          CH4aux = CH4aux*CH42010/CH4conc(NHistYear,1);
          for t=2:NHistYear
                CH4conc(t,1) = (1-CH4aux)*CH4conc(t-1,1) + CH4aux*CH41750 + CH4convert*historicCH4emit(t-1);
          end
end

CH4life = CH4aux;