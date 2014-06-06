%first pass
for t=2:NHistYear
     MRHbox(t,1,:) = MRH(MRHbox(t-1,1,:),historicCO2emit(t-1)+historicLUemit(t-1),MRHlife,MRHshare,CO2convert);
     CO2conc(t,1) = sum(MRHbox(t,1,:));
end

CO2aux = CO2convert;

while abs(CO2conc(NHistYear)-CO22010) > 1,
          CO2aux = CO2aux*CO22010/CO2conc(NHistYear);
          for t=2:NHistYear
                MRHbox(t,1,:) = MRH(MRHbox(t-1,1,:),historicCO2emit(t-1)+historicLUemit(t-1),MRHlife,MRHshare,CO2aux);
                CO2conc(t,1) = sum(MRHbox(t,1,:));
          end
end

CO2convert = CO2aux;