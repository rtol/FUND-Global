dimpact = impactd - impact;

for i=1:NImpact,
    dimpabs(i,:,:) = squeeze(dimpact(i,:,:)).*Y;
end

gy = zeros(NYear,NScen);
for t=2:NYear,
    for s=1:NScen,
        gy(t,s) = (Y(t,s)-Y(t-1,s))/Y(t-1,s);
    end
end

df = zeros(NYear,NScen);
for s=1:NScen,
    df(265,s)=1;
end

for t=266:NYear,
    for s=1:NScen,
        df(t,s) = df(t-1,s)/(1+gy(t-1,s));
    end
end

for i=1:NImpact,
    for s=1:NScen,
        SCC(i,s) = df(:,s)'*dimpabs(i,:,s)';
    end
end

SCC = -0.01*SCC/1000000;