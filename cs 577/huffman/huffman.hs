module HuffmanCompression 
       (prettyCompress,
        huffCompress
        )
       where

import Data.PriorityQueue.FingerTree as PQ
import Data.Monoid
import Data.Functor
import Control.Applicative
import Control.Monad
import Data.List.Split

-- | A simple tree. No balancing etc. Odd that Haskell doesn't have this built in.
data SimpleTree a = Empty
                  | Node (SimpleTree a) (SimpleTree a)
                  | Leaf a
                    deriving (Show)

-- | For Huffman encoding, we have a priority queue of trees
type TreeQueue k v = PQueue k (SimpleTree v)

-- | Easily printable version of the encoding
prettyCompress :: (Show a, Ord freq, Num freq) => [(freq, a)] -> IO ()
prettyCompress x = do 
  putStr $ prettyCompress' x
  
-- | Prints out the compression from a file
prettyCompressF :: String -> IO ()
prettyCompressF filename = do
  dat <- liftM parseFile $ readFile filename
  prettyCompress dat

-- | Maps a set of lines to the appropriate array
parseFile :: String -> [(Int, String)]
parseFile str = 
  let lns  = lines str
      arrs = map (splitOn "\t") lns
  in map (\x -> (read $ last x, head x)) arrs    
  
-- | Internal method to prettify huffman output. Just separated from
--   prettyCompress to keep away IO.
prettyCompress' :: (Show a, Ord freq, Num freq) => [(freq, a)] -> String
prettyCompress' x = 
  let codes = huffCompress x
      prettySingle (key, value) = (foldl (++) [] $ map show key) ++ "\t" ++ show value
  in foldl (\x ac -> ac++"\n"++x) [] $ map prettySingle codes         
     
-- | Given a list of freq/term pairs returns the optimal encoding
huffCompress :: (Ord freq, Num freq) => [(freq, a)] -> [([Bit], a)]
huffCompress = code [] . removeAndAdd . fromList . map (\(freq, x) -> (freq, Leaf x))

-- | The core of Huffman encoding:
--   * If queue is empty, return empty (This only happens if you're encoding [])
--   * If there's one tree in the queue, return that tree
--   * Otherwise, take the top two trees off the queue, merge them, re-add, then recurse
removeAndAdd :: (Ord k, Num k) => TreeQueue k v -> SimpleTree v
removeAndAdd queue = 
  case minViewWithKey queue of
    Nothing -> Empty                    -- They were mean and gave us an empty queue
    Just ((weight, node), newqueue) ->  -- OK it has one element; does it have two?
      case minViewWithKey newqueue of
        Nothing -> node                 -- One node left => We're done
        Just ((weight2, node2), queue') -> removeAndAdd $ insert (weight + weight2) (Node node node2) queue'

-- | Just a little shorthand for {0,1}
data Bit = Zero | One 
instance Show Bit where
  show Zero = "0"
  show One  = "1"
  
-- | Given a tree, returns its encoding in binary  
--   Left sub-trees are prefixed with 0 and right with 1, although I suppose
--   the encoding is equally good if that's reversed
code :: [Bit] -> SimpleTree a -> [([Bit], a)]
code  _   Empty     = []
code num (Leaf x)   = [(num, x)]
code num (Node l r) = (code (Zero:num) l) ++ (code (One:num) r)


sample1 = [(10, "a"), (5, "b"), (5, "c"), (12, "d"), (18, "e"), (2, "f")]

pQueueToList :: (Ord k) => (PQueue k v) -> [(k, v)]
pQueueToList q 
  | PQ.null q = []
  | otherwise = 
    let extract Nothing = []
        extract (Just ((k, v), q)) = (k, v):(pQueueToList q)
    in extract $ minViewWithKey q    

myFold :: ((a, a) -> [a] -> [a]) -> [a] -> [a]
myFold f (x:y:xs) = myFold f (f (x, y) xs)
myFold _ ac = ac