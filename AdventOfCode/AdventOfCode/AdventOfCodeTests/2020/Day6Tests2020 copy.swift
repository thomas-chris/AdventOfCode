import XCTest
import AdventOfCode

class Advent2020TestsDay6: XCTestCase {

    func test_day6_example1() {
        let input = Input.getInputStringNoTrim(name: "Day62020_Example1")

        let immigrationForm = TwentyTwenty.Day6()
        let result = immigrationForm.solve(input: input)
        XCTAssertEqual(result, 11)
    }


    func test_day6_part1() {
        let input = Input.getInputStringNoTrim(name: "Day62020")

        let immigrationForm = TwentyTwenty.Day6()
        let result = immigrationForm.solve(input: input)
        XCTAssertEqual(result, 6625)

    }
    
    func test_day6_example2() {
        let input = Input.getInputStringNoTrim(name: "Day62020_Example1")

        let immigrationForm = TwentyTwenty.Day6()
        let result = immigrationForm.solve2(input: input)
        XCTAssertEqual(result, 6)
    }
//
    func test_day6_part2() {
        let input = Input.getInputStringNoTrim(name: "Day62020")

        let immigrationForm = TwentyTwenty.Day6()
        let result = immigrationForm.solve2(input: input)
        XCTAssertEqual(result, 3360)

    }
//
//    func test_day5_part2_v2() {
//        measure {
//        let input = Input.getInputString(name: "Day52020")
//        let array = input.components(separatedBy: "\n")
//
//        let boardingPassFilter = TwentyTwenty.Day5()
//        let results = boardingPassFilter.boardingPassFilterV2(input: array)
//        let myPass = boardingPassFilter.findYourPass(input: results)
//        XCTAssertEqual(myPass, 636)
//        }
//    }
}
