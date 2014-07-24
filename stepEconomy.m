function [K,Y,E,C] = stepEconomy(K0,Y0,TFP,Pop,EI,CI)

global Depreciation SavingsRate LabourElast

K = (1-Depreciation)*K0 + SavingsRate*Y0;

Y = TFP*Pop^LabourElast*K^(1-LabourElast);

E = EI*Y;

C = CI*E;