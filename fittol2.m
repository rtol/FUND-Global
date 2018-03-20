function [a b c LL] = fittol2(temp,imp)
%function [a b c LL] = fittol2(temp,imp)
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.1-matlab-global
%
%This function is part of FUND 4.1 MG
%It fits Tol's piecewise linear impact function
%
%Richard Tol, 18 March 2018
%This code is protected by the MIT License

cinit = [0.74 1.01 -1.14];
%estimator = cinit;
options  =  optimset('MaxFunEvals',10000,'MaxIter',10000); 
[estimator,ssr] = fminsearch(@(beta)ssrtol2(beta,temp,imp),cinit,options);

a = estimator(1);
b = estimator(2);
c = estimator(3);
mimp = evaltol2(estimator,temp);
res = imp - mimp;
ssr = res'*res;
n = length(imp);
p = length(estimator);
ssq = ssr/(n-p);

LL= -0.5*n*log(2*pi*ssq) - 0.5*ssr/ssq;