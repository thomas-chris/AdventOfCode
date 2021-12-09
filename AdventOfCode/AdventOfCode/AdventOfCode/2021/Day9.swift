import Algorithms
import Foundation
import Regex
import UIKit

public struct Day9 {
    
    public static func part1(_ input: [String]) -> Int {
        let grid = Grid(input)
        
        return getLowPoints(grid: grid)
            .map { grid[$0]! + 1}
            .reduce(0, +)
    }
    
    public static func part2(_ input: [String]) throws -> Int {
        let grid = Grid(input)
        
        return getLowPoints(grid: grid)
                .map { calcBasinPoints($0, visitedPositions: Set([$0]), grid: grid).count }
                .sorted()
                .suffix(3)
                .reduce(1, *)

    }
    
    private static func getLowPoints(grid: Grid) -> [Position] {
        grid.keys.compactMap { position -> Position? in
            let minimumSurroundingValue = position.getAdjacentPositions()
                .compactMap { position in
                    grid[position]
                }
                .min() ?? 0
            
                if grid[position]! < minimumSurroundingValue {
                    return position
                }
                return nil
            }
    }
    
    private static func calcBasinPoints(_ position: Position, visitedPositions: Set<Position>, grid: Grid) -> Set<Position> {
        var setOfPositions = visitedPositions
        
        let adjacent = position.getAdjacentPositions()

        for position in adjacent {
            if (grid[position] != 9 && grid[position] != nil) && !setOfPositions.contains(position) {
                setOfPositions.insert(position)
                setOfPositions = setOfPositions.union(calcBasinPoints(position, visitedPositions: setOfPositions, grid: grid))
            }
        }
        
        return setOfPositions
    }
    
}
