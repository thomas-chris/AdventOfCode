//
//  Day12.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 12/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

public enum Planet: Int {
    case Io = 0
    case Europa = 1
    case Ganymede = 2
    case Callisto = 3
}


public class Day12 {
    let input: [XYZ]
    
    public init(input: [XYZ]) {
        self.input = input
    }
    
    public func part1(loops: Int) -> Int {
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
    
    public func part2() -> Int {
        var state = [Planet: (position: XYZ, velocity: XYZ)]()
            input.enumerated().forEach { (index, position) in
            state[Planet(rawValue: index)!] = (position: position, velocity: XYZ.zero)
        }
        
        var xSet = Set<([Planet: SetData])>()
        var ySet = Set<([Planet: SetData])>()
        var zSet = Set<([Planet: SetData])>()

        var setDictionaryX = [Planet: SetData]()
        var setDictionaryY = [Planet: SetData]()
        var setDictionaryZ = [Planet: SetData]()
        state.forEach { (key, value) in
            setDictionaryX[key] = SetData(position: value.position.x, velocity: value.velocity.x)
            setDictionaryY[key] = SetData(position: value.position.y, velocity: value.velocity.y)
            setDictionaryZ[key] = SetData(position: value.position.z, velocity: value.velocity.z)
        }
        
        xSet.insert(setDictionaryX)
        ySet.insert(setDictionaryY)
        zSet.insert(setDictionaryZ)
        
        var xSetCount: Int?
        var ySetCount: Int?
        var zSetCount: Int?
        
        while xSetCount == nil || ySetCount == nil || zSetCount == nil {
            
            let countX = xSet.count
            let countY = ySet.count
            let countZ = zSet.count
            
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
            
            var setDictionaryX = [Planet: SetData]()
            var setDictionaryY = [Planet: SetData]()
            var setDictionaryZ = [Planet: SetData]()
            state.forEach { (key, value) in
                setDictionaryX[key] = SetData(position: value.position.x, velocity: value.velocity.x)
                setDictionaryY[key] = SetData(position: value.position.y, velocity: value.velocity.y)
                setDictionaryZ[key] = SetData(position: value.position.z, velocity: value.velocity.z)
            }
            
            xSet.insert(setDictionaryX)
            ySet.insert(setDictionaryY)
            zSet.insert(setDictionaryZ)
            
            if countX == xSet.count {
                xSetCount = countX
            }
            if countY == ySet.count {
                ySetCount = countY
            }
            if countZ == zSet.count {
                zSetCount = countZ
            }
        }
        
        let result = lowestCommonMultiple(xSetCount!, lowestCommonMultiple(ySetCount!, zSetCount!))
        return result
    }
    
    public func move(initialState: (position: XYZ, velocity: XYZ), otherBodyPostions: [XYZ]) -> (position: XYZ, velocity: XYZ) {
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
    
    public func greatestCommonDivisor(_ value1: Int, _ value2: Int) -> Int {
        var i: Int = 0
        var j: Int = max(value1, value2)
        var result: Int = min(value1, value2)

        while result != 0 {
            i = j
            j = result
            result = i % j
        }
        return j
    }

    public func lowestCommonMultiple(_ value1: Int, _ value2: Int) -> Int {
        return (value1 * value2) / greatestCommonDivisor(value1, value2)
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

struct PlanetInfo: Hashable, Equatable {
    let planet: Planet
    let x: Int
    let y: Int
    let z: Int
    let vx: Int
    let vy: Int
    let vz: Int
}

struct SetData: Hashable, Equatable {
    let position: Int
    let velocity: Int
}
