function [a LL] = fitnordhaus(temp,imp)

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