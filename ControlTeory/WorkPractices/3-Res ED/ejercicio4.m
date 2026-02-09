%ejercicio 4

syms y(t) s Y
%usando transformada de laplace

    Dy  = diff(y, t);
    
    % Ecuacion diferencial
    eqn = Dy + 2*y == 1;
    
    % Transformada de Laplace
    L_eqn = laplace(eqn, t, s);
    
    % Sustituir condiciones iniciales
    L_eqn = subs(L_eqn, ...
        [laplace(y(t), t, s), y(0)], ...
        [Y, 0]);

    
    L_eqn = subs(L_eqn, Y, Y); % mantener Y
    
    % Despejar Y(s)
    Y_s = solve(L_eqn, Y);
    
    y_t = ilaplace(Y_s, s, t);
    
    % Mostrar solucion
    disp('Solucion y(t):');
    pretty(y_t)
    
    % Graficar
    fplot(y_t, [0, 5]);
    title('Solucion de la EDO: y(t)');
    xlabel('t'); ylabel('y(t)');
    grid on;


%usando dsolve
    sol = dsolve(Dy + 2*y == 1, y(0) == 0);
    fplot(sol, [0,5], 'g', 'LineWidth', 2);
    title('Comparación: Laplace vs dsolve');
    hold on;
    
    % Superponer solución por Laplace (del ejercicio 3)
    fplot(y_t, [0,5], '--b');
    legend('dsolve', 'Transformada de Laplace');
    grid on;