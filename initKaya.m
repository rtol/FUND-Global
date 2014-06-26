%initialize

histPopulation = csvread('histPopulation.csv');
histGDP = csvread('histGDP.csv');
histYpC = histGDP./histPopulation;

for s=1:NScen
     Popscen(s) = (99+s)/100;
     YpCscen(s)=(99+s)/100;
end

Population= zeros(NYear,NScen);
GDP= zeros(NYear,NScen);
YpC= zeros(NYear,NScen);
for s=1:NScen
    Population(1:NHistYear,s)=histPopulation;
    GDP(1:NHistYear,s)=histGDP;
    YpC(1:NHistYear,s)=histYpC;
end

for t=NHistYear+1:NYear
    for s=1:NScen
        Population(t,s) = Popscen(s)*Population(t-1,s);
        YpC(t,s) = YpCscen(s)*YpC(t-1,s);
        GDP(t,s)=YpC(t,s)*Population(t,s);
    end
end
