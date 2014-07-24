function [CO2box, CO2c, pH] = stepCO2(CO2c0,CO2e,LUe)

global MRHlife MRHshare CO2convert CO21750 pH1750 pHpar1 pHpar2

CO2box = MRH(CO2c0,CO2e+LUe,MRHlife,MRHshare,CO2convert);
CO2c = sum(CO2box);
pH = pH1750-pHpar1*(CO2c-CO21750)^pHpar2;