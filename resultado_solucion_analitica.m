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
# la gr�fica sea suave, si cambiamos el paso 0.01
# por 1 vemos que la gr�fica es tosca y pierde exactitud con 
# el grafico obtenido con 0.01
t = 0: 0.01: 20;
#------------------------------------------------------------------
#llamamos la funci�n que creamos (solucion_analitica) envi�ndole
#las condiciones iniciales como par�metros L,c,w,E_o,t.
#Almacenando su resultado en una variable que llamamos sol
sol = solucion_analitica(L, c, w, E_0, t);
#------------------------------------------------------------------
#Graficando:
#Llamamos la funci�n que destinamos para graficar (graficar) donde 
#enviaremos como par�metros:
#t = vector tiempo (ser� nuestro eje x)
#sol = que es la soluci�n se nos retorna anteriormente (ser� nuestro eje x)
#'Soluci�n Anal�tica' = nombre de nuestra grafica
#'t'= nombre del eje x
#'q(t)' = nombre del eje y
#[0: 1 :20] = paso del eje x para mejorar la est�tica
#'no' = par�metro que permite generar una gr�fica de barras
graficar(t, sol, 'Soluci�n Analitica', 't', 'q(t)', [0: 1: 20], 'no')