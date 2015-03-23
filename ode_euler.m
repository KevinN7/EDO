function [T,Y] = ode_euler(fct,I,y0,N)

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
    T(i) = t0+i*h;
    Y(i,:) = Y(i-1,:) + h*phi(T(i-1),Y(i-1,:))';
end;

