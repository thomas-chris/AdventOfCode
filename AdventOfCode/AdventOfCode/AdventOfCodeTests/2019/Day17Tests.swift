//
//  Day17Tests.swift
//  AdventOfCodeTests
//
//  Created by Chris Thomas on 17/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import AdventOfCode
import XCTest

class Day17Tests: XCTestCase {

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    
        let input = Input.day17(file: "Day17")
        let day17 = Day17(input: input)
        let result = day17.part1()
        XCTAssertEqual(result, 5680)
    }
    
    func testPart2() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    
        let input = Input.day17(file: "Day17Part2")
        let day17 = Day17(input: input)
        let result = day17.part2()
        XCTAssertEqual(result, 895965)
    }
}
