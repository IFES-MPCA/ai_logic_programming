% 1ª linha de dados
antes_imediato(fabio_freitas, helena_hypolito).
antes_imediato(helena_hypolito, bruna_barros).
antes_imediato(helena_hypolito, quincas_quaresma).
antes_imediato(helena_hypolito, eduardo_eugenio).
antes_imediato(helena_hypolito, nauvia_novais).

% 2ª linha de dados
antes_imediato(tadeu_torres, renato_ramos).
antes_imediato(tadeu_torres, carla_correia).
antes_imediato(davi_dantas, tadeu_torres).
antes_imediato(kaio_kiefer, tadeu_torres).

% 3ª linha de dados
antes_imediato(gina_gomes, miguel_moraes).
antes_imediato(gina_gomes, paula_prado).
antes_imediato(gina_gomes, ursula_uliana).
antes_imediato(fabio_freitas, gina_gomes).
antes_imediato(nauvia_novais, gina_gomes).
antes_imediato(tadeu_torres, gina_gomes).

% 4ª linha de dados
antes_imediato(fabio_freitas, ivan_ignacio).
antes_imediato(ivan_ignacio, joana_justo).
antes_imediato(ivan_ignacio, yves_young).
antes_imediato(ivan_ignacio, kaio_kiefer).
antes_imediato(ivan_ignacio, luana_lessa).

% 5ª linha de dados
antes_imediato(zaira_zaia, andre_alves).
antes_imediato(renato_ramos, zaira_zaia).
antes_imediato(walter_watanabe, zaira_zaia).

% 6ª linha de dados
antes_imediato(yves_young, bruna_barros).
antes_imediato(eduardo_eugenio, bruna_barros).
antes_imediato(paula_prado, bruna_barros).
antes_imediato(bruna_barros, andre_alves).
antes_imediato(bruna_barros, zaira_zaia).

% 7ª linha de dados
antes_imediato(davi_dantas, xena_xavier).
antes_imediato(davi_dantas, joana_justo).
antes_imediato(davi_dantas, renato_ramos).
antes_imediato(davi_dantas, helena_hypolito).
antes_imediato(simone_souza, davi_dantas).

% 8ª linha de dados
antes_imediato(valdo_villares, ursula_uliana).
antes_imediato(valdo_villares, otto_orelio).
antes_imediato(walter_watanabe, valdo_villares).
antes_imediato(kaio_kiefer, valdo_villares).
antes_imediato(quincas_quaresma, valdo_villares).
antes_imediato(paula_prado, valdo_villares).

% 9ª linha de dados
antes_imediato(kaio_kiefer, xena_xavier).
antes_imediato(xena_xavier, renato_ramos).
antes_imediato(xena_xavier, joana_justo).
antes_imediato(xena_xavier, carla_correia).

% 10ª linha de dados
antes_imediato(quincas_quaresma, luana_lessa).
antes_imediato(nauvia_novais, luana_lessa).
antes_imediato(luana_lessa, walter_watanabe).
antes_imediato(luana_lessa, otto_orelio).

% 11ª linha de dados
antes_imediato(ursula_uliana, otto_orelio).
antes_imediato(ursula_uliana, zaira_zaia).
antes_imediato(miguel_moraes, ursula_uliana).
antes_imediato(carla_correia, ursula_uliana).

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
race([Corredor1, Corredor2 | T]) :- antes(Corredor1, Corredor2), race([Corredor2 | T]).