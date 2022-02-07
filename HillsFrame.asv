%Definisco le equazioni di Hill. Queste equazioni sono le accelerazioni nel
%frame di Hill per i tre assi x,y,z.

syms x y z;%Hill's positions


%mc is the mass of the spacecraft
% F x,y,x is the force in each direction
% w0 is the orbital angular velocity
%v is the velocity in each direction
Vlvh=[diff(x);
      diff(y);
      diff(z);];
%this was the definition of the VELOCITY in the LVLH frame

%is the thrusters force which is given by multiplying the matrix of
%rotation of the spacecraft and the thrust force expressed in bodyframe
% Note: see Body Frame definition in "Definizioni"
% Fthr=Rb*Fb;
%this was the definition of the Thrusters Force in the LVLH frame


% P is the density of the atmosphere
% V is the orbital Velocity of the spacecraft
% S is the frontal section
%Cd is the drag coefficient
% Flvh= [Fthr(1,1)-(1/2)*P*Vlvh^2*S*Cd;
%         Fthr(2,1);
%         Fthr(3,1);];
%this was the definition of the FORCE in the LVLH frame
P=5474.89;%air pressure at 20 km
Vlvh=[7666;
        0;
        0;];%example of velocity(ISS velocity)
syms S Cd;
Flvh= [-(1/2)*P*Vlvh.^2*S*Cd;
        0;
        0;];
mc=7080;
w0=Vlvh(1,1)*pi*20000;
Alvh= [(Flvh(1,1)/mc)+(2*w0*Vlvh(3,1));
       (Flvh(2,1)/mc)-(w0*Vlvh(2,1));
        (Flvh(3,1)/mc)-(2*w0*Vlvh(1,1))+(3*w0^2*z);];
%this was the definition of the acceleration in the LVLH frame




