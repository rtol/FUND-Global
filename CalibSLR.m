%first pass
for t=2:NHistYear
     SLR(t,1) = SLRsens*oceantemp(t-1,1);
end

while abs(SLR(NHistYear,1)-SLR2010) > 0.001,
         SLRsens = SLRsens*SLR2010/SLR(NHistYear,1);
         for t=2:NHistYear
              SLR(t,1) = SLRsens*oceantemp(t-1,1);
         end
end
