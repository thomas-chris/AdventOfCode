import Algorithms
import Foundation
import Regex
import UIKit

public struct Day8 {
    
    public static func part1(_ input: [[[String]]]) -> Int {
        var total = 0
        
        for row in input {
                var countForRow = 0
                for number in row.last! {
                    switch number.count {
                    case 2, 3, 4, 7:
                        total += 1
                        countForRow += 1
                    default:
                        break
                    }
            }
        }
       return total
    }
    
    public static func part2(_ input: [[[String]]]) -> Int {
        var outputTotals = 0
        for row in input {
                var countForRow = 0
                let input = row.first!
                let output = row.last!
                outputTotals += solve(input: input, output: output)
            }
       return outputTotals
    }

    private static func solve(input: [String], output: [String]) -> Int {
        
        
        var unsolved = Set(input)
        
        let one = unsolved.first { $0.count == 2 }!
        let four = unsolved.first { $0.count == 4 }!
        let seven = unsolved.first { $0.count == 3 }!
        let eight = unsolved.first { $0.count == 7 }!
        
        unsolved.remove(one)
        unsolved.remove(four)
        unsolved.remove(seven)
        unsolved.remove(eight)
        
        let nine = unsolved.first { string in
            string.count == 6 && string.isSuperSet(of: four)
        }!
        
        unsolved.remove(nine)
        
        let three = unsolved.first { string in
            string.count == 5 && string.isSuperSet(of: one)
        }!
        
        unsolved.remove(three)
        
        let zero = unsolved.first { string in
            string.count == 6 && string.isSuperSet(of: one)
        }!
        
        unsolved.remove(zero)
        
        let six = unsolved.first { string in
            string.count == 6
        }!
        
        unsolved.remove(six)
        
        let five = unsolved.first { string in
            let newNine = nine.filter { character in
                !one.contains(character)
            }
            return string.count == 5 && string.isSuperSet(of: newNine)
        }!
        
        unsolved.remove(five)
        
        let two = unsolved.first { string in
            return string.count == 5
        }!
        
        unsolved.remove(two)

        let numbersSet = [Set(zero), Set(one), Set(two), Set(three), Set(four), Set(five), Set(six), Set(seven), Set(eight), Set(nine)]
        var total = ""
        for value in output {
            numbersSet.enumerated().forEach { (index, numbers) in
                if Set(value).sorted() == numbers.sorted() {
                    total += String(index)
                }
            }
        }
        
        return Int(total)!
    }
}

extension String {
    func isSuperSet(of string: String) -> Bool {
        let selfSet = CharacterSet(charactersIn: self)
        return selfSet.isSuperset(of: CharacterSet(charactersIn: string))
    }
}
