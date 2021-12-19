import Foundation

public struct Day18 {
    
    public static func part1(_ input: [String]) -> (Int, String) {
        
        let fishes = input.map(Fish.init)
        
        var result = fishes.first!
        let reducedFish = fishes.dropFirst().reduce(result) { partialResult, fish in
            let fish = Fish.addFish(partialResult, fish)
            let result = Fish.reduceFishes(fish)
            
            return result
        }
            
        return (reducedFish.magnitude, reducedFish.description)
    }
    
    public static func part2(_ input: [String]) -> Int {
        let fishes = input.map(Fish.init)
        
        let options = fishes.permutations(ofCount: 2)
        
        var results = options.map { array -> Fish in
            let fish = Fish.addFish(array[0], array[1])
            return Fish.reduceFishes(fish)
        }
        
        return results.map { fish in
            fish.magnitude
        }.max()!
    }
}

public struct Fish: Equatable {
    var elements: [Element]
    
    public init(_ elements: [Element]) {
        self.elements = elements
    }
    
    public var magnitude: Int {
        var index = 0
        return processForMagnitude(&index)
    }
    
    func processForMagnitude(_ index: inout Int) -> Int {
        if let value = elements[index].value {
            index += 1
            return value
        } else {
            index += 1
            let left = processForMagnitude(&index)
            let right = processForMagnitude(&index)
            index += 1
            return 3 * left + 2 * right
        }
    }
    
    public var description: String {
        var string = ""
        elements.forEach { char in
            switch char {
            case .open:
                string += "["
            case .close:
                string += "]"
            case .value(let int):
                string += "\(int)"
            }
        }
        return string
    }
    /// can strip out the commas
    public init(_ row: String) {
        self.elements = row.compactMap { char in
            switch char {
            case "[":
                return .open
            case "]":
                return .close
            default:
                return Int(String(char)).map { .value($0) }
            }
        }
    }
    
    public static func addFish(_ lhs: Fish, _ rhs: Fish) -> Fish {
        return Fish([.open] + lhs.elements + rhs.elements + [.close])
    }
    
    public static func reduceExplode(_ fish: Fish) -> (Fish, Bool) {
        var fish = fish
        var level = 0
        for (index, element) in fish.elements.enumerated() {
            switch element {
            case .open:
                level += 1
            case .close:
                level -= 1
            case .value:
                break
            }
            
            if level == 5 {
                if let prev = fish.elements[..<index].lastIndex(where: { $0.value != nil }) {
                    fish.elements[prev] = .value(fish.elements[prev].value! + fish.elements[index + 1].value!)
                }
                
                if let next = fish.elements[(index + 4)...].firstIndex(where: { $0.value != nil }) {
                    fish.elements[next] = .value(fish.elements[next].value! + fish.elements[index + 2].value!)
                }
                
                fish.elements.replaceSubrange(index..<(index + 4), with: [.value(0)])
                return (fish, true)
            }
        }
        
        return (fish, false)
    }
    
    public static func reduceSplit(_ fish: Fish) -> (Fish, Bool) {
        var fish = fish
        for (index, element) in fish.elements.enumerated() {
            if let value = element.value, value >= 10 {
                fish.elements.replaceSubrange(
                    index..<(index + 1),
                    with: [.open, .value(value / 2), .value((value + 1) / 2), .close])
                return (fish, true)
            }
        }
        
        return (fish, false)
    }
    
    public static func reduceFishes(_ fish: Fish) -> Fish {
        var fish = fish
        var keepGoing = true

        while keepGoing {
            var split = false
            var exploded = false
            let explodeResult = reduceExplode(fish)
            fish = explodeResult.0
            exploded = explodeResult.1
            if !exploded {
                let splitResult = reduceSplit(fish)
                fish = splitResult.0
                split = splitResult.1
            }
            
            keepGoing = exploded || split
        }
        
        return fish
    }
}

public enum Element: Equatable {
    case open
    case close
    case value(Int)
    
    var value: Int? {
        switch self {
        case .open, .close:
            return nil
        case .value(let int):
            return int
        }
    }
}
