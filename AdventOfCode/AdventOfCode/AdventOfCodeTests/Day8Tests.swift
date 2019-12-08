//
//  Day8Tests.swift
//  AdventOfCodeTests
//
//  Created by Chris Thomas on 08/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

@testable import AdventOfCode
import XCTest

class Day8Tests: XCTestCase {
    
    func testExample1() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let input = Input.day8(file: "Day8Test1")
        let day8 = Day8(input: input)
        let output = day8.part1(width: 3, height: 2)
        XCTAssertEqual(output, 1)
    }
    
    func testPart1() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let input = Input.day8(file: "Day8")
        let day8 = Day8(input: input)
        let output = day8.part1(width: 25, height: 6)
        XCTAssertEqual(output, 2904)
    }
    
    func testPart2() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let input = Input.day8(file: "Day8")
        let day8 = Day8(input: input)
        let output = day8.part2(width: 25, height: 6)
        XCTAssertEqual(output, ["◼️◻️◻️◼️◻️◻️◼️◼️◻️◻️◼️◼️◼️◻️◻️◻️◼️◼️◻️◻️◼️◼️◼️◼️◻️",
                                "◼️◻️◻️◼️◻️◼️◻️◻️◼️◻️◼️◻️◻️◼️◻️◼️◻️◻️◼️◻️◼️◻️◻️◻️◻️",
                                "◼️◼️◼️◼️◻️◼️◻️◻️◻️◻️◼️◼️◼️◻️◻️◼️◻️◻️◻️◻️◼️◼️◼️◻️◻️",
                                "◼️◻️◻️◼️◻️◼️◻️◼️◼️◻️◼️◻️◻️◼️◻️◼️◻️◻️◻️◻️◼️◻️◻️◻️◻️",
                                "◼️◻️◻️◼️◻️◼️◻️◻️◼️◻️◼️◻️◻️◼️◻️◼️◻️◻️◼️◻️◼️◻️◻️◻️◻️",
                                "◼️◻️◻️◼️◻️◻️◼️◼️◼️◻️◼️◼️◼️◻️◻️◻️◼️◼️◻️◻️◼️◻️◻️◻️◻️"])
    }
}
