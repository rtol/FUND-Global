%first pass
for t=2:NHistYear
     K(t,1) = (1-Depreciation)*K(t-1,1) + SavingsRate*Y(t-1,1);
     Y(t,1) = TFP(t,1)*histPopulation(t)^LabourElast*K(t,1)^(1-LabourElast);
end

while abs(Y(NHistYear,1)-histGDP(NHistYear)) > 1000000,
        
        if Y(NHistYear,1) > histGDP(NHistYear)
            gTFP = gTFP*(histGDP(NHistYear)/Y(NHistYear,1))^0.1;
        else
            gTFP = gTFP*(histGDP(NHistYear)/Y(NHistYear,1))^0.1;
        end
        
        for t=2:NHistYear
               TFP(t,1) = (1+gTFP)*TFP(t-1,1);
               K(t,1) = (1-Depreciation)*K(t-1,1) + SavingsRate*Y(t-1,1);
               Y(t,1) = TFP(t,1)*histPopulation(t)^LabourElast*K(t,1)^(1-LabourElast);
        end
end
