%% Scrivo le equazioni di Hill aggiungendo tre variabili ausiliarie
h=100;
Fx= 328;
mc=2392832;
y(1)= 0;
a(1)= 1;

for k= 1:100
    y(k+1)=y(k)+(1/h)*a(k);
    a(k+1)= a(k) + (Fx/mc)*(1/h);
end

figure(1)
plot(y)
title('legge del moto')


