function imp = evaltol2(c,temp)
%function [a b c LL] = fittol2(temp,imp)
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.1-matlab-global
%
%This function is part of FUND 4.1 MG
%It fits Tol's piecewise linear impact function
%
%Richard Tol, 18 March 2018
%This code is protected by the MIT License

imp = c(1)*temp.*(temp<c(2)) + (c(1)*c(2) + c(3)*temp).*(temp>=(c(2)));