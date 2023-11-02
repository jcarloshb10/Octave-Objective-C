#Función que nos permite graficar en barras o normal
#------------------------------------------------------------
#parámetros de la función: 
#x = Valores de x
#y = Valores de y
#titulo = título de la grafica
#ejex = título del eje x
#ejey = título del eje y
#pasoejes = paso de los ejes en este formato: [inicio: paso: fin]
#barras = opción de graficar con barras
function graficar(x, y, titulo, ejex, ejey, pasoejes, barras)
  #condicional para graficar con barras o no
  if (barras == "si" )
    #grafica de barras h
    h = bar(x ,y);
    #cambio de color de las barras
    set(h, "facecolor", "r", "edgecolor", "r");
    #títulos de la gráfica y ejes (en formato negrita, tamaño 20)
    title(titulo,"fontweight","bold","fontsize",20);
    xlabel(ejex,"fontweight","bold","fontsize",20);
    ylabel(ejey,"fontweight","bold","fontsize",20);
    #activación de cuadricula
    grid on
  elseif (barras == "no")
    #grafica 
    figure
    #color de la graficar
    plot(x, y, "r")
    #activación de la cuadricula
    grid on
    #titulos de la gráfica y los ejes 
    title(titulo,"fontweight","bold","fontsize",20)
    xlabel(ejex,"fontweight","bold","fontsize",20)
    ylabel(ejey,"fontweight","bold","fontsize",20)
    #paso de los ejes
    xticks(pasoejes)
   endif
endfunction
