function aggimp = aggimpact(temp,par,Y,P)
%function aggimp = aggimpact(temp,par,Y,P)
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.1-matlab-global
%
%This function is part of FUND 4.1 MG
%It evaluates the impact of climate change at a particular point in time.
%
%Richard Tol, 12 May 2018
%This code is protected by the MIT License

global YpC2010 impincelas NImpact

aggimp(1) = par(1,1)*temp + par(1,2)*temp.^2;
aggimp(2) = par(2,1)*temp.^2 + par(2,2)*temp.^6;
aggimp(3) = par(2,1)*temp.^2 + par(3,2)*temp.^7;
aggimp(4) = par(4,1)*temp.^2;
aggimp(5) = par(5,1)*temp;
aggimp(6) = par(6,1)*(exp(temp)-1);
aggimp(7) = par(7,1)*(exp(exp(temp))-exp(1));
aggimp(8) = evaltol2(par(8,1:3),temp);

YpC = Y/P;

for i=1:NImpact,
    aggimp(i) = aggimp(i)*(YpC/YpC2010)^impincelas;
end