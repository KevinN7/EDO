function ypoint = phi(t,y)

y1 = y(1,1);
y2 = y(1,2);

phi1 = y2;
phi2 = (1-y1^2)*y2-y1;

ypoint = [phi1;phi2];