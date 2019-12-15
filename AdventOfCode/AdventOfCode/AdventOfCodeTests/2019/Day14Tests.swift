//
//  Day14Tests.swift
//  AdventOfCodeTests
//
//  Created by Chris Thomas on 14/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import AdventOfCode
import XCTest

class Day14Tests: XCTestCase {
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let input = Input.day14(file: "Day14Example1")
        let day14 = Day14(input: input)
        let result = day14.part1(fuel: 1)
        XCTAssertEqual(result.0, 31)
    }
    
    func testExample2() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let input = Input.day14(file: "Day14Example2")
        let day14 = Day14(input: input)
        let result = day14.part1(fuel: 1)
        XCTAssertEqual(result.0, 165)
    }
    
    func testExample3() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let input = Input.day14(file: "Day14Example3")
        let day14 = Day14(input: input)
        let result = day14.part1(fuel: 1)
        XCTAssertEqual(result.0, 13312)
    }
    
    func testExample4() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let input = Input.day14(file: "Day14Example4")
        let day14 = Day14(input: input)
        let result = day14.part1(fuel: 1)
        XCTAssertEqual(result.0, 180697)
    }
    
    func testExample5() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let input = Input.day14(file: "Day14Example5")
        let day14 = Day14(input: input)
        let result = day14.part1(fuel: 1)
        XCTAssertEqual(result.0, 2210736)
    }
    
    func testPart1() {
        let input = Input.day14(file: "Day14")
        let day14 = Day14(input: input)
        let result = day14.part1(fuel: 1)
        XCTAssertEqual(result.0, 598038)
    }
    
    func testPart2Example1() {
//        let input = Input.day14(file: "Day14")
//        let day14 = Day14(input: input)
//        let result = day14.part2(ore: 1000000000000)
//        XCTAssertEqual(result, 598038)
    }
}
