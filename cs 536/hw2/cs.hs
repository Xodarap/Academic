allChars :: [String] 
allChars =
     let 
     x ="{      }     (      )      ,      =      ;   +      -     *      /      ++     --   !      &&    ||     ==    !=     <      >      <=     >=   &"
     in words x


pretty :: String -> String
pretty ch = "\"" ++ ch ++ "\", "

doWork :: [String]
doWork = map pretty allChars

createJlex :: String -> String
createJlex x = "\"" ++ x ++ "\"{WHITESPACE}\t{ \n\t\tSymbol s = new Symbol( , new TokenVal(yyline+1, CharNum.num);\n\t\tCharNum.num += " ++ ((length x) :: [Char]) ++ ";\n\t\t return s;\n\t}"