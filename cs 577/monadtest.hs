import Control.Monad
import Control.Monad.Writer
--import Control.Monad.Trans.Writer

data Counts = Counts { additions :: Int, multiplications :: Int }

instance Show Counts where
  show (Counts a m) = do
    show a
    show m
    
type AddCountM = Writer (Sum Int)

addM :: Num a => a -> a -> AddCountM a
addM x y = do
  --tell (Counts { additions = 1, multiplications = 0})
  tell (Sum 1)
  return (x + y)
{-
am :: Num a => a -> a -> AddCountM a
am x y = do 
   t <- addM x y
   id t 
-}
fib :: Int -> AddCountM Int
fib 0 = return 0
fib 1 = return 1
fib n = do
  n1 <- addM n (-1)
  n2 <- addM n (-2)
  fibn1 <- fib n1
  fibn2 <- fib n2
  (addM fibn1 fibn2)

type MultCountM = Writer (Sum Int)
mulM :: Num a => a -> a -> MultCountM a
mulM x y = do
  tell (Sum 1)
  return (x * y)
      
combine :: (Floating a, Num a) => ([a], [a]) -> a -> a -> ([AddCountM a], [AddCountM a])
combine ([], []) _ _ = ([], [])
combine ((x:xs), (y:ys)) w j = do
  (n1, _) <- mulM 0 1
  ([addM 0 1], [addM 0 1])

  --r  <- addM x $ (w ** j) * y
  --return ([], [])

{-
        r' = x - (w ** j) * y
        (left, right) = combine (xs,ys) w (j + 1)
    in ((r:left), (r':right))
-}