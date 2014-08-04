function [CO2box, CO2c, pH] = stepCO2(CO2c0,CO2e,LUe)
%function [CO2box, CO2c, pH] = stepCO2(CO2c0,CO2e,LUe)
%The Climate Framework for Uncertainty, Negotiation and Distribution
%version 4.0-matlab-global
%
%This function is part of FUND 4.0 MG
%It updates carbon dioxide and ocean pH
%
%Richard Tol, 8 August 2014
%This code is protected by the MIT License

global MRHlife MRHshare CO2convert CO21750 pH1750 pHpar1 pHpar2

CO2box = MRH(CO2c0,CO2e+LUe,MRHlife,MRHshare,CO2convert);
CO2c = sum(CO2box);
pH = pH1750-pHpar1*(CO2c-CO21750)^pHpar2;