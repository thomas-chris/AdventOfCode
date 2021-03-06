//
//  Day4Tests.swift
//  AdventOfCodeTests
//
//  Created by Chris Thomas on 04/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import AdventOfCode
import XCTest

class Day4Tests: XCTestCase {

    func testScenario1() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let input = Input.day4(file: "Day4Test1")
        let count = Day4.part1(passwordRange: input)
        XCTAssertEqual(count, "454")
        
        //TO HIGH??
    }
    
    func testScenario2() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let input = Input.day4(file: "Day4Test2")
        let count = Day4.part1(passwordRange: input)
        XCTAssertEqual(count, "9")
    }
    
    func testScenario3() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let input = Input.day4(file: "Day4Test1")
        let count = Day4.part2(passwordRange: input)
        XCTAssertEqual(count, "288")
        
        //To low - 214
        // to high 301
    }
    
    func testScenario4() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let input = Input.day4(file: "Day4Test3")
        let count = Day4.part2(passwordRange: input)
        XCTAssertEqual(count, "1")
        
        //To low
    }
}
