function [T,Y,nphi,ifail] = ode_gauss(fct,I,y0,option)

%Recuperation des options
N=option(1);
fp_iter_max=option(2);
fp_eps=option(3);

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
    
    k1 = fct(T(i-1) , Y(i-1,:))';
    k2 = fct(T(i-1) + (1/3)*h , Y(i-1,:) + h*(1/3)*k1)';
    
    nb_iter=0;norm=1;
    while(norm>fp_eps && nb_iter<=fp_iter_max)
        newk1 = phi(T(i-1) + ((1/2)-(sqrt(3)/6)) , Y(i-1,:) + h*((1/4)*k1 +(((1/4)-(sqrt(3)/6))*k2)))';
        newk2 = phi(T(i-1) + ((1/2)+(sqrt(3)/6)) , Y(i-1,:) + h*(((1/4)+(sqrt(3)/6))*k1 +(1/4)*k2))';
        norm = norm([newk1-k1;newk2-k2]);
        nb_iter = nb_iter+1;
        k1=newk1;k2=newk2;
    end;
    
    Y(i,:) = Y(i-1,:) + h*((1/2)*k1 + (1/2)*k2);
end;
