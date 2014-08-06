%readdata
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.0-matlab-global
%
%This script is part of FUND 4.0 MG
%It reads historic data
%
%Richard Tol, 6 August 2014
%This code is protected by the MIT License

historicCO2emit = csvread('histCO2emit.csv');
historicLUemit = csvread('histLUemit.csv');
histCO2conc = csvread('histCO2conc.csv');

historicCH4emit = csvread('histCH4emit.csv');
histCH4conc = csvread('histCH4conc.csv');
historicN2Oemit = csvread('histN2Oemit.csv');
histN2Oconc = csvread('histN2Oconc.csv');
historicSF6emit = csvread('histSF6emit.csv');
histSF6conc = csvread('histSF6conc.csv');
histCFC11emit = csvread('histCFC11emit.csv');
histCFC11conc = csvread('histCFC11conc.csv');
histCFC12emit = csvread('histCFC12emit.csv');
histCFC12conc = csvread('histCFC12conc.csv');
histO3radforc = csvread('histO3radforc.csv');

historicSemit = csvread('histSemit.csv');

historicTemp = csvread('histTemp.csv');

observedImpact = csvread('TotalImpact.csv');

histPopulation = csvread('histPopulation.csv');
histGDP = csvread('histGDP.csv');
histYpC = histGDP./histPopulation;
histEnergy = csvread('histEnergy.csv');
histEnInt = histEnergy./histGDP;
histCO2Int = historicCO2emit./histEnergy;