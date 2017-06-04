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


-- Dodatkowa trudnoscia, z ktora przyszlo nam sie zmierzyc w tym zadaniu sa funkcje, wyrazenia matching_list, pary oraz ich 
-- projekcje, funkcje_unit() a takze listy wyrazen typu bool oraz int. Nieodzowna pomoca w zadaniu okazal sie plik AST.hs dla tej 
-- pracowni, poniewaz bardzo dobrze ukazywal strukture abstrakcyjnego drzewa rozbioru poszczegolnych wyrazen, zatem bezposredni dostep
-- do skladowych np. funkcji nie wydawal sie juz taki trudny.


---------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------ROZWIAZANIE WRAZ Z OBJASNIENIAMI ----------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------

-- Dwa nowe typy zdefiniowane na potrzeby rozwiazania tj. 
-- 1)TypyProgramu, ktory mowi nam, ze cos moze bym dobrym typem, ewentualnie zlym 
-- wraz z informacja (konstrukcja podobna do wyrazeniu typu Maybe Just).
-- 2)WartosciProgramy - bez zbednej filozofii, czyli co moze byc typem wynikowym naszego programu.
data TypyProgramu p = OKType Type | ErrType p String
data WartosciProgramu = IntegerValue Integer | BooleanValue Bool | UnitValue | PairValue WartosciProgramu WartosciProgramu | ListValue [WartosciProgramu] | DivisionByZero


---------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------TypeChecker--------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
-- Mankamentem mogła okazać się zabawa z obsluga bledow, jednak jest ona dosc podobna do zeszlej pracowni, to znaczy bledy przekazujemy wyzej.
-- Pierwsza czesc to wlasciwie poprzednia pracownia, a jedynie wymogiem bylo dodanie funkcji typecheckPrim dla wyrazen dodanych na tej liscie.
-- Wystarczylo podazac za plikiem AST.hs oraz regulami z pliku ze SKOS. W porownanie do poprzedniej listy uproscilem jedynie system typw, to znaczy
-- ze jest OK albo Err, czyli powyzsza konstrukacja typu, ktora niejako nawiazauje do Maybe, Just.   


-- funkcja pomocnicza, ktora bezposrednio odnosi sie do pliku AST.hs, czyli wyszukiwanie funkcji w prorgamie poprzez odniesenie do typu FunctionDef
czyJestFun :: [FunctionDef p] -> FSym -> Maybe (FunctionDef p)
czyJestFun [] name = Nothing
czyJestFun (f1:funcDefinicje) name = 
    if funcName f1 == name 
        then Just f1
        else czyJestFun funcDefinicje name  

-- sprawdzenie typu funkcji 
funkcjaTyp :: [FunctionDef p] -> TypeCheckResult p
funkcjaTyp funcDefinicje =
    case funcDefinicje of
        [] -> Ok
        (function:rest) -> case typecheckPrim funcDefinicje [(funcArg function, OKType (funcArgType function))] (funcBody function) of
                    ErrType p mesg -> Error p mesg
                    OKType a -> if a == funcResType function 
                        then funkcjaTyp rest
                        else Error (funcPos function) ("Func err: Zly typ wynikowy funkcji")

-- typ standardowej funkcji sprawdzajacej typ
typecheck :: [FunctionDef p] -> [Var] -> Expr p -> TypeCheckResult p
-- definicja standardowej funkcji sprawdzajacej typ
typecheck funcDefinicje vars input =
    case funkcjaTyp funcDefinicje of
        Error p mesg -> Error p mesg
        _ -> let zmienneGood = map aux vars where
                    aux var = (var, OKType TInt)
                in case typecheckPrim funcDefinicje zmienneGood input of
                    OKType TInt -> Ok
                    OKType _ -> Error (getData input) ("TypeChecker Err: Zly typ")
                    ErrType p mesg -> Error p mesg

-- definicje funkcji przyporzadkowania typow
zmienneTyp :: p -> [(Var, TypyProgramu p)] -> Var -> TypyProgramu p
zmienneTyp p [] var = ErrType p ("Nieznana zmienna" ++  var)
zmienneTyp p ((value, posType):xs) var = 
    if value == var
     then posType 
     else zmienneTyp p xs var

-- typ rozszerzonej funkcji sprawdzajacej typ
typecheckPrim :: [FunctionDef p] -> [(Var, TypyProgramu p)] -> Expr p -> TypyProgramu p
-- definicja rozszerzonej funkcji sprawdzajacej typ
typecheckPrim funcDefinicje vars (EVar p var) = zmienneTyp p vars var
typecheckPrim funcDefinicje _ (ENum p _) = OKType TInt
typecheckPrim funcDefinicje _ (EBool p _) = OKType TBool

-- typy wyrazen z operatorami unarnymi
typecheckPrim funcDefinicje vars (EUnary p unop e1) =
    case typecheckPrim funcDefinicje vars e1 of
        OKType TBool -> case unop of
            UNot -> OKType TBool
            UNeg -> ErrType p ("TypeCheck Err: Operator (-) przy wyrazeniu typu boolowskim")
        OKType TInt -> case unop of
            UNeg -> OKType TInt
            UNot -> ErrType p ("TypeCheck Err: Operator (not) przy wyrazeniu typu int")
        ErrType p mesg -> ErrType p mesg

-- typy wyrazen z operatorai binarnymi   
typecheckPrim funcDefinicje vars (EBinary p binarnyOperator w1 w2) =
    let x = typecheckPrim funcDefinicje vars w1
    in let y = typecheckPrim funcDefinicje vars w2 
    in case (x, y) of
            (ErrType p1 mesg, _) -> ErrType p1 mesg
            (_, ErrType p1 mesg) -> ErrType p1 mesg
            (OKType TBool, OKType TBool) -> case binarnyOperator of
                BAnd -> OKType TBool
                BOr -> OKType TBool
                _ -> ErrType p ("TypeCheck Err: Operator int przy bool")
            (OKType TInt, OKType TInt) -> case binarnyOperator of
                BEq -> OKType TBool
                BNeq -> OKType TBool
                BLt -> OKType TBool 
                BGt -> OKType TBool
                BLe -> OKType TBool
                BGe -> OKType TBool
                BAdd -> OKType TInt 
                BSub -> OKType TInt
                BMul -> OKType TInt
                BDiv -> OKType TInt
                BMod -> OKType TInt
                _ -> ErrType p ("TypeCheck Err: Operator bool przy int")
            _ -> ErrType p ("TypeCheck Err: Rozne typy argumentow operatora")

-- typy wyrazen Let In
typecheckPrim funcDefinicje vars (ELet p var e1 e2) =
    case typecheckPrim funcDefinicje vars e1 of
        ErrType p1 mesg -> ErrType p1 mesg
        t -> typecheckPrim funcDefinicje ((var,t):vars) e2

-- typy wyrazen If
typecheckPrim funcDefinicje vars (EIf p e1 e2 e3) =
    case typecheckPrim funcDefinicje vars e1 of 
        OKType TBool -> let x = typecheckPrim funcDefinicje vars e2
            in let y = typecheckPrim funcDefinicje vars e3
            in case (x,y) of
                (ErrType p2 mesg, _) -> ErrType p2 mesg
                (_, ErrType p2 mesg) -> ErrType p2 mesg
                (OKType TBool, OKType TBool) -> x
                (OKType TInt, OKType TInt) -> x
                _ -> ErrType (getData e2) ("TypeCheck Err: rozne typy wyrazen")
        ErrType p1 mesg -> ErrType p1 mesg
        _ -> ErrType p ("TypeCheck Err: zly typ warunku")

-- typy funkcji
typecheckPrim funcDefinicje vars (EApp p name e1) = 
    case czyJestFun funcDefinicje name of
        Nothing -> ErrType p ("TypeCheck Err: Niezdefiniowana funkcja")
        Just f1 -> case typecheckPrim funcDefinicje vars e1 of
            ErrType p mesg -> ErrType p mesg
            OKType t -> if t == funcArgType f1 
                then OKType $ funcResType f1 
                else ErrType p ("TypeCheck Err: Zly typ funkcji")

-- typy wyrazenia Unit()
typecheckPrim _ _ (EUnit _) = OKType TUnit

-- typ wyrazen Pair
typecheckPrim funcDefinicje vars (EPair p e1 e2) = 
    case typecheckPrim funcDefinicje vars e1 of
        ErrType p1 mesg -> ErrType p1 mesg
        OKType t1 -> case typecheckPrim funcDefinicje vars e2 of
            ErrType p2 mesg2 -> ErrType p2 mesg2
            OKType t2 -> OKType $ TPair t1 t2

-- typ projekcji fst
typecheckPrim funcDefinicje vars (EFst p e1) = 
    case typecheckPrim funcDefinicje vars e1 of
        ErrType p1 m -> ErrType p1 m
        OKType (TPair t1 _) -> OKType t1
        _ -> ErrType p ("TypeCheck Err: Blad przy projekcji first.")

-- typ projekcji snd
typecheckPrim funcDefinicje vars (ESnd p e1) =
    case typecheckPrim funcDefinicje vars e1 of
        ErrType p1 m -> ErrType p1 m
        OKType (TPair _ t2) -> OKType t2
        _ -> ErrType p ("TypeCheck Err: Blad przy projekcji second.")

-- typ wyrazen ENil - pusta lista  
typecheckPrim funcDefinicje vars (ENil p t) = case t of 
        TList _ -> OKType t
        _ -> ErrType p ("TypeCheck Err: Brak typu przy liscie.")

-- typ List
typecheckPrim funcDefinicje vars (ECons p e1 e2) = 
    case typecheckPrim funcDefinicje vars e1 of
        ErrType p1 m1 -> ErrType p1 m1
        OKType t -> case typecheckPrim funcDefinicje vars e2 of
            ErrType p2 m2 -> ErrType p2 m2
            OKType (TList t) -> OKType (TList t)
            _ -> ErrType p ("TypeCheck Err: Blad miedzy elemntami listy a jej typem.")

-- typ wyrazen Matching List - Ciekawe :) 
typecheckPrim funcDefinicje vars (EMatchL p e1 e2 (head,tail,e3)) = 
    case typecheckPrim funcDefinicje vars e1 of
        ErrType p1 m1 -> ErrType p1 m1
        OKType (TList t) -> case (typecheckPrim funcDefinicje vars e2, typecheckPrim funcDefinicje ((head, OKType t):(tail, OKType (TList t)):vars) e3) of
                (ErrType p1 m1, _) -> ErrType p1 m1
                (_, ErrType p1 m1) -> ErrType p1 m1
                (OKType a, OKType b) -> case a == b of 
                    True -> OKType a
                    _ -> ErrType p ("TypeCheck Err: Bledny typ w wyrazeniu match.")
        _ -> ErrType p ("TypeCheck Err: Brak listy w matching list")


---------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------Eval----------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------

-- Akurat w tym przypadku nie mamy za bardzo wielkiej filozofii, zakladajac, ze wyrazenia sa poprawnie otypowane mozemy swobodnie wywolywac
-- funkcje eval w poszegolnych przypadkach podazajac za wskazowkami z pliku ze SKOS.

-- typ standardowej funkcji eval
eval :: [FunctionDef p] -> [(Var,Integer)] -> Expr p -> EvalResult
-- definicja standardowej funkcji eval
eval funcDefinicje vars input =
    let zmienneGood = map aux vars where
        aux (var,val) = (var, IntegerValue val)
    in case evalPrim funcDefinicje zmienneGood input of
        IntegerValue value -> Value value
        _ -> RuntimeError

-- funkcja przyporzadkujaca zmiennym wartosci, gdzie argumentami sa mary (Key, Value)
-- niejako mapowanie wartosci do zmiennych, jesli warunek Key == Var jest spelniony
zmienneWartosc :: [(Var, WartosciProgramu)] -> Var -> WartosciProgramu
zmienneWartosc ((key, value):xs) var = 
    case (key == var) of
        True -> value 
        False -> zmienneWartosc xs var

-- typ rozszerzonej funkcji eval
evalPrim :: [FunctionDef p] -> [(Var, WartosciProgramu)] -> Expr p -> WartosciProgramu
-- definicja rozszerzonej funkcji eval
-- podstawy wnioskowania o wartosciach
evalPrim funcDefinicje srodowisko (EVar _ var) = zmienneWartosc srodowisko var
evalPrim funcDefinicje _ (ENum _ int) = IntegerValue int
evalPrim funcDefinicje _ (EBool _ bool) = BooleanValue bool
-- wartosc wyrazen z operatorami unarnymi
evalPrim funcDefinicje srodowisko (EUnary _ unop expr) =
    case evalPrim funcDefinicje srodowisko expr of
        DivisionByZero -> DivisionByZero
        IntegerValue v -> IntegerValue (- v)
        BooleanValue v -> BooleanValue (not v)
-- wartosc wyrazen z operatorami binarnymi        
evalPrim funcDefinicje srodowisko (EBinary _ binarnyOperator e1 e2) = 
    case evalPrim funcDefinicje srodowisko e1 of 
        DivisionByZero -> DivisionByZero
        IntegerValue v1 -> case evalPrim funcDefinicje srodowisko e2 of
            DivisionByZero -> DivisionByZero
            IntegerValue v2 -> case binarnyOperator of 
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
        BooleanValue p1 -> case evalPrim funcDefinicje srodowisko e2 of 
            DivisionByZero -> DivisionByZero 
            BooleanValue p2 -> case binarnyOperator of
                BAnd -> BooleanValue (p1 && p2)
                BOr -> BooleanValue (p1 || p2)

-- wartosc wyrazen typu Let In
evalPrim funcDefinicje srodowisko (ELet _ var e1 e2) =
    case evalPrim funcDefinicje srodowisko e1 of
        DivisionByZero -> DivisionByZero    
        av -> evalPrim funcDefinicje ((var, av):srodowisko) e2

-- wartosc wyrazen typu If
evalPrim funcDefinicje srodowisko (EIf _ e1 e2 e3) =
    case evalPrim funcDefinicje srodowisko e1 of
        DivisionByZero -> DivisionByZero
        BooleanValue True -> evalPrim funcDefinicje srodowisko e2
        BooleanValue False -> evalPrim funcDefinicje srodowisko e3

-- wartosc aplikacji funkcji
evalPrim funcDefinicje srodowisko (EApp p name expr) =
    let Just f1 = czyJestFun funcDefinicje name in case evalPrim funcDefinicje srodowisko expr of
        DivisionByZero -> DivisionByZero
        argument -> evalPrim funcDefinicje [(funcArg f1, argument)] (funcBody f1)

-- wartosc wyrazen Unit()
evalPrim _ _ (EUnit p) = UnitValue

-- wartosc wyrazen Pair
evalPrim funcDefinicje srodowisko (EPair p e1 e2) = case (evalPrim funcDefinicje srodowisko e1, evalPrim funcDefinicje srodowisko e2) of
    (DivisionByZero, _) -> DivisionByZero
    (_, DivisionByZero) -> DivisionByZero
    (a,b) -> PairValue a b

-- wartosc projekcji First
evalPrim funcDefinicje srodowisko (EFst p e1) = case evalPrim funcDefinicje srodowisko e1 of 
    DivisionByZero -> DivisionByZero
    PairValue a b -> a

-- wartosc projkecji Second
evalPrim funcDefinicje srodowisko (ESnd p e1) = case evalPrim funcDefinicje srodowisko e1 of 
    DivisionByZero -> DivisionByZero
    PairValue a b -> b

-- wartosc Listy Pusta, czyli lista pusta :)
evalPrim funcDefinicje srodowisko (ENil p _) = ListValue []

-- wartosc List
evalPrim funcDefinicje srodowisko (ECons p e1 e2) = case evalPrim funcDefinicje srodowisko e2 of
    DivisionByZero -> DivisionByZero
    ListValue xs -> case evalPrim funcDefinicje srodowisko e1 of
            DivisionByZero -> DivisionByZero
            x -> ListValue (x:xs)

-- wartosc wyrazen Matchnig List
evalPrim funcDefinicje srodowisko (EMatchL p e1 e2 (head,tail,e3)) = 
    case evalPrim funcDefinicje srodowisko e1 of
            DivisionByZero -> DivisionByZero
            ListValue [] -> evalPrim funcDefinicje srodowisko e2
            ListValue (x:xs) -> evalPrim funcDefinicje ((head,x):(tail,ListValue xs):srodowisko) e3