#Resultado de la solucion_analitica y grafica
#---------------------------------------------
#limpiamos las variables para evitar problemas
clear all
#---------------------------------------------
#definimos las condiciones iniciales, de acuerdo 
#al punto a) del trabajo, donde:
#L = 0.2
#c = 2
#w = 4.5
#E_0 = 3
L = 0.2;
c = 2;
w = 4.5;
E_0 = 3;
#----------------------------------------------
#definimos t en el rango que se nos solicita:
# vector t de 0 20 con un paso de 0.01 para que 
# la gráfica sea suave, si cambiamos el paso 0.01
# por 1 vemos que la gráfica es tosca y pierde exactitud con 
# el grafico obtenido con 0.01
t = 0: 0.01: 20;
#------------------------------------------------------------------
#llamamos la función que creamos (solucion_analitica) enviándole
#las condiciones iniciales como parámetros L,c,w,E_o,t.
#Almacenando su resultado en una variable que llamamos sol
sol = solucion_analitica(L, c, w, E_0, t);
#------------------------------------------------------------------
#Graficando:
#Llamamos la función que destinamos para graficar (graficar) donde 
#enviaremos como parámetros:
#t = vector tiempo (será nuestro eje x)
#sol = que es la solución se nos retorna anteriormente (será nuestro eje x)
#'Solución Analítica' = nombre de nuestra grafica
#'t'= nombre del eje x
#'q(t)' = nombre del eje y
#[0: 1 :20] = paso del eje x para mejorar la estética
#'no' = parámetro que permite generar una gráfica de barras
graficar(t, sol, 'Solución Analitica', 't', 'q(t)', [0: 1: 20], 'no')