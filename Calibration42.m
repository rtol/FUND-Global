%CalibrationTargets
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.2-matlab-global
%
%This script is part of FUND 4.1 MG
%It sets parameters and variables
%
%Richard Tol, 27 July 2022
%This code is protected by the MIT License

%starting values
global CO2convert CH4life N2Oconvert SF6convert STpar SLRsens
CO2convert = 0.00035624;
CH4life = 0.1120; 
N2Oconvert = 0.0865;
SF6convert = 0.0398;
ClimSens = 4.089199604542426;
STpar(1) = ClimSens/CO2RF/log(2);
SLRsens = 0.9;

%targets
CO22010 = 388.56;
CH42010 = 1816;
N2O2010 = 323;
SF62010 = 7.28;
SF62000 = 4.00;
AtmTemp2010 = 0.8;
SLR2010 = 0.19;

%calibration
CalibCO2
CalibCH4
CalibN2O
CalibSF6
CalibTemp
CalibSLR
CalibImpact42
