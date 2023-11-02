#regresi�n polinomial num�rica
#paso
h = 0.1;
#vector tiempo
t1 = [0:h:20];
#condiciones iniciales
Eo = 3; 
L = 0.2; 
c = 2; 
w = 4.5;
R = 0;
Et1 = Eo*sin(w.*t1);
condicion = [0 ;0]; #condici�n inicial q, dq/dt(y) para t = 0
#limite
limit = (size(t1)(2));
yp = zeros(1, limit); #crea una fila (1) por limit columnas de ceros.
for i=2:limit
  k1 = kn(Et1(i), L, R, c, t1(i), condicion);
  k2 = kn(Et1(i), L, R, c, (t1(i)+(h/2)), condicion+(h/2)*k1);
  k3 = kn(Et1(i), L, R, c, (t1(i)+(h/2)), condicion+(h/2)*k2);
  k4 = kn(Et1(i), L, R, c, (t1(i)+h), condicion+h*k3);
  tmp_value = condicion + ((1/6)*(k1+2*k2+2*k3+k4)*h); ##q y dq/dt;
  condicion = tmp_value;
  yp(i) = condicion(1);
endfor
#=========================================================================
#regresi�n polinomial para la soluci�n num�rica
#-------------------------------------------------------------------------
#Regresi�n polinomica con polyfit:
#utilizamos interpolaci�n polinomial 
#con la funci�n polyfit(x,y,n)
#esto nos devuelve los coeficientes de un 
#polinomio de grado n minimizando el error de m�nimos 
#cuadrados del ajuste a los puntos. Lo almacenamos en p
#para poder utilizarlo con la funci�n polyval
p = polyfit(t1, yp, 6);
#-------------------------------------------------------------------------
#polyval eval�a el polinomio p en los valores especificados (t1)
yfit = polyval(p,t1);
#-------------------------------------------------------------------------
#--------------------------------------------------------------------------
#c�lculo del valor residual para polifit
# obtenemos el coeficiente de correlaci�n
yresid = yp-yfit;
#suma residual de cuadrados
SSresid = sum(yresid.^2);
#suma total de cuadrados (var = varianza)
SStotal = (length(yp)-1*var(yp));
#c�lculo de R^2
rsq = 1-SSresid/SStotal;
# obtenemos el coeficiente de correlacion
r = corr(yp,yfit);
#==========================================================================
#evaluamos con spline
#spline enviado con un tercer argumento nos evaluar� 
#el polinomio por partes en los puntos que enviemos
#en este caso t1
sn = spline(t1, yp ,t1);
# obtenemos el coeficiente de correlaci�n
r2 = corr(yp,sn);
#--------------------------------------------------------------------------
#Imprimimos:
#coeficiente de correlaci�n
fprintf (' coeficiente de correlaci�n polival = %3.3f\n', r ) ;
fprintf (' coeficiente de correlaci�n spline= %3.3f\n', r2 ) ;
#------------------------------------------------------------------
#Graficando
#graficamos la soluci�n num�rica
plot(t1, yp,'g');
#hold on para poder graficar la solucion_analitica y la del ajuste
hold on;
#Graficamos la regresi�n polinomial con polyfit
plot(t1, yfit, 'r');
#Graficamos con spline
plot(t1, sn,'x','markersize', 4)
#cuadricula activa
grid on;  
#-------------------------------------------------------------------------
#Mejorando Gr�fica
#T�tulo de la gr�fica, tama�o de la letra 20, negrita
title("Regresi�n Polinomial (soluci�n numerica)","fontweight","bold","fontsize",20)
#T�tulo de eje x
xlabel('t',"fontweight","bold","fontsize",20)
#T�tulo de eje y
ylabel('q(t)',"fontweight","bold","fontsize",20)
#legend, pasando los t�tulos de nuestra etiqueta y la locaci�n
legend('Soluci�n Numerica', 'polyfit', 'spline', 'location', 'southEast')

