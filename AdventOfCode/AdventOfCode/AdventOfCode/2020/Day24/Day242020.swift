import Algorithms

extension TwentyTwenty {
    public class Day24 {
        public init() {
        }
        
        enum Instruction: String, CaseIterable {
            case east = "e"
            case west = "w"
            case northEast = "ne"
            case northWest = "nw"
            case southEast = "se"
            case southWest = "sw"
        }
        
        enum Colour {
            case white
            case black
            
            func flip() -> Colour {
                let value = self == .white ? Colour.black : Colour.white
                return value
            }
        }
    }
}

extension TwentyTwenty.Day24 {
    public func solvePart1(input: [String]) -> Int {
        
        let instructions = input.map { getDirections(line: $0) }
        var tiles = [Position: Colour]()
        
        for line in instructions {
            let position = moveHexPosition(position: Position(x: 0, y: 0), instructions: line)
            tiles[position] = tiles[position]?.flip() ?? .black
        }
        
        return tiles.values.filter { $0 == .black }.count
    }
    
    public func solvePart2(input: [String]) -> Int {
        
        let instructions = input.map { getDirections(line: $0) }
        var tiles = [Position: Colour]()
        
        for line in instructions {
            let position = moveHexPosition(position: Position(x: 0, y: 0), instructions: line)
            tiles[position] = tiles[position]?.flip() ?? .black
        }
        
        for _ in 1 ... 100 {
            var newTiles = tiles
            let blackTiles = tiles.filter { (position, colour) in
                colour == .black
            }
            
            blackTiles.forEach { (position, colour) in
                let allNeighbours = neighbours(position: position)
                let colours = allNeighbours.map { position in
                    tiles[position] ?? .white
                }
                if colours.filter { $0 == .black }.count == 0 || colours.filter { $0 == .black }.count > 2 {
                    newTiles[position] = .white
                }
            }
            
            let blackTileNeighbours = blackTiles.flatMap { (position, colour) in
                neighbours(position: position)
            }
            
            var whiteTiles = blackTileNeighbours.compactMap { position -> Position? in
                if tiles[position] == .black {
                    return nil
                } else {
                    return position
                }
            }

            whiteTiles = Array(Set(whiteTiles))
            
            for whiteTile in whiteTiles {
                let wNeighbours = neighbours(position: whiteTile)
                let colours = wNeighbours.map { position in
                    tiles[position] ?? .white
                }
                if colours.filter { $0 == .black }.count == 2 {
                    newTiles[whiteTile] = .black
                }
            }
            
            tiles = newTiles
        }
        
        return tiles.values.filter { $0 == .black }.count
        
    }
    
    func getDirections(line: String) -> [Instruction]{
        var line = line
        var instructions = [Instruction]()
        while line.count > 0 {
            let character = line.popFirst()
            if character == "e" {
                instructions.append(.east)
            }
            if character == "w" {
                instructions.append(.west)
            }
            if character == "n" {
                let next = line.popFirst()
                if next == "e" {
                    instructions.append(.northEast)
                }
                if next == "w" {
                    instructions.append(.northWest)
                }
            }
            if character == "s" {
                let next = line.popFirst()
                if next == "e" {
                    instructions.append(.southEast)
                }
                if next == "w" {
                    instructions.append(.southWest)
                }
            }
        }
        
        return instructions
    }
    
    func moveHexPosition(position: Position, instructions: [Instruction]) -> Position {
        
        var position = position
        for instruction in instructions {
            switch instruction {
            case .east:
                position = Position(x: position.x + 2, y: position.y)
            case .west:
                position = Position(x: position.x - 2, y: position.y)
            case .northWest:
                position = Position(x: position.x - 1, y: position.y + 1)
            case .northEast:
                position = Position(x: position.x + 1, y: position.y + 1)
            case .southWest:
                position = Position(x: position.x - 1, y: position.y - 1)
            case .southEast:
                position = Position(x: position.x + 1, y: position.y - 1)
            }
        }
        
        return position
    }
    
    func neighbours(position: Position) -> [Position] {
        return Instruction.allCases.map {
            moveHexPosition(position: position, instructions: [$0])
        }
    }
}

extension String {
    mutating func popFirst() -> String? {
        guard let first = self.first else {
            return nil
        }
        self = String(self.dropFirst())
        return String(first)
    }
}
