extension TwentyFifteen {
    public struct Day3 {
        public init() {}
    }
}

extension TwentyFifteen.Day3 {
    public func solvePart1(input: String) -> Int {
        
        var houses: [Position: Int] = [Position(x: 0, y: 0): 1]
        
        var cp = Position(x: 0, y: 0)
        for direction in input {
            switch direction {
            case "v":
                cp = cp.move(vector: .down)
            case "^":
                cp = cp.move(vector: .up)
            case ">":
                cp = cp.move(vector: .right)
            case "<":
                cp = cp.move(vector: .left)
            default:
                fatalError()
            }
            houses[cp, default: 0] += 1
        }
        
        return houses.keys.count
    }
    
    public func solvePart2(input: String) -> Int {
        var houses: [Position: Int] = [Position(x: 0, y: 0): 1]
        
        var santaCP = Position(x: 0, y: 0)
        var roboSantaCP = Position(x: 0, y: 0)
        for i in stride(from: 0, through: input.length - 1, by: 2){
            santaCP = newPostion(from: santaCP, direction: input[i])
            roboSantaCP = newPostion(from: roboSantaCP, direction: input[i+1])
            houses[santaCP, default: 0] += 1
            houses[roboSantaCP, default: 0] += 1
        }
        
        return houses.keys.count
    }
    
    private func newPostion(from postion: Position, direction: String) -> Position {
        switch direction {
        case "v":
            return postion.move(vector: .down)
        case "^":
            return postion.move(vector: .up)
        case ">":
            return postion.move(vector: .right)
        case "<":
            return postion.move(vector: .left)
        default:
            fatalError()
        }
    }
}
