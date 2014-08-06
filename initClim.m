%initClim
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.0-matlab-global
%
%This script is part of FUND 4.0 MG
%It initializes variables and sets parameters
%
%Richard Tol, 6 August 2014
%This code is protected by the MIT License

atmtemp = zeros(NYear,NScen);
oceantemp = zeros(NYear,NScen);
SLR = zeros(NYear,NScen);

atmtemp(1,1) = atmtemp0;
oceantemp(1,1) = oceantemp0;
SLR(1,1) = 0;


