%CalibSLR
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.0-matlab-global
%
%This script is part of FUND 4.0 MG
%It calibrates the sensitivity of sea level rise to temperature
%
%Richard Tol, 28 August 2014
%This code is protected by the MIT License

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
