#Ecuación: Regresión polinómica mejor aproximada
#------------------------------------------------
# limpiamos variables almacenadas 
clear all
# definimos las condiciones iniciales que ya conocemos:
L = 0.2;
c = 2;
w = 4.5;
E_0 = 3;
#vector t con paso 0.01 para la regresión polinomial(paso igual al de 
#la solucion_analitica), en el punto b tenemos que evaluar la 
#solucion_analitica entre 0 y 0.95 por eso creamos el
#vector t así: 0:0.01:1.95
t = 0: 0.01: 1.95;
#-------------------------------------------------------------------------
#llamada a la función solucion_analitica que definimos anteriormente
sol = solucion_analitica(L, c, w, E_0, t);
#-------------------------------------------------------------------------
#Regresión polinomica con polyfit:
#utilizamos interpolación polinomial 
#con la funcion polyfit(x,y,n)
#esto nos devuelve los coeficientes de un 
#polinomio de grado n minimizando el error de mínimos 
#cuadrados del ajuste a los puntos. (el parámetro para nosotros
#es: 6, 10 o 19 donde se ajusta correctamente), lo almacenamos en p
#para poder utilizarlo con la función polyval
p = polyfit(t, sol, 6);
#-------------------------------------------------------------------------
#polyval evalúa el polinomio p en los valores especificados (t)
yfit = polyval(p,t);
#grafica
plot(t, sol,'y');
#hold on para poder graficar la solucion_analitica y la del ajuste
hold on;
#definimos los parámetros de la gráfica, color y marcador.
plot(t, yfit,'o' ,'markersize', 8, 'markerfacecolor', 'r');
#cuadricula activa
grid on;  
# obtenemos el coeficiente de correlación
r = corr(sol,yfit);
#-------------------------------------------------------------------------
#Mejorando Grafica
#Título de la gráfica, tamaño de la letra 20, negrita
title("Regresión Polinomial","fontweight","bold","fontsize",20)
#Título de eje x
xlabel('t',"fontweight","bold","fontsize",20)
#Título de eje y
ylabel('q(t)',"fontweight","bold","fontsize",20)
#legend, pasando los títulos de nuestra etiqueta y la locación
legend('Solución Analitica', 'Regresión Polimomial', 'location', 'southEast')
#--------------------------------------------------------------------------
#cálculo del valor residual
yresid = sol-yfit;
#suma residual de cuadrados
SSresid = sum(yresid.^2);
#suma total de cuadrados (var = varianza)
SStotal = (length(sol)-1*var(sol));
#calculo de R^2
rsq = 1-SSresid/SStotal;
#--------------------------------------------------------------------------
#Imprimimos:
#coeficiente de correlación
fprintf (' coeficiente de correlación = %3.3f\n', r ) ;
fprintf (' R^2 = %3.3f\n', rsq ) ;


