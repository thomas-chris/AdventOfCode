//
//  Day5.swift
//  AdventOfCodeTests
//
//  Created by Chris Thomas on 05/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import AdventOfCode
import XCTest

class Day5Tests: XCTestCase {

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let input = Input.day5()
        let output = Day5.calculate(list: input, inputs: [1])
        XCTAssertEqual(output, 13210611)
        
    }
    
    func testExample2() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let input = Input.day5()
        let output = Day5.calculate(list: input, inputs: [5])
        XCTAssertEqual(output, 584126)
        
    }

}
