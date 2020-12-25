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
        var notSolved = true
        var cryptoValue = 1
        
        while notSolved {
            if value != doorKey {
                value = (subject * value) % 20201227
                cryptoValue = (cardKey * cryptoValue) % 20201227
            } else {
                notSolved = false
            }
        }
        
        return cryptoValue
    }
}
