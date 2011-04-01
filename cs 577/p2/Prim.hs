module Prim (
  edgeOk,
  prim
  ) where
import Data.Graph
import Data.Set as S
import Debug.Trace
import SimpleGraph as SG


prim :: (TreeSpannable a, VertexContainer b, TreeSpannable b) => a -> b -> b
prim graph soFar
  | (numVertices graph) == 0 = soFar       -- If all the vertices are in the tree, we're done
  | (numVertices soFar) == 0 =             -- If it's the first time through, we arbitrarily choose one             
    let (edge, graph') = bestEdgeWhere (\x -> True) graph
        tree = SG.insert soFar edge
    in prim graph' tree
  | otherwise =                                              -- Otherwise, recurse
    let (edge, graph') = bestEdgeWhere (edgeOk soFar) graph
        tree = SG.insert soFar edge
    in prim graph' tree    

         
-- | An edge is OK if one and only one of the vertices
--   are in the subset
edgeOk :: (VertexContainer a) => a -> WeightedEdge -> Bool 
edgeOk subset edge =
    let firstInSub = contains subset $ sourceVertex edge
        secInSub = contains subset $ destVertex edge
    in firstInSub `xor` secInSub    

{- ==== Utilities ==== -}
xor a b
  | a = not b
  | otherwise = b
                
-- | Like fst and snd, except they work with tuples of three
first (x, y, z) = x
second (x, y, z) = y
third (x, y, z) = z
                
-- | Ternary operator             
(?) :: Bool -> (t, t) -> t                  
a ? (b, c) = if a then b else c