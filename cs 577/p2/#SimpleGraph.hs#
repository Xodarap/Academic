module SimpleGraph
       ( TreeSpannable,
         SimpleGraph (..),
         Weight,
         WeightedEdge (..),
         WeightedGraph,
         contains,
         graphVertices,
         numVertices,
         graphFromList,
         bestEdgeWhere,
         SimpleGraph.insert,
         VertexContainer,
         wgFromList,
         sourceVertex,
         destVertex
       ) where

import Data.Graph 
import Data.Set as S
import Data.List as L
import Data.Monoid

type Weight = Int
data WeightedEdge = WeightedEdge (Vertex, Vertex, Weight)
type WeightedGraph = [WeightedEdge]

instance Eq WeightedEdge where
  x == y = (getWeight x)  == (getWeight y) &&
           sourceVertex x == sourceVertex y &&
           destVertex x   == destVertex y

instance Ord WeightedEdge where
  x <= y = foldl
    
    ((compare x y `mappend`
            compare x y  `mappend`
            compare x y)

instance Show WeightedEdge where
  show (WeightedEdge x) = show x

-- | An object which can contain vertices
--   This abstracts over both the graph and the 
--   structure containing the minimum spanning tree
class VertexContainer a  where
  contains :: a -> Vertex -> Bool
  insert :: a -> WeightedEdge -> a
  numVertices :: a -> Int
  
-- | An object which we can calculate the MST for  
--   Basically, all we need to be able to do is find the
--   cheapest edge satisfying a predicate. The other methods
--   are sugar
class TreeSpannable a where
  graphVertices :: a -> [Vertex]
  graphFromList :: WeightedGraph -> a
  bestEdgeWhere :: (WeightedEdge -> Bool) -> a -> (Maybe WeightedEdge, a)

data SimpleGraph = SimpleGraph WeightedGraph

instance TreeSpannable SimpleGraph where
  graphVertices (SimpleGraph []) = []
  graphVertices (SimpleGraph (edge:graph)) =
    let vertexes = (sourceVertex edge):(destVertex edge):(graphVertices $ SimpleGraph graph)
    in sort $ L.nub $ S.toList $ S.fromList vertexes
  graphFromList graph = SimpleGraph graph
  bestEdgeWhere fn (SimpleGraph graph) =
    let okEdges = L.filter fn graph
        -- Remove the edge which matches with the lowest weight
        g1      = L.filter (not . fn) graph        -- anything not matching pred is ok
        g2      = tail' $ sort $ L.filter fn graph -- sort by weight and remove highest
        graph'  = graphFromList $ g1 ++ g2
    in (headM $ sort okEdges, graph')

instance VertexContainer SimpleGraph where
  contains (SimpleGraph []) _ = False
  contains (SimpleGraph (x:xs)) elem
   | (sourceVertex x) == elem = True
   | (destVertex x) == elem = True
   | otherwise = contains (SimpleGraph xs) elem  
  insert (SimpleGraph graph) edge = graphFromList (edge:graph)
  numVertices graph = length $ graphVertices graph

instance Show SimpleGraph where
  show (SimpleGraph a) = show a

headM :: [a] -> Maybe a
headM [] = Nothing
headM (x:xs) = Just x

-- | Like tail except (tail' [] = [])
tail' [] = []
tail' x = tail x

{- ==== Utilities ==== -}
xor a b
  | a = not b
  | otherwise = b
                
-- | Like fst and snd, except they work with tuples of three
first (x, y, z) = x
second (x, y, z) = y
third (x, y, z) = z
                
getWeight :: WeightedEdge -> Weight
getWeight (WeightedEdge x) = third x                 

sourceVertex :: WeightedEdge -> Vertex
sourceVertex (WeightedEdge x) = first x

destVertex :: WeightedEdge -> Vertex
destVertex (WeightedEdge x) = second x

wgFromList xs = L.map (\x -> WeightedEdge x) xs

-- | Ternary operator             
(?) :: Bool -> (t, t) -> t                  
a ? (b, c) = if a then b else c                    