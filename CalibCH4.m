%first pass
for t=2:NHistYear
     CH4conc(t,1) = (1-CH4life)*CH4conc(t-1,1) + CH4life*CH41750 + CH4convert*historicCH4emit(t-1);
end

CH4aux = CH4life;

while abs(CH4conc(NHistYear)-CH42010) > 1,
          CH4aux = CH4aux*CH42010/CH4conc(NHistYear,1);
          for t=2:NHistYear
                CH4conc(t,1) = (1-CH4aux)*CH4conc(t-1,1) + CH4aux*CH41750 + CH4convert*historicCH4emit(t-1);
          end
end

CH4life = CH4aux;