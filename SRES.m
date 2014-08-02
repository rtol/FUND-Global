%read SRES and reshape

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