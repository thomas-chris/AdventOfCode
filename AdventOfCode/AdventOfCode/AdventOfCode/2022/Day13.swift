import Algorithms
import Foundation
import Regex
import UIKit

public struct Day13 {
    
    private static func parse(_ input: [String]) -> ([Position: Int], [(String, Int)]) {
        var positions = [Position: Int]()
        var folds = [(String, Int)]()
        
        for line in input {
            if line.first != "f" {
            let coordinates = line.split(separator: ",").compactMap { Int($0) }
            if coordinates.count == 2 {
                positions[Position(x: coordinates[0], y: coordinates[1])] = 1
            }
            } else {
                    let components = line.replacingOccurrences(of: "fold along ", with: "").split(separator: "=")
                    folds.append((String(components[0]), Int(components[1])!))
            }
        }
        
        return (positions, folds)
    }
    
    private static func foldInX(_ positions: [Position: Int], fold: Int) -> [Position: Int] {
        var newPositions = [Position: Int]()
        positions.forEach { (key, value) in
            if key.x - fold > 0 {
                let x = (fold * 2) - key.x
                newPositions[Position(x: x, y: key.y)] = 1
            } else {
                newPositions[Position(x: key.x, y: key.y)] = 1
            }
        }
        
        return newPositions
    }
    
    private static func foldInY(_ positions: [Position: Int], fold: Int) -> [Position: Int] {
        var newPositions = [Position: Int]()
        positions.forEach { (key, value) in
            if key.y - fold > 0 {
                let y = (fold * 2) - key.y
                newPositions[Position(x: key.x, y: y)] = 1
            } else {
                newPositions[Position(x: key.x, y: key.y)] = 1
            }
        }
        
        return newPositions
    }
    
    public static func part1(_ input: [String]) -> Int {
        let (positions, folds) = parse(input)
        
        let fold = folds.first!
        var newPositions = [Position: Int]()
        
        if fold.0 == "x" {
            newPositions = foldInX(positions, fold: fold.1)
        }
        
        if fold.0 == "y" {
            newPositions = foldInY(positions, fold: fold.1)
        }
        
        return newPositions.count
    }
    public static func part2(_ input: [String]) {
        var (positions, folds) = parse(input)
        
        for fold in folds {
            var newPositions = [Position: Int]()
            if fold.0 == "x" {
                
                newPositions = foldInX(positions, fold: fold.1)
            }
            if fold.0 == "y" {
                newPositions = foldInY(positions, fold: fold.1)
            }
            positions = newPositions
        }
        
        let (minX, maxY) = extremes(Array(positions.keys))
        for y in minX.y ... maxY.y {
            var row = ""
            for x in minX.x...maxY.x {
                positions[Position(x: x, y: y)] == 1 ? row.append("◼️") : row.append("◻️")
            }
            print(row)
            
        }
    }
    
    public static func extremes(_ points: [Position]) -> (Position, Position) {
        var miniX = Int.max
        var miniY = Int.max
        var maxiX = 0
        var maxiY = 0
        for point in points {
            miniX = min(point.x, miniX)
            miniY = min(point.y, miniY)
            maxiX = max(point.x, maxiX)
            maxiY = max(point.y, maxiY)
        }
        return (Position(x: miniX, y: miniY), Position(x: maxiX, y: maxiY))
    }
    
}

extension Array where Element == Position {
    
}
