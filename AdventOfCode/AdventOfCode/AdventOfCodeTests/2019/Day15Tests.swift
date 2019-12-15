//
//  Day15Tests.swift
//  AdventOfCodeTests
//
//  Created by Chris Thomas on 15/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//
import AdventOfCode
import XCTest

class Day15Tests: XCTestCase {

    func testPart1() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let input = Input.day15(file: "Day15")
        let day15 = Day15(input: input)
        let path = day15.part1()
        XCTAssertEqual(path, 266)
    }
    
    func testPart2() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let input = Input.day15(file: "Day15")
        let day15 = Day15(input: input)
        let path = day15.part2()
        XCTAssertEqual(path, 274)
    }
}
