#Script Bisección
#xl = límite superior
#xu = límite inferior 
#xr = punto medio
#es = error relativo (criterio de paro)
function tabla_fin = biseccion(funcion, xl, xu, es)
    #Evaluamos los limites inferior y superior en la función(q(t))
    #Almacenándola el resultado en test para luego ver los condicionales
    test = funcion(xl)*funcion(xu);
    #xr será nuestro punto medio el cual inicialmente será igual a xl
    xr = xl;
    #inicializamos las variables:
    #iter = obtener la iteración actual
    iter = 0;
    #ea = variable que nos proporcionara el error
    ea = 0;
    #tablas para almacenar los resultados de la bisección
    #tabla para almacenar los resultados numéricos
    tabla=[];
    #tabla para visualizar los resultados de una manera correcta 
    #se puede agregar más resultados para hacerlo más entendible como xl,xu
    tabla_fin=["Raiz    ","Error  ","Iteracion  "];
    #--------------------------------------------------------------------
    #inicio de ciclo:
    while (1)
      #xrold = xr anterior o de otra manera el actual
      xrold = xr;
      #obtenemos el punto medio xr = (xl + xu)/2 (lo obtenemos con el limite 
      #superior menos el inferior dividiendo esto sobre 2)
      xr = (xl + xu)/2;
      #-----------------------------------------------------------------------
      #vector auxiliar que nos permitirá agregar una fila a nuestra matriz
      fila=[xr, ea, iter];
      #aumentamos el contador iter
      iter = iter +1;
      #evaluamos las condiciones si xr es diferente de 0
      # ea = abs((xr-xrold)/xr)*100; obtenemos el error y 
      # salimos del if
      if xr ~= 0, ea = abs((xr-xrold)/xr)*100; end
      #----------------------------------------------------------------------
      #ahora evaluamos la función en el límite superior y 
      #en el punto medio
      test = funcion(xl)*funcion(xr);
      #----------------------------------------------------------------------
      #Evaluamos test:
      # si el resultado de test es menor a 0(negativo) 
      if test < 0
        #xu = límite inferior es igual al punto medio
        xu = xr;
      # si el resultado de test es mayor a 0(positivo) 
      elseif test > 0
        #xl = límite superior es igual al punto medio 
        xl = xr;
      else
        # si no se cumple ninguna de las condiciones anteriores, es decir
        # test = 0 entonces el error ea = 0
        ea = 0;
      endif
      #ahora evaluaremos el error ea con respecto al error es que es el parámetro
      #de entrada (criterio de paro)
      #si ea <= es salimos del ciclo
      
      if ea <= es
        #con esto aseguro que el ultimo dato obtenido se adicione a la tabla
        fila=[ xr, ea, iter];
        tabla=[tabla;fila];
        break
      endif
      #-------------------------------------------------------------------------
      #concatenamos la tabla que tenemos; y el vector que obtenemos anteriormente
      tabla=[tabla;fila];
    endwhile
    #adicionamos a nuestra tabla de salida los encabezados que se crean al inicio 
    #del script, y formateamos la tabla que obtenemos del ciclo 
    tabla_fin=[tabla_fin;num2str(tabla,"% 3.4f")];
endfunction
