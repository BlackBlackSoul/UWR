{-# LANGUAGE Safe #-}
 
 
module KarolRodzinskiTests(tests) where
 
import DataTypes
 
tests :: [Test]
 
tests =
  [ Test "inc"      (SrcString "input x in x + 1")  (Eval [42] (Value 43))
  , Test "noInput"      (SrcString "42 + 0") (Eval [] (Value 42))
  , Test "undefVar" (SrcString "x") TypeError
  , Test "simplifyOperators" (SrcString " input x in x + 10 - - -  1") (Eval [1] (Value 10))
  , Test "ifStatement"       (SrcString "input x y in if x >= 1 then 144 else y * 5") (Eval [2, 3] (Value 144))
  , Test "negationSimplifiedToTrue" (SrcString "input x in if not not true then x * 1 else x div 1") (Eval [1] (Value 1))
  , Test "simpleInputIn"       (SrcString "input x y in x * 1 - y mod 4") (Eval [1,12] (Value 1))
  , Test "errorWithBoolInIf"     (SrcString "input x in if 11 then x * 22 else x * 33") TypeError
  , Test "evaluateBoolExpression" (SrcString "if true or false or false or true then 1 else 0") (Eval [] (Value 1))
  , Test "checkBoolInIf"      (SrcString "input x in if x div 2 >= 1 then x * 3 else x div 3") (Eval [6] (Value 18))
  , Test "undefinedVariables"      (SrcString "input x y in x*y + z") TypeError
  , Test "boolErrorInLet"      (SrcString "input x y z in let x  = y in z + x") (Eval [1,2,3] (Value 5))
  , Test "notValidReturnThen"      (SrcString "input x in if true then true else x * 2") TypeError
  , Test "properIfLazy" (SrcString "input x in if x >= 0 then x else x div 0") (Eval [1] (Value 1))
  , Test "quiteHardIfExpr" (SrcString "input a b c in if a < 0 and b < 0 then c else a + b") (Eval [-1, -1, 1] (Value 1))
  , Test "multipleSums"      (SrcString "input x y z a b in x + y + z + a + b") (Eval [1,11,11,11,11] (Value 45))
  , Test "thereIsUnusedVar" (SrcString "input x y in x*2") (Eval [1,2] (Value 2))
  , Test "scriptInterpretLanguage" (SrcString "1 + 10 + 100") (Eval [] (Value 111))
  , Test "orAppliedToNumberAndBool" (SrcString "input a in if a or true then a else a") TypeError 
  , Test "multipleSubstractions"      (SrcString "input a b c d in a - b - c - d") (Eval [3,1,1,1] (Value 0))
  , Test "errorWithBoolInIf" (SrcString "if 1 then 2 else 3") TypeError
  , Test "priorityOperators"      (SrcString "input a b c in a * b - c") (Eval [2,2,3] (Value 1))
  , Test "binaryWithUnaryOperator" (SrcString "10 + -7") (Eval [] (Value 3))       
  , Test "alwaysReturnInput"      (SrcString "input x in if true then x else x mod 2") (Eval [1] (Value 1))
  , Test "usingUndefinedVariable" (SrcString "input x y in x + y + z") TypeError
  , Test "mixedBoolAndIntegerOperator" (SrcString "input a in if - true then 1 else 0") TypeError
  , Test "nestedIfElse" (SrcString "input x in if if x >= 1 then true else false then if true then x * 3 else 42 + x else x") (Eval [1] (Value 3))
  , Test "letStatementNested" (SrcString "let x = 1 in let x = 2*x in let x = x + 5 in let x = 3*x in x + -1") (Eval [] (Value 20))
  , Test "negationIf" (SrcString "input x in if not false then x else -x") (Eval [1] (Value 1))
  ]