close all;

t0=0;
tf = 6.6632868593231301896996820305;
y10 = 2.00861986087484313650940188;
y20 = 0;
N=25;

I=[t0 tf];
y0=[y10 y20];

[T,Ye] = ode_euler(@phi,I,y0,N);
[T,Yr] = ode_runge(@phi,I,y0,N);
[T,Yh] = ode_heun(@phi,I,y0,N);
[T,Yrk4] = ode_rk4(@phi,I,y0,N);
[T,Yrk438] = ode_rk4_38(@phi,I,y0,N);

figure;
plot(T(:),Ye(:,1),T(:),Yr(:,1),T(:),Yh(:,1),T(:),Yrk4(:,1),T(:),Yrk438(:,1));
legend('euler','runge','heun','rk4','rk4_38');
xlabel('t');
ylabel('y1(t)');

figure;
plot(T(:),Ye(:,2),T(:),Yr(:,2),T(:),Yh(:,2),T(:),Yrk4(:,2),T(:),Yrk438(:,2));
legend('euler','runge','heun','rk4','rk4_38');
xlabel('t');
ylabel('y2(t)');

figure;
plot(Ye(:,1),Ye(:,2),Yr(:,1),Yr(:,2),Yh(:,1),Yh(:,2),Yrk4(:,1),Yrk4(:,2),Yrk438(:,1),Yrk438(:,2));
legend('euler','runge','heun','rk4','rk4_38');
xlabel('y1(t)');
ylabel('y2(t)');

figure;
plot(T(:),Ye(:,1),T(:),Yr(:,1),T(:),Yh(:,1),T(:),Yrk4(:,1),T(:),Yrk438(:,1));
legend('euler','runge','heun','rk4','rk4_38');
xlabel('t');
ylabel('y1(t)');

figure;
plot(T(:),Ye(:,2),T(:),Yr(:,2),T(:),Yh(:,2),T(:),Yrk4(:,2),T(:),Yrk438(:,2));
legend('euler','runge','heun','rk4','rk4_38');
xlabel('t');
ylabel('y2(t)');

figure;
plot(Ye(:,1),Ye(:,2),Yr(:,1),Yr(:,2),Yh(:,1),Yh(:,2),Yrk4(:,1),Yrk4(:,2),Yrk438(:,1),Yrk438(:,2));
legend('euler','runge','heun','rk4','rk4_38');
xlabel('y1(t)');
ylabel('y2(t)');

pause;
close all;


%Erreur Globale

E1=[];E2=[];

Il=[120:60:1080 1200:600:10800];
[k,l] = size(Il);
for i = 1:l
    ordre = Il(i);
    [T,Ye] = ode_euler(@phi,I,y0,ordre);
    [T,Yr] = ode_runge(@phi,I,y0,ordre);
    [T,Yh] = ode_heun(@phi,I,y0,ordre);
    [T,Yrk4] = ode_rk4(@phi,I,y0,ordre);
    [T,Yrk438] = ode_rk4_38(@phi,I,y0,ordre);
    
    a1=abs(Ye(end,1)-y0(1));
    b1=abs(Yr(end,1)-y0(1));
    c1=abs(Yh(end,1)-y0(1));
    d1=abs(Yrk4(end,1)-y0(1));
    e1=abs(Yrk438(end,1)-y0(1));
    
    a2=abs(Ye(end,2)-y0(2));
    b2=abs(Yr(end,2)-y0(2));
    c2=abs(Yh(end,2)-y0(2));
    d2=abs(Yrk4(end,2)-y0(2));
    e2=abs(Yrk438(end,2)-y0(2));
    
    E1=[E1 [a1;b1;c1;d1;e1]];
    E2=[E2 [a2;b2;c2;d2;e2]];
end;

E1=log10(E1);
E2=log10(E2);

Ilg=[120:60:1080 1200:600:10800]/4;
[k,l] = size(Ilg);
itmax = 15;
eps = 1*10^-12;
Eg1=[];Eg2=[];
for i=1:l
    ordre = Ilg(i);   
    [Tg,Yg,nphi,ifail]=ode_gauss(@phi,I,y0,[ordre itmax eps]);
    eg1=abs(Yg(end,1)-y0(1));
    eg2=abs(Yg(end,2)-y0(2));
    Eg1=[Eg1 eg1];
    Eg2=[Eg2 eg2];
end;

Eg1=log10(Eg1);
Eg2=log10(Eg2);
    

figure;
plot(log10(Il),E1(1,:),log10(Il),E1(2,:),log10(Il),E1(3,:),log10(Il),E1(4,:),log10(Il),E1(5,:),log10(Ilg),Eg1(:));
legend('euler','runge','heun','rk4','rk4_38','gauss');
ylabel('y1(t)');
xlabel('log10(nphi)');

figure;
plot(log10(Il),E2(1,:),log10(Il),E2(2,:),log10(Il),E2(3,:),log10(Il),E2(4,:),log10(Il),E2(5,:),log10(Ilg),Eg2(:));
legend('euler','runge','heun','rk4','rk4_38','gauss');
ylabel('y2(t)');
xlabel('log10(nphi)');

pause;
close all;

%Gauss implicite
N=25;
itmax = 15;
eps = 1*10^-12;
[Tg,Yg1,nphi,ifail]=ode_gauss(@phi,I,y0,[N itmax eps]);

itmax = 2;
eps = 1*10^-12;
[Tg,Yg2,nphi,ifail]=ode_gauss(@phi,I,y0,[N itmax eps]);

itmax = 15;
eps = 1*10^-6;
[Tg,Yg3,nphi,ifail]=ode_gauss(@phi,I,y0,[N itmax eps]);
    
figure;
plot(Tg(:),Yg1(:,1),Tg(:),Yg2(:,1),Tg(:),Yg3(:,1));
legend('itmax 15 eps 1*10^-12','itmax 2 eps 1*10^-12','itmax 15 eps 1*10^-6');
xlabel('t');
ylabel('y1(t)');

figure;
plot(Tg(:),Yg1(:,2),Tg(:),Yg2(:,2),Tg(:),Yg3(:,2));
legend('itmax 15 eps 1*10^-12','itmax 2 eps 1*10^-12','itmax 15 eps 1*10^-6');
xlabel('t');
ylabel('y2(t)');

pause;
close all;

    