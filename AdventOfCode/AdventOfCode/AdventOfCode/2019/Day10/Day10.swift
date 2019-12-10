//
//  Day10.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 10/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

struct Day10 {
    let input: [Position]
    
    init(input: [Position]) {
        self.input = input
    }
    
    func part1() -> (Position, Int) {
        let viewableAsteroidsAtEachPosition = calculateUniqueGradients()
        
        var maxViewable: Position = Position(x: 0, y: 0)
        var maxViewableValue = 0
        
        viewableAsteroidsAtEachPosition.forEach { (key, value) in
            if value > maxViewableValue {
                maxViewable = key
                maxViewableValue = value
            }
        }
        
        return (maxViewable, maxViewableValue)
        
    }
    
    func part2() -> Int {
        let laserLocation = part1().0
        let dictionary = getGradientAndAsteroidsOnItForEveryAsteroid()
        
        guard let intermidiate = dictionary[laserLocation] else { return 0 }
        var count = 0
        var positions = intermidiate.map { (key, value) in
            return value
        }
        
        var positionOf200 = Position(x: 0, y: 0)
        while count < 200 {
            positions.enumerated().forEach { (index,value) in
                if let position = value.first {
                    positionOf200 = position
                    positions[index] = Array(value.dropFirst())
                    count += 1
                }
            }
        }
        
        return (positionOf200.x * 100) + positionOf200.y
    }
}

extension Day10 {
    func calculateUniqueGradients() -> [Position: Int] {
        let positionDictionaryWithDictionaryOfGradientsWithEachAsteroidOnGradient = getGradientAndAsteroidsOnItForEveryAsteroid()
        
        var canViewDictionary = [Position: Int]()
        positionDictionaryWithDictionaryOfGradientsWithEachAsteroidOnGradient.forEach { (position, value) in
            var canView = 0
            value.forEach { (gradient, otherPositions) in
                if otherPositions.count == 1 {
                    canView += 1
                } else if otherPositions.count > 0 {
                    canView += numberOfDirections(position: position, positions: otherPositions)
                }
            }
            canViewDictionary[position] = canView
        }
        return canViewDictionary
    }
    
    func numberOfDirections(position: Position, positions: [Position]) -> Int {
        var isLeftAndUp = false
        var isRightAndUp = false
        var isLeftAndDown = false
        var isRightAndDown = false
        var onYPlaneXBig = false
        var onYPlaneXSmall = false
        var onXPlaneAndYSmall = false
        var onXPlaneAndYBig = false
        var count = 0
        positions.forEach { value in
            if value.x < position.x && value.y < position.y {
                isLeftAndDown = true
            }
            if value.x < position.x && value.y > position.y {
                isLeftAndUp = true
            }
            if value.x > position.x && value.y < position.y {
                isRightAndDown = true
            }
            if value.x > position.x && value.y > position.y {
                isRightAndUp = true
            }
            if value.x == position.x && value.y < position.y{
                onXPlaneAndYSmall = true
            }
            if value.x == position.x && value.y > position.y{
                onXPlaneAndYBig = true
            }
            if value.y == position.y && value.x > position.x {
                onYPlaneXBig = true
            }
            if value.y == position.y && value.x < position.x {
                onYPlaneXSmall = true
            }
        }
        
        if isRightAndUp {
            count += 1
        }
        if isRightAndDown {
            count += 1
        }
        if isLeftAndDown {
            count += 1
        }
        if isLeftAndUp {
            count += 1
        }
        if onXPlaneAndYBig {
            count += 1
        }
        if onXPlaneAndYSmall {
            count += 1
        }
        if onYPlaneXBig {
            count += 1
        }
        if onYPlaneXSmall {
            count += 1
        }
        
        return count
    }
    
    func getGradientAndAsteroidsOnItForEveryAsteroid() -> [Position : [Float: [Position]]]{
        var dictionary: [Position : [Float: [Position]]] = [:]
        input.forEach { position in
            var dictionary2: [Float: [Position]] = [:]
            input.forEach { value in
                if value != position {
                    let gradient = (Float(position.y - value.y)) / (Float(position.x - value.x))
                    var savedPositions = dictionary2[gradient] ?? []
                    savedPositions.append(value)
                    dictionary2[gradient] = savedPositions
                }
            }
            
            dictionary[position] = dictionary2
        }
        return dictionary
    }
}
