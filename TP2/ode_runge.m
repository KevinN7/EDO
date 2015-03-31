function [T,Y] = ode_runge(fct,I,y0,N)

%init
t0 = I(1,1);
tf = I(1,2);
[~,n] = size(y0);
h=(tf-t0)/N;

T=zeros(N+1,1);
Y=zeros(N+1,n);
T(1) = I(1,1);
Y(1,:) = y0(1,:); 

for i=2:N+1
    T(i) = t0+(i-1)*h;
    
    k1 = fct(T(i-1) , Y(i-1,:))';
    k2 = fct(T(i-1)+(1/2)*h , Y(i-1,:) + (1/2)*h*k1)';
    Y(i,:) = Y(i-1,:) + h*(0*k1 + 1*k2);
end;
