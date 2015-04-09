function analyse(A,tf,C,R)

nb_points_ellipse = 100;
deux_pi = 2*pi;
theta_points_ellipse = deux_pi/nb_points_ellipse:deux_pi/nb_points_ellipse:deux_pi;

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
        Y=[Y expm(k*A)*y0];
        plot(Y(1,end),Y(2,end));
    end;
    G=[G;Y];
end;


%Tracer des ellipses
for bach=[1 10 20 30 40 50 60 80 90 100];
    H=G(:,bach);
    L=reshape(H,2,[]);

    x=L(1,:);
    y=L(2,:);

    %Moindres carres ordinaires pour trouver les caracteristiques de l'ellipse
    x=x';y=y';
    [n,~] = size(x);
    A_1 = [x.*y y.*y-x.*x x y ones(n,1)];
    B_1 = -x.^2;
    X_1 = A_1\B_1;
    p_1 = [1-X_1(2);X_1(1);X_1(2);X_1(3);X_1(4);X_1(5)];
    [C_1,theta_0_1,a_1,b_1] = conversion(p_1);
    affichage_ellipse(C_1,theta_0_1,a_1,b_1,theta_points_ellipse,'b-');
end;