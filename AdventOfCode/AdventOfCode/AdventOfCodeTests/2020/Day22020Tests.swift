import XCTest
import AdventOfCode

class Advent2020TestsDay2: XCTestCase {

    func test_day2_example1() {
        let input = Input.day2Input_2020(name: "Day2Example1_2020")
        XCTAssertEqual(validSledPasswords(input), 2)
    }
    
    func test_day2_part1() {
        let input = Input.day2Input_2020(name: "Day2_2020")
        XCTAssertEqual(validSledPasswords(input), 506)
    }
    
    func test_day2_example2() {
        let input = Input.day2Input_2020(name: "Day2Example1_2020")
        XCTAssertEqual(validPasswords(input), 1)
    }
    
    func test_day2_part2() {
        let input = Input.day2Input_2020(name: "Day2_2020")
        XCTAssertEqual(validPasswords(input), 443)
    }
}
