clc
clear all 

%apf on 1 dimension

x= 1:1:100;
goal= 81;
f=(x-goal).^2;
plot(x,f,'r-')

iterations=100;
tollerance=1;

speed=10;

start=1;

current_position=start;
route= [current_position];% questo vettore conterrà tutte le posizioni raggiunte dal punto ( robot)

grad_x= -1 .* gradient(f);

grid on

while (iterations>0 || abs(current_position-goal)>tollerance)


    delta_x=grad_x(floor(current_position));% calcolo del gradiente della posizione precedente (moltiplicato per meno uno)
    %floor serve per arrotondare
    delta_Direction_x= delta_x/norm(delta_x); %normalizzazione del gradiente cambiato di segno (questo ci da il segno)

    new_route_x=current_position +speed*delta_Direction_x;

    current_position=new_route_x;
    
    hold on
    plot(new_route_x, 0,'r*');
    hold off

    route=[route; current_position];
    iterations=iterations-1;
end

route
