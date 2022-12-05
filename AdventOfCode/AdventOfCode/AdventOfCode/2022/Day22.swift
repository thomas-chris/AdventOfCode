import Foundation
import Regex

public struct Day22 {
    
    public static func part1(_ input: [String]) -> Int {
        
        let regex = Regex(#"([a-z]+) x=(-?\d+)..(-?\d+),y=(-?\d+)..(-?\d+),z=(-?\d+)..(-?\d+)"#)
        var instructions: [([ThreeDPosition], Bool)] = []
        
        for line in input {
            let match = regex.firstMatch(in: line)!.captures.compactMap { $0 }
            let minX = max(Int(match[1])!, -50)
            let maxX = min(Int(match[2])!, 50)
            let minY = max(Int(match[3])!, -50)
            let maxY = min(Int(match[4])!, 50)
            let minZ = max(Int(match[5])!, -50)
            let maxZ = min(Int(match[6])!, 50)
            
            if minX <= maxX && minY <= maxY && minZ <= maxZ {
                
                var positions = [ThreeDPosition]()
                for x in minX...maxX {
                    for y in minY...maxY {
                        for z in minZ...maxZ {
                            positions.append(ThreeDPosition(x: x, y: y, z: z))
                        }
                    }
                }
                
                let bool = match[0] == "on" ? true : false
                
                instructions.append((positions, bool))
            }
        }
        
        var board = [ThreeDPosition: Bool]()
        
        for (positions, value) in instructions {
            for position in positions {
                board[position] = value
            }
        }
        
        return board.values.filter { $0 }.count
    }
    
    public static func part2(_ input: [String]) -> Int {
        
        struct Boundary: Hashable {
            let value: Int
            let bool: Bool
            let start: Bool
        }
        
        let regex = Regex(#"([a-z]+) x=(-?\d+)..(-?\d+),y=(-?\d+)..(-?\d+),z=(-?\d+)..(-?\d+)"#)
        var cuboids = Set<Cuboid>()
        
        for line in input {
            let match = regex.firstMatch(in: line)!.captures.compactMap { $0 }
            let minX = Int(match[1])!
            let maxX = Int(match[2])!
            let minY = Int(match[3])!
            let maxY = Int(match[4])!
            let minZ = Int(match[5])!
            let maxZ = Int(match[6])!
            
            if minX <= maxX && minY <= maxY && minZ <= maxZ {
                
                let turnOn = match[0] == "on" ? true : false
                
                let cuboid = Cuboid(x: minX...maxX, y: minY...maxY, z: minZ...maxZ)
                
                if turnOn {
                    if cuboids.isEmpty {
                        cuboids = [cuboid]
                    } else {
                        cuboids = Set(cuboids.flatMap { $0.union(with: cuboid) })
                    }
                } else {
                    cuboids = Set(cuboids.flatMap { $0.union(with: cuboid) })
                    cuboids.remove(cuboid)
                }
            }
        }
        
        return cuboids.map { $0.points }.reduce(0, +)
    }
    
}
