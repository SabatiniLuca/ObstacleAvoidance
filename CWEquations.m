clc;clear all;

% definizione delle equazioni in forma chiusa
n=sqrt(3.986*exp(14)/500^3);
P0x=-16000; %16 km condizione iniziale lungo x
P0y=0;%0 km
P0z=3000;%3 km

QuatPosition= @(P0)   [(4-3*cos(n*t))*P0 + (sin(delta)/delta)*diff(P0) + (2/delta)*(1-cos(delta))*diff(P0);];
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
plot(h*(0:N),funz,'g')
