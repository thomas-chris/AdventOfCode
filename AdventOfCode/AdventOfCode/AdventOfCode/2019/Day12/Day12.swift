//
//  Day12.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 12/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

enum Planet: Int {
    case Io = 0
    case Europa = 1
    case Ganymede = 2
    case Callisto = 3
}


class Day12 {
    let input: [XYZ]
    
    init(input: [XYZ]) {
        self.input = input
    }
    
    func part1(loops: Int) -> Int {
        var state = [Planet: (position: XYZ, velocity: XYZ)]()
            input.enumerated().forEach { (index, position) in
            state[Planet(rawValue: index)!] = (position: position, velocity: XYZ.zero)
        }
        
        var count = 0
        while count < loops {
            var newState = [Planet: (position: XYZ, velocity: XYZ)]()
            state.forEach { (key, value) in
                let otherBodys = state.remove(for: key)
                                        .map { (key, value) in
                                            return value.position
                                        }
                let moved = move(initialState: value, otherBodyPostions: otherBodys)
                newState[key] = moved
            }
            state = newState
            count += 1
        }
        
        let energy = state.map { (key, value) in
            value.position.energy * value.velocity.energy
        }.reduce(0, +)
        return energy
    }
    
    func move(initialState: (position: XYZ, velocity: XYZ), otherBodyPostions: [XYZ]) -> (position: XYZ, velocity: XYZ) {
        var xChange = 0
        var yChange = 0
        var zChange = 0
        otherBodyPostions.forEach { value in
            let xDifference = value.x - initialState.position.x
            let yDifference = value.y - initialState.position.y
            let zDifference = value.z - initialState.position.z
            
            if xDifference > 0 {
                xChange += 1
            } else if xDifference < 0 {
                xChange -= 1
            }
            if yDifference > 0 {
                yChange += 1
            } else if yDifference < 0 {
                yChange -= 1
            }
            if zDifference > 0 {
                zChange += 1
            } else if zDifference < 0 {
                zChange -= 1
            }
        }
        
        let velocity = XYZ(x: initialState.velocity.x + xChange, y: initialState.velocity.y + yChange, z: initialState.velocity.z + zChange)
        let newPostion = XYZ(x: initialState.position.x + velocity.x, y: initialState.position.y + velocity.y, z: initialState.position.z + velocity.z)
    
        return (position: newPostion, velocity: velocity)
    }
}

extension Dictionary where Key: Equatable {
    func remove(for keyToRemove: Key) -> Dictionary {
        var newDictionary = [Key: Value]()
        self.forEach { (key, value) in
            if key != keyToRemove {
                newDictionary[key] = value
            }
        }
        return newDictionary
    }
}
