function [a LL] = fithope(temp,imp)
%function [a LL] = fithope(temp,imp)
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.1-matlab-global
%
%This function is part of FUND 4.0 MG
%It fits Hope's linear impact function
%
%Richard Tol, 18 March 2018
%This code is protected by the MIT License

X = temp;
eval = X'*X;
beta = inv(X'*X)*X'*imp;
a = beta;
res = imp - X*beta;
ssr = res'*res;
n = length(imp);
p = length(beta);
ssq = ssr/(n-p);

LL= -0.5*n*log(2*pi*ssq) - 0.5*ssr/ssq;