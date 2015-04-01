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



% %PARTIE 2
% 
% itmax = 15;
% eps = 1*10^-12;
% N = 10;
% [T,Y,nphi,ifail]=ode_gauss(@phi,I,y0,[N itmax eps])
% 
% %T = [120:60:1080 1200:600:10800];
% 
% figure;
% plot(T(:),Ye(:,1),T(:),Yr(:,1),T(:),Yh(:,1),T(:),Yrk4(:,1),T(:),Yrk438(:,1));
% legend('euler','runge','heun','rk4','rk4_38');
% xlabel('t');
% ylabel('y1(t)');
% 
% figure;
% plot(T(:),Ye(:,2),T(:),Yr(:,2),T(:),Yh(:,2),T(:),Yrk4(:,2),T(:),Yrk438(:,2));
% legend('euler','runge','heun','rk4','rk4_38');
% xlabel('t');
% ylabel('y2(t)');
% 
% figure;
% plot(Ye(:,1),Ye(:,2),Yr(:,1),Yr(:,2),Yh(:,1),Yh(:,2),Yrk4(:,1),Yrk4(:,2),Yrk438(:,1),Yrk438(:,2));
% legend('euler','runge','heun','rk4','rk4_38');
% xlabel('y1(t)');
% ylabel('y2(t)');



%Gauss
itmax = 15;
eps = 1*10^-6;
N = 10;
[T,Y,nphi,ifail]=ode_gauss(@phi,I,y0,[N itmax eps])
pause;
close all;

E1=[];E2=[];

I=[120:60:1080 1200:600:10800];
[k,l] = size(I);
for i = 1:l
    ordre = I(i)
    [T,Ye] = ode_euler(@phi,I,y0,ordre);
    [T,Yr] = ode_runge(@phi,I,y0,ordre);
    [T,Yh] = ode_heun(@phi,I,y0,ordre);
    [T,Yrk4] = ode_rk4(@phi,I,y0,ordre);
    [T,Yrk438] = ode_rk4_38(@phi,I,y0,ordre);
    
    a1=log10(abs(Ye(end,1)-y0(1)));
    b1=log10(abs(Yr(I(i)/2+1,1)-y0(1)));
    c1=log10(abs(Yh(I(i)/3+1,1)-y0(1)));
    d1=log10(abs(Yrk4(I(i)/4+1,1)-y0(1)));
    e1=log10(abs(Yrk438(I(i)/4+1,1)-y0(1)));
    
    a2=abs(Ye(end,2)-y0(2));
    b2=abs(Yr(end,2)-y0(2));
    c2=abs(Yh(end,2)-y0(2));
    d2=abs(Yrk4(end,2)-y0(2));
    e2=abs(Yrk438(end,2)-y0(2));
    
    E1=[E1 [a1;b1;c1;d1;e1]];
    E2=[E2 [a2;b2;c2;d2;e2]];
end;

%E1=log(E1);
E2=log10(E2);

figure;
plot(log10(I),E1(1,:),log10(I),E1(2,:),log10(I),E1(3,:),log10(I),E1(4,:),log10(I),E1(5,:));
figure;
plot(log10(I),E2(1,:),log10(I),E2(2,:),log10(I),E2(3,:),log10(I),E2(4,:),log10(I),E2(5,:));
    
    