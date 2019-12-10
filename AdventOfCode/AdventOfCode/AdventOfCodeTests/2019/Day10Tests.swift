//
//  Day10Tests.swift
//  AdventOfCodeTests
//
//  Created by Chris Thomas on 10/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

@testable import AdventOfCode
import XCTest

class Day10Tests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let input = Input.day10(file: "Day10Test1")
        let day10 = Day10(input: input)
        let result = day10.part1()
        XCTAssertEqual(result.0, Position(x: 3, y: 4))
        XCTAssertEqual(result.1, 8)
    }
    
    func testExample2() {
        let input = Input.day10(file: "Day10Test2")
        let day10 = Day10(input: input)
        let result = day10.part1()
        XCTAssertEqual(result.0, Position(x: 5, y: 8))
        XCTAssertEqual(result.1, 33)
    }
    
    func testExample3() {
        let input = Input.day10(file: "Day10Test3")
        let day10 = Day10(input: input)
        let result = day10.part1()
        XCTAssertEqual(result.0, Position(x: 11, y: 13))
        XCTAssertEqual(result.1, 210)
    }
    
    func testPart1() {
        let input = Input.day10(file: "Day10")
        let day10 = Day10(input: input)
        let result = day10.part1()
        XCTAssertEqual(result.0, Position(x: 14, y: 17))
        XCTAssertEqual(result.1, 260)
    }
    
    func testPart2Example1() {
        let input = Input.day10(file: "Day10Test3")
        let day10 = Day10(input: input)
        let result = day10.part2()
        XCTAssertEqual(result, 802)
    }
    
}
