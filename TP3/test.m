A1=[-1 -4;1 -1];
A2=[1 -4;1 -1];
A3=[1 4;1 -2];

%tf=1;

%A1:
tf = 2*pi/sqrt(3);
C=[0.8;0.8];
R=0.3;
theta = 1:10;
theta=theta*360;
figure;
hold on;

for t=theta
    y0=C+[R*cos(t);R*sin(t)];
    I=1:100;
    I=tf*I/100;
    for k=I
        Y=expm(k*A1)*y0;
        plot(Y(1),Y(2));
    end;
end;

pause;