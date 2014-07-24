%otherGHGparam

global CH41750 CH4life CH4convert
global N2O1750 N2Olife N2Oconvert
global SF61750 SF6life SF6convert
global CFC11life CFC12life

CH4life = 0.1120;
CH41750 = 790;
CH4convert = 0.3597;
CH4conc = zeros(NYear,NScen);
CH4conc(1,1) = CH41750;
CH42010 = 1816;

N2Olife = 1/120;
N2O1750 = 285;
N2Oconvert = 0.0865;
N2Oconc = zeros(NYear,NScen);
N2Oconc(1,1) = N2O1750;
N2O2010 = 323;

SF6life = 1/3200;
SF61750 = 0;
SF6convert = 0.0398;
SF6conc = zeros(NYear,NScen);
SF6conc(1,1) = SF61750;
SF62010 = 7.28;
SF62000 = 4.00;

CFC11life = 1/45;
CFC11conc = zeros(NYear,NScen);
CFC12life = 1/100;
CFC12conc = zeros(NYear,NScen);