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
plot(T(:),Ye(:,1),T(:),Yr(:,1),T(:),Yh(:,1),T(:),Yrk4(:,1));

figure;