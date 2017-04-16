:- module(karol_rodzinski_tests, [tests/5]).

:- op(200, fx, ~).
:- op(500, xfy, v).

tests(wylaczony_srodek, validity, [p v ~p], 500, solution([(p,t)])).
tests(prosta_tautologia, validity, [p v q v !q v w v !w, p v !p], 850, solution(count(8))).
tests(zmudne, validity, [a v b v c v d v e v f v g v h v j v k, ~k], 1500, solution([(k, f), (a,t)])). 
tests(ta_sama_zmienne_jedna_klauzula, validity, [a v a v a v a v a v a v a v a v a v a], 600, solution([count(1)])).
tests(niespelnialna_szybka, validity, [a, ~a], 500, solution(count(0))).
tests(niespelnialna_dluga, validity, [a, ~a, b, ~b, c, ~c, d, ~d, e, ~e, h, ~h, g, ~g, e, ~e], 2000, solution(count(0))).
tests(zbior_klauzul, validity, [a v b v c v d v e, ~a v ~b v ~c v ~d v ~e], 2000, solution([(a ,t), (b, f), (c,t), (d,f), (e,t)])).
tests(smieszne, validity, [a v b, c v ~d v e, m v ~g, ~h v ~i, ~j v k, l, ~l], 1500, solution(count(0))).
tests(zbior_klauzul_jedna_pusta, validity, [p v q, r v s, [], q v s], 700, count(0)).
tests(najprostszy, validity, [p], 500, solution([(p, t)])).
tests(pusta_klauzula, validity, [[]], 500, count(0)).
tests(brak_klauzul, validity, [], 500, count(1)).
tests(prawo_pochlaniania, validity, [p, p v r], 600, solution([(p,t), (r,t)])).
tests(duzo_wartsciowan, validity, [~p, ~q, ~r, ~w, ~t, ~s, ~m, ~u], 1500, solution(count(8))).
tests(ta_sama_zmienne_wiele_klauzul, validity, [a, a, a, a, a, a, a, a, a, a], 750, solution([(a, t)])).
tests(duzo_wartsciowan_drugie_spelniajacych, validity, [a v b v c v d v e v m v g v h v i v j], 2500, solution(count(1023))).
tests(brak_spelnialnosci, validity, [~s v r, ~q v s, p v q, ~r v ~s, ~p v q], 800, solution(count(0))).
tests(inne_zmienne, validity, [a v ~b v c, d v e v ~m], 1300, solution([(a,f),(b,f),(c,f),(d,f),(e,f),(m,f)])).
tests(zadanie_z_kolokwium, validity, [~p v ~q v r, ~p v q, ~r v ~s, ~r v s], 1200, solution([(p, f), (r, f), (q, t), (s, t)])).
tests(zadanie_z_kolokwium_drugie, validity, [p v q v r, p v ~q v ~r, ~p v q v ~r, ~p v ~q v r], 1200, solution([(p ,t), (q ,t), (r ,t)])).
tests(zadanie_z_kolokwium_trzecie, validity, [~p v r, ~r v s, p v ~s, ~r], 800, solution([(p, f), (r, f), (s ,f)])).
tests(zadanie_z_kolokwium_czwarte, validity, [~p v q, ~q v p, ~t v s, ~s v t], 600, count(4)).
tests(duzo_zmiennych_tricky_one, performance, [a v c v d v e v k v l v m v a v c v d v e v k v l v m v a v c v d v e v k v l v m, b, ~b], 500, count(0)).
tests(duzo_wartsciowan_drugie, performance, [q v w v e v r v y v u v i v o v p v a v s v d v g v h v j v k v l v z v c v ~p v b v n v m], 500, solution([(q,f),(w,f),(e,f),(r,f),(t,f),(y,f),(u,f),(i,f),(o,f),(p,f),(a,f),(s,f),(d,f),(g,f),(h,f),(j,f),(k,f),(l,f),(z,f),(c,f),(v,f),(b,f),(n,f),(m,f)])).
tests(duzo_zmiennych_tricky_pusta, performance, [a v c v d v e v k v l v m v a v c v d v e v k v l v m v a v c v d v e v k v l v m v u v p v e v r v q, a v c v d v e v k v l v m v a v c v d v e v k v l v m v a v c v d v e v k v l v m, []], 500, count(0)).
tests(powtarzalny_zbior_klauzul, performance, [a v b v c v ~d v e, a v b v c v ~d v e, a v b v c v ~d v e, a v b v c v ~d v e, a v b v c v ~d v e, a v b v c v ~d v e, a v b v c v ~d v e, a v b v c v ~d v e, a v b v c v ~d v e, a v b v c v ~d v e, a v b v c v ~d v e], 500, solution([(a,t),(b,t),(c,f),(d,f),(e,f)])).
tests(brak_spelnialnosci_wiele_zmiennych, performance, [q1 v q2 v q3 v q4 v q5 v q6 v q7 v q8 v q9 v q10 v q11 v q12 v q13 v q14 v q15 v q16 v q17 v q18 v q19 v q20 v q21 v q22 v q23 v q24 v q25 v q26 v q27 v q28 v q29 v q30 v q31 v q32 v q33 v q34 v q35 v q36 v q37 v q38 v q39 v q40 v q41 v q42 v q43 v q44 v q45 v q46 v q47 v q48 v q49 v q50 v q51 v q52 v q53 v q54 v q55 v q56 v q57 v q58 v q59 v q60 v q61 v q62 v q63 v q64 v q65 v q66 v q67 v q68 v q69 v q70 v q71 v q72 v q73 v q74 v q75 v q76 v q77 v q78 v q79 v q80 v q81 v q82 v q83 v q84 v q85 v q86 v q87 v q88 v q89 v q90 v q91 v q92 v q93 v q94 v q95 v q96 v q97 v q98 v q99 v q100, ~p101, p101], 500, count(0)).