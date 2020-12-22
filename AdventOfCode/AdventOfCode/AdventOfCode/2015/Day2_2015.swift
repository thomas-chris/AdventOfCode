extension TwentyFifteen {
    public struct Day2 {
        public init() {}
    }
}

extension TwentyFifteen.Day2 {
    public func solvePart1(input: [String]) -> Int {
        
        var total = 0
        for box in input {
            let sides = box.components(separatedBy: "x").compactMap { Int($0) }
            
            let surfaceAreas = [sides[0] * sides[1], sides[1] * sides[2], sides[0] * sides[2]]
            
            total += (surfaceAreas.map { 2 * $0 }.reduce(0, +) + surfaceAreas.min()!)
        }
        
        return total
    }
    
    public func solvePart2(input: [String]) -> Int {
        
        var total = 0
        for box in input {
            let sides = box.components(separatedBy: "x").compactMap { Int($0) }
            
            total += sides.reduce(1, *)
                        + sides.sorted()
                            .dropLast()
                            .map { 2 * $0 }
                            .reduce(0,+)
        }
 
        return total
    }
}
