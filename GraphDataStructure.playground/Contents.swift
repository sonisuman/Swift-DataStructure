enum EdgeType {
    case directed
    case undirected
}

struct Vertex<Element> {
    let data: Element
    let index: Int
}

extension Vertex: Hashable where Element: Hashable {}
extension Vertex: Equatable where Element: Equatable {}

extension Vertex: CustomStringConvertible {
    var description: String {
        return "\(index) : \(data)"
    }
}

struct Edge<Element> {
    let source: Vertex<Element>
    let destination: Vertex<Element>
    let weight: Double?
}

protocol Graph {
    associatedtype Element
    func createVertex(data: Element) -> Vertex<Element>
    func addDirectedEdge(from source: Vertex<Element>,to destination: Vertex<Element>,weight: Double?)
    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>,weight: Double?)
    func add(_ edge: EdgeType, from source: Vertex<Element>,to destination: Vertex<Element>,weight: Double?)
    func edges(from source: Vertex<Element>) -> [Edge<Element>]
    func weight(from source: Vertex<Element>,to destination: Vertex<Element>) -> Double?
}

extension Graph {
    
    //addundirectedgraph
    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>,weight: Double?) {
        addDirectedEdge(from: source, to: destination, weight: weight)
         addDirectedEdge(from: destination, to: source, weight: weight)
    }
    
    //add
    func add(_ edge: EdgeType, from source: Vertex<Element>,to destination: Vertex<Element>,weight: Double?) {
        
        switch edge {
            
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
            
        case .undirected:
            addUndirectedEdge(between: source, and: destination, weight: weight)
        }
    }
}

class AdjacencyList<Element: Hashable> : Graph {
   
    private var adjancencies = [Vertex<Element>: [Edge<Element>]]()
    init() {}
    
    func createVertex(data: Element) -> Vertex<Element> {
        let vertex = Vertex(data: data, index: adjancencies.count)
        adjancencies[vertex] = []
        return vertex
    }
    
    func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjancencies[source]?.append(edge)
    }
    func edges(from source: Vertex<Element>) -> [Edge<Element>] {
        return adjancencies[source] ?? []
    }
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double? {
        return edges(from: source).first {$0.destination == destination}?.weight
    }
}

let graph = AdjacencyList<String>()
let singapore = graph.createVertex(data: "Singapore")
let tokyo = graph.createVertex(data: "Tokyo")
let hongkong = graph.createVertex(data: "Hong Kong")
let detroit = graph.createVertex(data: "Detroit")
let sanfrancisco = graph.createVertex(data: "San francisco")
let washingtonDc = graph.createVertex(data: "Washington DC")
let austinTexas = graph.createVertex(data: "Austin Texas")
let seattle = graph.createVertex(data: "Seattle")
graph.add(.undirected, from: singapore, to: tokyo, weight: 300)
graph.add(.undirected, from: tokyo, to: hongkong, weight: 300)
graph.add(.undirected, from: hongkong, to: detroit, weight: 300)
graph.add(.undirected, from: detroit, to: singapore, weight: 300)
graph.add(.undirected, from: sanfrancisco, to: tokyo, weight: 300)
graph.add(.undirected, from: washingtonDc, to: sanfrancisco, weight: 300)
graph.add(.undirected, from: austinTexas, to: seattle, weight: 300)
graph.add(.undirected, from: seattle, to: tokyo, weight: 300)
graph.add(.undirected, from: austinTexas, to: hongkong, weight: 300)

print(graph)

