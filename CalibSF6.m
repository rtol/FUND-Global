%first pass
for t=2:NHistYear
     N2Oconc(t) = (1-N2Olife)*N2Oconc(t-1) + N2Olife*N2O1750 + N2Oconvert*historicN2Oemit(t-1);
end

N2Oaux = N2Oconvert

while abs(N2Oconc(NHistYear)-N2O2010) > 1,
          N2Oaux = N2Oaux*N2O2010/N2Oconc(NHistYear)
          for t=2:NHistYear
                N2Oconc(t) = (1-N2Olife)*N2Oconc(t-1) + N2Olife*N2O1750 + N2Oaux*historicN2Oemit(t-1);
          end
end

N2Oconvert = N2Oaux;