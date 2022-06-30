# Trabalho de introdução à programação lógica (com Prolog)

Segundo trabalho apresentado à disciplina de Inteligência Artificial.

- Autor: Antônio Carlos Durães da Silva
- Semestre: 2022/1

As implementações foram realizadas no ambiente [SWISH](https://swish.swi-prolog.org/), plataforma online para desenvolvimento Prolog.

## Questões implementadas

### Questão 1: Corrida

Arquivo: [q1.pl](https://github.com/IFES-MPCA/prog_logica/blob/main/src/q1.pl)

Os predicados desenvolvidos foram:
- **antes_imediato(A, B):** Verifica se existem algum fato que relacione diretamente o corredor A com o corredor B.
- **antes(A, Z):** Verifica se o corredor A chegou antes de Z, existindo um fato que relacione diretamente A com Z **ou** fatos que indiquem que A chegou antes de um terceiro corredor e fatos que indiquem que esse terceiro corredor chegou antes de Z.
- **race(Ranking):** Itera sob os pares de corredores da lista de entrada e verifica se não há algum par que conflite com os fatos da base de conhecimento.

### Questão 2: Labirinto

Arquivo: [q2.pl](https://github.com/IFES-MPCA/prog_logica/blob/main/src/q2.pl)

Os predicados desenvolvidos foram:
- **list_reverse(L, R, O):** Dado uma lista (L), uma lista de itens com sua ordem já revertida (R) e uma variável de saída (O), reverte a ordem dos elementos de L e armazena em O.
- **find_relation(S, T, C):** Verifica se existe um fato que relacione (independente a ordem) o ponto de origem S ao ponto de destino T, e se existir, armazena seu custo em C.
- **solve_internal(S, T, TP, C, O):** Predicado solucionador e recursivo, que verifica se existe um ponto intermediário entre a origem (S) e o destino (T) que ainda não esteja no caminho temporário (TP), se existir o adiciona no caminho temporário. Ao final retorna o caminho completo (O) e a soma dos custos acumulados em C.
- **solve_sort(S, T, P, C):** Encapsula a chamada ao predicado solucionador e reverte sua saída antes de armazená-la em P.
- **solve(X, Y, P, N):** Predicado principal, que será chamado externamente.

### Questão 3: Quebra-cabeças

**Não implementada.**
