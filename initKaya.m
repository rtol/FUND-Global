%initialize

histPopulation = csvread('histPopulation.csv');
histGDP = csvread('histGDP.csv');
histYpC = histGDP./histPopulation;

Y= zeros(NYear,NScen);

CobbDouglasparam

TFP(1,1) = (histGDP(1)/histPopulation(1))^LabourElast * (Depreciation/SavingsRate)^(1-LabourElast);
K(1,1) = SavingsRate*histGDP(1)/Depreciation;
Y(1,1) = TFP(1,1)*histPopulation(1)^LabourElast*K(1,1)^(1-LabourElast);

gTFP = 0.0075;

for t=2:NHistYear
    TFP(t,1) = (1+gTFP)*TFP(t-1,1);
end

CalibTFP

for s=1:NScen
     Popscen(s) = (99+s)/100;
     TFPscen(s)= gTFP*(1-NScen+floor(NScen/2)+s)/1;
end

for s=2:NScen
    TFP(:,s) = TFP(:,1);
end

Population= zeros(NYear,NScen);
for s=1:NScen
    Population(1:NHistYear,s)=histPopulation;
end

for t=NHistYear+1:NYear
    for s=1:NScen
        Population(t,s) = Popscen(s)*Population(t-1,s);
        TFP(t,s) = (1+TFPscen(s))*TFP(t-1,s);
    end
end
