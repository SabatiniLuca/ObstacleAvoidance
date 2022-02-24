clc;clear all;
% A=[3*(n^2)*x + 2*n*dy;
%     -2*n*dx;
%     -(n^2)*z;];
% V=[int(3*(n^2)*x + 2*n*dy ,x);
%     int(-2*n*dx ,y);
%     int(-(n^2)*z ,z);];
gamma= 3.986e14;%cost grav
a=400000;%altitudine esemplificativa
delta=sqrt(gamma/(a^3));
%posizione iniziale
P0=0
% definizione delle equazioni in forma chiusa

QuatPosition= @(P0)   [(4-3*cos(delta))*P0 + (sin(delta)/delta)*diff(P0) + (2/delta)*(1-cos(delta))*diff(P0);];
%                         6*(sin(delta*t)-delta*t)*P0(1,1) + P0(2,1) - (2/delta)*(1-cos(delta*t))*diff(P0(1,1)) + ((4*sin(delta*t)-(3*delta*t))/delta)*diff(P0(2,1));
%                         P0(3,1)*cos(delta*t) + (diff(P0(3,1))/delta)*sin(delta*t);];


%%condizioni operative
tf= 50;
N=100;
h=tf/N;%passo numerico

%metodo numerico

Phi_fEul  = @(y) y + h*QuatPosition(y);
% p_fEul(1)=0
n=1;
funz(n)=0
%calcolo

for n=1:N
    funz(n+1)=Phi_fEul(funz(n));
    P0=funz(n+1);

%     p_fEul(n+1) = Phi_fEul(p_fEul(n),h);
%     P0=p_fEul(n+1);
end
plot(h*(0:N),p_fEul,'magenta')
