function CO2concnew = MRH(CO2concold,CO2emit,CO2life,CO2share,CO2convert)
%function CO2concnew = MRH(CO2concold,CO2emit,CO2life,CO2share,CO2convert)
%
%updates the atmospheric concentration of carbon dioxide using the
%Maier-Reimer Hasselmann model

global NBox

for b = 1:NBox,
    CO2concnew(b) = (1-CO2life(b))*CO2concold(b) + CO2convert*CO2share(b)*CO2emit;
end
