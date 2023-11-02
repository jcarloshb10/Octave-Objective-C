#Funci�n que nos permite graficar en barras o normal
#------------------------------------------------------------
#par�metros de la funci�n: 
#x = Valores de x
#y = Valores de y
#titulo = t�tulo de la grafica
#ejex = t�tulo del eje x
#ejey = t�tulo del eje y
#pasoejes = paso de los ejes en este formato: [inicio: paso: fin]
#barras = opci�n de graficar con barras
function graficar(x, y, titulo, ejex, ejey, pasoejes, barras)
  #condicional para graficar con barras o no
  if (barras == "si" )
    #grafica de barras h
    h = bar(x ,y);
    #cambio de color de las barras
    set(h, "facecolor", "r", "edgecolor", "r");
    #t�tulos de la gr�fica y ejes (en formato negrita, tama�o 20)
    title(titulo,"fontweight","bold","fontsize",20);
    xlabel(ejex,"fontweight","bold","fontsize",20);
    ylabel(ejey,"fontweight","bold","fontsize",20);
    #activaci�n de cuadricula
    grid on
  elseif (barras == "no")
    #grafica 
    figure
    #color de la graficar
    plot(x, y, "r")
    #activaci�n de la cuadricula
    grid on
    #titulos de la gr�fica y los ejes 
    title(titulo,"fontweight","bold","fontsize",20)
    xlabel(ejex,"fontweight","bold","fontsize",20)
    ylabel(ejey,"fontweight","bold","fontsize",20)
    #paso de los ejes
    xticks(pasoejes)
   endif
endfunction
