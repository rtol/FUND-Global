%CalibImpact
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.2-matlab-global
%
%This script is part of FUND 4.2 MG
%It calibrates five alternative aggregrate damage functions
%
%Richard Tol, 28 July 2023
%This code is protected by the MIT License

vtemp = observedImpact(:,1);
vimp = observedImpact(:,2);
vN = length(vtemp);
vtemp = vtemp(1:vN); %why did I drop the last one?
vimp = vimp(1:vN);

imppar = zeros(NImpact,4);

[imppar(1,1) imppar(1,2) imppar(1,4)] = fittol(vtemp,vimp);
[imppar(2,1) imppar(2,2) imppar(2,4)] = fitweitzman6(vtemp,vimp);
[imppar(3,1) imppar(3,2) imppar(3,4)] = fitweitzman7(vtemp,vimp);
[imppar(4,1) imppar(4,4)] = fitnordhaus(vtemp,vimp);
[imppar(5,1) imppar(5,4)] = fithope(vtemp,vimp);
[imppar(6,1) imppar(6,4)] = fitploeg(vtemp,vimp);
[imppar(7,1) imppar(7,4)] = fitgolosov(vtemp,vimp);
[imppar(8,1) imppar(8,2) imppar(8,3) imppar(8,4)] = fittol2(vtemp,vimp);

%overwrite the fit with results in spreadsheet
imppar(1,1) = -0.45334;
imppar(1,2) = -0.08173;
imppar(1,4) = 0.2078;
imppar(2,1) = -0.18978;
imppar(2,2) = 0.000010;
imppar(2,4) = 0.1176;
imppar(3,1) =  -0.1836;
imppar(3,2) = 0.000000985;
imppar(3,4) = 0.1161;
imppar(4,1) = -0.17424;
imppar(4,4) = 0.1130;
imppar(5,1) = -0.79477984;
imppar(5,4) = 0.1391;
imppar(6,1) = -0.00781;
imppar(6,4) = 0.000998;
imppar(7,1) = -0.40701; %this is sinh, not golosov
imppar(7,4) = 0.1736;
imppar(8,1) = -0.79478;
imppar(8,2) = 12.83651;
imppar(8,3) = -17.8274;
imppar(8,4) = 0.1318;

for i = 1:NObsImp,
    imppar(i+NImpact,1) = vimp(i)/vtemp(i)/vtemp(i);
end

%impact functions per method
imppar(NTImp-4,1) = 0.965138; %enumeration
imppar(NTImp-4,2) = 1.0;
imppar(NTImp-4,3) = -1.5397;
imppar(NTImp-3,1) = -2.32857629; %elicitation
imppar(NTImp-2,1) = -0.00356; %econometric
imppar(NTImp-1,1) = -0.15095; %CGE
imppar(NTImp-1,2) = -0.000064;

grimpar = zeros(14,4);
grimpar(1,1) = -0.004655; %letta
grimpar(2,1) = -0.01714;  %kahn
grimpar(3,1) = 0.0019;    %kotz21
grimpar(3,2) = -0.0018;
grimpar(4,1) = -0.0013;   %kotz22
grimpar(4,2) = -0.0018;
grimpar(5,1) = -0.004029; %combined
grimpar(5,2) = -0.000337;
grimpar(6,3) = 0.002586;  %pretis
grimpar(6,4) = -0.0004;
grimpar(7,3) = 0.001558;  %burke
grimpar(7,4) = -0.0005;
grimpar(8,3) = -0.00081;  %henseler
grimpar(8,4) = -0.000455;
grimpar(9,3) = 0.002105;  %acevedo
grimpar(9,4) = -0.00051;
grimpar(10,3) = -0.010098; %kikstra
grimpar(10,4) = -0.000761;
grimpar(11,3) = -0.006666; %kalkuhl
grimpar(11,4) = -0.000015;
grimpar(12,3) = -0.002131; %dell
grimpar(13,3) = 0.004796; %damania
grimpar(13,4) = -0.000790;
grimpar(14,3) = -0.002006; %combined
grimpar(14,4) = -0.0000232;

