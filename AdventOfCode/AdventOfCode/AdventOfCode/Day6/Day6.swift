//
//  Day6.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 06/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

struct Day6 {
    static func part1(input: [OrbitPair]) -> Int {
        var orbitsDictionary : [String: String] = [:]
        input.forEach { value in
            orbitsDictionary[value.orbiter] = value.center
        }
        
        return orbitsDictionary.reduce(0) { $0 + count(key: $1.key, dictionary: orbitsDictionary)}
    }
    static func part2(input: [OrbitPair]) -> Int {
        var orbitsDictionary : [String: String] = [:]
        input.forEach { value in
            orbitsDictionary[value.orbiter] = value.center
        }
        
        let you = chain(key: "YOU", dictionary: orbitsDictionary)
        let santa = chain(key: "SAN", dictionary: orbitsDictionary)
        
        let count = min(you.count, santa.count)
        for i in 0...count {
            if you[i] != santa[i] {
                return you.count + santa.count - i - i - 2
            }
        }
        return 0
    }
    
    static func chain(key: String, dictionary: [String: String]) -> [String] {
        if key == "COM" {
           return [key]
        }
        
        if let ancestor = dictionary[key] {
            return chain(key: ancestor, dictionary: dictionary) + [key]
        }
        
        return [key]
    }
    
    static func count(key: String, dictionary: [String:String]) -> Int {
        if key == "COM" {
            return 0
        }
        
        if let ancestor = dictionary[key] {
            
            return 1 + count(key: ancestor, dictionary: dictionary)
        }
        
        return 0
    }
}
