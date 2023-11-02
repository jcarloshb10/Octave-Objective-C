#Esta función nos permite calcular las soluciones de la 
#solución analítica:
#======================================================
#solución analítica de la ecuación 1
#------------------------------------------------------
#definimos los parámetros de la función 
#L,c,w,E_o,t
#------------------------------------------------------
#para poder calcular la solución analítica 
#con los valores iniciales tenemos que calcular p,E,R que 
#equivalen a:
#p=1/(sqrt(L*c))
#E=E_0*sin(w*t)
#R=0
function q = solucion_analitica(L,c,w,E_0,t)
  #--------------------------------------------------------
  #para cuando creamos la función tenemos que:
  #q = solucion_analitica(L,c,w,E_0,t)
  #donde:
  #q es lo que nos retornara la función 
  #seguido del nombre de la función y los parámetros que recibirá esta
  #-------------------------------------------------------------------
  #seguido de esto definimos E,R,p 
  E = E_0*sin(w*t);  
  R = 0;
  p = 1/(sqrt(L*c));
  #-------------------------------------------------------------------
  #aquí calculamos la solución, donde q es lo que se retornara
  #tenemos que la función que deseamos calcular es:
  #q(t)=(E_0/(L*((p^2)-(w^2))))*(((-w/p)*sin(p*t))+sin(w*t))
  q = (E_0/(L*((p^2)-(w^2))))*(((-w/p)*sin(p*t))+sin(w*t));
  #limpiamos las variables para evitar que estas se almacenen 
  #cada vez que ejecutamos
  clear L c w E_0
endfunction





