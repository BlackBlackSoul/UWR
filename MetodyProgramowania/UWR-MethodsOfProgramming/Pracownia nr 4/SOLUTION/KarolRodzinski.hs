{-# LANGUAGE Safe #-}
module KarolRodzinski (typecheck, eval) where

import AST
import DataTypes

-- Zadanie opieralo sie na napisaniu modulu eksportujacego dwie funkcje eval oraz typechechk.
-- W pliku dotyczacym pracowni mozemy dowiedziec sie jak wygladaja reguly wnioskowania dla tego jezyka.
-- Nasza praca sprowadzala sie do przepisania tych regul do Haskella. Trudnosciami mogly byc rozne zwracane 
-- przez typy funkcji eval, to znaczym nasz program nie zawsze zwraca int, to dzieje sie jedynie na koncu, 
-- ale w trakcie dzialania funkcja eval moze zwrocic rowniez wartosc typu bool, zatem przyjmujemy, iz
-- nasze dane tzn. Typy to: bool type, int type oraz error, a wartosci, to bool value, int value oraz nowa
-- wartosc DivisionByZero. Definiujemt rowniez kilka funkcji, ktore przyporzadkuja wartosci oraz typ kazdej zmiennej, 
-- rozszerzone funkcje typePrim oraz valuePrim, ktore uwzgledniaja wczesniej wspomniana trudnosc. Pobawilem sie takze
-- z systemem informowania o bledzie wykonania, dlatego typ Error moze miec argument w postaci Stringa, ktory
-- informuje nas z jaka trudnoscia spotkal sie program. Pozwala to na szybkie diagnozowanie bledow.  

data TypyProgramu p = BooleanTyp p | IntegerTyp p | Err p String
data WartosciProgramu = BooleanValue Bool | IntegerValue Integer | DivisionByZero  
-- typ funkcji
typZmiennej :: p -> [(Var, TypyProgramu p)] -> Var -> TypyProgramu p
-- definicje funkcji przyporzadkowania typow
typZmiennej p [] var = Err p ("Var Error: Nieznana zmienna" ++ var)
typZmiennej p ((x,y):xs) var = 
    case var == x of
        True -> y
        False -> typZmiennej p xs var
-- typ funkcji
wartoscZmiennej :: [(Var, WartosciProgramu)] -> Var -> WartosciProgramu
-- definicje funkcji przyporzadkowania wartosc
wartoscZmiennej ((val, int):xs) var = 
    case (val == var) of
        True -> int
        False -> wartoscZmiennej xs var
-- typ standardowej funkcji typ
typecheck :: [Var] -> Expr p -> TypeCheckResult p
-- definicja standardowej funkcji typ
typecheck var expr =
    let var_ext = map go var where
        go x = (x, IntegerTyp (getData expr))
    in case typecheckPrim var_ext expr of
        IntegerTyp p -> Ok
        BooleanTyp p -> Error p ("TypeCheckError: bool, a mial byc int")
        Err p mesg -> Error p mesg
-- typ rozszerzonej funkcji typu
typecheckPrim :: [(Var, TypyProgramu p)] -> Expr p -> TypyProgramu p
-- definicja rozszerzonej funkcji typ
typecheckPrim zmienne (EVar p var) = typZmiennej p zmienne var
typecheckPrim _ (ENum p _) = IntegerTyp p
typecheckPrim _ (EBool p _) = BooleanTyp p
-- typy wyrazen z operatorami unarnymi
typecheckPrim zmienne (EUnary p unop e1) =
    case typecheckPrim zmienne e1 of
        BooleanTyp p -> case unop of
            UNot -> BooleanTyp p
            UNeg -> Err p ("TypeCheckError: Operator (-) przy wyrazeniu typu bool")
        IntegerTyp p -> case unop of
            UNeg -> IntegerTyp p
            UNot -> Err p ("TypeCheckError: Operator (not) przy wyrazeniu typu int")
        Err p mesg -> Err p mesg
-- typy wyrazen z operatorai binarnymi        
typecheckPrim zmienne (EBinary p binop e1 e2) =
    let x = typecheckPrim zmienne e1
    in let y = typecheckPrim zmienne e2 
    in case (x, y) of
            -- mozliwe typy wyrazen 
            (Err p1 m, _) -> Err p1 m
            (_, Err p1 m) -> Err p1 m
            (BooleanTyp _, BooleanTyp _) -> case binop of
                BAnd -> BooleanTyp p
                BOr -> BooleanTyp p
                _ -> Err p ("TypeCheckError: Operator int przy bool")
            (IntegerTyp _, IntegerTyp _) -> case binop of
                BEq -> BooleanTyp p
                BNeq -> BooleanTyp p
                BLt -> BooleanTyp p 
                BGt -> BooleanTyp p
                BLe -> BooleanTyp p
                BGe -> BooleanTyp p
                BAdd -> IntegerTyp p 
                BSub -> IntegerTyp p
                BMul -> IntegerTyp p
                BDiv -> IntegerTyp p
                BMod -> IntegerTyp p
                _ -> Err p ("TypeCheckError: Operator bool przy int")
            _ -> Err p ("TypeCheckError: Rozne typy argumentow operatora")
-- typy wyrazen Let In
typecheckPrim zmienne (ELet p var e1 e2) =
    case typecheckPrim zmienne e1 of
        Err p1 m -> Err p1 m
        t -> typecheckPrim ((var,t):zmienne) e2
-- typy wyrazen If
typecheckPrim zmienne (EIf p e0 e1 e2) =
    case typecheckPrim zmienne e0 of 
        BooleanTyp p1 -> let x = typecheckPrim zmienne e1
            in let y = typecheckPrim zmienne e2
            in case (x,y) of
                (Err p2 m, _) -> Err p2 m
                (_, Err p2 m) -> Err p2 m
                (BooleanTyp _, BooleanTyp _) -> x
                (IntegerTyp _, IntegerTyp _) -> x
                _ -> Err (getData e1) ("TypeCheckError: rozne typy wyrazen")
        Err p1 mesg -> Err p1 mesg
        _ -> Err p ("TypeCheckError: zly typ warunku")
-- typ standardowej funkcji eval
eval :: [(Var,Integer)] -> Expr p -> EvalResult
 -- definicja standardowej funkcji eval
eval zmienne expr = 
    let zmienne_big = map go zmienne where
        go (var, int) = (var, IntegerValue int)
    in case evalPrim zmienne_big expr of 
        IntegerValue val -> Value val
        _ -> RuntimeError
-- typ rozszerzonej funkcji eval
evalPrim :: [(Var, WartosciProgramu)] -> Expr p -> WartosciProgramu
-- definicja rozszerzonej funkcji eval
evalPrim srodowisko (EVar _ var) = wartoscZmiennej srodowisko var
evalPrim _ (ENum _ int) = IntegerValue int
evalPrim _ (EBool _ bool) = BooleanValue bool
-- wartosc wyrazen z operatorami unarnymi
evalPrim srodowisko (EUnary _ unop expr) =
    case evalPrim srodowisko expr of
        DivisionByZero -> DivisionByZero
        IntegerValue v -> IntegerValue (- v)
        BooleanValue v -> BooleanValue (not v)
-- wartosc wyrazen z operatorami binarnymi  
evalPrim srodowisko (EBinary _ binop e1 e2) = 
    case evalPrim srodowisko e1 of 
        DivisionByZero -> DivisionByZero
        IntegerValue v1 -> case evalPrim srodowisko e2 of
            DivisionByZero -> DivisionByZero
            IntegerValue v2 -> case binop of 
                -- wartosc wyrazen z operatorami porownania
                BEq -> BooleanValue (v1 == v2)
                BNeq -> BooleanValue (v1 /= v2)
                BLt -> BooleanValue (v1 < v2)
                BGt -> BooleanValue (v1 > v2)
                BLe -> BooleanValue (v1 <= v2)
                BGe -> BooleanValue (v1 >= v2)
                -- wartosc wyrazen z operatorami grupy multiplikatywnej
                BAdd -> IntegerValue (v1 + v2)
                BSub -> IntegerValue (v1 - v2)
                BMul -> IntegerValue (v1 * v2)
                BDiv -> case v2 == 0 of
                    False -> IntegerValue (v1 `div` v2)
                    True -> DivisionByZero
                BMod -> case v2 == 0 of
                    False -> IntegerValue (v1 `mod` v2)
                    True -> DivisionByZero
                -- wartosc wyrazen boolowskich
        BooleanValue p1 -> case evalPrim srodowisko e2 of 
            DivisionByZero -> DivisionByZero 
            BooleanValue p2 -> case binop of
                BAnd -> BooleanValue (p1 && p2)
                BOr -> BooleanValue (p1 || p2)
-- wartosc wyrazen typu Let In
evalPrim srodowisko (ELet _ var e1 e2) =
    case evalPrim srodowisko e1 of
        DivisionByZero -> DivisionByZero    
        av -> evalPrim ((var, av):srodowisko) e2
-- wartosc wyrazen typu If
evalPrim srodowisko (EIf _ e0 e1 e2) =
    case evalPrim srodowisko e0 of
        DivisionByZero -> DivisionByZero
        BooleanValue True -> evalPrim srodowisko e1
        BooleanValue False -> evalPrim srodowisko e2
