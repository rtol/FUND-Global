function [atmtempnew, oceantempnew] = ST(atmtempold,oceantempold,radforc)
%function [atmtempnew oceantempnew] = ST(atmtempold,oceantempold,radforc)
%The Climate Framework for Uncertainty, Negotiation and Distribution
%version 4.0-matlab-global
%
%This function is part of FUND 4.0 MG
%It updates the temperature of the atmosphere and the ocean using the Schneider-Thompson model
%
%Richard Tol, 8 August 2014
%This code is protected by the MIT License

global STpar

atmtempnew  = atmtempold + STpar(2)*(STpar(1)*radforc-atmtempold) + STpar(3)*(oceantempold-atmtempold);
oceantempnew = oceantempold + STpar(4)*(atmtempold-oceantempold);