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
        search(seenLowerCaseCaves: Set(["start"]), breadcrumb: ["start"], hasVisitedSmallCaveTwice: true, connections: connections, paths: &paths)
        
        return paths.count
    }
    
    public static func part2(_ input: [Cave]) throws -> Int {
        var connections = [Cave: [Cave]]()
        for instruction in input {
            let split = instruction.split(separator: "-")
            connections[Cave(split[0]), default: []].append(Cave(split[1]))
            connections[Cave(split[1]), default: []].append(Cave(split[0]))
        }
        
        var paths = [[Cave]]()
        search(seenLowerCaseCaves: Set(["start"]), breadcrumb: ["start"], hasVisitedSmallCaveTwice: false, connections: connections, paths: &paths)
        
        return paths.count
    }
    
    private static func search(seenLowerCaseCaves: Set<Cave>, breadcrumb: [Cave], hasVisitedSmallCaveTwice: Bool, connections: [Cave: [Cave]], paths: inout [[Cave]]) {
        let last = breadcrumb.last!
        for cave in connections[last]! {
            if cave == "end" {
                var newBreadcrumb = breadcrumb
                newBreadcrumb.append(cave)
                paths.append(newBreadcrumb)
            } else if cave == "start" {
                //ignore start
            } else {
                if hasVisitedSmallCaveTwice && seenLowerCaseCaves.contains(cave)  {
                    continue
                } else {
                    var newBreadcrumb = breadcrumb
                    newBreadcrumb.append(cave)
                    var seenCaves = seenLowerCaseCaves
                    var seen = hasVisitedSmallCaveTwice
                    if cave == cave.lowercased() {
                        seen = seenLowerCaseCaves.contains(cave) || hasVisitedSmallCaveTwice
                        seenCaves.insert(cave)
                    }
                    search(seenLowerCaseCaves: seenCaves, breadcrumb: newBreadcrumb, hasVisitedSmallCaveTwice: seen, connections: connections, paths: &paths)
                }
            }
        }
    }
}
