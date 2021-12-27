import Algorithms
import Foundation
import UIKit

public struct Day25 {
    
    enum Cucumber {
        case south
        case east
        case free
        
        init?(_ string: Character) {
            if string == "v" {
                self = .south
            } else if string == ">" {
                self = .east
            } else {
                self = .free
            }
        }
        
        var description: Character {
            switch self {
            case .south:
                return "v"
            case .east:
                return ">"
            case .free:
                return "."
            }
        }
    }
    public static func part1(_ input: [String]) -> Int {
        
        var positions: [Position: Cucumber] = [:]
        let maxX = input.first!.count
        let maxY = input.count
        for (yIndex, row) in input.enumerated() {
            for (xIndex, value) in row.enumerated() {
                if let cucumber = Cucumber(value) {
                    positions[Position(x: xIndex, y: yIndex)] = cucumber
                }
            }
        }
        
        var steps = 0
        while true {
            let next = move(positions, maxX: maxX, maxY: maxY)
            steps += 1
            //draw(next.0, maxX: maxX, maxY: maxY)
            if next.1 == 0 {
                break
            }
            
            positions = next.0
        }
        
        return steps
    }
    
    public static func part2(_ input: [String]) -> Int {
        return 1
    }
    
    private static func move(_ oldPositions: [Position: Cucumber], maxX: Int, maxY: Int) -> ([Position: Cucumber], Int) {
        var newPositions = oldPositions
        var moved = Set<Position>()
        var movedCount = 0
        for y in 0..<maxY {
            for x in 0..<maxX {
                if oldPositions[Position(x: x, y: y)] != .east || moved.contains(Position(x: x, y: y)) { continue }
                    var newX = (x + 1)
                    newX = newX == maxX ? 0 : newX
                    if oldPositions[Position(x: newX, y: y)] == .free {
                        newPositions[Position(x: newX, y: y)] = .east
                        newPositions[Position(x: x, y: y)] = .free
                        moved.insert(Position(x: newX, y: y))
                        movedCount += 1
                    }
                }
            }
        
        var eastMoved = newPositions
        for y in 0..<maxY {
            for x in 0..<maxX {
                if newPositions[Position(x: x, y: y)] != .south || moved.contains(Position(x: x, y: y)) { continue }
                    var newY = (y + 1)
                    newY = newY == maxY ? 0 : newY
                    if newPositions[Position(x: x, y: newY)] == .free {
                        eastMoved[Position(x: x, y: newY)] = .south
                        eastMoved[Position(x: x, y: y)] = .free
                        moved.insert(Position(x: x, y: newY))
                        movedCount += 1
                    }
                }
        }
        
        return (eastMoved, movedCount)
    }
    
    private static func draw(_ grid: [Position: Cucumber], maxX: Int, maxY: Int) {
        
        for y in 0..<maxY {
            var row = ""
            for x in 0..<maxX {
                let char = grid[Position(x: x, y: y)]!.description
                row.append(char)
            }
            print("\(row)\n")
        }
    }
    
}
