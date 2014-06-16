function [a LL] = fitploeg(temp,imp)

X = exp(2*temp/4.33)-1;
a = inv(X'*X)*X'*imp;
res = imp - X*a;
ssr = res'*res;
n = length(imp);
p = 1;
ssq = ssr/(n-p);

LL= -0.5*n*log(2*pi*ssq) - 0.5*ssr/ssq;