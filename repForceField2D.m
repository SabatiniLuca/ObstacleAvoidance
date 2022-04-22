clc
clear all

%% Generazione mappa
rownum=500;
colnum=500;

obstacle =false (rownum,colnum);

[x,y] =meshgrid(1:colnum , 1:rownum);

%% Ostacoli
Xc=200;Yc=100;R=50;

t=((x-Xc).^2 + (y-Yc).^2) <R^2;
obstacle(t)=true;


obstacle(100:150 , 50:75)=true;

%% Campo repulsivo
RepGain=600;
%delta=2
safety=2;%%safety radius
radius=R+safety;

dist=bwdist(obstacle);%distanza dall'ostacolo
k=100;%tuning parameter
rho=dist/k + 1; % l'uno e per evitare la divisione per zero

repForceLimit=5;%il limite oltre il quale la forza repulsiva non ha piu effetto

Repulsive_Force= RepGain*((1./rho - 1./repForceLimit).^2);
Repulsive_Force(rho>repForceLimit)=0;

%% Plot del campo repulsivo
figure;
m=mesh(Repulsive_Force);
m.FaceLighting= 'phong';
axis equal;
title ('Repulsive Force Field')

%% Campo attrattivo
Xgoal=100; 
Ygoal=100;
goal= [Xgoal, Ygoal];
tuningParameter=1/1000;

Attractive_Force= tuningParameter*((x-Xgoal).^2 + (y-Ygoal).^2 );

%% Plot del campo attrattivo
figure;
m=mesh(Attractive_Force);
m.FaceLighting= 'phong';
axis equal;
title ('Attractive Force Field')

%% Plot totale
Total_field=Repulsive_Force+Attractive_Force;
figure;
m=mesh(Total_field);
m.FaceLighting= 'phong';
axis equal;
title ('Total Force Field')

