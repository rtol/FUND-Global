%GHGalone
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.0-matlab-global
%
%This script runs the gas cycle components of FUND 4.0 MG
%
%Richard Tol, 28 August 2014
%This code is protected by the MIT License

inittime
initCO2alone
initGHG

CalibCO2
CalibCH4
CalibN2O
CalibSF6

for t=2:NHistYear
     MRHbox(t,1,:) = MRH(MRHbox(t-1,1,:),historicCO2emit(t-1)+historicLUemit(t-1),MRHlife,MRHshare,CO2convert);
     CO2conc(t,1) = sum(MRHbox(t,1,:));
     pH(t,1) = pH1750-pHpar1*(CO2conc(t,1)-CO21750)^pHpar2;
     CH4conc(t,1) = (1-CH4aux)*CH4conc(t-1,1) + CH4aux*CH41750 + CH4convert*historicCH4emit(t-1);
     N2Oconc(t,1) = (1-N2Olife)*N2Oconc(t-1,1) + N2Olife*N2O1750 + N2Oaux*historicN2Oemit(t-1);
     SF6conc(t,1) = (1-SF6life)*SF6conc(t-1,1) + SF6life*SF61750 + SF6aux*historicSF6emit(t-1);
end

for s=2:NScen
    MRHbox(:,s,:) = MRHbox(:,1,:);
    CO2conc(:,s) = CO2conc(:,1);
    CH4conc(:,s) = CH4conc(:,1);
    N2Oconc(:,s) = N2Oconc(:,1);
    SF6conc(:,s) = SF6conc(:,1);
    pH(:,s) = pH(:,1);
end

for t=NHistYear+1:NYear
    for s=1:NScen
        MRHbox(t,s,:) = MRH(MRHbox(t-1,s,:),CO2emit(t-1,s)+LUemit(t-1,s),MRHlife,MRHshare,CO2convert);
        CO2conc(t,s) = sum(MRHbox(t,s,:));
        pH(t,s) = pH1750-pHpar1*(CO2conc(t,s)-CO21750)^pHpar2;
        CH4conc(t,s) = (1-CH4aux)*CH4conc(t-1,s) + CH4aux*CH41750 + CH4convert*CH4emit(t-1,s);
        N2Oconc(t,s) = (1-N2Olife)*N2Oconc(t-1,s) + N2Olife*N2O1750 + N2Oaux*N2Oemit(t-1,s);
        SF6conc(t,s) = (1-SF6life)*SF6conc(t-1,s) + SF6life*SF61750 + SF6aux*SF6emit(t-1,s);
    end
end

subplot(2,5,1), plot(Year(1:NHistYear),CO2conc(1:NHistYear),histCO2conc(:,1),histCO2conc(:,2),'b.'), xlabel('year'), ylabel('parts per million'), title('Carbon dioxide')
subplot(2,5,2), plot(Year(1:NHistYear),pH(1:NHistYear)), xlabel('year'), ylabel('pH'), title('Ocean acidity')
subplot(2,5,3), plot(Year(1:NHistYear),CH4conc(1:NHistYear),histCH4conc(:,1),histCH4conc(:,2),'b.'), xlabel('year'), ylabel('parts per billion'), title('Methane')
subplot(2,5,4), plot(Year(1:NHistYear),N2Oconc(1:NHistYear),histN2Oconc(:,1),histN2Oconc(:,2),'b.'), xlabel('year'), ylabel('parts per billion'), title('Nitrous oxide')
subplot(2,5,5), plot(Year(1:NHistYear),SF6conc(1:NHistYear),histSF6conc(:,1),histSF6conc(:,2),'b.'), xlabel('year'), ylabel('parts per trillion'), title('Sulphur hexafluoride')
subplot(2,5,6), plot(Year,CO2conc(:,1),Year,CO2conc(:,2),Year,CO2conc(:,3)), xlabel('year'), ylabel('parts per million'), title('Carbon dioxide')
subplot(2,5,7), plot(Year,pH(:,1),Year,pH(:,2),Year,pH(:,3)), xlabel('year'), ylabel('pH'), title('Ocean acidity')
subplot(2,5,8), plot(Year,CH4conc(:,1),Year,CH4conc(:,2),Year,CH4conc(:,3)), xlabel('year'), ylabel('parts per billion'), title('Methane')
subplot(2,5,9), plot(Year,N2Oconc(:,1),Year,N2Oconc(:,2),Year,N2Oconc(:,3)), xlabel('year'), ylabel('parts per billion'), title('Nitrous oxide')
subplot(2,5,10), plot(Year,SF6conc(:,1),Year,SF6conc(:,2),Year,SF6conc(:,3)), xlabel('year'), ylabel('parts per trillion'), title('Sulphur hexafluoride')


