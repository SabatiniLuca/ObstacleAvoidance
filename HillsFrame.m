clear;
clc;
set(0,'defaultTextInterpreter','latex')
set(0,'defaultAxesTickLabelInterpreter','latex')
set(0,'defaultLegendInterpreter','latex')
set(0,'defaultAxesFontSize',14)
%% Condizioni iniziali
%forza thrusters
Fmag=@(Fnom,Fbias,Fnoise) Fnom+Fbias+Fnoise;
Versore=@(Rbias,VersNominale) Rrand*Rbias*VersNominale;
Ftot=@(Versore,Fmag) Versore*Fmag;
%Bforce è la somma di tutte le forze di ogni propulsore ( ce ne sono 12)
Fthr=@(R,Bforce) R*Bforce;

Fx = 32.8; %Forza propulsori asse x
Fy = 32.8; %Forza propulsori asse y 
Fz = 32.8; %Forza propulsori asse z
w = 2;
m = 600;

%% Campo
% Ua=1/2*Ka
%% Condizioni operative
tf = 25;
N = 2000;
h = tf/N;

% f = @(t, xi) [h*xi(2) + xi(1)
%          h*(Fx/m + 2*w*xi(4)) + xi(2)
%          h*xi(4) + xi(3)
%          h*(Fz/m - 2*w*xi(2) + 3*(w^2)*xi(4)) + xi(4)]; % Campo vettoriale modello 

%% Definizione metodo di eulero in avanti
% Phi_fEul  = @(t,y,h) y + h*f(t,y);

%% Inizializzazione
%xi_fEul = 20*rand(4,1); 

%% Simulazione numerica
%for n = 1:(N-1)
 %xi_fEul(:,n+1) = Phi_fEul(h*(n-1),xi_fEul(:,n),h);
%end


%% Grafica 
%plot3(xi_fEul(1,1:N),xi_fEul(2,1:N),xi_fEul(3,1:N))
%plot(t,xi_fEul(2,1:N));

%% Definizione funzioni 
x = -16100;
Vx = 6;
y = 0;
Vy = 1;
z = 3000;
Vz = 1;

xf = -500;
yf = 0;
zf = 0;


%% Simulazione numerica

for t = 1:N-1
        x(t+1) = x(t) + Vx(t)*h;
        Vx(t+1) = Vx(t)+ h*(Fx/m + 2*w*Vz(t));

        y(t+1) = y(t) + Vy(t)*h;
        Vy(t+1) = Vy(t) + h*(Fy/m - w*y(t));

        z(t+1) = z(t) + Vz(t)*h;
        Vz(t+1) = Vz(t) + h*(Fz/m - 2*w*Vx(t) + 3*(w^2)*z(t));
end
x(N) = -500;
y(N) = 0;
z(N) = 0;
t = linspace(0, tf, N);
%% Grafica
% tiledlayout(2,2)
% nexttile
% plot(Vx,'k');
% nexttile
plot(Vz, 'g')
nexttile([1 2])
plot3(Vx, Vy, Vz, 'b');
hold on
plot3(x,y,z,'r');
% hold on
%plot3(x,y,z, 'g')
% hold on 
%plot3(x(N), y(N), z(N), 'ro')
xlabel('Vx')
ylabel('Vy')
zlabel('Vz')
