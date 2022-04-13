clear;
clc;
set(0,'defaultTextInterpreter','latex')
set(0,'defaultAxesTickLabelInterpreter','latex')
set(0,'defaultLegendInterpreter','latex')
set(0,'defaultAxesFontSize',14)
%% Condizioni Operative
Fx = 30.0; %Forza propulsori asse x
Fy = 32.4; %Forza propulsori asse y 
Fz = 34.8; %Forza propulsori asse z
w = 2; %Velocità angolare 
m = 600; %Massa dello spacecraft
ro = 1.225; %Densità dell'atmosfera 
Cd = 2.2; %Coefficiente di attrito dello spacecraft
S = 100; %Sezione frontale dello spacecraft 

%% Definizione del passo numerico
tf = 50;
N = 2000;
h = tf/N;

%% Condizioni iniziali
P = [-16100; %x
        0;    %y
      3000];  %z    Posizioni iniziali dello spacecraft

V = [6;     %Vx
      0;     %Vy
      3;];   %Vz    Velocità iniziali dello spacecraft

%% Matrici posizione e velocità
P = [P(1) + V(1)*h;
     P(2) + V(2)*h;
     P(3) + V(3)*h];

V = [V(1) + h*(Fx/m + 2*w*V(3));
     V(2) + h*(Fy/m - w*P(2));
     V(3) + h*(Fz/m - 2*w*V(1) + 3*(w^2)*P(3))];

%% Forze in gioco
F = [Fx;
     Fy; 
     Fz];

F_ext = [(-1/2)*ro*(V(1)^2)*S*Cd;
                0;
                0];
F_thr =0;
%F_thr = [cos(fi) sin(fi) 0;
%        -sin(fi) cos(fi) 0;
%            0       0    1;];

F_tot = F_ext + F_thr;    

t_on = 1;
t_off = 0;

%% Simulazione numerica
for t = 1:N-1
        P(t+1) = P(t) + h*V(t);
        V(t+1) = V(t) + h*V(t);
end
plot(P, V)
