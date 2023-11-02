#Esta funci�n nos permite calcular las soluciones de la 
#soluci�n anal�tica:
#======================================================
#soluci�n anal�tica de la ecuaci�n 1
#------------------------------------------------------
#definimos los par�metros de la funci�n 
#L,c,w,E_o,t
#------------------------------------------------------
#para poder calcular la soluci�n anal�tica 
#con los valores iniciales tenemos que calcular p,E,R que 
#equivalen a:
#p=1/(sqrt(L*c))
#E=E_0*sin(w*t)
#R=0
function q = solucion_analitica(L,c,w,E_0,t)
  #--------------------------------------------------------
  #para cuando creamos la funci�n tenemos que:
  #q = solucion_analitica(L,c,w,E_0,t)
  #donde:
  #q es lo que nos retornara la funci�n 
  #seguido del nombre de la funci�n y los par�metros que recibir� esta
  #-------------------------------------------------------------------
  #seguido de esto definimos E,R,p 
  E = E_0*sin(w*t);  
  R = 0;
  p = 1/(sqrt(L*c));
  #-------------------------------------------------------------------
  #aqu� calculamos la soluci�n, donde q es lo que se retornara
  #tenemos que la funci�n que deseamos calcular es:
  #q(t)=(E_0/(L*((p^2)-(w^2))))*(((-w/p)*sin(p*t))+sin(w*t))
  q = (E_0/(L*((p^2)-(w^2))))*(((-w/p)*sin(p*t))+sin(w*t));
  #limpiamos las variables para evitar que estas se almacenen 
  #cada vez que ejecutamos
  clear L c w E_0
endfunction





