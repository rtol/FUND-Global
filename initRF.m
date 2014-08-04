%initRF
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.0-matlab-global
%
%This script is part of FUND 4.0 MG
%It initializes variables and sets parameters
%
%Richard Tol, 28 August 2014
%This code is protected by the MIT License

historicSemit = csvread('histSemit.csv');

%for s=1:NScen
 %   Sscen(s) = (100-NScen+floor(NScen/2)+s)/100;
%end

Semit= zeros(NYear,NScen);
for s=1:NScen
    Semit(1:NHistYear,s)=historicSemit;
end

for t=NHistYear+1:NYear
    for s=1:NScen
        Semit(t,s) = (1+SRESdS(s,ts))*Semit(t-1,s);
    end
end

RFparam



