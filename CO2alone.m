%CO2alone
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.0-matlab-global
%
%This script runs the carbon cycle components of FUND 4.0 MG
%
%Richard Tol, 28 August 2014
%This code is protected by the MIT License

inittime
initCO2alone

CalibCO2

for t=2:NHistYear
     MRHbox(t,1,:) = MRH(MRHbox(t-1,1,:),historicCO2emit(t-1)+historicLUemit(t-1),MRHlife,MRHshare,CO2convert);
     CO2conc(t,1) = sum(MRHbox(t,1,:));
     pH(t,1) = pH1750-pHpar1*(CO2conc(t,1)-CO21750)^pHpar2;
end

for s=2:NScen
    MRHbox(:,s,:) = MRHbox(:,1,:);
    CO2conc(:,s) = CO2conc(:,1);
    pH(:,s) = pH(:,1);
end

for t=NHistYear+1:NYear
    for s=1:NScen
        MRHbox(t,s,:) = MRH(MRHbox(t-1,s,:),CO2emit(t-1,s)+LUemit(t-1,s),MRHlife,MRHshare,CO2convert);
        CO2conc(t,s) = sum(MRHbox(t,s,:));
        pH(t,s) = pH1750-pHpar1*(CO2conc(t,s)-CO21750)^pHpar2;
    end
end

subplot(2,2,1), plot(Year(1:NHistYear),CO2conc(1:NHistYear),histCO2conc(:,1),histCO2conc(:,2),'b.'), xlabel('year'), ylabel('parts per million'), title('Ambient CO2')
subplot(2,2,2), plot(Year(1:NHistYear),pH(1:NHistYear)), xlabel('year'), ylabel('pH'), title('Ocean acidity')
subplot(2,2,3), plot(Year,CO2conc(:,1),Year,CO2conc(:,2),Year,CO2conc(:,3)), xlabel('year'), ylabel('parts per million'), title('Ambient CO2')
subplot(2,2,4), plot(Year,pH(:,1),Year,pH(:,2),Year,pH(:,3)), xlabel('year'), ylabel('pH'), title('Ocean acidity')