1 RANDOMIZE = TIMER
2 let aleatorio = int(rnd()*10) + 1
3 print aleatorio
4 input "Advinhe o número: "; numero
5 if(aleatorio = numero) then goto 150
6 if(aleatorio <> numero) then goto 100
  
100 if (numero<aleatorio) then goto 105
101 if(numero>aleatorio) then goto 106
105 print "O número sorteado é maior que "+numero
goto 4
106 print "O número sorteado é menor que "+numero
goto 4
    
150 print "PARABÉNS"  
200 end