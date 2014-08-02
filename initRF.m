%initialize

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



