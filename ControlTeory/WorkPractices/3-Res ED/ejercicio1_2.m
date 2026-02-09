%desarrollado por Manuel Fernandez Mercado

%ejericio 1

syms s t
F = 2/(s+3) + 5/(s^2 +4);
f_t = ilaplace(F,s,t);

disp('Ejercicio 1:');
pretty(f_t);

%ejercicio 2: Descomposición por fraccions parciales y transformada Inv

disp('Ejercicio 2:');
F1 = (s+1)/(s*(s+2)*(s+3));
disp('Fracciones parciales:');
disp(partfrac(F,s));
f_t1 = ilaplace(F1,s,t);
disp('Solucion:');
pretty(f_t1);







