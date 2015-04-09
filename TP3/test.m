
A1=[-1 -4;1 -1];
%A1:
tf = 2*pi/sqrt(3);
C=[0.8;0.8];
R=0.3;

analyse(A1,tf,C,R);


%A2
clear all;

A2=[1 -4;1 -1];
tf = 2*pi/sqrt(3);
C=[0.8;0.8];
R=0.3;

analyse(A2,tf,C,R);

%A3
clear all;

A3=[1 1;4 -2];
tf=1;
C=[0.15;-0.6];
R=0.1;
analyse(A3,tf,C,R);

pause;
close all;








