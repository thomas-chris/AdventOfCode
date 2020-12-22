extension TwentyTwenty.Day20 {
    public struct Tile: Hashable {
        public let number: Int
        public let rows: [String]
        public var rotations: Int
        public var flippedInX: Bool
        public var flippedInY: Bool
        
        public var edgelessRows: [String] {
            var lines = [String]()
            let size = rows.count
            for y in 1 ..< size - 1 {
                let oldLine = rows[y]
                var line = ""
                for x in 1 ..< size - 1 {
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
