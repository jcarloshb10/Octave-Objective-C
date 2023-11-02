function kn = kn(Et, L, R, c, t, mt)
  #Et, L, R, c = valores constantes
  #matriz con los valores q y dq/dt
  q = mt(1);
  dq = mt(2); #dq/dt
  dqq = (Et/L) - ((R/L)*dq) - ((1/(L*c))*q);#d2q/dt2 cuando reescribimos por ser de segundo orden de ecuacion
  #Se calcula en valor de la segunda derivada con los valores q y dq/dt
  kn = [dq;dqq];
  #como se evaluan 2 condiciones iniciales, el valor de las ks sera una matriz de 1*2
endfunction

