function [T,Y] = ode_heun(fct,I,y0,N)

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
    k2 = fct(T(i-1) + (1/3)*h , Y(i-1,:) + h*(1/3)*k1)';
    k3 = fct(T(i-1) + (2/3)*h , Y(i-1,:) + h*(0*k1 + (2/3)*k2))';
    Y(i,:) = Y(i-1,:) + h*((1/4)*k1 + 0*k2 + (3/4)*k3);
end;