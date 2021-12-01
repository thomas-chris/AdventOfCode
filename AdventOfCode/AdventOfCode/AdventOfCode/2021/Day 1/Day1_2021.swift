import Algorithms

public struct Day1 {
    public static func getAnswerPart1() -> Double? {
        
        let compactmap: (String) -> Int? = { string in Int(string) }
        let input = Input.array(seperator: "\n", file: "Day1", compactmap: compactmap).compactMap { $0 }
         
        return input.windows(ofCount: 2)
            .map { slice -> Double in
            if slice.last ?? 0 > slice.first ?? 0 {
                return 1
            }
            
            return 0
        }
            .reduce(0, +)
    }
    
    public static func getAnswerPart2() -> Double? {
        let compactmap: (String) -> Int? = { string in Int(string) }
        let input = Input.array(seperator: "\n", file: "Day1", compactmap: compactmap).compactMap { $0 }
         
        return input
            .windows(ofCount: 3)
            .map { slice in
                return slice.reduce(0, +)
            }
            .windows(ofCount: 2)
            .map { slice -> Double in
                if slice.last ?? 0 > slice.first ?? 0 {
                    return 1
                }
            
                return 0
            }
            .reduce(0, +)
    }
}
