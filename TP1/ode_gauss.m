%Methode de Gauss(Resolution par la m�thode du point fixe)
%Eqn du type 
%   dy(t)/dt = fct(t,y(t))
%   y(t0)=y0
%
%IN:-fct fonction tq dy(t)/dt = fct(t,y(t))
%   -I = [t0 tf] taille:1*2 intervalle de resolution t0<tf
%   -y0  tel que y(to)=y0
%   -N nombre de pas dans l'intervalle entier
%
%OUT:-T points approxim�s 
%    -Y valeur des points de la fonction inconnue approxim�
function [T,Y,nphi,ifail] = ode_gauss(fct,I,y0,option)

nphi=0;
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
    T(i) = t0+(i-1)*h;
    
    k1 = fct(T(i-1) + h*((1/2)-(sqrt(3)/6)) , Y(i-1,:))';
    k2 = fct(T(i-1) + h*((1/2)+(sqrt(3)/6)) , Y(i-1,:))';
    nphi=nphi+2;
    
    %Recherche des ki par point fixe
    nb_iter=1;normp=1;
    while(normp>fp_eps && nb_iter<fp_iter_max)
        newk1 = fct(T(i-1) + h*((1/2)-(sqrt(3)/6)) , Y(i-1,:) + h*((1/4)*k1 +(((1/4)-(sqrt(3)/6))*k2)))';
        newk2 = fct(T(i-1) + h*((1/2)+(sqrt(3)/6)) , Y(i-1,:) + h*(((1/4)+(sqrt(3)/6))*k1 +(1/4)*k2))';
        nphi=nphi+2;
        normp = norm([newk1-k1;newk2-k2],1);
        nb_iter = nb_iter+1;
        k1=newk1;k2=newk2;
    end;
    
    if(normp<=fp_eps)
        ifail(i-1)=1;
    else
        ifail(i-1)=-1;
    end;
    
    Y(i,:) = Y(i-1,:) + h*((1/2)*k1 + (1/2)*k2);
end;
