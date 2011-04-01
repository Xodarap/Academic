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
         destVertex,
         getWeight
       ) where

import Data.Graph 
import Data.Set as S
import Data.List as L
import Data.Monoid

{- ========== Basic Datatypes of the graph ======= -}
type Weight = Int
data WeightedEdge = WeightedEdge (Vertex, Vertex, Weight) deriving (Show)
type WeightedGraph = [WeightedEdge]

instance Eq WeightedEdge where
  x == y = foldr (&&) True $ zipWith (==) (edgeToArray x) (edgeToArray y)

instance Ord WeightedEdge where
  -- | To compare two edges, we first check their weights,
  --   then the source, then the dest. We really only care
  --   about weight, but in order for this to be consistent
  --   we have to specify an exact comparison
  x `compare` y =
    let xdata = edgeToArray x
        ydata = edgeToArray y
        -- As a monoid, Order just keeps going till it finds something not EQ
    in foldl mappend EQ $ zipWith compare xdata ydata

-- instance Functor WeightedEdge

-- | An edge is an (Int, Int, Int); this translates it to an [Int, Int, Int]
edgeToArray :: WeightedEdge -> [Int]
edgeToArray edge =
  let ordFns = [getWeight, sourceVertex, destVertex]
  in zipWith (\f x -> f x) ordFns $ repeat edge      

-- | An object which can contain vertices
--   This abstracts over both the graph and the 
--   structure containing the minimum spanning tree
class VertexContainer a where
  contains :: a -> Vertex -> Bool
  insert :: a -> Maybe WeightedEdge -> a
  empty :: a -> Bool
  
-- | An object which we can calculate the MST for  
--   Basically, all we need to be able to do is find the
--   cheapest edge satisfying a predicate. The other methods
--   are sugar
class TreeSpannable a where
  graphVertices :: a -> [Vertex]
  graphFromList :: WeightedGraph -> a
  bestEdgeWhere :: (WeightedEdge -> Bool) -> a -> (Maybe WeightedEdge, a)
  numVertices :: a -> Int
  
-- | SimpleGraph is a naive implementation which is used for unit
--   testing
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
  numVertices graph = length $ graphVertices graph
  
instance VertexContainer SimpleGraph where
  contains (SimpleGraph []) _ = False
  contains (SimpleGraph (x:xs)) elem
   | (sourceVertex x) == elem = True
   | (destVertex x) == elem = True
   | otherwise = contains (SimpleGraph xs) elem  
  insert graph Nothing = graph
  insert (SimpleGraph graph) (Just edge) = graphFromList $ edge:graph
  empty (SimpleGraph []) = True
  empty _ = False

instance Show SimpleGraph where
  show (SimpleGraph a) = show a

instance Eq SimpleGraph where
  (SimpleGraph x) == (SimpleGraph y) = (x == y)

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