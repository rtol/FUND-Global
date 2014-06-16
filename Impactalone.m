%FUND

inittime
initCO2
initGHG
initRF
initClim
initImpact

CalibCO2
CalibCH4
CalibN2O
CalibSF6
CalibTemp
CalibImpact

for t=2:NHistYear
     MRHbox(t,1,:) = MRH(MRHbox(t-1,1,:),historicCO2emit(t-1)+historicLUemit(t-1),MRHlife,MRHshare,CO2convert);
     CO2conc(t,1) = sum(MRHbox(t,1,:));
     pH(t,1) = pH1750-pHpar1*(CO2conc(t,1)-CO21750)^pHpar2;
     CH4conc(t,1) = (1-CH4aux)*CH4conc(t-1,1) + CH4aux*CH41750 + CH4convert*historicCH4emit(t-1);
     N2Oconc(t,1) = (1-N2Olife)*N2Oconc(t-1,1) + N2Olife*N2O1750 + N2Oaux*historicN2Oemit(t-1);
     SF6conc(t,1) = (1-SF6life)*SF6conc(t-1,1) + SF6life*SF61750 + SF6aux*historicSF6emit(t-1);
     CFC11conc(t,1) = (1-CFC11life)*CFC11conc(t-1,1) + histCFC11emit(t-1);
     CFC12conc(t,1) = (1-CFC12life)*CFC12conc(t-1,1) + histCFC12emit(t-1);
     RadForc(t,1) = RadiativeForcing(CO2conc(t,1),CH4conc(t,1),N2Oconc(t,1),SF6conc(t,1),CFC11conc(t,1),CFC12conc(t,1),Semit(t,s));
     [atmtemp(t,1) oceantemp(t,1)] = ST(atmtemp(t-1,1),oceantemp(t-1,1),RadForc(t,1));
     impact(1,t,1) = evaltol(atmtemp(t,1),[imppar(1,1) imppar(1,2)]);
     impact(2,t,1) = evalweitzman(atmtemp(t,1),[imppar(2,1) imppar(2,2)]);
     impact(3,t,1) = evalnordhaus(atmtemp(t,1),imppar(3,1));
     impact(4,t,1) = evalhope(atmtemp(t,1),imppar(4,1));
     impact(5,t,1) = evalploeg(atmtemp(t,1),imppar(5,1));
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
    impact(:,:,s) = impact(:,:,1);
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
        RadForc(t,s) = RadiativeForcing(CO2conc(t,s),CH4conc(t,s),N2Oconc(t,s),SF6conc(t,s),CFC11conc(t,s),CFC12conc(t,s),Semit(t,s));
        [atmtemp(t,s) oceantemp(t,s)] = ST(atmtemp(t-1,s),oceantemp(t-1,s),RadForc(t,s));
        impact(1,t,s) = evaltol(atmtemp(t,s),[imppar(1,1) imppar(1,2)]);
        impact(2,t,s) = evalweitzman(atmtemp(t,s),[imppar(2,1) imppar(2,2)]);
        impact(3,t,s) = evalnordhaus(atmtemp(t,s),imppar(3,1));
        impact(4,t,s) = evalhope(atmtemp(t,s),imppar(4,1));
        impact(5,t,s) = evalploeg(atmtemp(t,s),imppar(5,1));
    end
end

subplot(2,3,1), plot(Year,atmtemp(:,1),Year,atmtemp(:,2),Year,atmtemp(:,3)), xlabel('year'), ylabel('degree Celsius'), title('Temperature')
subplot(2,3,2), plot(Year,impact(1,:,1),Year,impact(1,:,2),Year,impact(1,:,3)), xlabel('year'), ylabel('percent income'), title('Impact')
subplot(2,3,3), plot(Year,impact(2,:,1),Year,impact(2,:,2),Year,impact(2,:,3)), xlabel('year'), ylabel('percent income'), title('Impact')
subplot(2,3,4), plot(Year,impact(3,:,1),Year,impact(3,:,2),Year,impact(3,:,3)), xlabel('year'), ylabel('percent income'), title('Impact')
subplot(2,3,5), plot(Year,impact(4,:,1),Year,impact(4,:,2),Year,impact(4,:,3)), xlabel('year'), ylabel('percent income'), title('Impact')
subplot(2,3,6), plot(Year,impact(5,:,1),Year,impact(5,:,2),Year,impact(5,:,3)), xlabel('year'), ylabel('percent income'), title('Impact')

