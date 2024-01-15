%CalibImpact
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.1-matlab-global
%
%This script is part of FUND 4.1 MG
%It calibrates five alternative aggregrate damage functions
%
%Richard Tol, 14 May 2018
%This code is protected by the MIT License

vtemp = observedImpact(:,1);
vimp = observedImpact(:,2);
vN = length(vtemp);
vtemp = vtemp(1:vN-1);
vimp = vimp(1:vN-1);

imppar = zeros(NImpact,4);

[imppar(1,1) imppar(1,2) imppar(1,4)] = fittol(vtemp,vimp);
[imppar(2,1) imppar(2,2) imppar(2,4)] = fitweitzman6(vtemp,vimp);
[imppar(3,1) imppar(3,2) imppar(3,4)] = fitweitzman7(vtemp,vimp);
[imppar(4,1) imppar(4,4)] = fitnordhaus(vtemp,vimp);
[imppar(5,1) imppar(5,4)] = fithope(vtemp,vimp);
[imppar(6,1) imppar(6,4)] = fitploeg(vtemp,vimp);
[imppar(7,1) imppar(7,4)] = fitgolosov(vtemp,vimp);
[imppar(8,1) imppar(8,2) imppar(8,3) imppar(8,4)] = fittol2(vtemp,vimp);