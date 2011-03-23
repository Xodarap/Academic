module HeapGraph (
  EdgeHeap (..)
                 ) where

import SimpleGraph as SG
import Data.Heap as H
import Data.Graph
import Data.List as L  
import GraphData
import Control.Applicative
import Control.Monad
import Test.QuickCheck
import Prim

data EdgeHeap = EdgeHeap (MinHeap WeightedEdge) deriving (Show)
    
instance TreeSpannable EdgeHeap where
  bestEdgeWhere pred (EdgeHeap heap) =
    let (match, nomatch) = H.partition pred heap
        res = view match
        item = fmap fst res
        together = union' (fmap snd res) $ pure nomatch
    in (item, EdgeHeap together) -- (m a, m b) -> m (a, b)     
  graphVertices (EdgeHeap heap) =
    let edges = heapInOrder $ Just heap
        verts = foldr (\x ac -> (sourceVertex x):(destVertex x):ac) [] edges
    in sort $ L.nub verts    
  graphFromList lst = EdgeHeap (H.fromList lst)
  numVertices graph = length $ graphVertices graph
  
heapContains :: ((Eq item), HeapItem pol item) => Heap pol item -> item -> Bool
heapContains heap item =
  let filterFn = (\x -> x == item)
      match = H.filter filterFn heap
      cnt = size match
  in (cnt > 0)    

-- | Displays the heap in sorted order. Useful for debugging
heapInOrder :: (HeapItem pol item) => Maybe (Heap pol item) -> [item]
heapInOrder Nothing = []
heapInOrder (Just hp) = 
  let next = view hp
      curVal = fmap fst next
      nextVal = heapInOrder $ fmap snd next
  in myCat curVal nextVal    

myCat :: Maybe a -> [a] -> [a]
myCat Nothing x = x
myCat (Just x) xs = x:xs
 
-- | Like Heap.Union, but it accepts Maybes. 
union' :: (Ord prio) => Maybe (HeapT prio val) -> Maybe (HeapT prio val) -> (HeapT prio val)
union' Nothing (Just x) = x
union' (Just x) Nothing = x
union' (Just x) (Just y) = H.union x y

{- =========== Unit Tests =============== -}
doTests =
  let args = Args { maxSuccess = 1000,
                    chatty = True,
                    maxDiscard = 1,
                    replay = Nothing,
                    maxSize = 99
                    }
  in
   do
     quickCheckWith args (\x v -> removeBestTest (pred v) x)
     where pred v x = sourceVertex x == v

-- | Compares removing the best node in a naive implementation to
--   doing it in an EdgeHeap
removeBestTest :: (WeightedEdge -> Bool) -> WeightedGraph -> Bool
removeBestTest _ [] = True
removeBestTest pred x =
  let simpGraph = graphFromList x :: SimpleGraph
      heap      = graphFromList x :: EdgeHeap
      (eg, g')  = bestEdgeWhere pred simpGraph
      (eh, h')  = bestEdgeWhere pred heap
  in (eg == eh) &&                           -- They should remove the same edge
     (graphVertices g' == graphVertices h')  -- And have the same vertexes remaining afterwards
     
instance Arbitrary WeightedEdge where     
  arbitrary = liftM (\x -> WeightedEdge x) (arbitrary :: Gen (Int, Int, Int))
  
-- | Compares Prim's algorithm on the naive graph to the heap
--   implementation
primTest :: WeightedGraph -> Bool
primTest [] = True
primTest graph = 
  let simpGraph = graphFromList graph :: SimpleGraph
      heap      = graphFromList graph :: EdgeHeap
      store1    = SimpleGraph []
      store2    = SimpleGraph []
      prim1     = prim simpGraph store1
      prim2     = prim heap store2
  in prim1 == prim2    
{- =============== Data =============== -}  
heap1 :: Heap MinPolicy WeightedEdge     
heap1 = H.fromList [WeightedEdge (1,2,3)] :: MinHeap WeightedEdge

heap2 :: Heap MinPolicy WeightedEdge
heap2 = H.fromList graph2 :: MinHeap WeightedEdge
  