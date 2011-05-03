module WordFrequency
       (wordFreq,
        charFreq,
        MRPair (..)
        ) where

import Data.Monoid
import Data.List
import Control.Monad

{-
   This module implements the standard word frequency counting using
   the usual map/group/reduce paradigm
-}

-- | Pair for map reduction. 
data MRPair k v = MRPair { key :: k, val :: v } deriving (Show)

instance Eq k => Eq (MRPair k v) where
  x == y = key x == key y
instance Ord k => Ord (MRPair k v) where  
  compare x y = compare (key x) (key y)
instance (Eq k, Monoid k, Monoid v) => Monoid (MRPair k v) where
  mempty = MRPair mempty mempty
  mappend x y = MRPair (key x) (val x `mappend` val y) 
instance Monoid Int where
  mempty  = 0
  mappend = (+)

-- | Returns a list of pairs indicating how frequently each word is used
wordFreq :: String -> [MRPair String Int]
wordFreq = myReduce . myGroup . myMap
  where myMap    = map (\x -> MRPair x 1) . words
        myGroup  = group . sort
        myReduce = map mconcat
        
-- | Similar to wordFreq, but per character        
charFreq :: String -> [MRPair String Int]
charFreq = myReduce . myGroup . myMap
  where myMap    = map (\x -> MRPair [x] 1)
        myGroup  = group . sort
        myReduce = map mconcat        