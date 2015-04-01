A1=[-1 -4;1 -1];
A2=[1 -4;1 -1];
A3=[1 4;1 -2];

%A1:
tf = 2*pi/sqrt(3);
C=[0.8;0.8];
R=0.3;
theta = 1:10;
theta=theta*360;

I=1:100;
I=tf*I/100;

figure;
hold on;

G=[];
for t=theta
    y0=C+[R*cos(t);R*sin(t)];
    Y=[];
    for k=I
        Y=[Y expm(k*A1)*y0];
        plot(Y(1,end),Y(2,end));
    end;
    G=[G;Y];
end;


for bach=[1 10 30 60 80 100];
H=G(:,bach);
L=reshape(H,2,[]);
fill(L(1,:),L(2,:),'r');
end;
%plot(L(1,:)',L(2,:)','+')
pause;

C=[0.15;-0.6];
R=0.1;