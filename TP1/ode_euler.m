%Methode d'Euler
%Eqn du type 
%   dy(t)/dt = fct(t,y(t))
%   y(t0)=y0
%
%IN:-fct fonction tq dy(t)/dt = fct(t,y(t))
%   -I = [t0 tf] taille:1*2 intervalle de resolution t0<tf
%   -y0  tel que y(to)=y0
%   -N nombre de pas dans l'intervalle entier
%
%OUT:-T points approximés 
%    -Y valeur des points de la fonction inconnue approximé

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
    T(i) = t0+(i-1)*h;
    Y(i,:) = Y(i-1,:) + h*fct(T(i-1),Y(i-1,:))';
end;

