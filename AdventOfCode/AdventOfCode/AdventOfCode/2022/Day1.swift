import Algorithms

public struct Day1 {
    public static func getAnswerPart1(input: [[Int]]) -> Int {
        
        return input
            .map { $0.reduce(0,+) }
            .max() ?? 0
    }
    
    public static func getAnswerPart2(input: [[Int]]) -> Int {
        return input
            .map { $0.reduce(0,+) }
            .sorted { $0<$1 }
            .suffix(3)
            .reduce(0,+)
    
    }
}
