%CalibImpact
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.0-matlab-global
%
%This script is part of FUND 4.0 MG
%It calibrates the conversion factor of nitrous oxide emissions to
%instantaneous concentrations.
%
%Richard Tol, 28 August 2014
%This code is protected by the MIT License

%first pass
for t=2:NHistYear
     N2Oconc(t,1) = (1-N2Olife)*N2Oconc(t-1,1) + N2Olife*N2O1750 + N2Oconvert*historicN2Oemit(t-1);
end

N2Oaux = N2Oconvert;

while abs(N2Oconc(NHistYear)-N2O2010) > 1,
          N2Oaux = N2Oaux*N2O2010/N2Oconc(NHistYear,1);
          for t=2:NHistYear
                N2Oconc(t,1) = (1-N2Olife)*N2Oconc(t-1,1) + N2Olife*N2O1750 + N2Oaux*historicN2Oemit(t-1);
          end
end

N2Oconvert = N2Oaux;