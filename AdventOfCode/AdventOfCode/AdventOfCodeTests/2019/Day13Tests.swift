//
//  Day13Tests.swift
//  AdventOfCodeTests
//
//  Created by Chris Thomas on 13/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import AdventOfCode
import XCTest

class Day13Tests: XCTestCase {

    func testPart1() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let input = Input.day13(file: "Day13")
        let day13 = Day13(list: input)
        let result = day13.part1(inputs: [])
        XCTAssertEqual(result, 427)
    }
    
    func testPart2() {
           // This is an example of a functional test case.
           // Use XCTAssert and related functions to verify your tests produce the correct results.
           
           let input = Input.day13(file: "Day13")
           let day13 = Day13(list: input)
           let result = day13.part2(memoryOverride: 2, inputs: [])
           XCTAssertEqual(result, 21426)
       }
}
