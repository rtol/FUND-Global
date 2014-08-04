function [K,Y,E,C] = stepEconomy(K0,Y0,TFP,Pop,EI,CI)
%function [K,Y,E,C] = stepEconomy(K0,Y0,TFP,Pop,EI,CI)
%The Climate Framework for Uncertainty, Negotiation and Distribution
%version 4.0-matlab-global
%
%This function is part of FUND 4.0 MG
%It updates income, energy and emissions
%
%Richard Tol, 8 August 2014
%This code is protected by the MIT License

global Depreciation SavingsRate LabourElast

K = (1-Depreciation)*K0 + SavingsRate*Y0;

Y = TFP*Pop^LabourElast*K^(1-LabourElast);

E = EI*Y;

C = CI*E;