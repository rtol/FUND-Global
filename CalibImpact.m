%CalibImpact
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.0-matlab-global
%
%This script is part of FUND 4.0 MG
%It calibrates five alternative aggregrate damage functions
%
%Richard Tol, 6 August 2014
%This code is protected by the MIT License

vtemp = observedImpact(:,1);
vimp = observedImpact(:,2);
vN = length(vtemp);
vtemp = vtemp(1:vN-1);
vimp = vimp(1:vN-1);

imppar = zeros(NImpact,3);

[imppar(1,1) imppar(1,2) imppar(1,3)] = fittol(vtemp,vimp);
[imppar(2,1) imppar(2,2) imppar(2,3)] = fitweitzman(vtemp,vimp);
[imppar(3,1) imppar(3,3)] = fitnordhaus(vtemp,vimp);
[imppar(4,1) imppar(4,3)] = fithope(vtemp,vimp);
[imppar(5,1) imppar(5,3)] = fitploeg(vtemp,vimp);