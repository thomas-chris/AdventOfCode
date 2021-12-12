import Algorithms
import Foundation
import Regex
import UIKit

public struct Day12 {
    
    public typealias Cave = String
    
    public static func part1(_ input: [String]) -> Int {
        
        var connections = [Cave: [Cave]]()
        for instruction in input {
            let split = instruction.split(separator: "-")
            connections[Cave(split[0]), default: []].append(Cave(split[1]))
            connections[Cave(split[1]), default: []].append(Cave(split[0]))
        }
        
        var paths = [[Cave]]()
        search(seenLowerCaseCaves: Set(["start"]), breadcrumb: ["start"], connections: connections, paths: &paths)
        
        return paths.count
    }
    
    public static func part2(_ input: [Cave]) throws -> Int {
        return 1
    }
    
    private static func search(seenLowerCaseCaves: Set<Cave>, breadcrumb: [Cave], connections: [Cave: [Cave]], paths: inout [[Cave]]) {
        
        
        let last = breadcrumb.last!
        for cave in connections[last]! {
            if cave == "end" {
                var newBreadcrumb = breadcrumb
                newBreadcrumb.append(cave)
                paths.append(newBreadcrumb)
            } else if cave == "start" {
                //ignore start
            } else {
                if seenLowerCaseCaves.contains(cave) {
                    continue
                } else {
                    var newBreadcrumb = breadcrumb
                    newBreadcrumb.append(cave)
                    var seenCaves = seenLowerCaseCaves
                    if cave == cave.lowercased() {
                        seenCaves.insert(cave)
                    }
                    search(seenLowerCaseCaves: seenCaves, breadcrumb: newBreadcrumb, connections: connections, paths: &paths)
                }
            }
        }
    }
}
