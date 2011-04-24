import Horn
import Data.List.Utils
import Data.List.Split
import Data.List
import Data.Monoid
import Control.Monad

instance Monoid Formula where
  mempty = Formula { nors = [], impls = []}
  (Formula n1 i1) `mappend` (Formula n2 i2) = Formula { nors  = n1 `mappend` n2,
                                                        impls = i1 `mappend` i2}

{-| Given a file, will return either a solution or the statement that it
    can't be solved. A line of the file should either be a space separated
    list of literals, in which case it will be interpreted as a NOR clause,
    or an implication. For example:

    a b c     -- interpreted as ~(a \/ b \/ c)
    a b -> c  -- interpreted as (a /\ b) -> c
-}
solveFromFile :: String    -- ^ The file name
                 -> IO (Either [Literal] String)
solveFromFile = liftM solve . file2form

-- | Returns a formula from a file
file2form :: String -> IO Formula
file2form filename = do
  liftM (file2form' . lines) $ readFile filename
  
-- | Turns a list of lines into a formula by mconcatenating them
file2form' :: [String] -> Formula
file2form' = mconcat . map line2form

-- | Turns a line into a formula
line2form :: String -> Formula
line2form str
  | isInfixOf "->" str = 
       let frm    = splitOn "->" str
           ante   = head frm 
           conseq = last frm
           impl   = line2impl ante conseq    
       in Formula { nors = [], impls = [impl] }    
  | otherwise =
    let litNames = filter (/= "") $ splitOn " " str
        lits     = map str2lit litNames
        nors     = NorClause { clausesN = lits }
    in Formula { nors = [nors], impls = [] }

-- | Turns a line into an implication
line2impl :: String      -- ^ Antecedent
             -> String   -- ^ Consequent
             -> Implication           
line2impl ante conseq
  | all (== ' ') ante = Tautology (str2lit conseq)
  | ante == ""        = Tautology (str2lit conseq)
  | otherwise         =
    let litNames = filter (/= "") $ splitOn " " ante
        lits     = map str2lit litNames
        ands     = AndClause { clausesA = lits }
        cons     = str2lit conseq
    in Implication ands cons
       
-- | Returns a literal with the given name
str2lit :: String -> Literal       
str2lit x = 
  let clean = filter (/= ' ') x
  in Literal clean False