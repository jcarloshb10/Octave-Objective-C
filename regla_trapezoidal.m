#Regla Trapezoidal 
#-------------------------------------------------------------------
#limpiamos todas las variables que tengamos almacenadas
clear all
#Condiciones iniciales 
#---------------------------------------------
L = 0.2;
c = 2;
w = 4.5;
E_0 = 3;
#----------------------------------------------
#definimos t = 0:0.01:20 pues se nos pide 
#que integremos los datos obtenidos en la solucion_analitica
#con esto enviamos el mismo vector que utilizamos en el script
#resultado_solucion_analitica 
t = 0:0.01: 20;
#------------------------------------------------------------------
#llamamos la funci�n que creamos (solucion_analitica) envi�ndole
#las condiciones iniciales como par�metros L,c,w,E_o,t.
#Almacenando su resultado en una variable que llamamos sol
sol = solucion_analitica(L, c, w, E_0, t);
#------------------------------------------------------------------
#Integrando los resultados de la soluci�n analitica:
#Regla Trapezoidal: Octave nos brinda la funci�n trapz
#trapz (y)calcula la integral de y a lo largo de la primera
#dimensi�n no singleton. Cuando se omite el argumento x,
#se supone un vector x igualmente espaciado con espaciado 
#unitario (1). eval�a la integral con respecto al espaciado 
#en xy los valores en y . Esto es �til si los puntos en y se
#han muestreado de manera desigual. trapz (x, y)
#-----------------------------------------------
#en nuestro caso utilizaremos trapz(x, y) donde 
#x = tiempo(t)
#y = soluci�n_analitica(sol)
#integrando tenemos
regla_trap = trapz(sol);
#mostramos el resultado de la integraci�n en la consola
fprintf('La aproximacion a la integral por  es: %3.3f\n', regla_trap)
#-------------------------------------------------
#Graficando:
#en este caso llamamos la funci�n graficar que creamos 
#mandando los par�metros que ya conocemos 
#cambiando el ultimo por 'si' para obtener una gr�fica de barras de barras
graficar(t, sol, 'Regla Trapezoidal', 't', 'q(t)', [0: 1: 20], "si")
