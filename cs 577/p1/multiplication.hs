import Numeric.LinearAlgebra
import Numeric.GSL
import Complex
import Debug.Trace
import Test.QuickCheck
import Data.List
import Char

--import Control.Monad.Writer

{- ==== General Statements ====
   My naming convention here is to suffix internal methods with an "i". You can call
   these if you want, but it will probably be less user-friendly. In particular, they
   tend to not do any checking of the input, so you can end up with infinite loops.

   The top level functions are mymult and mymulti - the only difference is that mymulti
   returns the metadata about how many adds/multiplies were done.

   Sample Usage:
      bash>ghci                      -- run ghci from the command line
      Prelude>:l multiplication.hs   -- load the file
      *Main> mymult [1..100] [1..50] -- multiply 1,2,3,...100 by 1,2,...50
      -- very long vector results

      *Main> mymulti [1..100] [1..50] 
      -- another long vector, but it tells us that 6442 additions and 6549 multiplications were done
-}

-- | An EvenOdd represents the even pieces of a vector and the odd pieces
type EvenOdd a = ([a], [a])
-- | The first piece of the tuple is the number of additions, the second is
--   the number of multiplications
type AddsMults = (Int, Int)
  
{- ====== IO Stuff ========== -}

-- | IO wrapper around mymult
--   Input: Two lines, each representing a number 
--   Output: Two lines, first is the product of each number,
--           Second is the number of adds/mults done. (Adds first.)
main = do
  x <- getLine
  y <- getLine
  let xdata = map (fromIntegral . digitToInt) x 
      ydata = map (fromIntegral . digitToInt) y 
      (result, metadata) = mymulti xdata ydata
      bigString = foldr (\x ac -> x ++ ac) "" $ map show result
    in do 
    putStrLn bigString 
    putStrLn $ show metadata

{- ====== Main ======= -}

-- | The point of this file: multiplies two numbers
--   (each represented by a vector)
mymult :: [Complex Double] -> [Complex Double] -> [Int]  
mymult x y = fst $ mymulti x y
-- | Returns the number of adds/mults too
mymulti :: [Complex Double] -> [Complex Double] -> ([Int], AddsMults)  
mymulti x y =  
  let n = padamt x y
      (fx, count1) = fftexpi n x
      (fy, count2) = fftexpi n y
      pr = fx `dotstar` fy
      -- we multiply every element in the vector by every other one, so 
      -- the number of multiplications equals the number of elements
      dotStarCount = (0, genericLength pr)
      (ip, count3) = ifftexpi n pr
      clean = doCarries $ cleanUp ((genericLength x) + (genericLength y) - 1) ip
      -- There are two additions and one division for each digit in doCarries
      doCarriesCount = (2 * (genericLength clean), genericLength clean)
      totalCount = addUpCounts $ [count1, count2, count3, dotStarCount, doCarriesCount]
   in (clean, totalCount)

-- | Aggregates all the AddsMults  into one
addUpCounts :: [AddsMults] -> AddsMults
addUpCounts = foldr (\(x, y) (accumx, accumy) -> (x+accumx, y+accumy)) (0,0)

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

-- | Handles all the carries at the end of the mult
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
      
-- | minimum length that the vector needs to be
--   for multiplication to work
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


myiffti :: Complex Double -> [Complex Double] -> ([Complex Double], AddsMults)
myiffti n x =
  let res = myffti (omegai n) x
      answer = map (/ n) (fst res)
  in (answer, snd res)    


-- | figures out the length for you
ffteasy lst = 
  let (px, _) = dopad lst []
  in myfft (omega $ fromIntegral $ length px) $ px
iffteasy lst = myifft (genericLength lst) $ reverse lst

-- | allows you to specify the root to use
fftexp n x = 
  let intval = fftexpi n x
  in fst intval
fftexpi n x =  myffti (omega $ fromIntegral n) $ reverse $ padi n x
ifftexp n x = 
  let intval = ifftexpi n x
  in fst intval
ifftexpi n x = myiffti (fromIntegral n) $ reverse $ padi n x

myfft w lst = fst $ myffti w lst

-- | Fast-fourier transform. w is the nth root of unity
--   where n is the length of lst
myffti :: (RealFloat a) =>  Complex a -> [Complex a] -> ([Complex a], AddsMults)
myffti w lst
  | (realPart w) == 1 = (lst, (0,0))
  | otherwise =
    let ev = splitVec lst
        w2 = w ** 2
        s  = myffti w2 $ fst ev
        sp = myffti w2 $ snd ev
        rs = combine (fst s, fst sp) w 0
        adds = (fst $ snd s) + (fst $ snd sp) + (fst $ third rs)
        muls = (snd $ snd s) + (snd $ snd sp) + (snd $ third rs)
        am = (adds, muls)
        newlist = (first rs) ++ (second rs)
    in (newlist, am)

         
-- | Does the second half of the FFT, i.e. takes the values
--   from the recursive part and combines them to get the 
--   final vector
combine :: (Floating a) => (EvenOdd a) -> a -> a -> ([a], [a], AddsMults)
combine ([], []) _ _ = ([], [], (0, 0))
combine ((x:xs), (y:ys)) w j =
  let r  = x + (w ** j) * y
      r' = x - (w ** j) * y
      (left, right, (a, m)) = combine (xs,ys) w (j + 1)
  in ((r:left), (r':right), (a + 2, m + 2))

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

{- ==== Utility methods ====
   Things which aren't really related to the FFT but makes it easier
-}

-- | Like fst and snd, except they work with tuples of three
first (x, y, z) = x
second (x, y, z) = y
third (x, y, z) = z

-- | Allows us to declare complex numbers using the [a..b] syntax
instance (Enum a, Num a, RealFloat a, RealFrac a) => (Enum (Complex a)) where
  succ x           =  x+1
  pred x           =  x-1
  toEnum           =  fromIntegral
  fromEnum         =  fromInteger . truncate . realPart  -- may overflow                                                                                                        

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
     