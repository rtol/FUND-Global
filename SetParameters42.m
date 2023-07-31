%SetParameters
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.1-matlab-global
%
%This script is part of FUND 4.1 MG
%It sets parameters and variables
%
%Richard Tol, 18 March 2018
%This code is protected by the MIT License

%carbon dioxide
global CO21750 NBox MRHlife MRHshare pHpar1 pHpar2 pH1750

CO21750 = 275;
NBox = 5;

MRHlife(1) = 0;
MRHlife(2) = 1-exp(-1/363);
MRHlife(3) = 1-exp(-1/74);
MRHlife(4) = 1-exp(-1/17);
MRHlife(5) = 1-exp(-1/2);

MRH1750(1) = CO21750;
MRH1750(2) = 0;
MRH1750(3) = 0;
MRH1750(4) = 0;
MRH1750(5) = 0;

MRHshare(1) = 0.13;
MRHshare(2) = 0.20;
MRHshare(3) = 0.32;
MRHshare(4) = 0.25;
MRHshare(5) = 0.10;

%ocean acidification
pHpar1 = 0.00569*0.1100/0.1325;
pHpar2 = 0.67;
pH1750 = 8.179;
pH2010 = 8.069;

%other greenhouse gases
global CH41750 CH4convert
global N2O1750 N2Olife
global SF61750 SF6life
global CFC11life CFC12life

CH41750 = 790;
CH4convert = 0.3597;

N2Olife = 1/120;
N2O1750 = 285;

SF6life = 1/3200;
SF61750 = 0;

CFC11life = 1/45;
CFC12life = 1/100;

%radiative forcing
global CO2RF CH4RF N2ORF CH4N2ORF CH4N2Op1 CH4N2Op2 CH4N2Op3 CH4N2Op4 CH4N2Op5 SF6RF SdirRF SindRF CFC11RF CFC12RF

CO2RF = 5.35;
CH4RF = 0.036;
N2ORF = 0.12;
CH4N2ORF = 0.47;
CH4N2Op1 = 0.0000201;
CH4N2Op2 = 0.00000000000000531;
CH4N2Op3 = 0.75;
CH4N2Op4 = 2.52;
CH4N2Op5 = 1.52;
SF6RF = 0.00052;
CFC11RF = 0.25/1000;
CFC12RF = 0.32/1000;
SdirRF = 0.03*4/14.6;
SindRF = 0.08;

%temperature and sea level
global STpar

atmtemp0 = 0;
oceantemp0 = 0;

STpar(1) = 0;             %note that this is a calibation parameter
STpar(2) = 0.0256;
STpar(3) = 0.00738;
STpar(4) = 0.00568;

%impact
global NImpact NTImp NObsImp NGImp impincelas

NObsImp = length(observedImpact);
NImpact = 8;
NTImp = NImpact + NObsImp + 4 + 1
NGImp = 14;
%impincelas =  0.00;
%impincelas = -0.18;
impincelas = -0.36;
%impincelas = -0.72;

%scenario
global LabourElast Depreciation SavingsRate

LabourElast = 0.8;
Depreciation = 0.1;
SavingsRate= 0.2;
