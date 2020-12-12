import Foundation
import Algorithms

extension TwentyTwenty {
    public class Day12 {
        public init() {}

        public enum Instruction {
            case forward(Int)
            case move(Heading, Int)
            case turn(Bool, Int)
        }
        
        public enum Heading: Int {
            case north = 0
            case east = 90
            case south = 180
            case west = 270
        }
        
    }
}

extension TwentyTwenty.Day12 {
    
    public func getInstructions(input: [String]) -> [Instruction] {
        return input.map { line -> Instruction in
            let first = line.first!
            let theRest = Int(line.dropFirst())!
            
            switch first {
            case "N": return .move(.north, theRest)
            case "E": return .move(.east, theRest)
            case "S": return .move(.south, theRest)
            case "W": return .move(.west, theRest)
            case "L": return .turn(true, theRest)
            case "R": return .turn(false, theRest)
            case "F": return .forward(theRest)
            default: fatalError("Invalid input")
            }
        }
    }
    
    public func solve1(instructions: [Instruction]) -> Int {
        
        var position = Position(x: 0, y: 0)
        var currentHeading: Heading = .east
        
        for instruction in instructions {
            switch instruction {
            case .forward(let distance) : position = position.move(heading: currentHeading, distance: distance)
            case .move(let heading, let distance): position = position.move(heading: heading, distance: distance)
            case .turn(let left, let angle): currentHeading = currentHeading.turn(left: left, angle: angle)
            }
        }

        return (abs(position.x) + abs(position.y))
        
    }
    
    public func solve2(instructions: [Instruction]) -> Int {
        
        var position = Position(x: 0, y: 0)
        var waypoint = Position(x: 10, y: 1)
        
        for instruction in instructions {
            switch instruction {
            case .forward(let distance):
                let x = waypoint.x * distance
                let y = waypoint.y * distance
                position = Position(x: position.x + x, y: position.y + y)
            case .move(let heading, let distance): waypoint = waypoint.move(heading: heading, distance: distance)
            case .turn(let left, let angle):
                var times = (angle / 90) % 4
                if left == false { times = 4 - times }
                switch times {
                case 0: continue
                case 1: waypoint = Position(x: -waypoint.y, y: waypoint.x)
                case 2: waypoint = Position(x: -waypoint.x, y: -waypoint.y)
                case 3: waypoint = Position(x: waypoint.y, y:  -waypoint.x)
                default: fatalError("Invalid input")
                }
            }

        }
        
        return (abs(position.x) + abs(position.y))
    }
}

extension Position {
    func move(heading: TwentyTwenty.Day12.Heading, distance: Int) -> Position {
        switch heading {
        case .north : return Position(x: self.x, y: self.y + distance)
        case .east : return Position(x: self.x + distance, y: self.y)
        case .south : return Position(x: self.x, y: self.y - distance)
        case .west : return Position(x: self.x - distance, y: self.y)
        }
    }
}

extension TwentyTwenty.Day12.Heading {
    func turn(left: Bool, angle: Int) -> TwentyTwenty.Day12.Heading {
        var heading = self
        
        let turns = angle / 90
        
        for _ in 1...turns {
            if left {
                switch heading {
                case .north: heading = .west
                case .east: heading = .north
                case .south: heading = .east
                case .west: heading = .south
                }
                
            } else {
                switch heading {
                case .north: heading = .east
                case .east: heading = .south
                case .south: heading = .west
                case .west: heading = .north
                }
            }
            
            
        }
        
        return heading
    }
}

