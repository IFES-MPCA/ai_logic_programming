# Trabalho de introdução à programação lógica (com Prolog)

<p align="center">
<img src="https://user-images.githubusercontent.com/37306576/176787756-85cdf512-ca30-477f-b88f-295c775992d7.png" />
</p>

Segundo trabalho apresentado à disciplina de Inteligência Artificial.

- Autor: Antônio Carlos Durães da Silva
- Semestre: 2022/1

As implementações foram realizadas no ambiente [SWISH](https://swish.swi-prolog.org/), plataforma online para desenvolvimento Prolog.

## Problemas, dúvidas e decisões de implementação

### Questão 1: Corrida

#### Divergência entre nomes

Há alguns nomes que dão a entender que são a mesma pessoa, mas estão levemente divergentes.

Este problema foi reportado, contudo não recebemos a relação de qual versão do nome deveríamos adotar. Os suspostos nomes são:
- "Eduardo Eugêncio" e "Eduardo Eugenio" (optei por "Eduardo Eugenio")
- "Nauvia Novais" e "Nauvia Novai" (optei por "Nauvia Novai**s**")
- "Carla Correia" e "Carla Correa" (optei por "Carla Correia")
- "Kaio Kiefer" e "Kaio Keifer" (optei por "Kaio Kiefer")

#### Divergência de interpretação

Em algumas conversas com professor (IA), foi passado que nossa resolução deveria entregar as possíveis listas que não contradigam as regras. Contudo, como na descrição da questão diz que _"defina um predicado, race(Ranking), que seja **verdadeiro** se a lista, Ranking, contiver os competidores da corrida em uma ordem de chegada que não contradiga nenhum fato"_, então interpretei que a lista seria recebida como entrada e que o predicado deveria apenas confirmar se a lista está em uma ordem aceita (coerente com os fatos). Optei por seguir a descrição.

#### Ordens inconclusivas

Há cenários (arranjos da lista de entrada) que não é possível relacionar um corredor com outro, uma vez que não uma ligação direita entre eles e nem intermediários que os conectem para que seja possível inferir uma ordem entre eles. Por padrão, nesse cenários inconclusivos, o retorno foi definido como **true**, uma vez que a entrada inconclusiva não contradiz nenhum fato da base.

Um exemplo de ordem inconclusiva é a lista que contém Davi Dantas e Fábio Freitas:
race([davi_dantas, fabio_freitas]).
race([fabio_freitas, davi_dantas]).

## Questões implementadas

### Questão 1: Corrida

Arquivo:

[q1.pl](https://github.com/IFES-MPCA/prog_logica/blob/main/src/q1.pl) (Versão em que os nomes dos corredores **NÃO** são string)

[q1_string.pl](https://github.com/IFES-MPCA/prog_logica/blob/main/src/q1_string.pl) (Versão onde os nomes são string e acentuadas)

Os predicados desenvolvidos foram:
- **antes_imediato(A, B):** Verifica se existem algum fato que relacione diretamente o corredor A com o corredor B.
- **antes(A, Z):** Verifica se o corredor A chegou antes de Z, existindo um fato que relacione diretamente A com Z **ou** fatos que indiquem que A chegou antes de um terceiro corredor e fatos que indiquem que esse terceiro corredor chegou antes de Z.
- **depois(A, Z)**: Verifica se o corredor A chegou após Z. Usa o método `antes` como atalho.
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
