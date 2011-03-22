import SimpleGraph as SG
import GraphData
import Prim

edgeOkTest = edgeOk ((graphFromList graph1) :: SimpleGraph) (SG.WeightedEdge (1, 4, 0))
primTest = intPrim ((graphFromList graph1) :: SimpleGraph)

primGeneric graph = intPrim ((graphFromList graph) :: SimpleGraph)

intPrim graph = prim' graph $ (graphFromList [WeightedEdge (1,1,0)] :: SimpleGraph)

