//
//  Day3Tests.swift
//  AdventOfCodeTests
//
//  Created by Chris Thomas on 03/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

@testable import AdventOfCode
import XCTest

class Day3Tests: XCTestCase {
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let data = Input.day3Input(file: "Day3Test1")
        let path1 = data.path1
        let path2 = data.path2
        
        let path1Points = Day3.createListOfPoints(directions: path1)
        let path2Points = Day3.createListOfPoints(directions: path2)
        
        let matchingPoints = Day3.getMatchingPoints(first: path1Points, second: path2Points)
        
        let distance = Day3.getShortestDistanceOfIntersection(points: matchingPoints)
        XCTAssertEqual(distance, 135)
        
    }
    
    func test2() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let data = Input.day3Input(file: "Day3Test2")
        let path1 = data.path1
        let path2 = data.path2
        
        let path1Points = Day3.createListOfPoints(directions: path1)
        let path2Points = Day3.createListOfPoints(directions: path2)
        
        let matchingPoints = Day3.getMatchingPoints(first: path1Points, second: path2Points)

        let distance = Day3.getShortestDistanceOfIntersection(points: matchingPoints)
        XCTAssertEqual(distance, 159)
        
    }
    
    
    func testResult() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let data = Input.day3Input(file: "Day3")
        let path1 = data.path1
        let path2 = data.path2
        
        let path1Points = Day3.createListOfPoints(directions: path1)
        let path2Points = Day3.createListOfPoints(directions: path2)
        
        let matchingPoints = Day3.getMatchingPoints(first: path1Points, second: path2Points)
        
        let matchedPoint1s = path1Points.filter { (value) -> Bool in
            matchingPoints.contains(value.0)
        }
        
        let matchedPoint2s = path2Points.filter { (value) -> Bool in
            matchingPoints.contains(value.0)
        }
        
        let distance = Day3.getShortestDistanceOfIntersection(points: matchingPoints)
        XCTAssertEqual(distance, 217)
        
    }
    
    func test_part2Test1() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let data = Input.day3Input(file: "Day3Test3")
        let path1 = data.path1
        let path2 = data.path2
        
        let path1Points = Day3.createListOfPoints(directions: path1)
        let path2Points = Day3.createListOfPoints(directions: path2)
        
        let matchingPoints = Day3.getMatchingPoints(first: path1Points, second: path2Points)
        
        let value = Day3.getStepsForTimeOfIntersection(first: path1Points, second: path2Points, matching: matchingPoints)
        
        XCTAssertEqual(value, 610)
        
    }
    
    func test_part2Test2() {
         // This is an example of a functional test case.
         // Use XCTAssert and related functions to verify your tests produce the correct results.
         
         let data = Input.day3Input(file: "Day3Test1")
         let path1 = data.path1
         let path2 = data.path2
         
         let path1Points = Day3.createListOfPoints(directions: path1)
         let path2Points = Day3.createListOfPoints(directions: path2)
         
         let matchingPoints = Day3.getMatchingPoints(first: path1Points, second: path2Points)
         
         let value = Day3.getStepsForTimeOfIntersection(first: path1Points, second: path2Points, matching: matchingPoints)
         
         XCTAssertEqual(value, 410)
         
     }
    
    func test_part2Test3() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let data = Input.day3Input(file: "Day3")
        let path1 = data.path1
        let path2 = data.path2
        
        let path1Points = Day3.createListOfPoints(directions: path1)
        let path2Points = Day3.createListOfPoints(directions: path2)
        
        let matchingPoints = Day3.getMatchingPoints(first: path1Points, second: path2Points)
        
        let value = Day3.getStepsForTimeOfIntersection(first: path1Points, second: path2Points, matching: matchingPoints)
        
        XCTAssertEqual(value, 3454)
        
    }
    
}
