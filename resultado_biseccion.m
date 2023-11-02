#Resultado bisección
#------------------------------------------------------------ 
#limpiamos variables
clear all 
#definimos el límite inferior para nuestro caso xl = 10
xl = 10;
#de acuerdo a lo que se nos pide en el punto d debemos encontrar el primer 
#t donde q=0, observando en la gráfica de la solición analítica 
#vemos que entre 10 y 13 se encuentra que q se hace 0
xu = 13;
#definimos el error mínimo que deseamos(0.001)
error = 0.001;
#-------------------------------------------------------------------------
#Valores iniciales dejamos por fuera t pues son los valores que se evaluaran 
#en el script bisección
L = 0.2;
c = 2;
w = 4.5;
E_0 = 3;
p = 1/(sqrt(L*c));
#--------------------------------------------------------------------------
#creando la función q(t) que evaluaremos en la bisección 
#q = @(t)(E_0/(L*((p^2)-(w^2))))*(((-w/p)*sin(p*t))+sin(w*t))
#donde:
#q = función
#@(t) es quien se evaluará en la bisección es una variable de esta función
q = @(t)(E_0/(L*((p^2)-(w^2))))*(((-w/p)*sin(p*t))+sin(w*t));
#--------------------------------------------------------------------------
#llamando a la función bisección:
#esta función que se creó nos retornara la raíz, el error, y la iteración
#en la que se obtuvo la raíz (q=0), enviamos los parámetros:
#q = ecuación(q(t))
#xl y xu = límites
#error = error(criterio de paro)
tabla = biseccion(q, xl, xu, error);
fprintf("Tabla de resultados: ")
tabla
#imprimimos e la consola
#fprintf ('Iteración en la que se obtuvo = %3.0f\n', iteración);
#fprintf ('Error = %3.3f\n', error);