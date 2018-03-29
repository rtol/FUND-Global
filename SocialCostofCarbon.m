%SocialCostofCarbon
%The Climate Framework for Uncertainty, Negotiation and Distribution,
%version 4.1-matlab-global
%
%This script is part of FUND 4.1 MG
%It computes the social cost of carbon
%
%Richard Tol, 28 March 2018
%This code is protected by the MIT License

dimpact = impactd - impact;

for i=1:NImpact,
    dimpabs(i,:,:) = squeeze(dimpact(i,:,:)).*Y;
end

gy = zeros(NYear,NScen);
for t=2:NYear,
    for s=1:NScen,
        gy(t,s) = (YpC(t,s)-YpC(t-1,s))/YpC(t-1,s);
    end
end

gp = zeros(NYear,NScen);
for t=2:NYear,
    for s=1:NScen,
        gp(t,s) = (Population(t,s)-Population(t-1,s))/Population(t-1,s);
    end
end

NDR = 6;
PRTP = [0.001 0.010 0.020 0.030 0.040 0.050];
NRA = 5;
RA = [0.5 1.0 1.5 2.0 2.5];

df = zeros(NYear,NScen,NDR,NRA);
for s=1:NScen,
    for p=1:NDR,
        for r=1:NRA,
            df(265,s,p,r)=1;
        end
    end
end

for t=266:NYear,
    for s=1:NScen,
        for p=1:NDR,
            for r=1:NRA
                df(t,s,p,r) = df(t-1,s,p,r)/(1+PRTP(p)+gp(t-1,s)+RA(r)*gy(t-1,s));
            end
        end
    end
end

SCC = zeros(NImpact, NScen, NDR, NRA);

for i=1:NImpact,
    for s=1:NScen,
        for p=1:NDR,
            for r=1:NRA,
                SCC(i,s,p,r) = squeeze(df(:,s,p,r))'*dimpabs(i,:,s)';
            end
        end
    end
end

SCC = -0.01*SCC/1000000;

s = PrintTable;
s.addRow('Time pref \ Risk aversion', RA(1), RA(2), RA(3), RA(4), RA(5));
s.addRow(num2str(PRTP(1),5),num2str(SCC(1,1,1,1),7),num2str(SCC(1,1,1,2),7),num2str(SCC(1,1,1,3),7),num2str(SCC(1,1,1,4),7),num2str(SCC(1,1,1,5),7));
s.addRow(num2str(PRTP(2),5),num2str(SCC(1,1,2,1),7),num2str(SCC(1,1,2,2),7),num2str(SCC(1,1,2,3),7),num2str(SCC(1,1,2,4),7),num2str(SCC(1,1,2,5),7));
s.addRow(num2str(PRTP(3),5),num2str(SCC(1,1,3,1),7),num2str(SCC(1,1,3,2),7),num2str(SCC(1,1,3,3),7),num2str(SCC(1,1,3,4),7),num2str(SCC(1,1,3,5),7));
s.addRow(num2str(PRTP(4),5),num2str(SCC(1,1,4,1),7),num2str(SCC(1,1,4,2),7),num2str(SCC(1,1,4,3),7),num2str(SCC(1,1,4,4),7),num2str(SCC(1,1,4,5),7));
s.addRow(num2str(PRTP(5),5),num2str(SCC(1,1,5,1),7),num2str(SCC(1,1,5,2),7),num2str(SCC(1,1,5,3),7),num2str(SCC(1,1,5,4),7),num2str(SCC(1,1,5,5),7));
s.addRow(num2str(PRTP(6),5),num2str(SCC(1,1,6,1),7),num2str(SCC(1,1,6,2),7),num2str(SCC(1,1,6,3),7),num2str(SCC(1,1,6,4),7),num2str(SCC(1,1,6,5),7));
disp('Social cost of carbon ($/tC)')
disp('alternative rates of time preference (rows) and risk aversion (columns)')
disp('model = Tol, scenario = SRES A1')
s.display

line = sprintf('\n');
disp(line)

t = PrintTable;
t.addRow('Model \ Scenario', 'SRES A1', 'SRES A2', 'SRES B1', 'SRES B2', 'SSP1', 'SSP2', 'SSP3', 'SSP4', 'SSP5');
t.addRow('Tol parabola',num2str(SCC(1,1,4,2),7),num2str(SCC(1,2,4,2),7),num2str(SCC(1,3,4,2),7),num2str(SCC(1,4,4,2),7),num2str(SCC(1,5,4,2),7),num2str(SCC(1,6,4,2),7),num2str(SCC(1,7,4,2),7),num2str(SCC(1,8,4,2),7),num2str(SCC(1,9,4,2),7));
t.addRow('Weitzman',num2str(SCC(2,1,4,2),7),num2str(SCC(2,2,4,2),7),num2str(SCC(2,3,4,2),7),num2str(SCC(2,4,4,2),7),num2str(SCC(2,5,4,2),7),num2str(SCC(2,6,4,2),7),num2str(SCC(2,7,4,2),7),num2str(SCC(2,8,4,2),7),num2str(SCC(2,9,4,2),7));
t.addRow('Nordhaus',num2str(SCC(3,1,4,2),7),num2str(SCC(3,2,4,2),7),num2str(SCC(3,3,4,2),7),num2str(SCC(3,4,4,2),7),num2str(SCC(3,5,4,2),7),num2str(SCC(3,6,4,2),7),num2str(SCC(3,7,4,2),7),num2str(SCC(3,8,4,2),7),num2str(SCC(3,9,4,2),7));
t.addRow('Hope',num2str(SCC(4,1,4,2),7),num2str(SCC(4,2,4,2),7),num2str(SCC(4,3,4,2),7),num2str(SCC(4,4,4,2),7),num2str(SCC(4,5,4,2),7),num2str(SCC(4,6,4,2),7),num2str(SCC(4,7,4,2),7),num2str(SCC(4,8,4,2),7),num2str(SCC(4,9,4,2),7));
t.addRow('Ploeg',num2str(SCC(5,1,4,2),7),num2str(SCC(5,2,4,2),7),num2str(SCC(5,3,4,2),7),num2str(SCC(5,4,4,2),7),num2str(SCC(5,5,4,2),7),num2str(SCC(5,6,4,2),7),num2str(SCC(5,7,4,2),7),num2str(SCC(5,8,4,2),7),num2str(SCC(5,9,4,2),7));
t.addRow('Golosov',num2str(SCC(6,1,4,2),7),num2str(SCC(6,2,4,2),7),num2str(SCC(6,3,4,2),7),num2str(SCC(6,4,4,2),7),num2str(SCC(6,5,4,2),7),num2str(SCC(6,6,4,2),7),num2str(SCC(6,7,4,2),7),num2str(SCC(6,8,4,2),7),num2str(SCC(6,9,4,2),7));
t.addRow('Tol piecewise linear',num2str(SCC(7,1,4,2),7),num2str(SCC(7,2,4,2),7),num2str(SCC(7,3,4,2),7),num2str(SCC(7,4,4,2),7),num2str(SCC(7,5,4,2),7),num2str(SCC(7,6,4,2),7),num2str(SCC(7,7,4,2),7),num2str(SCC(7,8,4,2),7),num2str(SCC(7,9,4,2),7));
disp('Social cost of carbon ($/tC)')
disp('alternative impact models (rows) and scenarios (columns)')
disp('pure rate of time preference = 0.03; rate of risk aversion = 1')
t.display