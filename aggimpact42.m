function aggimp = aggimpact(temp,par,Y,P)
%function aggimp = aggimpact(temp,par,Y,P)
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.1-matlab-global
%
%This function is part of FUND 4.1 MG
%It evaluates the impact of climate change at a particular point in time.
%
%Richard Tol, 27 July 2022
%This code is protected by the MIT License

global YpC2010 impincelas NImpact NObsImp NTImp

aggimp(1) = par(1,1)*temp + par(1,2)*temp.^2;
aggimp(2) = par(2,1)*temp.^2 + par(2,2)*temp.^6;
aggimp(3) = par(3,1)*temp.^2 + par(3,2)*temp.^7;
aggimp(4) = par(4,1)*temp.^2;
aggimp(5) = par(5,1)*temp;
aggimp(6) = par(6,1)*(exp(temp)-1);
%aggimp(7) = par(7,1)*(exp(exp(temp))-exp(1));
aggimp(7) = (1-exp(-2*par(7,1)*temp))/2/exp(-par(7,1)*temp);
aggimp(8) = evaltol2(par(8,1:3),temp);

for i = 1:NObsImp,
    aggimp(i+NImpact) =  par(i+NImpact,1)*temp.^2;
end

aggimp(NTImp-4) = evaltol2(par(NTImp-4,1:3),temp);
aggimp(NTImp-3) = par(NTImp-3,1)*temp;
aggimp(NTImp-2) = par(NTImp-2,1)*(exp(temp)-1);
aggimp(NTImp-1) = par(NTImp-1,1)*temp + par(NTImp-1,2)*temp.^7;

aggimp(NTImp) = 0;
for i = 1:NImpact,
    aggimp(NTImp) = aggimp(NTImp) + aggimp(i)*par(i,4);
end

YpC = Y/P;

for i=1:NTImp,
    %aggimp(i) = aggimp(i)*(YpC/YpC2010)^impincelas;
    aggimp(i) = aggimp(i) + impincelas*log(YpC/YpC2010);
end