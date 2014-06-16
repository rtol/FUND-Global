function [a b LL] = fittol(temp,imp)

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