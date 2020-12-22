public enum TwentyFifteen {}

extension TwentyFifteen {
    public struct Day1 {
        public init() {}
    }
}

extension TwentyFifteen.Day1 {
    public func solvePart1(input: String) -> Int {
        
        var count = 0
        
        for i in input {
            switch i {
            case "(":
                count += 1
            case ")":
                count -= 1
            default:
                fatalError()
            }
        }
        
        return count
    }
    
    public func solvePart2(input: String) -> Int {
        var count = 0
        
        for i in 0..<input.count {
            switch input[i] {
            case "(":
                count += 1
            case ")":
                count -= 1
            default:
                fatalError()
            }
            
            if count == -1 {
                return (i + 1)
            }
        }
        
        return -1
    }
}
