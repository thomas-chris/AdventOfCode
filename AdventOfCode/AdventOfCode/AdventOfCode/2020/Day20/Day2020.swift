import Foundation

extension TwentyTwenty {
    public class Day20 {
        public init() {
        }
        
        public enum Edge: CaseIterable {
            case top, right, bottom, left
        }
        
        public struct Tile: Hashable {
            public let number: Int
            public let rows: [String]
            public var rotations: Int
            public var flippedInX: Bool
            public var flippedInY: Bool
            
            public var edgelessRows: [String] {
                var lines = [String]()
                let size = rows.count
                for y in 1 ... size - 1 {
                    let oldLine = rows[y]
                    var line = ""
                    for x in 1 ... size - 1 {
                        line.append(oldLine[x])
                    }
                    lines.append(line)
                }
                
                return lines
            }
            
            public init(number: Int, rows: [String], rotations: Int, flippedInX: Bool, flippedInY: Bool) {
                self.number = number
                self.rows = rows
                self.rotations = rotations
                self.flippedInX = flippedInX
                self.flippedInY = flippedInY
            }
            
            public init(tileLines: [String]) {
                let number = Int(tileLines.first!.replacingOccurrences(of: "Tile ", with: "").replacingOccurrences(of: ":", with: ""))!
                
                self.number = number
                self.rows = Array(tileLines.dropFirst())
                self.rotations = 0
                self.flippedInX = false
                self.flippedInY = false
            }
            
            public func edge(_ edge: Edge) -> String {
                switch edge {
                case .top:
                    return rows.first!
                case .bottom:
                    return rows.last!
                case .left:
                    return String(rows.map { String($0.first!) }.joined())
                case .right:
                    return rows.map { String($0.last!) }.joined()
                }
            }
            
            public func allEdges() -> [String] {
                Edge.allCases.map { self.edge($0) }
            }
            
            public func flipX() -> Tile {
                return Tile(number: self.number, rows: self.rows.map { String($0.reversed()) }, rotations: rotations, flippedInX: !self.flippedInX, flippedInY: self.flippedInY)
            }
            
            public func flipY() -> Tile {
                return Tile(number: self.number, rows: self.rows.reversed(), rotations: rotations, flippedInX: self.flippedInX, flippedInY: !self.flippedInY)
            }
            
            public func edgesForAllFlippages() -> Set<String> {
                return Set(allEdges() + flipX().allEdges() + flipY().allEdges())
            }
            
            public func allTiles() -> Set<Tile> {
                var set = Set<Tile>()
                set.insert(self)
                set.insert(flipX())
                set.insert(flipY())
                for i in 1...3 {
                    set.insert(rotateRight(rotations: i))
                    set.insert(flipX().rotateRight(rotations: i))
                    set.insert(flipY().rotateRight(rotations: i))
                }
                
                return set
            }
            
            public func rotateRight() -> Tile {
                let count = rows.count - 1
                var newRows: [String] = []
                
                for _ in 0 ... (count) {
                    newRows.append("")
                }
                
                rows.forEach { row in
                    row.enumerated().forEach { (index, character) in
                        newRows[count - index] = String(character) + (newRows[count - index])
                    }
                }
                
                return Tile(number: self.number, rows: newRows.reversed(), rotations: (self.rotations + 1) % 4, flippedInX: self.flippedInX, flippedInY: self.flippedInY)
            }
            
            func rotateRight(rotations: Int) -> Tile {
                var tile = self
                for _ in 1 ... rotations {
                    tile = tile.rotateRight()
                }
                
                return tile
            }
        }
        
    }
    
}

extension TwentyTwenty.Day20 {
    public func solvePart1(input: [String]) -> Int {
        
        let tiles = input.map { tile -> Tile in
            Tile(tileLines: tile.components(separatedBy: "\n"))
        }
        
        // dont need flipped in x and y as that is the same result as not flipped!
        let allPossibleTilesFlipped = tiles.flatMap { tile in
            return [tile, tile.flipX(), tile.flipY()]
        }
        
        let allEdges = tiles.flatMap { $0.allEdges() } + tiles.flatMap { $0.allEdges().map { String($0.reversed()) }}
        var allEdgesWithCounts = [String: Int]()
        
        allEdges.forEach { edge in
            let value = allEdgesWithCounts[edge] ?? 0
            allEdgesWithCounts[edge] = (value + 1)
        }
        
        let edgesWithNoMatches = allEdgesWithCounts.compactMap { (edge, count) -> String? in
            if count == 1 {
                return edge
            }
            return nil
        }
        
        let cornerTiles = tiles.filter { $0.edgesForAllFlippages().intersection(Set(edgesWithNoMatches)).count == 4
        }
        
        return cornerTiles.reduce(1) { (result, tile) -> Int in
            return result * tile.number
        }
    }
    
    public func solvePart2(input: [String]) -> Int {
        
        let size = Int(sqrt(Double(input.count)))
        
        var tiles = input.map { tile -> Tile in
            Tile(tileLines: tile.components(separatedBy: "\n"))
        }
        
        let allEdges = tiles.flatMap { $0.allEdges() } + tiles.flatMap { $0.allEdges().map { String($0.reversed()) }}
        var allEdgesWithCounts = [String: Int]()
        
        allEdges.forEach { edge in
            let value = allEdgesWithCounts[edge] ?? 0
            allEdgesWithCounts[edge] = (value + 1)
        }
        
        let edgesWithNoMatches = Set(allEdgesWithCounts.compactMap { (edge, count) -> String? in
            if count == 1 {
                return edge
            }
            return nil
        })
        
        var corners = [Tile]()
        var edges = [Tile]()
        
        corners = tiles.filter {
            $0.edgesForAllFlippages().intersection(Set(edgesWithNoMatches)).count == 4
        }
        let cornerNumbers = corners.map { $0.number }
        let tiles_noCorners = tiles.filter {
            !cornerNumbers.contains($0.number)
        }
        
        edges = tiles_noCorners.filter {
            $0.edgesForAllFlippages().intersection(Set(edgesWithNoMatches)).count == 2
        }
        
        var topLeft = corners[0]
        var grid: [Position: Tile] = [Position(x: 0, y: 0): topLeft]
        while !Set([topLeft.edge(.top), topLeft.edge(.left)]).isSubset(of: edgesWithNoMatches) {
            topLeft = topLeft.rotateRight()
        }
        
        //get top row...
        var matchingTile = topLeft
        for i in 1...15 {
            for tile in edges {
                if matchingTile.number == tile.number { continue }
                else if tile.edge(.left) == matchingTile.edge(.right) && edgesWithNoMatches.contains(tile.edge(.top)) {
                    grid[Position(x: i, y: 0)] = tile
                    matchingTile = tile
                    break
                }
                
                else if tile.rotateRight().edge(.left) == matchingTile.edge(.right) && edgesWithNoMatches.contains(tile.rotateRight(rotations: 1).edge(.top)) {
                    grid[Position(x: i, y: 0)] = tile.rotateRight()
                    matchingTile = tile.rotateRight()
                    break
                }
                
                else if tile.rotateRight(rotations: 2).edge(.left) == matchingTile.edge(.right) && edgesWithNoMatches.contains(tile.rotateRight(rotations: 2).edge(.top)) {
                    grid[Position(x: i, y: 0)] = tile.rotateRight(rotations: 2)
                    matchingTile = tile.rotateRight(rotations: 2)
                    break
                }
                
                else if tile.rotateRight(rotations: 3).edge(.left) == matchingTile.edge(.right) && edgesWithNoMatches.contains(tile.rotateRight(rotations: 3).edge(.top)) {
                    grid[Position(x: i, y: 0)] = tile.rotateRight(rotations: 3)
                    matchingTile = tile.rotateRight(rotations: 3)
                    break
                }
                
                else if tile.flipX().edge(.left) == matchingTile.edge(.right) && edgesWithNoMatches.contains(tile.flipX().edge(.top)) {
                    grid[Position(x: i, y: 0)] = tile.flipX()
                    matchingTile = tile.flipX()
                    break
                }
                
                else if tile.flipX().rotateRight(rotations: 1).edge(.left) == matchingTile.edge(.right) && edgesWithNoMatches.contains(tile.flipX().rotateRight(rotations: 1).edge(.top)) {
                    grid[Position(x: i, y: 0)] = tile.flipX().rotateRight(rotations: 1)
                    matchingTile = tile.flipX().rotateRight(rotations: 1)
                    break
                }
                
                else if tile.flipX().rotateRight(rotations: 2).edge(.left) == matchingTile.edge(.right) && edgesWithNoMatches.contains(tile.flipX().rotateRight(rotations: 2).edge(.top)) {
                    grid[Position(x: i, y: 0)] = tile.flipX().rotateRight(rotations: 2)
                    matchingTile = tile.flipX().rotateRight(rotations: 2)
                    break
                }
                
                else if tile.flipX().rotateRight(rotations: 3).edge(.left) == matchingTile.edge(.right) && edgesWithNoMatches.contains(tile.flipX().rotateRight(rotations: 3).edge(.top)) {
                    grid[Position(x: i, y: 0)] = tile.flipX().rotateRight(rotations: 3)
                    matchingTile = tile.flipX().rotateRight(rotations: 3)
                    break
                }
            }
        }
        
        for tile in corners {
            if tile.edge(.left) == matchingTile.edge(.right) && edgesWithNoMatches.contains(tile.edge(.top)) && edgesWithNoMatches.contains(tile.edge(.right)) {
                grid[Position(x: 11, y: 0)] = tile
                matchingTile = tile
                break
            }
            
            else if tile.rotateRight().edge(.left) == matchingTile.edge(.right) && edgesWithNoMatches.contains(tile.rotateRight(rotations: 1).edge(.top)) && edgesWithNoMatches.contains(tile.rotateRight(rotations: 1).edge(.right)) {
                grid[Position(x: 11, y: 0)] = tile.rotateRight()
                matchingTile = tile.rotateRight()
                break
            }
            
            else if tile.rotateRight(rotations: 2).edge(.left) == matchingTile.edge(.right) && edgesWithNoMatches.contains(tile.rotateRight(rotations: 2).edge(.top)) && edgesWithNoMatches.contains(tile.rotateRight(rotations: 2).edge(.right)) {
                grid[Position(x: 11, y: 0)] = tile.rotateRight(rotations: 2)
                matchingTile = tile.rotateRight(rotations: 2)
                break
            }
            
            else if tile.rotateRight(rotations: 3).edge(.left) == matchingTile.edge(.right) && edgesWithNoMatches.contains(tile.rotateRight(rotations: 3).edge(.top)) && edgesWithNoMatches.contains(tile.rotateRight(rotations: 3).edge(.right)) {
                grid[Position(x: 11, y: 0)] = tile.rotateRight(rotations: 3)
                matchingTile = tile.rotateRight(rotations: 3)
                break
            }
            
            else if tile.flipX().edge(.left) == matchingTile.edge(.right) && edgesWithNoMatches.contains(tile.flipX().edge(.top)) && edgesWithNoMatches.contains(tile.flipX().edge(.right)) {
                grid[Position(x: 11, y: 0)] = tile.flipX()
                matchingTile = tile.flipX()
                break
            }
            
            else if tile.flipX().rotateRight(rotations: 1).edge(.left) == matchingTile.edge(.right) && edgesWithNoMatches.contains(tile.flipX().rotateRight(rotations: 1).edge(.top)) && edgesWithNoMatches.contains(tile.flipX().rotateRight(rotations: 1).edge(.right)) {
                grid[Position(x: 11, y: 0)] = tile.flipX().rotateRight(rotations: 1)
                matchingTile = tile.flipX().rotateRight(rotations: 1)
                break
            }
            
            else if tile.flipX().rotateRight(rotations: 2).edge(.left) == matchingTile.edge(.right) && edgesWithNoMatches.contains(tile.flipX().rotateRight(rotations: 2).edge(.top)) && edgesWithNoMatches.contains(tile.flipX().rotateRight(rotations: 2).edge(.right)) {
                grid[Position(x: 11, y: 0)] = tile.flipX().rotateRight(rotations: 2)
                matchingTile = tile.flipX().rotateRight(rotations: 2)
                break
            }
            
            else if tile.flipX().rotateRight(rotations: 3).edge(.left) == matchingTile.edge(.right) && edgesWithNoMatches.contains(tile.flipX().rotateRight(rotations: 3).edge(.top)) && edgesWithNoMatches.contains(tile.flipX().rotateRight(rotations: 3).edge(.right)) {
                grid[Position(x: 11, y: 0)] = tile.flipX().rotateRight(rotations: 3)
                matchingTile = tile.flipX().rotateRight(rotations: 3)
                break
            }
        }
        
        for i in 0...11 {
            for j in 1...11 {
                let matching = matchTile(above: grid[Position(x: i, y: j - 1)]!, left: grid[Position(x: i-0, y: j)], tiles: tiles)
                grid[Position(x: i, y: j)] = matching
            }
        }
        
        let sea = constructGrid(grid, size: 12)
        draw(sea)
        let sea1 = rotate(sea)
        
        draw(sea1)
        let sea2 = rotate(sea1)
        
        draw(sea2)
        let sea3 = rotate(sea2)
        
        draw(sea3)

        var count = 0
        for i in sea {
            for j in i {
                if j == "#" {
                    count += 1
                }
            }
        }
        return 0
    }
    
    func removeTile(tile: Tile, from tiles: [Tile]) -> [Tile] {
        return tiles.filter { (value) -> Bool in
            value.number != tile.number
        }
    }
    
    private func matchTile(above: Tile, left: Tile?, tiles: [Tile]) -> Tile {
        let aboveBottom = above.edge(.bottom)
        for tile in tiles {
            if let left = left {
                let leftRight = left.edge(.right)
                if aboveBottom == tile.edge(.top) && leftRight == tile.edge(.left) {
                    return tile
                } else if aboveBottom == tile.rotateRight(rotations: 1).edge(.top) && leftRight == tile.rotateRight(rotations: 1).edge(.left) {
                    return tile.rotateRight(rotations: 1)
                } else if aboveBottom == tile.rotateRight(rotations: 2).edge(.top) && leftRight == tile.rotateRight(rotations: 2).edge(.left) {
                    return tile.rotateRight(rotations: 2)
                } else if aboveBottom == tile.rotateRight(rotations: 3).edge(.top) && leftRight == tile.rotateRight(rotations: 3).edge(.left) {
                    return tile.rotateRight(rotations: 3)
                } else if aboveBottom == tile.flipX().edge(.top) && leftRight == tile.flipX().edge(.left) {
                    return tile.flipX()
                } else if aboveBottom == tile.flipX().rotateRight(rotations: 1).edge(.top) && leftRight == tile.flipX().rotateRight(rotations: 1).edge(.left) {
                    return tile.flipX().rotateRight(rotations: 1)
                } else if aboveBottom == tile.flipX().rotateRight(rotations: 2).edge(.top) && leftRight == tile.flipX().rotateRight(rotations: 2).edge(.left) {
                    return tile.flipX().rotateRight(rotations: 2)
                } else if aboveBottom == tile.flipX().rotateRight(rotations: 3).edge(.top) && leftRight == tile.flipX().rotateRight(rotations: 3).edge(.left) {
                    return tile.flipX().rotateRight(rotations: 3)
                }
            } else {
                if aboveBottom == tile.edge(.top) {
                    return tile
                } else if aboveBottom == tile.rotateRight(rotations: 1).edge(.top) {
                    return tile.rotateRight(rotations: 1)
                } else if aboveBottom == tile.rotateRight(rotations: 2).edge(.top) {
                    return tile.rotateRight(rotations: 2)
                } else if aboveBottom == tile.rotateRight(rotations: 3).edge(.top) {
                    return tile.rotateRight(rotations: 3)
                } else if aboveBottom == tile.flipX().edge(.top) {
                    return tile.flipX()
                } else if aboveBottom == tile.flipX().rotateRight(rotations: 1).edge(.top) {
                    return tile.flipX().rotateRight(rotations: 1)
                } else if aboveBottom == tile.flipX().rotateRight(rotations: 2).edge(.top) {
                    return tile.flipX().rotateRight(rotations: 2)
                } else if aboveBottom == tile.flipX().rotateRight(rotations: 3).edge(.top) {
                    return tile.flipX().rotateRight(rotations: 3)
                }
            }
        }
        fatalError()
    }
    
    func indexOf(_ tile: Tile, items: [Tile]) -> Int {
        for i in 0..<items.count {
            if items[i].number == tile.number {
                return i
            }
        }
        return -1
    }
    
    func constructGrid(_ tiles: [Position: Tile], size: Int) -> [[String] ]{
        let smallerSize = tiles.first!.value.edgelessRows.count
        let gridSize = size*smallerSize
        var grid: [[String]] = Array(repeating: Array(repeating: ".", count: gridSize), count: gridSize)

        for y in 0..<size {
            for x in 0..<size {
                let point = Position(x: x, y: y)
                let tile = tiles[point]!
                let edgeless = tile.edgelessRows
                for y2 in 0..<smallerSize {
                    for x2 in 0..<smallerSize {
                        let character = edgeless[y2][x2]
                        let gp = Position(x: (x * smallerSize) + x2, y: (y * smallerSize) + y2)
                        grid[gp.y][gp.x] = character
                    }
                }
            }
        }
        return grid
    }
    
    func rotate(_ grid: [[String]]) -> [[String]] {
        var output = [[String]]()
        let size = grid.count
        
        for x in 0..<size {
            var line = [String]()
            for y in 0..<size {
                line.append((grid[size - 1 - y][x]))
            }
            output.append(line)
        }
        
        return output
    }
    
    func draw(_ grid: [[String]]) {
        for row in grid {
            var line = ""
            for value in row {
                line.append(value)
            }
            print(line)
        }
        print()
    }
}
