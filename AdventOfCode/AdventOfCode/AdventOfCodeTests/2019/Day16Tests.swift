//
//  Day16Tests.swift
//  AdventOfCodeTests
//
//  Created by Chris Thomas on 16/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import AdventOfCode
import XCTest

class Day16Tests: XCTestCase {

    func testPart1Example1() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let input = Input.day16(file: "Day16Example1")
        let day16 = Day16(input: input)
        
        let result = day16.part1(loops: 100)
        let prefix = result.prefix(8)
        XCTAssertEqual(prefix, "24176176")
    }
    
    func testPart1Example2() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let input = Input.day16(file: "Day16Example2")
        let day16 = Day16(input: input)
        
        let result = day16.part1(loops: 100)
        let prefix = result.prefix(8)
        XCTAssertEqual(prefix, "73745418")

    }
    
    func testPart1() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let input = Input.day16(file: "Day16")
        let day16 = Day16(input: input)

        let result = day16.part1(loops: 100)
        let prefix = result.prefix(8)
        XCTAssertEqual(prefix, "42945143")
        
    }
    
    func testPart2Example1() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let input = Input.day16(file: "Day16Part2Example1")
        let day16 = Day16(input: input)
        
        let result = day16.part2(loops: 100).prefix(8)
        XCTAssertEqual(result, "84462026")

    }
    
    func testPart2() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let input = Input.day16(file: "Day16")
        let day16 = Day16(input: input)
        
        let result = day16.part2(loops: 100).prefix(8)
        XCTAssertEqual(result, "84462026")

    }
    
//    func testPart2() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//
//        let input = Input.day16(file: "Day16")
//        let day16 = Day16(input: input)
//
//        let result = day16.part2(loops: 100)
//
//        let prefix = Int(String(result.prefix(7)))!
//
//        let realResult = result.dropFirst(prefix)
//
//        let answer = realResult.prefix(8)
//        print(answer)
//        XCTAssertTrue(result.hasPrefix("42945143"))
//    }
}
