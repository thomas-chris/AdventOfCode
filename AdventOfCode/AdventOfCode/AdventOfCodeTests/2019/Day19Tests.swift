//
//  Day19Tests.swift
//  AdventOfCodeTests
//
//  Created by Chris Thomas on 20/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import AdventOfCode
import XCTest

class Day19Tests: XCTestCase {

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let input = Input.day19(file: "Day19")
        let day19 = Day19(input: input)
        let result = day19.part1()
        XCTAssertEqual(result, 129)
    }
}
