function [RF,TA,TO,SLR] = stepClimate(CO2,CH4,N2O,SF6,CFC11,CFC12,SO2,O3,TA0,TO0)
%function [RF,TA,TO,SLR] = stepClimate(CO2,CH4,N2O,SF6,CFC11,CFC12,SO2,O3,TA0,TO0)
%The Climate Framework for Uncertainty, Negotiation and Distribution
%version 4.0-matlab-global
%
%This function is part of FUND 4.0 MG
%It updates radiative forcing, temperature and sea level
%
%Richard Tol, 8 August 2014
%This code is protected by the MIT License

global SLRsens

RF= RadiativeForcing(CO2,CH4,N2O,SF6,CFC11,CFC12,SO2,O3);

[TA,TO] = ST(TA0,TO0,RF);
        
SLR = SLRsens*TO;