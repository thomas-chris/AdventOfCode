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
}
