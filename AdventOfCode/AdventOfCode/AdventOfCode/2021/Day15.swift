import Algorithms
import Foundation
import Regex
import UIKit

public struct Day15 {
    
    public static func part1(_ input: [String]) -> Int {
        
        let maxX = input.first!.count
        let maxY = input.count
        var positions = Grid(input)
        var vertices = Set(positions.grid.map { (key, value) in
            Vertex(identifier: key)
        })
//
//        for vertex in vertices {
//            let neighbours = vertex.identifier.getAdjacentPositions().filter { position in
//                positions.grid[position] != nil
//            }
//
//            vertex.neighbors = neighbours.map({ position -> (Vertex, Double) in
//                let vertex1 = vertices.filter { vertex in
//                    vertex.identifier == position
//                }.first!
//                return (vertex1, Double(positions.grid[position]!))
//            })
//        }
//
//        let start = vertices.filter { vertex in
//            vertex.identifier == Position(x: 0, y: 0)
//        }.first!
//        let dijkstra = Dijkstra(vertices: vertices)
//        dijkstra.findShortestPaths(from: start)
//
//        return dijkstra.totalVertices.filter { vertex in
//            vertex.identifier == Position(x: maxX - 1, y: maxY - 1)
//        }.first!.pathLengthFromStart
        
        return positions.dijkstra(start: Position(x: 0, y: 0), end: Position(x: positions.rows - 1, y: positions.columns - 1))
    }
    
    public static func part2(_ input: [String]) -> Int {
        let maxX = input.first!.count
        let maxY = input.count
        var positions = Grid(input)
        
        for x in 0..<maxX {
            for y in 0..<maxY {
                for i in 1...5 {
                    var value = positions.grid[Position(x: x, y: y), default: 0] + (i - 1)
                    if value > 9 {
                        value = value % 9
                    }
                    positions.grid[Position(x: (x + ((i - 1) * maxX)), y: y)] = value
                }
            }
        }
        
        for x in 0 ..< (maxX*5) {
            for y in 0..<maxY {
                for i in 1...5 {
                    var value = positions.grid[Position(x: x, y: y), default: 0] + (i - 1)
                    if value > 9 {
                        value -= 9
                    }
                    positions.grid[Position(x: x, y: (y + ((i - 1) * maxY)))] = value
                }
            }
        }
        
        return positions.dijkstra(start: Position(x: 0, y: 0), end: Position(x: positions.rows - 1, y: positions.columns - 1))
    }
    
    private static func parse(_ input: [String]) {
    
    }
}
