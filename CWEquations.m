
% A=[3*(n^2)*x + 2*n*dy;
%     -2*n*dx;
%     -(n^2)*z;];
% V=[int(3*(n^2)*x + 2*n*dy ,x);
%     int(-2*n*dx ,y);
%     int(-(n^2)*z ,z);];
gamma= 3.986e14;%cost grav
a=400000;%altitudine esemplificativa
n=sqrt(gamma/(a^3));
%posizione iniziale
P0=[0;
    0;
    a;];
% definizione delle equazioni in forma chiusa
QuatPosition = @(P0)   [(4-3*cos(n*t))*P0(1,1) + (sin(n*t)/n)*diff(P0(1,1)) + (2/n)*(1-cos(n*t))*diff(P0(2,1));
                        6*(sin(n*t)-n*t)*P0(1,1) + P0(2,1) - (2/n)*(1-cos(n*t))*diff(P0(1,1)) + ((4*sin(n*t)-(3*n*t))/n)*diff(P0(2,1));
                        P0(3,1)*cos(n*t) + (diff(P0(3,1))/n)*sin(n*t);];
%condizioni operative
tf= 50;
N=100;
h=tf/N;%passo numerico

%metodo numerico
Phi_fEul  = @(y,h) y + h*QuatPosition(y);

p_fEul(1)=0;
%calcolo
for n=1:N
    p_fEul(n+1) = Phi_fEul(p_fEul(n),h);
end
plot(h*(0:N),p_fEul,'magenta')
