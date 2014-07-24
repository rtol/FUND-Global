function [RF,TA,TO,SLR] = stepClimate(CO2,CH4,N2O,SF6,CFC11,CFC12,SO2,O3,TA0,TO0)

global SLRsens

RF= RadiativeForcing(CO2,CH4,N2O,SF6,CFC11,CFC12,SO2,O3);

[TA,TO] = ST(TA0,TO0,RF);
        
SLR = SLRsens*TO;