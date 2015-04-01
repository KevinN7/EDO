%dy1(t)/dt = y2(t)
%dy2(t)/dt = (1-y1(t)^2)*y2(t) - y1(t)
%dY/dt=phi(Y)
%y = [y1 y2]

function ypoint = phi(t,y)

y1 = y(1,1);
y2 = y(1,2);

phi1 = y2;
phi2 = (1-y1^2)*y2-y1;

ypoint = [phi1;phi2];