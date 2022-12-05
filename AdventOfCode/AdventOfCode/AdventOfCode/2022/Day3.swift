import Algorithms
import Foundation

public struct Day3 {
    
    static let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    
    public static func part1(_ input: [String]) -> Int {
        
        input
            .compactMap { rucksack in
                let compartments = rucksack.split(by: (rucksack.length / 2))
                let intersection = Set(compartments[0]).intersection(Set(compartments[1]))
                return intersection.first
            }
            .compactMap { element in
                let index = alphabet.firstIndex(of: String(element)) ?? 0
                return Int(index + 1)
            }
            .reduce(0,+)
    }
    
    public static func part2(_ input: [String]) -> Int {
        
        input
            .chunks(ofCount: 3)
            .compactMap { arrays -> Character? in
                let lists = Array(arrays)
                return Set(lists[0]).intersection(Set(lists[1])).intersection(Set(lists[2])).first
            }
            .compactMap { element in
                let index = alphabet.firstIndex(of: String(element)) ?? 0
                return Int(index + 1)
            }
            .reduce(0,+)
    }
}

extension String {
    func split(by length: Int) -> [String] {
        var startIndex = self.startIndex
        var results = [Substring]()

        while startIndex < self.endIndex {
            let endIndex = self.index(startIndex, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            results.append(self[startIndex..<endIndex])
            startIndex = endIndex
        }

        return results.map { String($0) }
    }
}
