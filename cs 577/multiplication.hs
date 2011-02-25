import Numeric.LinearAlgebra
import Numeric.GSL
import Complex
import Debug.Trace
import Test.QuickCheck
import Data.List
import Control.Monad.Writer

type EvenOdd a = ([a], [a])
type AddsMults = (Int, Int)

{- ==== Meta programming stuff =====
   We define two monoids, one for counting additions, and the other for multiplications
   The "Writer" monoid provides a "tell" method, which allows us to increment the counter
   by one without needing to explicitly pass in state. The downside is that there is no
   easy way (that I know of) to turn this on and off. So you have to run everything within
   a runWriter context. 
  
   Another option here would've been to create a type constructor like Num of which both a
   monoidic and regular double are instances of. This would have some issues in that the
   compiler would view recursive applications as being separate calls. e.g. 
      x = 1 + 2;  -- one add
      y = 1 + x;  -- should be one add, but will be interpreted as two since it will include x's adds
   
   So having it explicitly return monoids was chosen.
-}

type AddCountM = Writer(Sum Int)
addM :: Num a => a -> a -> AddCountM a
addM x y= do
    tell (Sum 1)
    return (x + y)
-- addMi :: Num a => a -> a -> a

type MultCountM = Writer (Sum Int)
mulM :: Num a => a -> a -> MultCountM a
mulM x y = do
  tell (Sum 1)
  return (x * y)
  
-- | The point of this file: multiplies two numbers
--   (each represented by a vector)
mymult :: [Complex Double] -> [Complex Double] -> [Int]  
mymult x y = 
  let n = padamt x y
      fx = fftexp n x
      fy = fftexp n y
      pr = fx `dotstar` fy
      ip = ifftexp n pr
      clean = doCarries $ cleanUp ((genericLength x) + (genericLength y) - 1) ip
   in clean


-- | The imaginary part of each component should
--   be near zero, so just remove it.  We also get
--   some rounding errors, so round everything
cleanUp :: Int -> [Complex Double] -> [Int]
cleanUp n lst = take n $ map cleanSingle lst
cleanSingle :: Complex Double -> Int
cleanSingle x =  
  let rx = realPart x
      fx = (round :: Double -> Int) rx
  in fx


doCarries lst =
  let rlst    = (reverse lst)
      val     = reverse $ doCarriesi rlst 0    
  in  val
        
doCarriesi :: [Int] -> Int -> [Int]
doCarriesi [] 0 = []
doCarriesi [] carry = doCarriesi [0] carry
doCarriesi (x:xs) carry = 
  let addedx   = x + carry
      newcarry = floor $ fromIntegral $ addedx `div` 10
      newx     = addedx - (newcarry * 10)
  in newx:(doCarriesi xs newcarry)

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
      
padamt x y =
  let n = (genericLength x) + (genericLength y)
  in 2 ^ (log2 n)

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

-- | figures out the length for you
ffteasy lst = 
  let (px, _) = dopad lst []
  in myfft (omega $ fromIntegral $ length px) $ px
iffteasy lst = myifft (genericLength lst) $ reverse lst

-- | allows you to specify the root to use
fftexp n x = myfft (omega $ fromIntegral n) $ reverse $ padi n x
ifftexp n x= myifft (fromIntegral n) $ reverse $ padi n x

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
combine :: (Floating a) => (EvenOdd a) -> a -> a -> ([a], [a])
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
     quickCheck (\x -> testboth x)
     quickCheck (\x y -> testmul x y)
     
testfft :: [Complex Double] -> Bool
testfft x =
  let n = padamt x []
      fx = fftexp n x
      real = fft $ fromList $ padi n x
  in fx `myeq` (toList real)
      
testifft :: [Complex Double] -> Bool
testifft x =
  let n = padamt x []
      fx = ifftexp n x
      real = ifft $ fromList $ padi n x
  in fx `myeq` (toList real)

testboth x = x `myeq` (iffteasy $ ffteasy x)

-- | Returns of two lists of complex numbers are approximately equal     
--   we need this because there are some rounding errors
myeq :: [Complex Double] -> [Complex Double] -> Bool
myeq [] [] = True     
-- If the second list is longer but made up of all zeros, that's ok
myeq [] (y:ys)
  | realPart y < (0.1) = myeq [] ys
  | otherwise = False
myeq (x:xs) (y:ys) = 
  let requal = abs((realPart x) - (realPart y)) < (0.1)
      iequal = abs((imagPart x) - (imagPart y)) < (0.1)
  in requal && iequal && (myeq xs ys)
     
-- | [1, 10, 100, ...]
powersof10 x = x:(powersof10 $ 10 * x)

-- | Tests whether my multiplication is the same
--   as Haskell's
testmul x y =
  let ax = abs x
      ay = abs y
      act = ax * ay
      me  = domul ax ay
  in act == me

-- | Multiplies two numbers using mymult
domul x y =
  let xvec = num2vec x
      yvec = num2vec y
      prod = mymult xvec yvec
  in vec2num prod
     
--testDoCarries :: (Num a) => [a] -> Bool   
testDoCarries x
  | length x < 5 =
    let absX = map abs x
    in (doCarries absX) == (num2vec $ vec2num absX)
  | otherwise = True
                
firstEq [] _ = True
firstEq (x:xs) (y:ys) = (x == y) && (firstEq xs ys)

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

generateVector :: Gen [Int]
generateVector = 
  do i <- choose (0, 9)
     return $ take 100 $ repeat i
     
{-
vecProp :: Property     
vecProp = forAll generateVector $ (\x y -> (mymult x y) == (mymult y x))
-}