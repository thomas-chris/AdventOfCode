//
//  Day3.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 03/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

public struct Point: Equatable, Hashable {
    let x: Double
    let y: Double
}

public struct Day3 {
    public static func calculateManhattanDistanceOfTwoPoints(from: Point, to: Point) -> Double {
        return (abs(from.x - to.x) + abs(from.y - to.y))
    }
    
    public static func createListOfPoints(directions: Day3Input) -> [(Point, Int)] {
        let start = (Point(x: 0, y: 0), 0)
        var lastPoint = start
        var points: [(Point, Int)] = []
        for i in 0...directions.count {
            guard let data = directions[Double(i)] else { break }
            let newPoints = getNewCoordinate(from: data, startingAt: lastPoint, points: points)
            lastPoint = newPoints.last!
            points = newPoints
        }
        
        return points
    }
    
    public static func getNewCoordinate(from: (direction: Direction, distance: Double), startingAt: (Point, Int), points: [(Point, Int)]) -> [(Point, Int)] {
        var points = points
        let time = points.last?.1 ?? 0
        switch from.direction {
        case .up:
            for i in 1...Int(from.distance) {
                points.append(((Point(x: startingAt.0.x, y: startingAt.0.y + Double(i))), time + abs(i)))
            }
        case .down:
            for i in 1...Int(from.distance) {
                points.append(((Point(x: startingAt.0.x, y: startingAt.0.y - Double(i))), time + abs(i)))
            }
        case .left:
            for i in 1...Int(from.distance) {
                points.append(((Point(x: startingAt.0.x - Double(i), y: startingAt.0.y)), time + abs(i)))
            }
        case .right:
            for i in 1...Int(from.distance) {
                points.append(((Point(x: startingAt.0.x  + Double(i), y: startingAt.0.y)), time + abs(i)))
            }
        }
        
        return points
    }
    
    public static func getMatchingPoints(first: [(Point, Int)], second: [(Point, Int)]) -> [Point] {
        
        let firstSet = Set(first.map { $0.0 })
        let secondSet = Set(second.map { $0.0 })
        let intersection = firstSet.intersection(secondSet)
        let array: [Point] = intersection.map { $0 }
        return array
    }
    
    public static func getShortestDistanceOfIntersection(points: [Point]) -> Double {
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
    
    public static func getStepsForTimeOfIntersection(first: [(Point, Int)], second: [(Point, Int)], matching: [Point]) -> Int {
        
        let matchedPoint1s = first.filter { (value) -> Bool in
            matching.contains(value.0)
        }
        
        let matchedPoint2s = second.filter { (value) -> Bool in
            matching.contains(value.0)
        }
        
        let pointsAndTimes = matchedPoint1s.compactMap { value -> (Point, Int) in
            var totalTime = 0
            matchedPoint2s.forEach { value2 in
                if value.0 == value2.0 {
                    totalTime = value2.1 + value.1
                }
            }
            return (value.0, totalTime)
        }

        let point =  pointsAndTimes.min { a, b in a.1 < b.1 } ?? (Point(x: 0, y: 0), 0)
        return point.1
    }
}
