function res = Jphi(t,y)


y1 = y(1,1);
y2 = y(1,2);

res = [0 1;-2*y1*y2-1 (1-y1^2)];