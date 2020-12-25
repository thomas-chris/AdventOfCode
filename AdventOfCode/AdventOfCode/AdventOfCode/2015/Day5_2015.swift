import Regex

extension TwentyFifteen {
    public struct Day5 {
        public init() {}
    }
}

extension TwentyFifteen.Day5 {
    public func solvePart1(input: [String]) -> Int {
        
        let rows = input.map { line in
            Array(line.map { String($0) })
        }
        
        return rows.filter { row -> Bool in

            passesDoubleLetter(row: row) && passesRuleAEIOU(row: row) && passesBannedPhraseRule(row: row)
        }.count
    }
    
    public func solvePart2(input: [String]) -> Int {
        
        let rule1 = Regex(#"(..).*\1"#) // a pair of characters repeated in the string
        let rule2 = Regex(#"(.).\1"#) // a character repeated w/ a single character in between
        
        return input.filter { line -> Bool in
            return rule1.matches(line) && rule2.matches(line)
        }.count
    }
    
    
    func passesRuleAEIOU(row: [String]) -> Bool {
        return row.compactMap { value -> String? in
            switch value {
            case "a", "e", "i", "o", "u":
                return value
            default:
                return nil
            }
        }.count > 2
    }
    
    func passesDoubleLetter(row: [String]) -> Bool {
        for i in 0 ..< row.count - 1 {
            if row[i] ==  row[i+1] {
                return true
            }
        }
        return false
    }
    
    func passesBannedPhraseRule(row: [String]) -> Bool {
        let banned = ["ab", "cd", "pq", "xy"]
        for i in 0 ..< row.count - 1 {
            if banned.contains(row[i] + row[i + 1]) {
                return false
            }
        }
        return true
    }
}
