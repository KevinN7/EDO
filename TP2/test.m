close all;

y0 = 10;

t0 = 0;
tf = 1.5;
I=[t0 tf];

itmax = 15;
eps = 1*10^-6;

N=30;

[T,Ye] = ode_euler(@phi,I,y0,N);
[T,Yr] = ode_runge(@phi,I,y0,N);
[T,Yh] = ode_heun(@phi,I,y0,N);
[T,Yrk4] = ode_rk4(@phi,I,y0,N);
[T,Yrk438] = ode_rk4_38(@phi,I,y0,N);
[T,YG,nphi,ifail]=ode_gauss(@phi,I,y0,[N itmax eps]);


figure;
plot(T(:),Ye(:),T(:),Yr(:),T(:),Yh(:),T(:),Yrk4(:),T(:),Yrk438(:),T(:),YG(:));

N=40;

[T,Ye] = ode_euler(@phi,I,y0,N);
[T,Yr] = ode_runge(@phi,I,y0,N);
[T,Yh] = ode_heun(@phi,I,y0,N);
[T,Yrk4] = ode_rk4(@phi,I,y0,N);
[T,Yrk438] = ode_rk4_38(@phi,I,y0,N);
[T,YG,nphi,ifail]=ode_gauss(@phi,I,y0,[N itmax eps]);

figure;
plot(T(:),Ye(:),T(:),Yr(:),T(:),Yh(:),T(:),Yrk4(:),T(:),Yrk438(:),T(:),YG(:));
N=80;


[T,Ye] = ode_euler(@phi,I,y0,N);
[T,Yr] = ode_runge(@phi,I,y0,N);
[T,Yh] = ode_heun(@phi,I,y0,N);
[T,Yrk4] = ode_rk4(@phi,I,y0,N);
[T,Yrk438] = ode_rk4_38(@phi,I,y0,N);
[T,YG,nphi,ifail]=ode_gauss(@phi,I,y0,[N itmax eps]);

figure;
plot(T(:),Ye(:),T(:),Yr(:),T(:),Yh(:),T(:),Yrk4(:),T(:),Yrk438(:),T(:),YG(:));

N=100;

[T,Ye] = ode_euler(@phi,I,y0,N);
[T,Yr] = ode_runge(@phi,I,y0,N);
[T,Yh] = ode_heun(@phi,I,y0,N);
[T,Yrk4] = ode_rk4(@phi,I,y0,N);
[T,Yrk438] = ode_rk4_38(@phi,I,y0,N);
[T,YG,nphi,ifail]=ode_gauss(@phi,I,y0,[N itmax eps]);

figure;
plot(T(:),Ye(:),T(:),Yr(:),T(:),Yh(:),T(:),Yrk4(:),T(:),Yrk438(:),T(:),YG(:));



pause;

close all;

y0 = 0;

t0 = 0;
tf = 1.5;
I=[t0 tf];

itmax = 30;
eps = 1*10^-6;

N=floor(50*tf/1.974);

[T,Ye] = ode_euler(@phiCurtiss,I,y0,N);
[T,Yr] = ode_runge(@phiCurtiss,I,y0,N);
[T,Yh] = ode_heun(@phiCurtiss,I,y0,N);
[T,Yrk4] = ode_rk4(@phiCurtiss,I,y0,N);
[T,Yrk438] = ode_rk4_38(@phiCurtiss,I,y0,N);
[T,YG,nphi,ifail]=ode_gauss(@phiCurtiss,I,y0,[N itmax eps]);


figure;
plot(T(:),Ye(:),T(:),Yr(:),T(:),Yh(:),T(:),Yrk4(:),T(:),Yrk438(:),T(:),YG(:));

N=floor(50*tf/1.875);

[T,Ye] = ode_euler(@phiCurtiss,I,y0,N);
[T,Yr] = ode_runge(@phiCurtiss,I,y0,N);
[T,Yh] = ode_heun(@phiCurtiss,I,y0,N);
[T,Yrk4] = ode_rk4(@phiCurtiss,I,y0,N);
[T,Yrk438] = ode_rk4_38(@phiCurtiss,I,y0,N);
[T,YG,nphi,ifail]=ode_gauss(@phiCurtiss,I,y0,[N itmax eps]);

figure;
plot(T(:),Ye(:),T(:),Yr(:),T(:),Yh(:),T(:),Yrk4(:),T(:),Yrk438(:),T(:),YG(:));
N=50;


[T,Ye] = ode_euler(@phiCurtiss,I,y0,N);
[T,Yr] = ode_runge(@phiCurtiss,I,y0,N);
[T,Yh] = ode_heun(@phiCurtiss,I,y0,N);
[T,Yrk4] = ode_rk4(@phiCurtiss,I,y0,N);
[T,Yrk438] = ode_rk4_38(@phiCurtiss,I,y0,N);
[T,YG,nphi,ifail]=ode_gauss(@phiCurtiss,I,y0,[N itmax eps]);

figure;
plot(T(:),Ye(:),T(:),Yr(:),T(:),Yh(:),T(:),Yrk4(:),T(:),Yrk438(:),T(:),YG(:));

N=100;

[T,Ye] = ode_euler(@phiCurtiss,I,y0,N);
[T,Yr] = ode_runge(@phiCurtiss,I,y0,N);
[T,Yh] = ode_heun(@phiCurtiss,I,y0,N);
[T,Yrk4] = ode_rk4(@phiCurtiss,I,y0,N);
[T,Yrk438] = ode_rk4_38(@phiCurtiss,I,y0,N);
[T,YG,nphi,ifail]=ode_gauss(@phiCurtiss,I,y0,[N itmax eps]);

figure;
plot(T(:),Ye(:),T(:),Yr(:),T(:),Yh(:),T(:),Yrk4(:),T(:),Yrk438(:),T(:),YG(:));