%initImpact
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.0-matlab-global
%
%This script is part of FUND 4.0 MG
%It initializes variables and sets parameters
%
%Richard Tol, 6 August 2014
%This code is protected by the MIT License

global YpC2010

YpC2010 = histYpC(NHistYear);

impact = zeros(NImpact,NYear,NScen);
impactd = zeros(NImpact,NYear,NScen);



