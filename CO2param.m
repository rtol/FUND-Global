%CO2param

global CO21750 NBox MRHlife MRHshare CO2convert pHpar1 pHpar2 pH1750

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

CO2convert = 0.00035624; %1/2.13/1000 =0.000469;

MRHbox = zeros(NYear,NScen,NBox);
MRHbox(1,1,:) = MRH1750;
CO2conc = zeros(NYear,NScen,1);
CO21750 = sum(MRH1750);
CO2conc(1,1) = CO21750;

CO22010 = 385.9;

pHpar1 = 0.00569*0.1100/0.1325;
pHpar2 = 0.67;
pH = zeros(NYear,NScen);
pH1750 = 8.179;
pH(1) = pH1750;
pH2010 = 8.069;