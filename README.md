# Trabalho de introdução à programação lógica

Segundo trabalho apresentado à disciplina de Inteligência Artificial.

- Autor: Antônio Carlos Durães da Silva
- Semestre: 2022/1

As implementações foram realizadas no ambiente [SWISH](https://swish.swi-prolog.org/), plataforma online para desenvolvimento Prolog.

## Questões implementadas

### Questão 1: Corrida

Arquivo: [q1.pl](https://github.com/IFES-MPCA/prog_logica/blob/main/src/q1.pl)

Os predicados desenvolvidos foram:
- **antes_imediato(A, B):** Verifica se existem algum fato que relacione diretamente o corredor A com o corredor B
- **antes(A, Z):** Verifica se o corredor A chegou antes de Z, existindo um fato que relacione diretamente A com Z **ou** fatos que indiquem que A chegou antes de um terceiro corredor e fatos que indiquem que esse terceiro corredor chegou antes de Z.
- **race(Ranking):** Itera sob os pares de corredores da lista de entrada e verifica se não há algum par que conflite com os fatos da base de conhecimento.
- **solve_internal():** 

### Questão 2: Labirinto

Arquivo: [q2.pl](https://github.com/IFES-MPCA/prog_logica/blob/main/src/q2.pl)

Os predicados desenvolvidos foram:
- **list_reverse(L, R, O):** Dado uma lista (L), uma lista de itens com sua ordem já revertida (R) e uma variável de saída (O), reverte a ordem dos elementos de L e armazena em O.
- **find_relation(A, B, C):** Verifica se existe um fato que relacione (independente a ordem) o ponto A com o ponto B, e se existir, armazena seu custo em C.
- **solve_internal():** 

% Ignore casos em que o ponto de origem e destino sejam o mesmo
solve_internal(X, X, T, 0, T).

solve_internal(Source, Target, T, FinalCost, Output) :-
    find_relation(Interm, Source, CostRelation),
    \+ member(Interm, T),
    solve_internal(Interm, Target, [Interm | T], CostRec, Output),
    FinalCost is CostRec + CostRelation.

% Encapsulamento para resolver e ordenar a saída
solve_sort(Source, Target, Path, Cost) :-

    % Inclua o ponto de origem no caminho a ser retornado
    solve_internal(Source, Target, [Source], Cost, UnsortedPath),
    
    % Inverta a ordem do caminho de saída
    list_reverse(UnsortedPath, [], Path).

% Defina o ponto de entrada (1º procedimento chamado)
solve(X, Y, T, N) :- solve_sort(X, Y, T, N).
