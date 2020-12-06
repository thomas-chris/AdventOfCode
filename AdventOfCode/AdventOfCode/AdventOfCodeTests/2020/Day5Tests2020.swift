import XCTest
import AdventOfCode

class Advent2020TestsDay5: XCTestCase {

    func test_day5_example1() {
        let input = Input.getInputStringNoTrim(name: "Day52020_Example1")
            .trimmingCharacters(in: .whitespacesAndNewlines)
        let array = input.components(separatedBy: "\n")
        
        let boardingPassFilter = TwentyTwenty.Day5()
        let results = boardingPassFilter.boardingPassFilter(input: array)
        print(results)
        XCTAssertEqual(results.1, 820)
    }

    func test_day5_part1() {
        let input = Input.getInputStringNoTrim(name: "Day52020")
            .trimmingCharacters(in: .whitespacesAndNewlines)
        let array = input.components(separatedBy: "\n")
        
        let boardingPassFilter = TwentyTwenty.Day5()
        let results = boardingPassFilter.boardingPassFilter(input: array)
        XCTAssertEqual(results.1, 947)
        
    }
    
    func test_day5_part1_v2() {
        let input = Input.getInputStringNoTrim(name: "Day52020")
            .trimmingCharacters(in: .whitespacesAndNewlines)
        let array = input.components(separatedBy: "\n")
        
        let boardingPassFilter = TwentyTwenty.Day5()
        let result = boardingPassFilter.boardingPassFilterV2(input: array).max()
        XCTAssertEqual(result, 947)
        
    }

    func test_day5_part2() {
        let input = Input.getInputString(name: "Day52020")
        let array = input.components(separatedBy: "\n")
        
        let boardingPassFilter = TwentyTwenty.Day5()
        let results = boardingPassFilter.boardingPassFilter(input: array)
        let myPass = boardingPassFilter.findYourPass(input: results.2)
        XCTAssertEqual(myPass, 636)

    }
    
    func test_day5_part2_v2() {
        measure {
        let input = Input.getInputString(name: "Day52020")
        let array = input.components(separatedBy: "\n")
        
        let boardingPassFilter = TwentyTwenty.Day5()
        let results = boardingPassFilter.boardingPassFilterV2(input: array)
        let myPass = boardingPassFilter.findYourPass(input: results)
        XCTAssertEqual(myPass, 636)
        }
    }
}
