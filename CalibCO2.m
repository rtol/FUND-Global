%CalibCO2
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.0-matlab-global
%
%This script is part of FUND 4.0 MG
%It calibrates the conversion factor of carbon dioxide emissions to
%instantaneous concentrations.
%
%Richard Tol, 6 August 2014
%This code is protected by the MIT License

%first pass
for t=2:NHistYear
     MRHbox(t,1,:) = MRH(MRHbox(t-1,1,:),historicCO2emit(t-1)+historicLUemit(t-1),MRHlife,MRHshare,CO2convert);
     CO2conc(t,1) = sum(MRHbox(t,1,:));
end

%calibrate
CO2aux = CO2convert;

while abs(CO2conc(NHistYear)-CO22010) > 1,
          CO2aux = CO2aux*CO22010/CO2conc(NHistYear);
          for t=2:NHistYear
                MRHbox(t,1,:) = MRH(MRHbox(t-1,1,:),historicCO2emit(t-1)+historicLUemit(t-1),MRHlife,MRHshare,CO2aux);
                CO2conc(t,1) = sum(MRHbox(t,1,:));
          end
end

CO2convert = CO2aux;