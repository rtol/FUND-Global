function [atmtempnew oceantempnew] = ST(atmtempold,oceantempold,radforc)
%function [atmtempnew oceantempnew] = ST(atmtempold,oceantempold,radforc)
%
%updates the temperature of the atmosphere and the ocean using the Schneider-Thompson model

global STpar

atmtempnew  = atmtempold + STpar(2)*(STpar(1)*radforc-atmtempold) + STpar(3)*(oceantempold-atmtempold);
oceantempnew = oceantempold + STpar(4)*(atmtempold-oceantempold);