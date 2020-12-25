import Algorithms

extension TwentyTwenty {
    public class Day25 {
        public init() {
        }
    }
}

extension TwentyTwenty.Day25 {
    public func solvePart1(cardKey: Int, doorKey: Int) -> Int {

        let subject = 7
        var value = 1
        var carLoops = 0
        var notSolved = true
        
        while notSolved {
            if value != cardKey {
                carLoops += 1
                value = subject * value
                value = value % 20201227
            } else {
                notSolved = false
            }
        }
        
        var cryptoValue = 1
        
        for _ in 0..<carLoops {
            cryptoValue = (doorKey * cryptoValue) % 20201227
        }
        

        return cryptoValue
    }
}
