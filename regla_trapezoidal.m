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
#llamamos la función que creamos (solucion_analitica) enviándole
#las condiciones iniciales como parámetros L,c,w,E_o,t.
#Almacenando su resultado en una variable que llamamos sol
sol = solucion_analitica(L, c, w, E_0, t);
#------------------------------------------------------------------
#Integrando los resultados de la solución analitica:
#Regla Trapezoidal: Octave nos brinda la función trapz
#trapz (y)calcula la integral de y a lo largo de la primera
#dimensión no singleton. Cuando se omite el argumento x,
#se supone un vector x igualmente espaciado con espaciado 
#unitario (1). evalúa la integral con respecto al espaciado 
#en xy los valores en y . Esto es útil si los puntos en y se
#han muestreado de manera desigual. trapz (x, y)
#-----------------------------------------------
#en nuestro caso utilizaremos trapz(x, y) donde 
#x = tiempo(t)
#y = solución_analitica(sol)
#integrando tenemos
regla_trap = trapz(sol);
#mostramos el resultado de la integración en la consola
fprintf('La aproximacion a la integral por  es: %3.3f\n', regla_trap)
#-------------------------------------------------
#Graficando:
#en este caso llamamos la función graficar que creamos 
#mandando los parámetros que ya conocemos 
#cambiando el ultimo por 'si' para obtener una gráfica de barras de barras
graficar(t, sol, 'Regla Trapezoidal', 't', 'q(t)', [0: 1: 20], "si")
