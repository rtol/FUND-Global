function [a LL] = fitploeg(temp,imp)
%function [a LL] = fitploeg(temp,imp)
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.0-matlab-global
%
%This function is part of FUND 4.0 MG
%It fits Van der Ploeg's impact function
%
%Richard Tol, 28 August 2014
%This code is protected by the MIT License

X = exp(2*temp/4.33)-1;
a = inv(X'*X)*X'*imp;
res = imp - X*a;
ssr = res'*res;
n = length(imp);
p = 1;
ssq = ssr/(n-p);

LL= -0.5*n*log(2*pi*ssq) - 0.5*ssr/ssq;