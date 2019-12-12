//
//  Day7Tests.swift
//  AdventOfCodeTests
//
//  Created by Chris Thomas on 07/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import AdventOfCode
import XCTest

class Day7Tests: XCTestCase {
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let input = Input.day7(file: "Day7")
        let day7 = Day7(list: input)
        let output = day7.part1()
        XCTAssertEqual(output, 34686)
    }
    
    func testPart2Test1() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let input = Input.day7(file: "Day7Test2")
        let day7 = Day7(list: input)
        let output = day7.part2()
        XCTAssertEqual(output, 139629729)
    }
    
    func testPart2() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let input = Input.day7(file: "Day7")
        let day7 = Day7(list: input)
        let output = day7.part2()
        XCTAssertEqual(output, 36384144)
    }
    
    func testRefactorFor5() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let input = Input.day7(file: "Day5")
        
        var count = 0
        let dictionary = input.reduce([Int: Int]()) { (dict, value) -> [Int: Int] in
            var dict = dict
            dict[count] = value
            count += 1
            return dict
        }
        
        let intCode = IntCode(list: dictionary)
        let output = intCode.calculate(inputs: [1])
        XCTAssertEqual(intCode.output.last, 13210611)
    }
}
