//
//  AdventOfCodeTests.swift
//  AdventOfCodeTests
//
//  Created by Chris Thomas on 02/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import XCTest
@testable import AdventOfCode

class Tests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_day1() {
        XCTAssertEqual(Day1Answer.getAnswer(), 5132018.0)
    }
    
    func test_day2() {
        XCTAssertEqual(Day2.calculate(list: Input.day2Input())[0], 466644)
    }
    
    func test_day2_fixedInput() {
        var input = Input.day2Input()
        input[1] = 12
        input[2] = 2
        XCTAssertEqual(Day2.calculate(list: input)[0], 3058646)
    }
    
    func test_day2_getPair() {
        let input = Input.day2Input()
        XCTAssertEqual(Day2.getPair(list: input, pair: (noun: 12, verb: 2))[0], 3058646)
    }
    
    func test_day2_getPair_reversedEngineerAnswer() {
        let input = Input.day2Input()
        let answer = Day2.reverseEngineerIt(result: 19690720, initialInput: input)
        XCTAssertNotNil(answer)
        guard let result = answer else { return }
        print(100 * result.noun + result.verb)
    }
}
