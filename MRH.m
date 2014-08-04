function CO2concnew = MRH(CO2concold,CO2emit,CO2life,CO2share,CO2convert)
%function CO2concnew = MRH(CO2concold,CO2emit,CO2life,CO2share,CO2convert)
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.0-matlab-global
%
%This function is part of FUND 4.0 MG
%It updates the atmospheric concentration of carbon dioxide using the
%Maier-Reimer Hasselmann model
%
%Richard Tol, 8 August 2014
%This code is protected by the MIT License

global NBox

for b = 1:NBox,
    CO2concnew(b) = (1-CO2life(b))*CO2concold(b) + CO2convert*CO2share(b)*CO2emit;
end
