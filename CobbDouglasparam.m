%CobbDouglasparam
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.0-matlab-global
%
%This script is part of FUND 4.0 MG
%It sets parameters and variables
%
%Richard Tol, 28 August 2014
%This code is protected by the MIT License

global LabourElast Depreciation SavingsRate

LabourElast = 0.8;
Depreciation = 0.1;
SavingsRate= 0.2;

TFP = zeros(NYear,NScen);
K = zeros(NYear,NScen);
Y = zeros(NYear,NScen);