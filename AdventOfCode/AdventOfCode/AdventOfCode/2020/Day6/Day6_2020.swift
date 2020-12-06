import Foundation

extension TwentyTwenty {
    public class Day6{
        public init() {}
    }
}

extension TwentyTwenty.Day6 {
    public func solve(input: String) -> Int {
        let components = input.components(separatedBy: "\n\n")
        return components
            .map { groupAnswers in
                let strippedAnswers = groupAnswers.replacingOccurrences(of: "\n", with: "")
                return Set(strippedAnswers).count
            }
            .reduce(0, +)
    }
    
    public func solve2(input: String) -> Int {
        let strippedInput = input.trimmingCharacters(in: .newlines)
        let components = strippedInput.components(separatedBy: "\n\n")
        return components
            .map { groupAnswers in
                let strippedAnswers = groupAnswers.components(separatedBy: .newlines)
                var everyonesYeses = Set(strippedAnswers[0])
                for nextAnswers in strippedAnswers.dropFirst() {
                    everyonesYeses = everyonesYeses.intersection(String(nextAnswers))
                }
                return everyonesYeses.count
            }
            .reduce(0, +)
    }
}
