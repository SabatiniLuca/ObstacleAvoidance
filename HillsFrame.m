clear;
clc;
set(0,'defaultTextInterpreter','latex')
set(0,'defaultAxesTickLabelInterpreter','latex')
set(0,'defaultLegendInterpreter','latex')
set(0,'defaultAxesFontSize',14)
%% Condizioni iniziali
Fx = 32.8; %Forza propulsori asse x
Fy = 32.8; %Forza propulsori asse y 
Fz = 32.8; %Forza propulsori asse z
w = 2;
m = 600;
%% Condizioni operative
tf = 50;
N = 1000;
h = tf/N;

% f = @(t, xi) [h*xi(2) + xi(1)
%          h*(Fx/m + 2*w*xi(4)) + xi(2)
%          h*xi(4) + xi(3)
%          h*(Fz/m - 2*w*xi(2) + 3*(w^2)*xi(4)) + xi(4)]; % Campo vettoriale modello 

%% Definizione metodo di eulero in avanti
Phi_fEul  = @(t,y,h) y + h*f(t,y);

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
x = 0;
Vx = 1;
y = 0;
Vy = 1;
z = 0;
Vz = 1;


%% Simulazione numerica
for t = 1:N-1
    x(t+1) = x(t) + Vx(t)*h;
    Vx(t+1) = Vx(t)+ h*(2*w*Vz(t));

    y(t+1) = y(t) + Vy(t)*h;
    Vy(t+1) = Vy(t) + h*(-w*y(t));

    z(t+1) = z(t) + Vz(t)*h;
    Vz(t+1) = Vz(t) + h*(- 2*w*Vx(t) + 3*(w^2)*z(t));
end
t = linspace(0, tf, N);
%% Grafica
plot3(Vx, Vy, Vz, 'b');
hold on
plot3(x,y,z, 'g')
hold on
plot3(0,0,0, 'ro')
hold on 
plot3(x(N), y(N), z(N), 'ko')
xlabel('X')
ylabel('Y')
zlabel('Z')
