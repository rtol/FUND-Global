function [a b LL] = fittol(temp,imp)
%function [a LL] = fittol(temp,imp)
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.0-matlab-global
%
%This function is part of FUND 4.0 MG
%It fits Tol's impact function
%
%Richard Tol, 28 August 2014
%This code is protected by the MIT License

X = [temp temp.^2];
%eval = X'*X;
beta = inv(X'*X)*X'*imp;
a = beta(1);
b = beta(2);
res = imp - X*beta;
ssr = res'*res;
n = length(imp);
p = length(beta);
ssq = ssr/(n-p);

LL= -0.5*n*log(2*pi*ssq) - 0.5*ssr/ssq;