#Ecuaci�n: Regresi�n polin�mica mejor aproximada
#------------------------------------------------
# limpiamos variables almacenadas 
clear all
# definimos las condiciones iniciales que ya conocemos:
L = 0.2;
c = 2;
w = 4.5;
E_0 = 3;
#vector t con paso 0.01 para la regresi�n polinomial(paso igual al de 
#la solucion_analitica), en el punto b tenemos que evaluar la 
#solucion_analitica entre 0 y 0.95 por eso creamos el
#vector t as�: 0:0.01:1.95
t = 0: 0.01: 1.95;
#-------------------------------------------------------------------------
#llamada a la funci�n solucion_analitica que definimos anteriormente
sol = solucion_analitica(L, c, w, E_0, t);
#-------------------------------------------------------------------------
#Regresi�n polinomica con polyfit:
#utilizamos interpolaci�n polinomial 
#con la funcion polyfit(x,y,n)
#esto nos devuelve los coeficientes de un 
#polinomio de grado n minimizando el error de m�nimos 
#cuadrados del ajuste a los puntos. (el par�metro para nosotros
#es: 6, 10 o 19 donde se ajusta correctamente), lo almacenamos en p
#para poder utilizarlo con la funci�n polyval
p = polyfit(t, sol, 6);
#-------------------------------------------------------------------------
#polyval eval�a el polinomio p en los valores especificados (t)
yfit = polyval(p,t);
#grafica
plot(t, sol,'y');
#hold on para poder graficar la solucion_analitica y la del ajuste
hold on;
#definimos los par�metros de la gr�fica, color y marcador.
plot(t, yfit,'o' ,'markersize', 8, 'markerfacecolor', 'r');
#cuadricula activa
grid on;  
# obtenemos el coeficiente de correlaci�n
r = corr(sol,yfit);
#-------------------------------------------------------------------------
#Mejorando Grafica
#T�tulo de la gr�fica, tama�o de la letra 20, negrita
title("Regresi�n Polinomial","fontweight","bold","fontsize",20)
#T�tulo de eje x
xlabel('t',"fontweight","bold","fontsize",20)
#T�tulo de eje y
ylabel('q(t)',"fontweight","bold","fontsize",20)
#legend, pasando los t�tulos de nuestra etiqueta y la locaci�n
legend('Soluci�n Analitica', 'Regresi�n Polimomial', 'location', 'southEast')
#--------------------------------------------------------------------------
#c�lculo del valor residual
yresid = sol-yfit;
#suma residual de cuadrados
SSresid = sum(yresid.^2);
#suma total de cuadrados (var = varianza)
SStotal = (length(sol)-1*var(sol));
#calculo de R^2
rsq = 1-SSresid/SStotal;
#--------------------------------------------------------------------------
#Imprimimos:
#coeficiente de correlaci�n
fprintf (' coeficiente de correlaci�n = %3.3f\n', r ) ;
fprintf (' R^2 = %3.3f\n', rsq ) ;


