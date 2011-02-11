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
createJlex x = "\"" ++ x ++ "\"\t{ \n\t\tSymbol s = new Symbol(sym. , new TokenVal(yyline+1, CharNum.num);\n\t\tCharNum.num += " ++ (show $ length x) ++ ";\n\t\t return s;\n\t}\n"