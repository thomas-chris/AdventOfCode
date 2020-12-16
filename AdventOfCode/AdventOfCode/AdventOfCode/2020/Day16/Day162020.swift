import Foundation
import Algorithms

extension TwentyTwenty {
    public class Day16 {
        public init() {
        }
        
    }
    
}

extension TwentyTwenty.Day16 {
    public func solvePart1(input: String) -> Int {
        
        var rulesSet = Set<Int>()
        var nearbyTickets = Array<Int>()
        
        let blocks = input.components(separatedBy: "\n\n")
        
        let notes = blocks.first!
        let otherTickets = blocks.last!
        
        let noteLines = notes.components(separatedBy: "\n")
        
        for line in noteLines {
            
            let rangesOfNotes = line.components(separatedBy: ":")[1].trimmingCharacters(in: .whitespaces).components(separatedBy: " or ")
            for value in rangesOfNotes {
                let startEnd = value.components(separatedBy: "-")
                for i in Array(Int(startEnd[0])! ... Int(startEnd[1])!) {
                    rulesSet.insert(i)
                }
            }
        }

        otherTickets.components(separatedBy: ":").last!.components(separatedBy: "\n").forEach { line in
            line.components(separatedBy: ",")
                .compactMap {
                    if $0.count > 0 {
                        return Int($0)!
                    }
                    return nil
                }
                .forEach { value in
                    nearbyTickets.append(value)
                }
        }
        
        var errors: [Int] = []
        var validOtherTickets = [Int]()
        for i in nearbyTickets {
            if !rulesSet.contains(i) {
                errors.append(i)
            } else {
                validOtherTickets.append(i)
            }
        }
        return errors.reduce(0, +)
    }
    
    public func solvePart2(input: String) -> Int {
        
        var allRules = Set<Int>()
        var rulesSets = Array<Set<Int>>()
        let blocks = input.components(separatedBy: "\n\n")
        
        let notes = blocks.first!
        let otherTickets = blocks.last!
        let myTicket = blocks[1]
        
        let noteLines = notes.components(separatedBy: "\n")
        
        for line in noteLines {
            var set = Set<Int>()
            
            let rangesOfNotes = line.components(separatedBy: ":")[1].trimmingCharacters(in: .whitespaces).components(separatedBy: " or ")
            for value in rangesOfNotes {
                let startEnd = value.components(separatedBy: "-")
                for i in Array(Int(startEnd[0])! ... Int(startEnd[1])!) {
                    set.insert(i)
                    allRules.insert(i)
                }
            }
            rulesSets.append(set)
        }
        
        var validOtherTickets: [[Int]] = []
        otherTickets.components(separatedBy: ":").last!.components(separatedBy: "\n").forEach { line in
            if line.count > 0 {
                let values = line.components(separatedBy: ",").compactMap { Int($0) }
                var valid = true
                for i in values {
                    if !allRules.contains(i) {
                        valid = false
                    }
                }
                
                if valid {
                    validOtherTickets.append(values)
                }
            }
            
        }
        
        var dictionary: [Int: [Int]] = [:]
        
        for i in validOtherTickets {
            for j in 0..<i.count {
                let list = dictionary[j] ?? []
                dictionary[j] = list + [i[j]]
            }
        }
        
        var possibleResults: [Int: [Int]] = [:]
        dictionary.forEach { (position, values) in
            for i in 0..<rulesSets.count {
                let rules = rulesSets[i]
                var valid = true
                for j in values {
                    if !rules.contains(j) {
                        valid = false
                    }
                }
                
                if valid {
                    let list = possibleResults[position] ?? []
                    possibleResults[position] = list + [i]
                }
            }
        }
        
        var columns: [Int: Int] = [:]
        while !possibleResults.isEmpty {
            (possibleResults, columns) = getRuleWith1(values: possibleResults, columns: columns)
        }
        
        let myTicketValues = myTicket.components(separatedBy: ":\n").last!.components(separatedBy: ",").compactMap { Int($0) }
        
        let indexs = columns.compactMap { (key, value) -> Int? in
            if key < 6 {
                return value
            }
            return nil
        }

        var finally = [Int]()
        indexs.forEach { (index) in
            finally.append(myTicketValues[index])
        }
        return finally.reduce(1, *)
    }
    
    func getRuleWith1(values: [Int: [Int]], columns: [Int: Int]) -> ([Int: [Int]], [Int: Int]) {
        var value = -1
        var columns = columns
        values.forEach { (key, list) in
            if list.count == 1 {
                value = list.first!
                columns[value] = key
            }
        }
        
        var newValues: [Int: [Int]] = [:]
        
        values.forEach { (key, list) in
            let newList = list.filter { (number) -> Bool in
                number != value
            }
            if newList.count > 0 {
                newValues[key] = newList
            }
        }
        
        return (newValues, columns)
    }
}
