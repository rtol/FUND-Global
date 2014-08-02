%initialize

clear all

StartYear = 1750;
EndHistYear = 2010;
NHistYear = EndHistYear - StartYear + 1;
EndYear = 2100;
NYear = EndYear - StartYear + 1;
Year = zeros(NYear,1);
Year(1) = StartYear;
for t=2:NYear,
    Year(t) = Year(t-1) + 1;
end

NScen = 4;