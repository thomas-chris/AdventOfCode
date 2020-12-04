import XCTest
import AdventOfCode

class Advent2020TestsDay4: XCTestCase {

    func test_day4_example1() {
        let input = Input.getInputStringNoTrim(name: "Day42020_Example1")
        let passportValidator = TwentyTwenty.Day4()
        let passports = passportValidator.createPassports(input)
        XCTAssertEqual(passports.count, 2)
    }

    func test_day4_part1() {
        let input = Input.getInputStringNoTrim(name: "Day42020")
        let passportValidator = TwentyTwenty.Day4()
        let passports = passportValidator.createPassports(input)
        XCTAssertEqual(passports.count, 250)
        
    }

    func test_day4_example2() {
        let input = Input.getInputStringNoTrim(name: "Day42020_Example2")
        let passportValidator = TwentyTwenty.Day4()
        let passports = passportValidator.createPassports(input)
        let count = passportValidator.validatePassports(passports)
        XCTAssertEqual(count, 4)
        
    }

    func test_day4_part2() {
        let input = Input.getInputString(name: "Day42020")
        let passportValidator = TwentyTwenty.Day4()
        let passports = passportValidator.createPassports(input)
        let count = passportValidator.validatePassports(passports)
        XCTAssertEqual(count, 158)
    }
}
