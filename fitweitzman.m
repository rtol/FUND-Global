function [a b LL] = fitweitzman(temp,imp)

X = [temp.^2 temp.^6];
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