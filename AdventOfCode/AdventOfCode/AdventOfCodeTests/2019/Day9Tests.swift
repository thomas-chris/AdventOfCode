//
//  Day9Tests.swift
//  AdventOfCodeTests
//
//  Created by Chris Thomas on 09/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import AdventOfCode
import XCTest

class Day9Tests: XCTestCase {
    
    func test9test1() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let input = Input.day9(file: "Day9Test1")
        let day9 = Day9(list: input)
        let output = day9.part1(inputs: [])
        XCTAssertEqual(output, [109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99])
    }
    
    func test9test2() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let input = Input.day9(file: "Day9Test2")
        let day9 = Day9(list: input)
        let output = day9.part1(inputs: [])
        XCTAssertEqual(output.last, 1219070632396864)
    }
    
    func test9test3() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let input = Input.day9(file: "Day9Test3")
        let day9 = Day9(list: input)
        let output = day9.part1(inputs: [])
        XCTAssertEqual(output.last, 1125899906842624)
    }
    
    func test9Part1() {
        let input = Input.day9(file: "Day9")
        let day9 = Day9(list: input)
        let output = day9.part1(inputs: [1])
        XCTAssertEqual(output, [4261108180])
    }
    
    func test9Part2() {
        let input = Input.day9(file: "Day9")
        let day9 = Day9(list: input)
        let output = day9.part1(inputs: [2])
        XCTAssertEqual(output, [77944])
    }
    
}
