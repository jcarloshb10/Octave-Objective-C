#RungeKutta 4 orden
t = [0:0.1:20];
#t = tiempo para la solicion analitica
h = 0.1;
#h = distancia entre los puntos de t1
t1 = [0:h:20];
#t1 = tiempo para la solucion numerica

#Valores iniciales
Eo = 3; L = 0.2; c = 2; w = 4.5;
Et = Eo*sin(w.*t); # Et evaluado con t
R = 0; p = 1/sqrt(L*c);

q = (Eo / ( L * (p^2 - w^2))) * (-((w*sin(p.*t))/p) + sin(w.*t));
#q = solucion analitica

Et1 = Eo*sin(w.*t1); # Et evaluado con t1
condicion = [0 ;0]; #condicion inicial q, dq/dt para t = 0

limit = (size(t1)(2)); 
yp = zeros(1, limit); # solucion numerica

for i=2:limit
  k1 = kn(Et1(i), L, R, c, t1(i), condicion);
  k2 = kn(Et1(i), L, R, c, (t1(i)+(h/2)), condicion+(h/2)*k1);
  k3 = kn(Et1(i), L, R, c, (t1(i)+(h/2)), condicion+(h/2)*k2);
  k4 = kn(Et1(i), L, R, c, (t1(i)+h), condicion+h*k3);
  
  tmp_value = condicion + ((1/6)*(k1+2*k2+2*k3+k4)*h);
  #al ser una ecuacion diferencial de segundo orden retorna 2 valores
  #el primero representa el valor de q y el segundo representa el valor de la primera derivada
  condicion = tmp_value; # se remplaza la condición para la siguiente iteación
  yp(i) = condicion(1);# se guarda el valor de q
endfor

#grafica 

plot(t,q, 'o') # gráfica solución analitica
hold on
plot(t1, yp, 'r') # gráfica solución numérica
grid on
#titulos de la gráfica y los ejes 
#coeficiente de correlacion
title("Solucion Numerica","fontweight","bold","fontsize",20)
xlabel("t","fontweight","bold","fontsize",20)
ylabel("q(t)","fontweight","bold","fontsize",20)

# obtenemos el coeficiente de correlacion
correlacion = corr(yp,q)






