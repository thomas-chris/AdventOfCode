//
//  Position.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 11/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation
import UIKit

public struct Position: Equatable, Hashable {
    let x: Int
    let y: Int
    
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    public static var origin: Position {
        return Position(x: 0, y: 0)
    }
    
    func move(vector: Direction) -> Position {
        switch vector {
        case .up:
            return Position(x: self.x, y: self.y + 1)
        case .right:
            return Position(x: self.x + 1, y: self.y)
        case .down:
            return Position(x: self.x, y: self.y - 1)
        case .left:
            return Position(x: self.x - 1, y: self.y)
        }
    }
    
    func getAdjacentPositions() -> [Position] {
        Direction.allCases.map { direction in
            self.move(vector: direction)
        }
    }
    
    /// currently only does +1,-1 in any direction...
    func vector(_ newPostion: Position) -> [Position] {
        var positions = [Position]()
        let dx = (newPostion.x - self.x) / abs(gcd(newPostion.y - self.y, newPostion.x - self.x))
        let dy = (newPostion.y - self.y) / abs(gcd(newPostion.y - self.y, newPostion.x - self.x))
        
        var currentPostion = self
        while currentPostion != newPostion {
            positions.append(currentPostion)
            currentPostion = Position(x: currentPostion.x + dx, y: currentPostion.y + dy)
        }
        
        positions.append(newPostion)
        return positions
    }
}

extension Position {
    var matrix: [Position] {
        
        [(Position(x: self.x - 1, y: self.y - 1)),
         (Position(x: self.x - 1, y: self.y)),
         (Position(x: self.x - 1, y: self.y + 1)),
         (Position(x: self.x, y: self.y - 1)),
         (Position(x: self.x, y: self.y + 1)),
         (Position(x: self.x + 1, y: self.y - 1)),
         (Position(x: self.x + 1, y: self.y)),
         (Position(x: self.x + 1, y: self.y + 1)),
        ]
    }
}

public struct XYZ: Equatable, Hashable {
    let x: Int
    let y: Int
    let z: Int
    
    public init(x: Int, y: Int, z: Int) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    public static let zero = XYZ(x: 0, y: 0, z: 0)
    
    public var energy: Int {
        abs(x) + abs(y) + abs(z)
    }
}

public class Grid {
    
    var columns: Int {
        grid.keys.max { $0.y < $1.y }!.y + 1
    }
    
    var rows: Int {
        grid.keys.max { $0.x < $1.x }!.x + 1
    }
    public var grid: [Position: Int]
    
    init(_ input: [String]) {
        var dictionary = [Position: Int]()
         
        for y in 0..<input.count {
            let row = input[y]
            for x in 0..<row.count {
                dictionary[Position(x: x, y: y)] = Int(row[x])!
            }
        }
        
        
        grid = dictionary
    }
}

extension Grid {
    
    public func dijkstra(start: Position, end: Position) -> Int {
        dijkstra(start: start, end: end, maxPoint: Position(x: rows - 1, y: columns - 1))
    }
    
    // https://www.redblobgames.com/pathfinding/a-star/introduction.html
    public func dijkstra(start: Position, end: Position, maxPoint: Position, shouldDrawPath: Bool = false) -> Int {
        let queue = PriorityQueue<Position>()
        queue.enqueue(start, priority: 0)
        var cameFrom = [Position:Position]()
        var costSoFar = [Position: Int]()
        costSoFar[start] = 0
        
        while !queue.isEmpty {
            let current = queue.dequeue()!
            if current == end {
                break
            }
            
            for next in current.getAdjacentPositions().filter { grid[$0] != nil } {
                let gridPoint = Position(x: next.x % columns, y: next.y % rows)
                var gridScore = self.grid[gridPoint]!
                let newCost = costSoFar[current, default: 0] + gridScore
                if costSoFar[next] == nil || newCost < costSoFar[next, default: 0] {
                    costSoFar[next] = newCost
                    queue.enqueue(next, priority: newCost)
                    cameFrom[next] = current
                }
            }
        }
        
        //        print(costSoFar.count, cameFrom.count)
        
//        // Draw Path
//        if shouldDrawPath {
//            var path = [Point]()
//            var current: Point? = end
//            while current != nil {
//                if let point = current, let next = cameFrom[point] {
//                    path.append(next)
//                    current = next
//                } else {
//                    current = nil
//                }
//            }
//
//            path.reversed().forEach { print($0) }
//        }
        
        return costSoFar[end, default: -1]
    }
}


public class PriorityQueue<T: Hashable> {
    public var queue = [T:Int]()
    public var isEmpty: Bool {
        queue.isEmpty
    }
    
    public func enqueue(_ item: T, priority: Int) {
        queue[item] = priority
    }
    
    public func dequeue() -> T? {
        guard !queue.isEmpty else { return nil }
        let item = queue.sorted { p1, p2 in
            p1.value < p2.value
        }.first!.key
        queue.removeValue(forKey: item)
        return item
    }
}
