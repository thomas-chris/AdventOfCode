import Foundation

public enum TwentyTwenty {}

extension TwentyTwenty {
    public class Day3 {
        

        public let input: String
        
        public init(_ input: String) {
            self.input = input
        }
    }
    
    public enum Tile: String {
        case empty = "."
        case tree = "#"
    }
}

extension TwentyTwenty.Day3 {
    
    public typealias Forest = [Position: TwentyTwenty.Tile]
    
    public func getMapAndHeight(from input: String) -> (forest: Forest, height: Int, width: Int) {
        let rows = input.components(separatedBy: "\n")
        
        var dictionary: Forest = [:]
        let height = rows.count
        let width = rows.first?.count ?? 0
        rows.enumerated().forEach { (rowIndex, row) in
            row.enumerated().forEach { (columnIndex, character) in
                dictionary[Position(x: columnIndex + 1, y: rowIndex + 1)] = TwentyTwenty.Tile(rawValue: String(character))
            }
        }
        
        return (dictionary, height, width)
    }
    
    public func countTreesInPath(describedBy move: (right: Int, down: Int), for forest: Forest, with height: Int, and width: Int) -> Int {
        var x = 1
        var y = 1
        
        let maxY = height
        let maxWidth = width
        
        var numberOfTrees = 0
        
        while y < maxY {
            y += move.down
            x += move.right
            
            if x > maxWidth {
                x = (x % maxWidth)
            }
            
            let position = Position(x: x, y: y)
            print(position)
            if forest[position] == .tree {
                numberOfTrees += 1
            }
            
        }
        
        return numberOfTrees
    }
}
