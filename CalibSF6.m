%CalibSF6
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.0-matlab-global
%
%This script is part of FUND 4.0 MG
%It calibrates the conversion factor of sulphur hexafluoride emissions to
%instantaneous concentrations.
%
%Richard Tol, 28 August 2014
%This code is protected by the MIT License

%first pass
for t=2:NHistYear
     SF6conc(t,1) = (1-SF6life)*SF6conc(t-1,1) + SF6life*SF61750 + SF6convert*historicSF6emit(t-1);
end

SF6aux = SF6convert;

while abs(SF6conc(NHistYear)-SF62010) > 1,
          SF6aux = SF6aux*SF62010/SF6conc(NHistYear,1)
          for t=2:NHistYear
                SF6conc(t,1) = (1-SF6life)*SF6conc(t-1,1) + SF6life*SF61750 + SF6aux*historicSF6emit(t-1);
          end
end

SF6convert = SF6aux;