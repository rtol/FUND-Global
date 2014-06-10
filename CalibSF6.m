%first pass
for t=2:NHistYear
     SF6conc(t,1) = (1-SF6life)*SF6conc(t-1,1) + SF6life*SF61750 + SF6convert*historicSF6emit(t-1);
end

SF6aux = SF6convert;

while abs(SF6conc(NHistYear)-SF62010) > 1,
          SF6aux = SF6aux*SF62010/SF6conc(NHistYear,1)
          for t=2:NHistYear
                SF6conc(t,1) = (1-SF6life)*SF6conc(t-1,1) + SF6life*SF61750 + SF6aux*historicSF6emit(t-1);
          end
end

SF6convert = SF6aux;