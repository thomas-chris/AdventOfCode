import Foundation
import Algorithms

extension TwentyTwenty {
    public class Day17 {
        public init() {
        }
        
    }
    
}

struct ThreeDPosition: Equatable, Hashable {
    let x: Int
    let y: Int
    let z: Int
}

struct FourDPosition: Equatable, Hashable {
    let x: Int
    let y: Int
    let z: Int
    let w: Int
}

enum State: String {
    case active = "#"
    case inactive = "."
}

extension TwentyTwenty.Day17 {
    public func solvePart1(input: [String]) -> Int {
        
        let initialSpace = parse(input: input)
        
        var space = increaseSpace(space: initialSpace)
        var loops = 1

        while loops < 7 {
            var newSpace = space
            for key in newSpace.keys {
                let neighbours = key.neighbours
                
                var countActive = 0
                neighbours.forEach { (position) in
                    if space[position] == .active {
                        countActive += 1
                    }
                }
                
                if space[key] == .inactive {
                    if countActive == 3 {
                        newSpace[key] = .active
                    }
                }
                
                if space[key] == .active {
                    if countActive < 2 || countActive > 3 {
                        newSpace[key] = .inactive
                    }
                }
            }
            
            space = increaseSpace(space: newSpace)
            loops += 1
        }
        
        return space.values.reduce(0) { (result, state) -> Int in
            if state == .active {
                return result + 1
            }
            return result
        }
    }
    
    public func solvePart2(input: [String]) -> Int {
        
        let initialSpace = parse4(input: input)
        
        var space = increase4dSpace(space: initialSpace)
        var loops = 1

        while loops < 7 {
            var newSpace = space
            for key in newSpace.keys {
                let neighbours = key.neighbours
                
                var countActive = 0
                neighbours.forEach { (position) in
                    if space[position] == .active {
                        countActive += 1
                    }
                }
                
                if space[key] == .inactive {
                    if countActive == 3 {
                        newSpace[key] = .active
                    }
                }
                
                if space[key] == .active {
                    if countActive < 2 || countActive > 3 {
                        newSpace[key] = .inactive
                    }
                }
            }
            
            space = increase4dSpace(space: newSpace)
            loops += 1
        }
        
        return space.values.reduce(0) { (result, state) -> Int in
            if state == .active {
                return result + 1
            }
            return result
        }
    }
    
    private func parse(input: [String]) -> [ThreeDPosition: State] {
        var space: [ThreeDPosition: State] = [:]
        
        var x = 0
        var y = 0
        for line in input {
            x = 0
            for character in line {
                let position = ThreeDPosition(x: x, y: y, z: 0)
                let state = State(rawValue: String(character))
                space[position] = state
                x += 1
            }
            
            y += 1
        }
        
        return space
    }
    
    private func parse4(input: [String]) -> [FourDPosition: State] {
        var space: [FourDPosition: State] = [:]
        
        var x = 0
        var y = 0
        for line in input {
            x = 0
            for character in line {
                let position = FourDPosition(x: x, y: y, z: 0, w: 0)
                let state = State(rawValue: String(character))
                space[position] = state
                x += 1
            }
            
            y += 1
        }
        
        return space
    }
    
    private func increaseSpace(space: [ThreeDPosition: State]) -> [ThreeDPosition: State] {
        
        var newSpace = space
        space.forEach { (position, _) in
            let neighbours = position.neighbours
            for neighbour in neighbours {
                newSpace[neighbour] = space[neighbour] ?? .inactive
            }
        }
        
        return newSpace
    }
    
    private func increase4dSpace(space: [FourDPosition: State]) -> [FourDPosition: State] {
        
        var newSpace = space
        space.forEach { (position, _) in
            let neighbours = position.neighbours
            for neighbour in neighbours {
                newSpace[neighbour] = space[neighbour] ?? .inactive
            }
        }
        
        return newSpace
    }
}

extension ThreeDPosition {
    var neighbours: [ThreeDPosition] {
        
        var temp: [ThreeDPosition] = []
        
        for x in -1 ... 1 {
            for y in -1 ... 1 {
                for z in -1 ... 1 {
                    temp.append(ThreeDPosition(x: self.x + x, y: self.y + y, z: self.z + z))
                }
            }
        }
        
        return temp.filter { (value) -> Bool in
            value != self
        }
    }
}

extension FourDPosition {
    var neighbours: [FourDPosition] {
        var temp: [FourDPosition] = []
        
        for x in -1 ... 1 {
            for y in -1 ... 1 {
                for z in -1 ... 1 {
                    for w in -1 ... 1 {
                        
                        temp.append(FourDPosition(x: self.x + x, y: self.y + y, z: self.z + z, w: self.w + w))
                    }
                }
            }
        }
        
        return temp.filter { (value) -> Bool in
            value != self
        }
    }
}
