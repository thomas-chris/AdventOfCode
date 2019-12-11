//
//  Day11Tests.swift
//  AdventOfCodeTests
//
//  Created by Chris Thomas on 11/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import XCTest


@testable import AdventOfCode
import XCTest

class Day11Tests: XCTestCase {
    
    func test11part1() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let input = Input.day11(file: "Day11")
        let day11 = Day11(list: input)
        let output = day11.part1(inputs: [0])
        XCTAssertEqual(output, 6904)
    }
}
