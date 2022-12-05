import Algorithms
import Foundation
import Regex
import UIKit

public struct Day17 {
    
    public static func part1(_ input: String) -> Int {
        
        getMaxHeights(input).max()!
    }
    
    public static func part2(_ input: String) -> Int {
        getMaxHeights(input).count
    }
    
    private static func move(x: Int, y: Int, minY: Int, target: Grid) -> Int? {
        var position = Position.origin
        var x = x
        var y = y
        var maxHeight = 0
        while position.y > minY {
            position = position.move(x: x, y: y)
            x -= x.signum()
            y -= 1
            maxHeight = max(position.y, maxHeight)
            
            if target.grid.keys.contains(position) {
                return maxHeight
            }
        }
        
        return nil
    }
    
    private static func getMaxHeights(_ input: String) -> [Int] {
        let positions = Grid([])
        
        let values = input.replacingOccurrences(of: "target area: ", with: "").components(separatedBy: ", ")
        let xBounds = values[0].replacingOccurrences(of: "x=", with: "").components(separatedBy: "..").compactMap { Int($0) }
        let yBounds = values[1].replacingOccurrences(of: "y=", with: "").components(separatedBy: "..").compactMap { Int($0) }
        
        for y in yBounds[0]...yBounds[1] {
            for x in xBounds[0]...xBounds[1] {
                positions.grid[Position(x: x, y: y)] = 1
            }
        }
        
        var maxHeights: [Int] = []
        for x in 1...xBounds[1] {
            for y in yBounds[0]...(-yBounds[0]) {
                if let height = move(x: x, y: y, minY: yBounds[0], target: positions) {
                    maxHeights.append(height)
                }
            }
        }
        
        return maxHeights
    }
}
