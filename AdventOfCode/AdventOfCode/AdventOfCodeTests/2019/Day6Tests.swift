//
//  Day6Tests.swift
//  AdventOfCodeTests
//
//  Created by Chris Thomas on 06/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import AdventOfCode
import XCTest

class Day6Tests: XCTestCase {

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let input = Input.day6(file: "Day6Test1")
        let x = Day6.part1(input: input)
        XCTAssertEqual(x, 42)
    }
    
    func testPart1() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let input = Input.day6(file: "Day6")
        let x = Day6.part1(input: input)
        XCTAssertEqual(x, 117672)
    }
    
    func testPart2() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let input = Input.day6(file: "Day6")
        let x = Day6.part2(input: input)
        XCTAssertEqual(x, 277)
    }

}
