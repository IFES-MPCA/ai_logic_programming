% 1ª linha de dados
antes_imediato('Fábio Freitas', 'Helena Hypólito').
antes_imediato('Helena Hypólito', 'Bruna Barros').
antes_imediato('Helena Hypólito', 'Quincas Quaresma').
antes_imediato('Helena Hypólito', 'Eduardo Eugenio').
antes_imediato('Helena Hypólito', 'Nauvia Novais').

% 2ª linha de dados
antes_imediato('Tadeu Torres', 'Renato Ramos').
antes_imediato('Tadeu Torres', 'Carla Correia').
antes_imediato('Davi Dantas', 'Tadeu Torres').
antes_imediato('Kaio Kiefer', 'Tadeu Torres').

% 3ª linha de dados
antes_imediato('Gina Gomes', 'Miguel Moraes').
antes_imediato('Gina Gomes', 'Paula Prado').
antes_imediato('Gina Gomes', 'Úrsula Uliana').
antes_imediato('Fábio Freitas', 'Gina Gomes').
antes_imediato('Nauvia Novais', 'Gina Gomes').
antes_imediato('Tadeu Torres', 'Gina Gomes').

% 4ª linha de dados
antes_imediato('Fábio Freitas', 'Ivan Ignácio').
antes_imediato('Ivan Ignácio', 'Joana Justo').
antes_imediato('Ivan Ignácio', 'Yves Young').
antes_imediato('Ivan Ignácio', 'Kaio Kiefer').
antes_imediato('Ivan Ignácio', 'Luana Lessa').

% 5ª linha de dados
antes_imediato('Zaíra Zaia', 'André Alves').
antes_imediato('Renato Ramos', 'Zaíra Zaia').
antes_imediato('Walter Watanabe', 'Zaíra Zaia').

% 6ª linha de dados
antes_imediato('Yves Young', 'Bruna Barros').
antes_imediato('Eduardo Eugenio', 'Bruna Barros').
antes_imediato('Paula Prado', 'Bruna Barros').
antes_imediato('Bruna Barros', 'André Alves').
antes_imediato('Bruna Barros', 'Zaíra Zaia').

% 7ª linha de dados
antes_imediato('Davi Dantas', 'Xena Xavier').
antes_imediato('Davi Dantas', 'Joana Justo').
antes_imediato('Davi Dantas', 'Renato Ramos').
antes_imediato('Davi Dantas', 'Helena Hypólito').
antes_imediato('Simone Souza', 'Davi Dantas').

% 8ª linha de dados
antes_imediato('Valdo Villares', 'Úrsula Uliana').
antes_imediato('Valdo Villares', 'Otto Orelio').
antes_imediato('Walter Watanabe', 'Valdo Villares').
antes_imediato('Kaio Kiefer', 'Valdo Villares').
antes_imediato('Quincas Quaresma', 'Valdo Villares').
antes_imediato('Paula Prado', 'Valdo Villares').

% 9ª linha de dados
antes_imediato('Kaio Kiefer', 'Xena Xavier').
antes_imediato('Xena Xavier', 'Renato Ramos').
antes_imediato('Xena Xavier', 'Joana Justo').
antes_imediato('Xena Xavier', 'Carla Correia').

% 10ª linha de dados
antes_imediato('Quincas Quaresma', 'Luana Lessa').
antes_imediato('Nauvia Novais', 'Luana Lessa').
antes_imediato('Luana Lessa', 'Walter Watanabe').
antes_imediato('Luana Lessa', 'Otto Orelio').

% 11ª linha de dados
antes_imediato('Úrsula Uliana', 'Otto Orelio').
antes_imediato('Úrsula Uliana', 'Zaíra Zaia').
antes_imediato('Miguel Moraes', 'Úrsula Uliana').
antes_imediato('Carla Correia', 'Úrsula Uliana').

% A chegou antes de Z, se A chegou imediatamente antes 
antes(A, Z) :- antes_imediato(A, Z).

% Ou, se o antecessor imediato de Z possuir algum antecessor (imediato ou não) ligado a A
/* Exemplo:
 * Considere a sequência de entrada sendo os predicados [(a, c), (b, c), (c, d), (d, e), (e, f)].
 * antes(a, f) deve retornar true mesmo que não haja relação direta entre "a" e "f",
 * uma vez que há uma relação indireta passando por a, c, d, e, f.
 * 
 * Teste de mesa:
 * 1ª chamada | Interm = e | antes(a, f) :- antes_imediato(e, f), antes(a, e).
 * 2ª chamada | Interm = d | antes(a, e) :- antes_imediato(d, e), antes(a, d).
 * 3ª chamada | Interm = c | antes(a, d) :- antes_imediato(c, d), antes(a, c).
 * 4ª chamada | Interm = _ | antes(a, c) :- antes_imediato(a, c) -> true
 */
antes(A, Z) :- antes_imediato(Interm, Z), antes(A, Interm).

% caso base para fim da lista
race([_]).

% verificar se cada par de elementos respeita a ordem armazenada no banco de regras
race([Corredor1, Corredor2 | T]) :-
  antes(Corredor1, Corredor2),
  
  % chame o procedimento novamente passando uma sublista que é a concatenação do iésimo + 1 corredor com a cauda da lista de entrada
  race([Corredor2 | T]).
