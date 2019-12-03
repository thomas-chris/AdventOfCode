//
//  Day3.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 03/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

struct Point: Equatable, Hashable {
    let x: Double
    let y: Double
}

struct Day3 {
    static func calculateManhattanDistanceOfTwoPoints(from: Point, to: Point) -> Double {
        return (abs(from.x - to.x) + abs(from.y - to.y))
    }
    
    static func createListOfPoints(directions: Day3Input) -> [Point] {
        let start = Point(x: 0, y: 0)
        var lastPoint = start
        var points: [Point] = []
        for i in 0...directions.count {
            guard let data = directions[Double(i)] else { break }
            let newPoints = getNewCoordinate(from: data, startingAt: lastPoint, points: points)
            lastPoint = newPoints.last!
            points = newPoints
        }
        
        return points
    }
    
    static func getNewCoordinate(from: (direction: Direction, distance: Double), startingAt: Point, points: [Point]) -> [Point] {
        var points = points
        switch from.direction {
        case .up:
            for i in 1...Int(from.distance) {
                points.append(Point(x: startingAt.x, y: startingAt.y + Double(i)))
            }
        case .down:
            for i in 1...Int(from.distance) {
                points.append(Point(x: startingAt.x, y: startingAt.y - Double(i)))
            }
        case .left:
            for i in 1...Int(from.distance) {
                points.append(Point(x: startingAt.x - Double(i), y: startingAt.y))
            }
        case .right:
            for i in 1...Int(from.distance) {
                points.append(Point(x: startingAt.x  + Double(i), y: startingAt.y))
            }
        }
        
        return points
    }
    
    static func getMatchingPoints(first: [Point], second: [Point]) -> [Point] {
        
        let firstSet = Set(first)
        let secondSet = Set(second)	
        let intersection = firstSet.intersection(secondSet)
        let array: [Point] = intersection.map { $0 }
        return array
    }
    
    static func getShortestDistanceOfIntersection(points: [Point]) -> Double {
        let origin = Point(x: 0, y: 0)
        let distancesFromOrigin = points.map {
            abs($0.x) + abs($0.y)
        }
        
        let filteredDistances = distancesFromOrigin.compactMap { (value) -> Int? in
            if value > 1 {
                return Int(value)
            }
            return nil
        }
        
        return Double(filteredDistances.min { a, b in a < b } ?? 0)
    }
}
