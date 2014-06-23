%FUND

inittime
initCO2
initGHG
initRF
initClim

CalibCO2
CalibCH4
CalibN2O
CalibSF6
CalibTemp

for t=2:NHistYear
     MRHbox(t,1,:) = MRH(MRHbox(t-1,1,:),historicCO2emit(t-1)+historicLUemit(t-1),MRHlife,MRHshare,CO2convert);
     CO2conc(t,1) = sum(MRHbox(t,1,:));
     pH(t,1) = pH1750-pHpar1*(CO2conc(t,1)-CO21750)^pHpar2;
     CH4conc(t,1) = (1-CH4aux)*CH4conc(t-1,1) + CH4aux*CH41750 + CH4convert*historicCH4emit(t-1);
     N2Oconc(t,1) = (1-N2Olife)*N2Oconc(t-1,1) + N2Olife*N2O1750 + N2Oaux*historicN2Oemit(t-1);
     SF6conc(t,1) = (1-SF6life)*SF6conc(t-1,1) + SF6life*SF61750 + SF6aux*historicSF6emit(t-1);
     CFC11conc(t,1) = (1-CFC11life)*CFC11conc(t-1,1) + histCFC11emit(t-1);
     CFC12conc(t,1) = (1-CFC12life)*CFC12conc(t-1,1) + histCFC12emit(t-1);
     RadForc(t,1) = RadiativeForcing(CO2conc(t,1),CH4conc(t,1),N2Oconc(t,1),SF6conc(t,1),CFC11conc(t,1),CFC12conc(t,1),Semit(t,1),trO3radforc(t,1));
     [atmtemp(t,1) oceantemp(t,1)] = ST(atmtemp(t-1,1),oceantemp(t-1,1),RadForc(t,1));
end

for s=2:NScen
    MRHbox(:,s,:) = MRHbox(:,1,:);
    CO2conc(:,s) = CO2conc(:,1);
    CH4conc(:,s) = CH4conc(:,1);
    N2Oconc(:,s) = N2Oconc(:,1);
    SF6conc(:,s) = SF6conc(:,1);
    CFC11conc(:,s) = CFC11conc(:,1);
    CFC12conc(:,s) = CFC12conc(:,1);
    pH(:,s) = pH(:,1);
    RadForc(:,s) = RadForc(:,1);
    atmtemp(:,s) = atmtemp(:,1);
    oceantemp(:,s) = oceantemp(:,1);
end

for t=NHistYear+1:NYear
    for s=1:NScen
        MRHbox(t,s,:) = MRH(MRHbox(t-1,s,:),CO2emit(t-1,s)+LUemit(t-1,s),MRHlife,MRHshare,CO2convert);
        CO2conc(t,s) = sum(MRHbox(t,s,:));
        pH(t,s) = pH1750-pHpar1*(CO2conc(t,s)-CO21750)^pHpar2;
        CH4conc(t,s) = (1-CH4aux)*CH4conc(t-1,s) + CH4aux*CH41750 + CH4convert*CH4emit(t-1,s);
        N2Oconc(t,s) = (1-N2Olife)*N2Oconc(t-1,s) + N2Olife*N2O1750 + N2Oaux*N2Oemit(t-1,s);
        SF6conc(t,s) = (1-SF6life)*SF6conc(t-1,s) + SF6life*SF61750 + SF6aux*SF6emit(t-1,s);
        CFC11conc(t,s) = (1-CFC11life)*CFC11conc(t-1,s) + CFC11emit(t-1,s);
        CFC12conc(t,s) = (1-CFC12life)*CFC12conc(t-1,s) + CFC12emit(t-1,s);
        RadForc(t,s) = RadiativeForcing(CO2conc(t,s),CH4conc(t,s),N2Oconc(t,s),SF6conc(t,s),CFC11conc(t,s),CFC12conc(t,s),Semit(t,s),trO3radforc(t,s));
        [atmtemp(t,s) oceantemp(t,s)] = ST(atmtemp(t-1,s),oceantemp(t-1,s),RadForc(t,s));
    end
end

subplot(2,8,1), plot(Year(1:NHistYear),CO2conc(1:NHistYear),histCO2conc(:,1),histCO2conc(:,2),'b.'), xlabel('year'), ylabel('parts per million'), title('Carbon dioxide'), axis([1750 2010 275 400])
subplot(2,8,2), plot(Year(1:NHistYear),pH(1:NHistYear)), xlabel('year'), ylabel('pH'), title('Ocean acidity'), axis([1750 2010 8.06 8.18])
subplot(2,8,3), plot(Year(1:NHistYear),CH4conc(1:NHistYear),histCH4conc(:,1),histCH4conc(:,2),'b.'), xlabel('year'), ylabel('parts per billion'), title('Methane'), axis([1750 2010 600 2000])
subplot(2,8,4), plot(Year(1:NHistYear),N2Oconc(1:NHistYear),histN2Oconc(:,1),histN2Oconc(:,2),'b.'), xlabel('year'), ylabel('parts per billion'), title('Nitrous oxide'), axis([1750 2010 280 330])
subplot(2,8,5), plot(Year(1:NHistYear),SF6conc(1:NHistYear),histSF6conc(:,1),histSF6conc(:,2),'b.'), xlabel('year'), ylabel('parts per trillion'), title('Sulphur hexafluoride'), axis([1750 2010 0 10])
subplot(2,8,6), plot(Year(1:NHistYear),Semit(1:NHistYear)), xlabel('year'), ylabel('million tonne of S per year'), title('Sulphur'), axis([1750 2010 0 70])
subplot(2,8,7), plot(Year(1:NHistYear),RadForc(1:NHistYear)), xlabel('year'), ylabel('Watts per square metre'), title('Radiative forcing'), axis([1750 2010 0 2.5])
subplot(2,8,8), plot(Year(1:NHistYear),atmtemp(1:NHistYear),historicTemp(:,1),historicTemp(:,2),'b.'), xlabel('year'), ylabel('degree Celsius'), title('Temperature'), axis([1750 2010 -0.5 1.0])
subplot(2,8,9), plot(Year,CO2conc(:,1),Year,CO2conc(:,2),Year,CO2conc(:,3)), xlabel('year'), ylabel('parts per million'), title('Carbon dioxide'), axis([1750 2100 275 700])
subplot(2,8,10), plot(Year,pH(:,1),Year,pH(:,2),Year,pH(:,3)), xlabel('year'), ylabel('pH'), title('Ocean acidity'), axis([1750 2100 7.9 8.18])
subplot(2,8,11), plot(Year,CH4conc(:,1),Year,CH4conc(:,2),Year,CH4conc(:,3)), xlabel('year'), ylabel('parts per billion'), title('Methane'), axis([1750 2100 600 3500])
subplot(2,8,12), plot(Year,N2Oconc(:,1),Year,N2Oconc(:,2),Year,N2Oconc(:,3)), xlabel('year'), ylabel('parts per billion'), title('Nitrous oxide'), axis([1750 2100 280 400])
subplot(2,8,13), plot(Year,SF6conc(:,1),Year,SF6conc(:,2),Year,SF6conc(:,3)), xlabel('year'), ylabel('parts per trillion'), title('Sulphur hexafluoride'), axis([1750 2100 0 70])
subplot(2,8,14), plot(Year,Semit(:,1),Year,Semit(:,2),Year,Semit(:,3)), xlabel('year'), ylabel('million tonne of S per year'), title('Sulphur'), title('Sulphur'), axis([1750 2100 0 160])
subplot(2,8,15), plot(Year,RadForc(:,1),Year,RadForc(:,2),Year,RadForc(:,3)), xlabel('year'), ylabel('Watts per square metre'), title('Radiative forcing'), axis([1750 2100 0.0 4.5])
subplot(2,8,16), plot(Year,atmtemp(:,1),Year,atmtemp(:,2),Year,atmtemp(:,3)), xlabel('year'), ylabel('degree Celsius'), title('Temperature'), axis([1750 2100 -0.5 3.0])

