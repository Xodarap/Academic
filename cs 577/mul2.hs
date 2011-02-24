import Numeric.LinearAlgebra
import Foreign.Storable
import Test.QuickCheck
import Debug.Trace

--bigMul :: (Num a) => [a] -> [a] -> [a]
bigMul :: [Double] -> [Double]  -> [Double]
bigMul [] _ = [0]
bigMul _ [] = [0]
bigMul (x:[]) (y:[]) 
    | (trace ((show x) ++ "; " ++ (show y)) True) = [x*y]
bigMul xs ys 
  | (trace ((show xs) ++ "; " ++ (show ys)) True) = 
  let (left1, right1) = split xs 
      (left2, right2) = split ys
      n2 = (/) 2 . fromIntegral $ length xs
      n = n2 * 2
      --n = fromIntegral $ (*) 2 $ length xs
      --n2 = fromIntegral $ length xs
      {-
      top = fakeMul {- bigMul -} left1 left2
      mid = fakeMul {- bigMul -} (bigAdd left1 left2) (bigAdd right1 right2)
      bot = fakeMul {- bigMul -} right1 right2
  in top ++ (bigSub (bigSub bot top) mid) ++ bot
      -}
      x1 = fMul left1 left2
      x2 = fMul right1 right2
      x3 = (fAdd left1 left2) * (fAdd right1 right2)
  in numToList $ (fMul right1 right2) + (10 ** n2) * ((fMul left1 right2) + (fMul right1 left2)) + (10 ** n) * (fMul left1 left2)
   --numToList $ x1 * (10 ** n) + (x3 - x1 - x2) * (10 ** n2) + x2
      
fakeMul xs ys = numToList $ (listToNum xs) * (listToNum ys)
fMul :: (Num a) => [a] -> [a] -> a
fMul xs ys = (listToNum xs) * (listToNum ys)
fAdd :: (Num a) => [a] -> [a] -> a
fAdd xs ys = (listToNum xs) + (listToNum ys)

pad :: (Num a) => [a] -> Int -> [a]
pad x amt = 
  let n = length x
      padding = take (amt - n)  (repeat 0)
  in x ++ padding

-- | Adds two lists of doubles together
--   Slow for now
bigAdd :: [Double] -> [Double] -> [Double]
bigAdd [] [] = [0 :: Double]
--bigAdd xs ys = toList $ (toVec xs) + (toVec ys)
--bigAdd xs ys = reverse $ lazyVecMul (reverse xs) (powers 1)
bigAdd xs ys = numToList $ (listToNum xs) + (listToNum ys)

lazyVecMul :: [Double] -> [Double] -> [Double]
lazyVecMul _ [] = []
lazyVecMul [] _ = []
lazyVecMul (x:xs) (y:ys) = (x * y):(lazyVecMul xs ys)

powers :: Double -> [Double]
powers x = ((10 * x) :: Double):(powers $ 10 * x)

-- | Subtracts two numbers
bigSub :: [Double] -> [Double] -> [Double]
bigSub [] [] = [0 :: Double]
bigSub xs ys = numToList $ (listToNum xs) - (listToNum ys)
--bigSub xs ys = toList $ (toVec xs) - (toVec ys)

split :: [Double] -> ([Double], [Double])
split xs = spliti xs 0 (((length xs) `div` 2) - 1)

spliti :: (Num a, Ord a, Num b, Ord b) => [a] -> b -> b -> ([a], [a])
spliti (x:xs) i n
  | i <= n = 
    let sp = spliti xs (i+1) n
    in (x:(fst sp), snd sp)
  | otherwise = ([], xs)
                
-- | The generic fromList creates a Vector t, which
--   doesn't have the addition etc. that we need. So
--   this utility function creates a Vector Double
toVec :: [Double] -> (Vector Double)
toVec xs = fromList xs :: Vector Double                

listToNum xs = foldr (\x accum -> accum * 10 + x) 0 $ reverse xs

--ones :: [Double] -> [Double]
--ones :: Integer -> Integer
--ones x = x - (((floor (x / 10))) * 10)
ones :: Double -> Double
ones x = x - (fromIntegral $ (floor (x / 10) * 10))

numToList :: Double -> [Double]
numToList x
  | x >= 1 = (numToList . fromIntegral . floor $ x / 10) ++ [ones x]
  | otherwise = []
                
myAdd x y =                 
  let xl = numToList x
      yl = numToList y
      sum = bigAdd xl yl
  in listToNum sum
     
mySub x y =
  let xl = numToList x
      yl = numToList y
      pr = bigSub xl yl
  in listToNum pr

myMul x y =     
  let xl = numToList x
      yl = numToList y
      prod = bigMul xl yl
  in listToNum prod
     
myRound x = abs $ fromIntegral $ floor $ x * 100

-- testOneThing :: (Num a) => a -> a -> Bool
testOneThing x y = 
  let rx = max (myRound x) $ myRound y
      ry = min (myRound x) $ myRound y
  in  --(myAdd rx ry) == (rx + ry) &&
      --((myMul rx ry) == (rx * ry))
   (mySub rx ry) == (rx - ry)

{-     
instance Aribtrary Double where     
  arbitrary = choose (1, 1000)
  coarbitrary c = choose (1, 1000)
-}