import Algorithms
import Foundation
import Regex
import UIKit

public struct Day11 {
    
    public static func part1(_ input: [String], turns: Int) -> Int {
        
        var initialGrid = Grid(input)
        var totalFlashCount = 0
        
        for _ in 0..<turns {
            var newGrid = initialGrid
            var flashes = [Position]()
            
            initialGrid.grid.forEach { position, value in
                newGrid.grid[position] = value + 1
                if value + 1 == 10 {
                    flashes.append(position)
                }
                
            }
            
            while !flashes.isEmpty {
                let flashPosition = flashes.removeFirst()
                
                let surroundingPositions = flashPosition.matrix.filter { $0.x < 10 && $0.x >= 0 && $0.y < 10 && $0.y >= 0 }
                for position in surroundingPositions {
                    newGrid.grid[position, default: 0] += 1
                    if newGrid.grid[position]! == 10 {
                        flashes.append(position)
                        
                    }
                }
            }
            
            newGrid.grid.forEach { position, value in
                        if value >= 10 {
                            newGrid.grid[position] = 0
                            totalFlashCount += 1
                        }
                    }
            initialGrid = newGrid
        }

        return totalFlashCount
    }
    
    public static func part2(_ input: [String]) throws -> Int {
    
        var initialGrid = Grid(input)
        var totalFlashCount = 0
        var count = 0
        
        while !(initialGrid.grid.values.filter { $0 == 0 }.count == 100) {
            count += 1
            var newGrid = initialGrid
            var flashes = [Position]()
            
            initialGrid.grid.forEach { position, value in
                newGrid.grid[position] = value + 1
                if value + 1 == 10 {
                    flashes.append(position)
                }
                
            }
            
            while !flashes.isEmpty {
                let flashPosition = flashes.removeFirst()
                
                let surroundingPositions = flashPosition.matrix.filter { $0.x < 10 && $0.x >= 0 && $0.y < 10 && $0.y >= 0 }
                for position in surroundingPositions {
                    newGrid.grid[position, default: 0] += 1
                    if newGrid.grid[position]! == 10 {
                        flashes.append(position)
                        
                    }
                }
            }
            
            newGrid.grid.forEach { position, value in
                        if value >= 10 {
                            newGrid.grid[position] = 0
                            totalFlashCount += 1
                        }
                    }
            initialGrid = newGrid
        }

        
        return count
    }
}
