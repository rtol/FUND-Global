%first pass
for t=2:NHistYear
     RadForc(t,1) = RadiativeForcing(CO2conc(t,1),CH4conc(t,1),N2Oconc(t,1),SF6conc(t,1),CFC11conc(t,1),CFC12conc(t,1),Semit(t,s));
     [atmtemp(t,1) oceantemp(t,1)] = ST(atmtemp(t-1,1),oceantemp(t-1,1),RadForc(t,1));
end

while abs(atmtemp(NHistYear,1)-AtmTemp2010) > 0.01,
         STpar(1) = STpar(1)*AtmTemp2010/atmtemp(NHistYear,1);
         for t=2:NHistYear
                [atmtemp(t,1) oceantemp(t,1)] = ST(atmtemp(t-1,1),oceantemp(t-1,1),RadForc(t,1));
         end
end

ClimSens = STpar(1)*CO2RF*log(2);
