module Prim (
  edgeOk,
  prim'
  ) where
import Data.Graph
import Data.Set as S
import Debug.Trace
import SimpleGraph as SG


prim' :: (TreeSpannable a, VertexContainer a, VertexContainer b) => a -> b -> b
prim' graph soFar
  | (numVertices soFar) == (numVertices graph) = soFar     
  | otherwise = prim' graph $ SG.insert soFar (bestEdgeWhere (edgeOk soFar) graph)

{-
prim' :: WeightedGraph -> WeightedGraph -> WeightedGraph
prim' graph soFar
  -- If we're going through for the first time, arbitrarily choose
  -- the first vertex to be included
  | (vertexCount soFar) == 0 = 
    let v1 = first $ head graph                            
    in prim' graph [(v1, v1, 0)]    
  | (vertexCount graph) == (vertexCount soFar) = soFar
  | otherwise = prim' graph $ (bestEdge soFar graph):soFar
-}    
{-
-- | Considers the set of all edges with one vertex in the
--   subset and one outside. Returns the edge with the lowest
--   weight from this set.
bestEdge :: WeightedGraph -> WeightedGraph -> WeightedEdge
bestEdge _ [] = (0, 0, 999999)
bestEdge subset (e:graph)  
  | edgeOk e subset =
    let curWeight = getWeight e 
        recEdge = bestEdge subset graph
        curBest = curWeight < (getWeight recEdge)
        best = curBest ? (e, recEdge)
    in best
  | otherwise = bestEdge subset graph     
-}
{--         
   An edge is OK if one and only one of the vertices
   are in the subset
--}
edgeOk :: (VertexContainer a) => a -> WeightedEdge -> Bool 
edgeOk subset edge = 
  let firstInSub = contains subset $ sourceVertex edge
      secInSub = contains subset $ destVertex edge
  in firstInSub `xor` secInSub    

{-- === Graph Utilities === --}
{-
-- | Returns if a vertex is in a graph
graphContains :: WeightedGraph -> Vertex -> Bool 
graphContains [] _ = False
graphContains (x:xs) elem
   | (first x) == elem = True
   | (second x) == elem = True
   | otherwise = graphContains xs elem

-- | simpler to remember mnemonic
getWeight = third

-- | Returns a list of the (unique) vertices in a graph
vertexList :: WeightedGraph -> [Vertex]
vertexList [] = []
vertexList (e:graph) = 
  let vertexes = (first e):(second e):(vertexList graph)
  in S.toList $ S.fromList vertexes
     
vertexCount :: WeightedGraph -> Int
vertexCount graph = length $ vertexList graph
-}
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