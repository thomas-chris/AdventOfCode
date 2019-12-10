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
    
    func part1() -> (Position, Int, [Position]) {
        let viewableAsteroidsAtEachPosition = calculateUniqueGradients()
        
        var maxViewable: Position = Position(x: 0, y: 0)
        var maxViewableValue = 0
        var closeOnes = [Position]()
        
        viewableAsteroidsAtEachPosition.forEach { (key, value) in
            if value.0 > maxViewableValue {
                maxViewable = key
                maxViewableValue = value.0
                closeOnes = value.1
            }
        }
        
        return (maxViewable, maxViewableValue, closeOnes)
        
    }
    
    func part2() -> Int {
        let part1Answer = part1()
        let laserLocation = part1Answer.0
        let asteroids = part1Answer.2

        let sortedAsteroids = asteroids
            .map { asteroid -> (Position, Double) in
                let angle = Angle(start: laserLocation, end: asteroid)
                return (asteroid, angle.value)
            }
            .sorted { $0.1 < $1.1 }

        let asteroidPosition = sortedAsteroids[199].0
        return asteroidPosition.x * 100 + asteroidPosition.y
    }
}

extension Day10 {
    func calculateUniqueGradients() -> [Position: (Int, [Position])] {
        let positionDictionaryWithDictionaryOfGradientsWithEachAsteroidOnGradient = getGradientAndAsteroidsOnItForEveryAsteroid()
        
        var canViewDictionary = [Position: (Int, [Position])]()
        positionDictionaryWithDictionaryOfGradientsWithEachAsteroidOnGradient.forEach { (position, value) in
            var canView = 0
            var closeOnes = [Position]()
            value.forEach { (gradient, otherPositions) in
                if otherPositions.count == 1 {
                    canView += 1
                    closeOnes.append(otherPositions.first!)
                } else if otherPositions.count > 0 {
                    let response = numberOfDirections(position: position, positions: otherPositions)
                    canView += response.0
                    closeOnes.append(contentsOf: response.1)
                }
            }
            canViewDictionary[position] = (canView, closeOnes)
        }
        return canViewDictionary
    }
    
    func numberOfDirections(position: Position, positions: [Position]) -> (Int, [Position]) {
        var isLeftAndUp = false
        var isRightAndUp = false
        var isLeftAndDown = false
        var isRightAndDown = false
        var onYPlaneXBig = false
        var onYPlaneXSmall = false
        var onXPlaneAndYSmall = false
        var onXPlaneAndYBig = false
        var count = 0
        var closeOnes = [Position]()
        positions.forEach { value in
            if value.x < position.x && value.y < position.y {
                if !isLeftAndDown {
                    closeOnes.append(value)
                }
                isLeftAndDown = true
            }
            if value.x < position.x && value.y > position.y {
                if !isLeftAndUp {
                    closeOnes.append(value)
                }
                isLeftAndUp = true
            }
            if value.x > position.x && value.y < position.y {
                if !isRightAndDown {
                    closeOnes.append(value)
                }
                isRightAndDown = true
            }
            if value.x > position.x && value.y > position.y {
                if !isRightAndUp {
                    closeOnes.append(value)
                }
                isRightAndUp = true
            }
            if value.x == position.x && value.y < position.y{
                if !onXPlaneAndYSmall {
                    closeOnes.append(value)
                }
                onXPlaneAndYSmall = true
            }
            if value.x == position.x && value.y > position.y{
                if !onXPlaneAndYBig {
                    closeOnes.append(value)
                }
                onXPlaneAndYBig = true
            }
            if value.y == position.y && value.x > position.x {
                if !onYPlaneXBig {
                    closeOnes.append(value)
                }
                onYPlaneXBig = true
            }
            if value.y == position.y && value.x < position.x {
                if !onYPlaneXSmall {
                    closeOnes.append(value)
                }
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
        

        
        return (count, closeOnes)
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

struct Angle {
    let start: Position
    let end: Position

    var value: Double {
        let opposite = Double(end.x - start.x)
        let adjacent = Double(end.y - start.y)
        let angle = atan2(adjacent, opposite)
        // Angles start from y = 0 so this bumps 90° and makes all values
        // between 0 and 2π.
        return (angle + 2.5 * .pi).truncatingRemainder(dividingBy: 2 * .pi)
    }
}
