%Methode de Runge kutta ordre4
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
function [T,Y] = ode_rk4(fct,I,y0,N)

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
    
    %Calcul des ki
    k1 = fct(T(i-1),Y(i-1,:))';
    k2 = fct(T(i-1)+(1/2)*h , Y(i-1,:) + h*(1/2)*k1)';
    k3 = fct(T(i-1)+(1/2)*h , Y(i-1,:)+h*(1/2)*k2)';
    k4 = fct(T(i-1)+h , Y(i-1,:)+h*k3)';
    
    %Approximation de Y(i)
    Y(i,:) = Y(i-1,:) + h*((1/6)*k1 +(2/6)*k2 +(2/6)*k3 +(1/6)*k4 );
end;
