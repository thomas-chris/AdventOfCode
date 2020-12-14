import XCTest
import AdventOfCode

class Advent2020TestsDay13: XCTestCase {
    
    func test_day13_example1() {
        let input = Input.getInputString(name: "Day132020_Example1").components(separatedBy: "\n")
        let day13 = TwentyTwenty.Day13()
        let value = day13.solvePart1(input: input)
        XCTAssertEqual(value, 295)
    }
    
    func test_day13() {
        measure {
            let input = Input.getInputString(name: "Day132020").components(separatedBy: "\n")
            let day13 = TwentyTwenty.Day13()
            let value = day13.solvePart1(input: input)
            XCTAssertEqual(value, 2947)
        }
    }
    
    func test_day13_part2_example1() {
            let input = Input.getInputString(name: "Day132020_Example1").components(separatedBy: "\n")
            let day13 = TwentyTwenty.Day13()
            let value = day13.solvePart2(input: input)
            XCTAssertEqual(value, 1068781)
    }
    
    func test_day13_part2_example2() {
        let input = Input.getInputString(name: "Day132020_Example2").components(separatedBy: "\n")
        let day13 = TwentyTwenty.Day13()
        let value = day13.solvePart2(input: input)
        XCTAssertEqual(value, 3417)
    }
    
    func test_day13_part2() {
        measure {
        let input = Input.getInputString(name: "Day132020").components(separatedBy: "\n")
        let day13 = TwentyTwenty.Day13()
        let value = day13.solvePart2(input: input)
        XCTAssertEqual(value, 526090562196173)
        }
    }
    
    func test_day13_part2_crt() {
        measure {
        let input = Input.getInputString(name: "Day132020").components(separatedBy: "\n")
        let day13 = TwentyTwenty.Day13()
        let value = day13.solvePart2crt(input: input)
        XCTAssertEqual(value, 526090562196173)
        }
    }
}
