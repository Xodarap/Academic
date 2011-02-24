import Numeric.LinearAlgebra
import Numeric.GSL
import Complex
import Debug.Trace
import Test.QuickCheck
import Data.List

type EvenOdd a = ([a], [a])
data Dvec = Vector Double

instance (RealFloat t) => Ord (Complex t) where
  c <= c' = realPart c <= realPart c'  
  
-- | The point of this file: multiplies two numbers
--   (each represented by a vector)
mymult :: [Complex Double] -> [Complex Double] -> [Double]  
mymult x y = 
  let (paddedx, paddedy) = dopad x y 
      n = genericLength paddedx
      fx = myfft (omega n) paddedx
      fy = myfft (omega n) paddedy
      foo = trace (show fx) 1
      pr = fx `dotstar` fy
      ip = reverse $ myifft n pr
      -- The imaginary part of each component should
      -- be near zero, so just remove it
      clean = map realPart ip
   in clean

-- | preprocessing step for multiplication
--   pads the numbers enough so the fft works
dopad :: (Num a) => [a] -> [a] -> ([a], [a])
dopad x y = 
   let n = (genericLength x) + (genericLength y)
       -- first, pad to the minimum length of the resulting
       -- polynomial (x + y)
       padded1x = padi n x
       padded1y = padi n y
       -- Now pad to the nearest power of 2
       paddedx = reverse $ pad padded1x 
       paddedy = pad padded1y
   in (paddedx, paddedy)
      
-- | finds the logarithm base 2
--   how can a language not have this built in?
log2 x
  | x <= 1 = 0
  | otherwise = 1 + log2 (fromIntegral (ceiling $ x / 2))

-- | pads a list to be as long as the nearest power of 2
pad :: (Num a) => [a] -> [a]
pad x =
  let goodlen = 2 ^ (log2 $ genericLength x)
  in padi goodlen x

-- | pads a list with a certain number of 0's
padi :: (Num a) => Int -> [a] -> [a]
padi n x =  x ++ take (fromIntegral $ n - (length x)) (repeat 0)

-- | element-by-element multiplication
dotstar :: (Num a) => [a] -> [a] -> [a]
dotstar = zipWith (*)

-- | inverse fft. Includes normalization
myifft n x = map (/ n) (myfft (omegai n) x)

ffteasy lst = myfft (omega $ fromIntegral $ length lst) $ reverse lst
iffteasy lst = myifft (genericLength lst) $ reverse lst

-- | Fast-fourier transform. w is the nth root of unity
--   where n is the length of lst
myfft :: (RealFloat a) =>  Complex a -> [Complex a] -> [Complex a]
myfft w lst
  | (realPart w) == 1 = lst --(fst ev):(snd ev)
  | otherwise =
    let ev = splitVec lst
        w2 = w ** 2
        s  = myfft w2 $ fst ev
        sp = myfft w2 $ snd ev
        rs = combine (s, sp) w 0
    in (fst rs) ++ (snd rs)

         
-- | Does the second half of the FFT, i.e. takes the values
--   from the recursive part and combines them to get the 
--   final vector
combine :: (Floating a, Ord a) => (EvenOdd a) -> a -> a -> ([a], [a])
combine ([], []) _ _ = ([], [])
combine ((x:xs), (y:ys)) w j =
  let r  = x + (w ** j) * y
      r' = x - (w ** j) * y
      (left, right) = combine (xs,ys) w (j + 1)
  in ((r:left), (r':right))

-- | nth root of unity
omega n = exp(-2 * pi * i / n)

-- | inverse of nth root of 1
omegai n = exp(2 * pi * i / n)

-- | splits a vector into the even and odd pieces
splitVec :: [a] -> EvenOdd a
splitVec [] = ([], [])
splitVec (x:y:xs) =
  let (even, odd) =  splitVec xs
  in (y:even, x:odd)
splitVec (x:[]) = ([], [x])         

{-- ==== Unit Tests ==== 
    In general, these just test my implementation versus the
    haskell reference implementation
--}
doTests =
  do quickCheck (\x -> testfft  x)
     quickCheck (\x -> testifft x)

testfft :: [Complex Double] -> Bool
testfft x =
  let (goodx, _) = dopad x []
      me = myfft (omega $ fromIntegral $ length goodx) $ goodx
      them = fft $ fromList $ reverse goodx
  in me `myeq` (toList them)
    
testifft :: [Complex Double] -> Bool
testifft x =
  let (goodx, _) = dopad x []
      me = myifft (fromIntegral $ length goodx) $ goodx
      them = ifft $ fromList $ reverse goodx
  in me `myeq` (toList them)

testboth x =
  let (goodx, _) = dopad x []
      len        = genericLength goodx
      res        = myifft len $ myfft (omega len) goodx
   in goodx `myeq` res

-- | Returns of two lists of complex numbers are approximately equal     
--   we need this because there are some rounding errors
myeq :: [Complex Double] -> [Complex Double] -> Bool
myeq [] [] = True     
myeq (x:xs) (y:ys) = 
  let requal = abs((realPart x) - (realPart y)) < (0.1)
      iequal = abs((imagPart x) - (imagPart y)) < (0.1)
  in requal && iequal && (myeq xs ys)
     
-- | [1, 10, 100, ...]
powersof10 x = x:(powersof10 $ 10 * x)

-- | Multiplies two numbers using mymult
testmul x y =
  let xvec = num2vec x
      yvec = num2vec y
      prod = mymult xvec yvec
  in vec2num prod
     
-- | Converts a number to a vector
--   e.g. 123 -> [1, 2, 3]
num2vec x 
  | x < 1 = []
  | otherwise =
    let next = (floor $ fromIntegral $ x `div` 10)
        onesplace = x - (10 * next)
    in (num2vec next) ++ [fromIntegral $ onesplace]
       
-- | Converts a vector to a number       
--   e.g. [1, 2, 3] -> 123
vec2num x = foldr (+) 0 $ zipWith (*) (reverse x) $ powersof10 1