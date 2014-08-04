function [a LL] = fithope(temp,imp)
%function [a LL] = fithope(temp,imp)
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.0-matlab-global
%
%This function is part of FUND 4.0 MG
%It fits Hope's impact function
%
%Richard Tol, 28 August 2014
%This code is protected by the MIT License

X = temp.^1.3;
eval = X'*X;
beta = inv(X'*X)*X'*imp;
a = beta;
res = imp - X*beta;
ssr = res'*res;
n = length(imp);
p = length(beta);
ssq = ssr/(n-p);

LL= -0.5*n*log(2*pi*ssq) - 0.5*ssr/ssq;