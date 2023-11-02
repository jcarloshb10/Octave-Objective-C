#Resultado bisecci�n
#------------------------------------------------------------ 
#limpiamos variables
clear all 
#definimos el l�mite inferior para nuestro caso xl = 10
xl = 10;
#de acuerdo a lo que se nos pide en el punto d debemos encontrar el primer 
#t donde q=0, observando en la gr�fica de la solici�n anal�tica 
#vemos que entre 10 y 13 se encuentra que q se hace 0
xu = 13;
#definimos el error m�nimo que deseamos(0.001)
error = 0.001;
#-------------------------------------------------------------------------
#Valores iniciales dejamos por fuera t pues son los valores que se evaluaran 
#en el script bisecci�n
L = 0.2;
c = 2;
w = 4.5;
E_0 = 3;
p = 1/(sqrt(L*c));
#--------------------------------------------------------------------------
#creando la funci�n q(t) que evaluaremos en la bisecci�n 
#q = @(t)(E_0/(L*((p^2)-(w^2))))*(((-w/p)*sin(p*t))+sin(w*t))
#donde:
#q = funci�n
#@(t) es quien se evaluar� en la bisecci�n es una variable de esta funci�n
q = @(t)(E_0/(L*((p^2)-(w^2))))*(((-w/p)*sin(p*t))+sin(w*t));
#--------------------------------------------------------------------------
#llamando a la funci�n bisecci�n:
#esta funci�n que se cre� nos retornara la ra�z, el error, y la iteraci�n
#en la que se obtuvo la ra�z (q=0), enviamos los par�metros:
#q = ecuaci�n(q(t))
#xl y xu = l�mites
#error = error(criterio de paro)
tabla = biseccion(q, xl, xu, error);
fprintf("Tabla de resultados: ")
tabla
#imprimimos e la consola
#fprintf ('Iteraci�n en la que se obtuvo = %3.0f\n', iteraci�n);
#fprintf ('Error = %3.3f\n', error);