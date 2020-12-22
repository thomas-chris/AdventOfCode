import Foundation
import Regex

extension TwentyTwenty {
    public class Day20 {
        public init() {
        }
    }
}

extension TwentyTwenty.Day20 {
    public func solvePart1(input: [String]) -> Int {
        
        let tiles = input.map { tile -> Tile in
            Tile(tileLines: tile.components(separatedBy: "\n"))
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
        
        let tiles = input.map { tile -> Tile in
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
        corners = Array(corners.dropFirst())
        
        while !Set([topLeft.edge(.top), topLeft.edge(.left)]).isSubset(of: edgesWithNoMatches) {
            topLeft = topLeft.rotateRight()
        }
        
        var grid: [Position: Tile] = [Position(x: 0, y: 0): topLeft]
        //get top row...
        var matchingTile = topLeft
        var edgeNumbers = [Int]()
        for i in 1...15 {
            for tile in edges {
                if matchingTile.number == tile.number { continue }
                else if tile.edge(.left) == matchingTile.edge(.right) && edgesWithNoMatches.contains(tile.edge(.top)) {
                    grid[Position(x: i, y: 0)] = tile
                    matchingTile = tile
                    edgeNumbers.append(tile.number)
                    break
                }
                
                else if tile.rotateRight().edge(.left) == matchingTile.edge(.right) && edgesWithNoMatches.contains(tile.rotateRight(rotations: 1).edge(.top)) {
                    grid[Position(x: i, y: 0)] = tile.rotateRight()
                    matchingTile = tile.rotateRight()
                    edgeNumbers.append(tile.number)
                    break
                }
                
                else if tile.rotateRight(rotations: 2).edge(.left) == matchingTile.edge(.right) && edgesWithNoMatches.contains(tile.rotateRight(rotations: 2).edge(.top)) {
                    grid[Position(x: i, y: 0)] = tile.rotateRight(rotations: 2)
                    matchingTile = tile.rotateRight(rotations: 2)
                    edgeNumbers.append(tile.number)
                    break
                }
                
                else if tile.rotateRight(rotations: 3).edge(.left) == matchingTile.edge(.right) && edgesWithNoMatches.contains(tile.rotateRight(rotations: 3).edge(.top)) {
                    grid[Position(x: i, y: 0)] = tile.rotateRight(rotations: 3)
                    matchingTile = tile.rotateRight(rotations: 3)
                    edgeNumbers.append(tile.number)
                    break
                }
                
                else if tile.flipX().edge(.left) == matchingTile.edge(.right) && edgesWithNoMatches.contains(tile.flipX().edge(.top)) {
                    grid[Position(x: i, y: 0)] = tile.flipX()
                    matchingTile = tile.flipX()
                    edgeNumbers.append(tile.number)
                    break
                }
                
                else if tile.flipX().rotateRight(rotations: 1).edge(.left) == matchingTile.edge(.right) && edgesWithNoMatches.contains(tile.flipX().rotateRight(rotations: 1).edge(.top)) {
                    grid[Position(x: i, y: 0)] = tile.flipX().rotateRight(rotations: 1)
                    matchingTile = tile.flipX().rotateRight(rotations: 1)
                    edgeNumbers.append(tile.number)
                    break
                }
                
                else if tile.flipX().rotateRight(rotations: 2).edge(.left) == matchingTile.edge(.right) && edgesWithNoMatches.contains(tile.flipX().rotateRight(rotations: 2).edge(.top)) {
                    grid[Position(x: i, y: 0)] = tile.flipX().rotateRight(rotations: 2)
                    matchingTile = tile.flipX().rotateRight(rotations: 2)
                    edgeNumbers.append(tile.number)
                    break
                }
                
                else if tile.flipX().rotateRight(rotations: 3).edge(.left) == matchingTile.edge(.right) && edgesWithNoMatches.contains(tile.flipX().rotateRight(rotations: 3).edge(.top)) {
                    grid[Position(x: i, y: 0)] = tile.flipX().rotateRight(rotations: 3)
                    matchingTile = tile.flipX().rotateRight(rotations: 3)
                    edgeNumbers.append(tile.number)
                    break
                }
            }
        }
        
        // GET THE TOP RIGHT CORNER
        
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
        
        edges = edges.filter { tile -> Bool in
            !edgeNumbers.contains(tile.number)
        }
        
        // GET THE LEFT EDGE
        
        matchingTile = topLeft
        edgeNumbers = [Int]()
        for i in 1...15 {
            for tile in edges {
                if matchingTile.number == tile.number { continue }
                else if tile.edge(.top) == matchingTile.edge(.bottom) && edgesWithNoMatches.contains(tile.edge(.left)) {
                    grid[Position(x: 0, y: i)] = tile
                    matchingTile = tile
                    edgeNumbers.append(tile.number)
                    break
                }
                
                else if tile.rotateRight().edge(.top) == matchingTile.edge(.bottom) && edgesWithNoMatches.contains(tile.rotateRight(rotations: 1).edge(.left)) {
                    grid[Position(x: 0, y: i)] = tile.rotateRight()
                    matchingTile = tile.rotateRight()
                    edgeNumbers.append(tile.number)
                    break
                }
                
                else if tile.rotateRight(rotations: 2).edge(.top) == matchingTile.edge(.bottom) && edgesWithNoMatches.contains(tile.rotateRight(rotations: 2).edge(.left)) {
                    grid[Position(x: 0, y: i)] = tile.rotateRight(rotations: 2)
                    matchingTile = tile.rotateRight(rotations: 2)
                    edgeNumbers.append(tile.number)
                    break
                }
                
                else if tile.rotateRight(rotations: 3).edge(.top) == matchingTile.edge(.bottom) && edgesWithNoMatches.contains(tile.rotateRight(rotations: 3).edge(.left)) {
                    grid[Position(x: 0, y: i)] = tile.rotateRight(rotations: 3)
                    matchingTile = tile.rotateRight(rotations: 3)
                    edgeNumbers.append(tile.number)
                    break
                }
                
                else if tile.flipX().edge(.top) == matchingTile.edge(.bottom) && edgesWithNoMatches.contains(tile.flipX().edge(.left)) {
                    grid[Position(x: 0, y: i)] = tile.flipX()
                    matchingTile = tile.flipX()
                    edgeNumbers.append(tile.number)
                    break
                }
                
                else if tile.flipX().rotateRight(rotations: 1).edge(.top) == matchingTile.edge(.bottom) && edgesWithNoMatches.contains(tile.flipX().rotateRight(rotations: 1).edge(.left)) {
                    grid[Position(x: 0, y: i)] = tile.flipX().rotateRight(rotations: 1)
                    matchingTile = tile.flipX().rotateRight(rotations: 1)
                    edgeNumbers.append(tile.number)
                    break
                }
                
                else if tile.flipX().rotateRight(rotations: 2).edge(.top) == matchingTile.edge(.bottom) && edgesWithNoMatches.contains(tile.flipX().rotateRight(rotations: 2).edge(.left)) {
                    grid[Position(x: 0, y: i)] = tile.flipX().rotateRight(rotations: 2)
                    matchingTile = tile.flipX().rotateRight(rotations: 2)
                    edgeNumbers.append(tile.number)
                    break
                }
                
                else if tile.flipX().rotateRight(rotations: 3).edge(.top) == matchingTile.edge(.bottom) && edgesWithNoMatches.contains(tile.flipX().rotateRight(rotations: 3).edge(.left)) {
                    grid[Position(x: 0, y: i)] = tile.flipX().rotateRight(rotations: 3)
                    matchingTile = tile.flipX().rotateRight(rotations: 3)
                    edgeNumbers.append(tile.number)
                    break
                }
            }
        }
        
        // GET BOTTOM LEFT CORNER
        
        for tile in corners {
            if tile.edge(.top) == matchingTile.edge(.bottom) && edgesWithNoMatches.contains(tile.edge(.left)) && edgesWithNoMatches.contains(tile.edge(.bottom)) {
                grid[Position(x: 0, y: 11)] = tile
                matchingTile = tile
                break
            }
            
            else if tile.rotateRight().edge(.top) == matchingTile.edge(.bottom) && edgesWithNoMatches.contains(tile.rotateRight(rotations: 1).edge(.left)) && edgesWithNoMatches.contains(tile.rotateRight(rotations: 1).edge(.bottom)) {
                grid[Position(x: 0, y: 11)] = tile.rotateRight()
                matchingTile = tile.rotateRight()
                break
            }
            
            else if tile.rotateRight(rotations: 2).edge(.top) == matchingTile.edge(.bottom) && edgesWithNoMatches.contains(tile.rotateRight(rotations: 2).edge(.left)) && edgesWithNoMatches.contains(tile.rotateRight(rotations: 2).edge(.bottom)) {
                grid[Position(x: 0, y: 11)] = tile.rotateRight(rotations: 2)
                matchingTile = tile.rotateRight(rotations: 2)
                break
            }
            
            else if tile.rotateRight(rotations: 3).edge(.top) == matchingTile.edge(.bottom) && edgesWithNoMatches.contains(tile.rotateRight(rotations: 3).edge(.left)) && edgesWithNoMatches.contains(tile.rotateRight(rotations: 3).edge(.bottom)) {
                grid[Position(x: 0, y: 11)] = tile.rotateRight(rotations: 3)
                matchingTile = tile.rotateRight(rotations: 3)
                break
            }
            
            else if tile.flipX().edge(.top) == matchingTile.edge(.bottom) && edgesWithNoMatches.contains(tile.flipX().edge(.left)) && edgesWithNoMatches.contains(tile.flipX().edge(.bottom)) {
                grid[Position(x: 0, y: 11)] = tile.flipX()
                matchingTile = tile.flipX()
                break
            }
            
            else if tile.flipX().rotateRight(rotations: 1).edge(.top) == matchingTile.edge(.bottom) && edgesWithNoMatches.contains(tile.flipX().rotateRight(rotations: 1).edge(.left)) && edgesWithNoMatches.contains(tile.flipX().rotateRight(rotations: 1).edge(.bottom)) {
                grid[Position(x: 0, y: 11)] = tile.flipX().rotateRight(rotations: 1)
                matchingTile = tile.flipX().rotateRight(rotations: 1)
                break
            }
            
            else if tile.flipX().rotateRight(rotations: 2).edge(.top) == matchingTile.edge(.bottom) && edgesWithNoMatches.contains(tile.flipX().rotateRight(rotations: 2).edge(.left)) && edgesWithNoMatches.contains(tile.flipX().rotateRight(rotations: 2).edge(.bottom)) {
                grid[Position(x: 0, y: 11)] = tile.flipX().rotateRight(rotations: 2)
                matchingTile = tile.flipX().rotateRight(rotations: 2)
                break
            }
            
            else if tile.flipX().rotateRight(rotations: 3).edge(.top) == matchingTile.edge(.bottom) && edgesWithNoMatches.contains(tile.flipX().rotateRight(rotations: 3).edge(.left)) && edgesWithNoMatches.contains(tile.flipX().rotateRight(rotations: 3).edge(.bottom)) {
                grid[Position(x: 0, y: 11)] = tile.flipX().rotateRight(rotations: 3)
                matchingTile = tile.flipX().rotateRight(rotations: 3)
                break
            }
        }
        
        // match the rest...
        
        for i in 1...11 {
            for j in 1...11 {
                let matching = matchTile(above: grid[Position(x: i, y: j - 1)]!, left: grid[Position(x: i - 1, y: j)]!, tiles: tiles)
                grid[Position(x: i, y: j)] = matching
            }
        }
        
        var sea = constructGrid(grid, size: 12)
        var seaCopy = sea
        let monster = SeaMonster()
        
        var monsterCount = 0
        for _ in 0..<4 {
            for y in 0..<sea.count {
                let line = sea[y].joined()
                let match = monster.regex.allMatches(in: line)
                for match in match {
                    let x = match.range.lowerBound.utf16Offset(in: line)
                    let tail = Position(x: x, y: y)
                    var points = monster.abovePoints(tailStart: tail)
                    points += monster.belowPoints(tailStart: tail)
                    var count = 0
                    for point in points {
                        if sea[point.y][point.x] == "#" {
                            count += 1
                        } else {
                            break
                        }
                    }
                    if points.count == count {
                        monsterCount += 1
                    }
                }
            }
            if monsterCount > 0 {
                break
            }
            
            sea = rotate(sea)
        }
        if monsterCount == 0 {
            for y in 0..<sea.count {
                sea[y] = sea[y].reversed()
            }

            for _ in 0..<4 {
                for y in 0..<sea.count {
                    let line = sea[y].joined()
                    let matches = monster.regex.allMatches(in: line)
                        for match in matches {
                            let x = match.range.lowerBound.utf16Offset(in: line)
                            let tail = Position(x: x, y: y)
                            var points = monster.abovePoints(tailStart: tail)
                            points += monster.belowPoints(tailStart: tail)
                            var count = 0
                            for point in points {
                                if sea[point.y][point.x] == "#" {
                                    count += 1
                                } else {
                                    break
                                }
                            }
                            if points.count == count {
                                monsterCount += 1
                                for point in monster.allPoints(tailStart: tail) {
                                    seaCopy[point.y][point.x] = "O"
                                }
                            }
                        }
                }
                if monsterCount > 0 {
                    break
                }
                
                sea = rotate(sea)
            }
        }

        draw(seaCopy)
        
        var hashes = 0
        for block in sea {
            for line in block {
                for character in line {
                    if character == "#" {
                        hashes += 1
                    }
                }
            }
        }
        return hashes - (monsterCount * 15)
    }
    
    func removeTile(tile: Tile, from tiles: [Tile]) -> [Tile] {
        return tiles.filter { (value) -> Bool in
            value.number != tile.number
        }
    }
    
    private func matchTile(above: Tile, left: Tile, tiles: [Tile]) -> Tile {
        let aboveBottom = above.edge(.bottom)
        let leftRight = left.edge(.right)
        for tile in tiles {
            if tile.number == above.number || tile.number == left.number { continue }
            else if aboveBottom == tile.edge(.top) && leftRight == tile.edge(.left) {
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
