close all;

t0=0;
tf = 6.6632868593231301896996820305;
y10 = 2.00861986087484313650940188;
y20 = 0;
N=10;

I=[t0 tf];
y0=[y10 y20];

[T,Ye] = ode_euler(@phi,I,y0,N)
[T,Yr] = ode_runge(@phi,I,y0,N)
[T,Yh] = ode_heun(@phi,I,y0,N)
[T,Yrk4] = ode_rk4(@phi,I,y0,N)
[T,Yrk438] = ode_rk4_38(@phi,I,y0,N)

figure;
plot(T(:),Ye(:,1),T(:),Yr(:,1),T(:),Yh(:,1),T(:),Yrk4(:,1),T(:),Yrk438(:,1));

figure;
plot(T(:),Ye(:,2),T(:),Yr(:,2),T(:),Yh(:,2),T(:),Yrk4(:,2),T(:),Yrk438(:,2));

figure;
plot(Ye(:,1),Ye(:,2),Yr(:,1),Yr(:,2),Yh(:,1),Yh(:,2),Yrk4(:,1),Yrk4(:,2),Yrk438(:,1),Yrk438(:,2));

pause;
close all;