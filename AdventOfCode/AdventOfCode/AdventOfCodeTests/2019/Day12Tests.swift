//
//  Day12Testa.swift
//  AdventOfCodeTests
//
//  Created by Chris Thomas on 12/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import AdventOfCode
import XCTest

class Day12Tests: XCTestCase {

    func testExample() {
        let input = Input.day12(file: "Day12")
        let day12 = Day12(input: input)
        let result = day12.part1(loops: 1000)
        XCTAssertEqual(result, 7636)
    }
    
    func testMove() {
        let input = Input.day12(file: "Day12")
        let day12 = Day12(input: input)
        
        let result = day12.move(initialState: (position: XYZ(x: -1, y: 0, z: 2), velocity: XYZ(x: 0, y: 0, z: 0)), otherBodyPostions: [XYZ(x: 2, y: -10, z: -7), XYZ(x: 4, y: -8, z: 8), XYZ(x: 3, y: 5, z: -1)])
        
        XCTAssertEqual(result.position, XYZ(x: 2, y: -1, z: 1))
        XCTAssertEqual(result.velocity, XYZ(x: 3, y: -1, z: -1))
        
        let result2 = day12.move(initialState: result, otherBodyPostions: [
            XYZ(x: 3, y: -7, z: -4),
            XYZ(x: 1, y: -7, z: 5),
            XYZ(x: 2, y: 2, z: 0)
        ])
        
        XCTAssertEqual(result2.position, XYZ(x: 5, y: -3, z: -1))
        XCTAssertEqual(result2.velocity, XYZ(x: 3, y: -2, z: -2))
    }
    
    func testDay12Example1Part1() {
        let input = Input.day12(file: "Day12Example1")
        let day12 = Day12(input: input)
        let result = day12.part1(loops: 10)
        
        XCTAssertEqual(result, 179)
    }
    
    func testDay12Example1Part2() {
        let input = Input.day12(file: "Day12Example1")
        let day12 = Day12(input: input)
        let result = day12.part2()
        
        XCTAssertEqual(result, 2772)
    }
    
    func testDay12Example2Part2() {
        let input = Input.day12(file: "Day12Example2")
        let day12 = Day12(input: input)
        let result = day12.part2()
        
        XCTAssertEqual(result, 4686774924)
    }
    
    func testDay12Part2() {
        let input = Input.day12(file: "Day12")
        let day12 = Day12(input: input)
        let result = day12.part2()
        
        XCTAssertEqual(result, 281691380235984)
    }
}
