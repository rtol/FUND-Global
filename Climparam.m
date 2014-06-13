%Climparam

global STpar

ClimSens = 4.089199604542426;
AtmTemp2010 = 0.8;

atmtemp0 = 0;
oceantemp0 = 0;

atmtemp = zeros(NYear,NScen);
oceantemp = zeros(NYear,NScen);

atmtemp(1,1) = atmtemp0;
oceantemp(1,1) = oceantemp0;

STpar(1) = ClimSens/CO2RF/log(2);
STpar(2) = 0.0256;
STpar(3) = 0.00738;
STpar(4) = 0.00568;

SLRlife = 1/500;
SLRsens = 2.0*SLRlife;

SLR = zeros(NYear,1);
SLR(1) = 0;