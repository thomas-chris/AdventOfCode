import Algorithms

public struct Day2 {
    
    typealias Position = (depth: Int, horizontal: Int)
    typealias PositionAndAim = (depth: Int, horizontal: Int, aim: Int)
    
    public static func getAnswerPart1(input: [(String, Int)]) -> Int {
        let finalPosition = move(input, position: (0, 0))
        return finalPosition.0 * finalPosition.1
    }
    
    public static func part2(_ input: [(String, Int)]) -> Int {
        let finalPosition = moveAndAim(input, position: (0, 0, 0))
        return finalPosition.0 * finalPosition.1
    }
    
    private static func move(_ directions: [(String, Int)], position: Position) -> Position {
        
        if directions.count == 0 {
            return position
        }
        
        var depth: Int = position.depth
        var horizontal: Int = position.horizontal
        
        switch directions.first!.0 {
        case "forward":
            horizontal += directions.first!.1
        case "down":
            depth += directions.first!.1
        case "up":
            depth -= directions.first!.1
        default:
            break
        }
        
        return move(Array(directions.dropFirst()), position: (depth, horizontal))
    }
    
    private static func moveAndAim(_ directions: [(String, Int)], position: PositionAndAim) -> PositionAndAim {
        
        if directions.count == 0 {
            return position
        }
        
        var depth: Int = position.depth
        var horizontal: Int = position.horizontal
        var aim: Int = position.aim
        
        switch directions.first!.0 {
        case "forward":
            horizontal += directions.first!.1
            depth = depth + (directions.first!.1 * aim)
        case "down":
            aim += directions.first!.1
        case "up":
            aim -= directions.first!.1
        default:
            break
        }
        
        return moveAndAim(Array(directions.dropFirst()), position: (depth, horizontal, aim))
    }
    
    
}
