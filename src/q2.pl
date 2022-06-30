% Proc. auxiliar 1: Inverta a ordem dos elementos da lista de entrada
list_reverse([], Y, R) :- R = Y.
list_reverse([H | T] , Y, R) :-list_reverse(T, [H | Y], R).


% Proc. auxiliar 2: Encontre a relação entre dois pontos (ignorando a ordem entre eles)
find_relation(Source, Target, Cost) :-
    (pway(Source, Target, Cost); pway(Target, Source, Cost)).


% Encapsulamento para resolver e ordenar a saída
solve_sort(Source, Target, Path, Cost) :-

    % Inclua o ponto de origem no caminho a ser retornado
    solve_internal(Source, Target, [Source], Cost, UnsortedPath),
    
    % Inverta a ordem do caminho de saída
    list_reverse(UnsortedPath, [], Path).


% Ignore casos em que o ponto de origem e destino sejam o mesmo
solve_internal(X, X, T, 0, T).

solve_internal(Source, Target, T, FinalCost, Output) :-
    find_relation(Interm, Source, CostRelation),
    \+ member(Interm, T),
    solve_internal(Interm, Target, [Interm | T], CostRec, Output),
    FinalCost is CostRec + CostRelation.


% Defina o ponto de entrada (1º procedimento chamado)
solve(X, Y, P, N) :- solve_sort(X, Y, P, N).
