%SRES
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.0-matlab-global
%
%This script is part of FUND 4.0 MG
%It reads and reshapes the SRES scenarios
%
%Richard Tol, 6 August 2014
%This code is protected by the MIT License

SRESall = csvread('SRES.csv');

xPop = SRESall(1:4,:);
xGDP = SRESall(5:8,:);
xPE = SRESall(9:12,:);
xCO2 = SRESall(13:16,:);
SRESLU = SRESall(17:20,:);
xrest = SRESall(21:44,:);

xInc = xGDP./xPop;
xEnInt = xPE./xGDP;
xCO2Int = xCO2./xPE;

xdPop = xPop(:,2:11)./xPop(:,1:10);
xdInc = xInc(:,2:11)./xInc(:,1:10);
xdEnInt = xEnInt(:,2:11)./xEnInt(:,1:10);
xdCO2Int = xCO2Int(:,2:11)./xCO2Int(:,1:10);
xdrest = xrest(:,2:11)./xrest(:,1:10);

xdPop = xdPop.^0.1 - 1;
xdInc = xdInc.^0.1 -1;
xdEnInt = xdEnInt.^0.1 -1;
xdCO2Int = xdCO2Int.^0.1 -1;
xdrest = xdrest.^0.1 - 1;

SRESdPop = repmat(xdPop(:,2),1,10);
SRESdInc = repmat(xdInc(:,2),1,10);
SRESdEnInt = repmat(xdEnInt(:,2),1,10);
SRESdCO2Int = repmat(xdCO2Int(:,2),1,10);
xxdrest = repmat(xdrest(:,2),1,10);

for i= 3:10,
    SRESdPop = [SRESdPop repmat(xdPop(:,i),1,10)];
    SRESdInc = [SRESdInc repmat(xdInc(:,i),1,10)];
    SRESdEnInt = [SRESdEnInt repmat(xdEnInt(:,i),1,10)];
    SRESdCO2Int = [SRESdCO2Int repmat(xdCO2Int(:,i),1,10)];
    xxdrest = [xxdrest repmat(xdrest(:,i),1,10)];
end

SRESdCH4 = xxdrest(1:4,:);
SRESdN2O = xxdrest(5:8,:);
SRESdS = xxdrest(9:12,:);
SRESdCFC = xxdrest(13:16,:);
SRESdSF6 = xxdrest(17:20,:);
SRESdO3 = xxdrest(21:24,:);

clear x*

%%
SSPall = csvread('SSP.csv');
%five scenarios; 2010-2100 in 10 year time step
%population, GDP, energy, CO2, land use, methane, nitrous, sulphur, F

xPop = SSPall(1:5,:);
xGDP = SSPall(6:10,:);
xPE = SSPall(11:15,:);
xCO2 = SSPall(16:20,:);
SSPLU = SSPall(21:25,:);
xCH4 = SSPall(26:30,:);
xN2O = SSPall(31:35,:);
xS = SSPall(36:40,:);
xSF6 = SSPall(31:45,:);

xInc = xGDP./xPop;
xEnInt = xPE./xGDP;
xCO2Int = xCO2./xPE;

xdPop = xPop(:,2:10)./xPop(:,1:9);
xdInc = xInc(:,2:10)./xInc(:,1:9);
xdEnInt = xEnInt(:,2:10)./xEnInt(:,1:9);
xdCO2Int = xCO2Int(:,2:10)./xCO2Int(:,1:9);
%xdLU = xLU(:,2:10)./xLU(:,1:9);
xdCH4 = xCH4(:,2:10)./xCH4(:,1:9);
xdN2O = xN2O(:,2:10)./xN2O(:,1:9);
xdS = xS(:,2:10)./xS(:,1:9);
xdSF6 = xSF6(:,2:10)./xSF6(:,1:9);

xdPop = xdPop.^0.1 - 1;
xdInc = xdInc.^0.1 -1;
xdEnInt = xdEnInt.^0.1 -1;
xdCO2Int = xdCO2Int.^0.1 -1;
%xdLU = xdLU.^0.1 -1;
xdCH4 = xdCH4.^0.1 -1;
xdN2O = xdN2O.^0.1 -1;
xdS = xdS.^0.1 -1;
xdSF6 = xdSF6.^0.1 -1;

SSPdPop = repmat(xdPop(:,1),1,10);
SSPdInc = repmat(xdInc(:,1),1,10);
SSPdEnInt = repmat(xdEnInt(:,1),1,10);
SSPdCO2Int = repmat(xdCO2Int(:,1),1,10);
%SSPdLU = repmat(xdLU(:,1),1,10);
SSPdCH4 = repmat(xdCH4(:,1),1,10);
SSPdN2O = repmat(xdN2O(:,1),1,10);
SSPdS = repmat(xdS(:,1),1,10);
SSPdSF6 = repmat(xdSF6(:,1),1,10);

for i= 2:9,
    SSPdPop = [SSPdPop repmat(xdPop(:,i),1,10)];
    SSPdInc = [SSPdInc repmat(xdInc(:,i),1,10)];
    SSPdEnInt = [SSPdEnInt repmat(xdEnInt(:,i),1,10)];
    SSPdCO2Int = [SSPdCO2Int repmat(xdCO2Int(:,i),1,10)];
%    SSPdLU = [SSPdLU repmat(SSPdLU(:,i),1,10)];
    SSPdCH4 = [SSPdCH4 repmat(SSPdCH4(:,i),1,10)];
    SSPdN2O = [SSPdN2O repmat(SSPdN2O(:,i),1,10)];
    SSPdS = [SSPdS repmat(SSPdS(:,i),1,10)];
    SSPdSF6 = [SSPdSF6 repmat(SSPdSF6(:,i),1,10)];
end

%%
for i=1:5,
    for j=1:4
        SSR(i,j) = (SSPdInc(i,:)-SRESdInc(j,:))*(SSPdInc(i,:)-SRESdInc(j,:))';
    end
end

%%
SSPdCFC(1,:) = SRESdCFC(3,:);
SSPdCFC(2,:) = SRESdCFC(4,:);
SSPdCFC(3,:) = SRESdCFC(4,:);
SSPdCFC(4,:) = SRESdCFC(4,:);
SSPdCFC(5,:) = SRESdCFC(1,:);

SSPdO3(1,:) = SRESdO3(3,:);
SSPdO3(2,:) = SRESdO3(4,:);
SSPdO3(3,:) = SRESdO3(4,:);
SSPdO3(4,:) = SRESdO3(4,:);
SSPdO3(5,:) = SRESdO3(1,:);

