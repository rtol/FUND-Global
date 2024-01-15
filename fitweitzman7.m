function [a b LL] = fitweitzman7(temp,imp)
%function [a LL] = fitweitzman(temp,imp)
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.0-matlab-global
%
%This function is part of FUND 4.0 MG
%It fits Weitzman's impact function
%
%Richard Tol, 14 May 2018
%This code is protected by the MIT License

X = [temp.^2 temp.^7];
beta = inv(X'*X)*X'*imp;
a = beta(1);
b = beta(2);
res = imp - X*beta;
rsq = res.*res;
ssr = sum(rsq);
n = length(imp);
p = length(beta);
ssq = ssr/(n-p);

LL= -0.5*n*log(2*pi*ssq) - 0.5*ssr/ssq;