module GraphData 
       (graph1,
        graph2) where
import SimpleGraph

graph1 :: WeightedGraph
graph1 = wgFromList $ [(1, 2, 1), (1, 3, 2), (2, 3, 1)]

graph2 :: WeightedGraph
graph2 = wgFromList $ [(1,2,1), (2,4,1), (1,3,3), (1,4,2), (4,6,1), (6,5,2), (3,5,1), (4,3,2)]