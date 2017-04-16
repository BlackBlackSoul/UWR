:- module(karol_rodzinski_tests, [resolve_tests/5, prove_tests/4]).
:- op(200, fx, ~).
:- op(500, xfy, v).

resolve_tests(prosty_test, q, p v q, ~q v r, p v r).
resolve_tests(sredni_test, z, s v ~q v z v ~a v b v ~e v a v ~d, s v q v q v c v a v d v a v d v ~z, s v ~q v ~a v b v ~e v a v ~d v q v c v d).
resolve_tests(trudny_test, q, r v a v a v p v b v r v z v d v g v w v p v z v d v s v b v g v e v z v s v b v g v p v q, e v r v p v z v s v z v e v r v s v m v p v z v r v w v p v c v s v r v w v b v e v z v a v ~q, r v a v p v b v z v d v w v s v m v c v g).
resolve_tests(pojedyncze zmienne, p, p v p v p v p v p v p v p v p v p v p v p v p v p v p v p v p v p v p v p v p v ~q, ~p v q v q v q v q v q v q v q v q v q v q v q v q, ~q v q).
resolve_tests(uproszczenie_wyniku, z, z v z v q v r v z v p v ~r, p v ~z v ~r v ~z v u, q v r v p v ~r v u).   
resolve_tests(pojedynczy_literal, q, q, p v r v s v ~q, p v r v s).
resolve_tests(pusty_literal_pojedynczy, p, p, ~p, []).
resolve_tests(pusty_literal_wiele, q, q v q v q v q v q v q v q v q v q v q v q v q v q v q v q v q v q v q v q v q v q v q v q v q v q v q v q v q v q v q, ~q v ~q v ~q v ~q v ~q v ~q v ~q v ~q v ~q v ~q v ~q v ~q v ~q v ~q v ~q v ~q v ~q v ~q, []).
resolve_tests(roznica_jednej_zmiennej, p, r v s v u v ~o v w v m v a v z v ~d v ~k v k v ~q v p, r v s v u v ~o v w v m v ~p v a v z v ~d v ~k v k v ~q, r v s v u v ~o v w v m v a v z v ~d v ~k v k v ~q).
resolve_tests(roznica_jednej_zmiennej_uproszczenie, q, a v d v g v ~s v e v r v s v q v ~w v b v a v d v q v c v b v e v a v d v g v s v a v ~d v r v w, a v d v g v ~s v e v r v s v ~q v ~w v b v a v d v c v b v e v a v d v g v s v a v ~d v r v w, a v d v g v ~s v e v r v s v ~w v b v c v ~d v w).

prove_tests(wylaczony_srodek, validity, [p v ~p], sat).
prove_tests(jedna_klauzula_jedna_zmienna, validity, [p], sat).
prove_tests(jedna_klauzula_jedna_zmienna_zanegowana,validity,[~p], sat).
prove_tests(pusta_klauzula, validity, [[]], unsat).
prove_tests(brak_klauzul, validity, [], sat).
prove_tests(prosty_brak_spelnialnosci, validity, [p, ~p], unsat).
prove_tests(podwojony_prosty_brak_spelnialnosci, validity, [~p v q,p,~q], unsat).
prove_tests(brak_spelnialnosci, validity, [p, ~p v q ,~q], unsat).
prove_tests(brak_spelnialnosci1, validity, [~q v p v ~r,r,p,q,~q, q v ~p v r], unsat).
prove_tests(jedna_zmienna, validity, [p v p v p v p v p v p v p v p v p v p v p v p v p v p v p v p v p v p], sat).
prove_tests(prosty_test, validity, [p v q v ~r, ~p v q, r v q, ~q, p], unsat).
prove_tests(prosty_test1, validity, [~p v ~q v r, ~p v q, ~r v ~s, ~r v s], sat).
prove_tests(prosty_test2, validity, [p v q v r, p v ~q v ~r, ~p v q v ~r, ~p v ~q v r], sat).
prove_tests(prosty_test3, validity, [~p v r, ~r v s, p v ~s, ~r], sat).
prove_tests(prosty_test4, validity, [~p v q, ~q v p, ~t v s, ~s v t], sat).
prove_tests(prosty_test5, validity, [p v q v r, ~r v ~q v ~p, ~q v r, ~r v p], sat).
prove_tests(prosty_test6, validity, [p v q, ~q v s, ~s v ~q v ~p, ~s v q, ~q v p], sat).
prove_tests(prosty_test7, validity, [p v q v s, ~p v ~q v r, ~p v s, ~q v ~s, p v ~q, r v s], sat).
prove_tests(prosty_test8, validity, [p v q v ~r, ~q v ~s, s v p, ~r v s], sat).
prove_tests(prosty_test9, validity, [a v b v c v d v e, e], sat).
prove_tests(excluded_middle, validity, [p v ~p], sat).
prove_tests(empty_set, validity, [], sat).
prove_tests(empty_clause, validity, [[]], unsat).
prove_tests(unsat1, validity, [p, ~p], unsat).
prove_tests(unsat2, validity, [p v q, p v ~p, []], unsat).
prove_tests(sat1, validity, [~p v q, ~q v r, ~r v s, ~s], sat).
prove_tests(malo_klauzul_malo_zmiennych_1, validity, [p], sat).
prove_tests(malo_klauzul_malo_zmiennych_2, validity, [~p], sat).
prove_tests(malo_klauzul_malo_zmiennych_3, validity, [p v p], sat).
prove_tests(malo_klauzul_malo_zmiennych_4, validity, [~p v ~p], sat).
prove_tests(malo_klauzul_malo_zmiennych_5, validity, [p v q], sat).
prove_tests(malo_klauzul_malo_zmiennych_6, validity, [p v ~q], sat).
prove_tests(malo_klauzul_malo_zmiennych_7, validity, [~p v ~q], sat).
prove_tests(malo_klauzul_duzo_zmiennych_1, validity, [p v q v r], sat).
prove_tests(malo_klauzul_duzo_zmiennych_2, validity, [p v q v ~r], sat).
prove_tests(malo_klauzul_duzo_zmiennych_3, validity, [p v ~q v ~r], sat).
prove_tests(malo_klauzul_duzo_zmiennych_4, validity, [~p v ~q v ~r], sat).
prove_tests(duzo_klauzul_malo_zmiennych_1, validity, [p, p], sat).
prove_tests(duzo_klauzul_malo_zmiennych_2, validity, [p, q], sat).
prove_tests(duzo_klauzul_malo_zmiennych_3, validity, [p, ~q], sat).
prove_tests(duzo_klauzul_malo_zmiennych_4, validity, [p v q, ~p v q, ~p v ~q], sat).
prove_tests(duzo_klauzul_duzo_zmiennych_1, validity, [~p v r, p v q v r, p v ~q v r], sat).
prove_tests(duzo_klauzul_duzo_zmiennych_2, validity, [p, p v r, r v q, p v ~r], sat).
prove_tests(duzo_klauzul_duzo_zmiennych_3, validity, [~q v r, ~r v p, p v q v r, ~r v ~q v ~p], sat).
prove_tests(duzo_klauzul_duzo_zmiennych_4, validity, [p, ~p v q, ~q v r, ~p v ~r v s], sat).
prove_tests(duzo_klauzul_duzo_zmiennych_5, validity, [p, q, r, s, u, w, ~y, z], sat).
prove_tests(pusta_pusta, validity, [[]], unsat).
prove_tests(negacja, validity, [p, ~p], unsat).
prove_tests(wieksza_negacja, validity, [p, ~p, q, r, s, y], unsat).
prove_tests(pusta, validity, [], sat).
prove_tests(wylaczony_srodek_val, validity, [p v ~p], sat).
prove_tests(wiekszy_wylaczony_srodek, validity, [p v ~p v q v r v s], sat).


prove_tests(puste_klazule_duzo, performance, [[], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []], unsat).
prove_tests(duzo_zmiennych_tricky, performance, [a v c v d v e v k v l v m v a v c v d v e v k v l v m v a v c v d v e v k v l v m, b, ~b], unsat).
prove_tests(zanegowane_zmienne,performance,[a1 v a2 v a3 v a4 v a5 v a6 v a7 v a8 v a9 v a10 v a11 v a12 v a13 v a14 v a15 v a16 v a17 v a18 v a19 v a20 v a21 v a22 v a23 v a24, ~a1 v ~a2 v ~a3 v ~a4 v ~a5 v ~a6 v ~a7 v ~a8 v ~a9 v ~a10 v ~a11 v ~a12 v ~a13 v ~a14 v ~a15 v ~a16 v ~a17 v ~a18 v ~a19 v ~a20 v ~a21 v ~a22 v ~a23 v ~a24], sat).
prove_tests(pusta_klauzula_tricky, performance, [a v c v d v e v k v l v m v a v c v d v e v k v l v m v a v c v d v e v k v l v m v u v p v e v r v q, a v c v d v e v k v l v m v a v c v d v e v k v l v m v a v c v d v e v k v l v m, []], unsat).
prove_tests(powtarzalny_zbior_klauzul, performance, [a v b v c v ~d v e, a v b v c v ~d v e, a v b v c v ~d v e, a v b v c v ~d v e, a v b v c v ~d v e, a v b v c v ~d v e, a v b v c v ~d v e, a v b v c v ~d v e, a v b v c v ~d v e, a v b v c v ~d v e, a v b v c v ~d v e], sat).
prove_tests(duzo_zmiennych_zmudne, performance, [q1 v q2 v q3 v q4 v q5 v q6 v q7 v q8 v q9 v q10 v q11 v q12 v q13 v q14 v q15 v q16 v q17 v q18 v q19 v q20 v q21 v q22 v q23 v q24 v q25 v q26 v q27 v q28 v q29 v q30 v q31 v q32 v q33 v q34 v q35 v q36 v q37 v q38 v q39 v q40 v q41 v q42 v q43 v q44 v q45 v q46 v q47 v q48 v q49 v q50 v q51 v q52 v q53 v q54 v q55 v q56 v q57 v q58 v q59 v q60 v q61 v q62 v q63 v q64 v q65 v q66 v q67 v q68 v q69 v q70 v q71 v q72 v q73 v q74 v q75 v q76 v q77 v q78 v q79 v q80 v q81 v q82 v q83 v q84 v q85 v q86 v q87 v q88 v q89 v q90 v q91 v q92 v q93 v q94 v q95 v q96 v q97 v q98 v q99 v q100, ~p101, p101], unsat).
prove_tests(kosa_test_tylkooptymalizacja_killer, performance, [~t v ~f v u v ~p v d, ~j v ~r v b v k v ~s, ~i v j v k, ~d v ~l v g v f, ~c v ~u v ~r v ~n v q, c v ~h v ~j, h v j, o v ~j v r v f v ~p, q v r v ~q v ~s, t v t v ~o v t v ~e], sat).