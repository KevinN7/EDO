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

G=[];
for t=theta
    y0=C+[R*cos(t);R*sin(t)];
    I=1:100;
    I=tf*I/100;
    Y=[];
    for k=I
        Y=[Y expm(k*A1)*y0];
        plot(Y(1,end),Y(2,end));
    end;
    G=[G;Y];
end;

H=G(:,50);
L=reshape(G,2,[]);
fill(L(1,:),L(2,:),'r');

pause;

C=[0.15;-0.6];
R=0.1;