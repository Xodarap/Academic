data Mark = ChildRemoved | NoChildRemoved deriving (Show)
data FibNode a = FibNode { 
  degree   :: Int,
  treeMin  :: a,
  subTrees :: [FibNode a]
  }
data FibForest a = FibForest {
  maxDegree :: Int,
  trees     :: [FibNode a]
  }



{-
data FibNode e = FibNode { 
  firstChild :: FibNode e,
  leftSib    :: FibNode e,
  parent     :: FibNode e,
  rightSib   :: FibNode e,
  mark       :: Mark,
  key        :: Int,
  val        :: e } | EmptyFibNode deriving (Show)
                      
instance Eq (FibNode e) where
  (==) = liftKey (==)
instance Ord (FibNode e) where
  compare = liftKey compare

liftKey :: (Int -> Int -> a) -> FibNode e -> FibNode e -> a
liftKey fn node1 node2 = fn (key node1) (key node2)

-- | The forest is the top-level collection of all the fib nodes
data FibForest e = FibForest {
  children   :: [FibNode e],
  minNode    :: FibNode e
  } | EmptyFibForest deriving (Show)
                      
-- | Constructs a fib node which has no links to anyone
lonelyFib :: Int -> a -> FibNode a
lonelyFib k v = FibNode {
  firstChild = EmptyFibNode,
  leftSib    = EmptyFibNode,
  parent     = EmptyFibNode,
  rightSib   = EmptyFibNode,
  mark       = NoChildRemoved,
  key        = k,
  val        = v}

-- | Number of siblings that a node has, including itself
--   (Why including itself? So that counting children is easier)
numSibs :: FibNode e -> Int
numSibs EmptyFibNode = 0
numSibs fb           = 1 + (numSibs $ rightSib fb)

-- | Number of children a node has. (AKA its degree)
degree :: FibNode e -> Int
degree EmptyFibNode = 0
degree fb           = numSibs $ firstChild fb

{- FibForest utils -}
-- | Concats two forests together. Doesn't balance the trees etc.
union :: FibForest e -> FibForest e -> FibForest e
union f1 f2 = FibForest {
  children = (children f1) ++ (children f2),
  minNode = min (minNode f1) (minNode f2)
  }
           
             
{- === Unit tests === -}
testNumSibs = numSibs (lonelyFib 1 2) == 0
-}                 
                 