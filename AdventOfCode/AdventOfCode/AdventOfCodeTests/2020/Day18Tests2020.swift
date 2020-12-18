import XCTest
import AdventOfCode

class Advent2020TestsDay18: XCTestCase {
    
    func test_day18_example1() {
        let input = ["1 + 2 * 3 + 4 * 5 + 6"]
        let day18 = TwentyTwenty.Day18()
        let value = day18.solvePart1(input: input)
        XCTAssertEqual(value, 71)

    }
    
    func test_day18_example2() {
        let input = ["1 + (2 * 3) + (4 * (5 + 6))"]
        let day18 = TwentyTwenty.Day18()
        let value = day18.solvePart1(input: input)
        XCTAssertEqual(value, 51)

    }
    
    func test_day18_example3() {
        let input = [
            "((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2"
        ]
        let day18 = TwentyTwenty.Day18()
        let value = day18.solvePart1(input: input)
        XCTAssertEqual(value, 13632)

    }
    
    func test_day18_example4() {
        let input = [
            "5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))"
        ]
        let day18 = TwentyTwenty.Day18()
        let value = day18.solvePart1(input: input)
        XCTAssertEqual(value, 12240)

    }
    
    func test_day18_example5() {
        let input = [
            "2 * 3 + (4 * 5)",
            "5 + (8 * 3 + 9 + 3 * 4 * 3)",
            "5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))",
            "((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2"
        ]
        let day18 = TwentyTwenty.Day18()
        let value = day18.solvePart1(input: input)
        XCTAssertEqual(value, 26335)

    }
    
    func test_day18_part1() {
        measure {
        let input = Input.getInputString(name: "Day182020").components(separatedBy: "\n")
        let day18 = TwentyTwenty.Day18()
        let value = day18.solvePart1(input: input)
        XCTAssertEqual(value, 7293529867931)
        }
    }
    
    func test_day18_2_example1() {
        let input = ["1 + 2 * 3 + 4 * 5 + 6"]
        let day18 = TwentyTwenty.Day18()
        let value = day18.solvePart2(input: input)
        XCTAssertEqual(value, 231)

    }
    
    func test_day18_2_example2() {
        let input = ["1 + (2 * 3) + (4 * (5 + 6))"]
        let day18 = TwentyTwenty.Day18()
        let value = day18.solvePart2(input: input)
        XCTAssertEqual(value, 51)

    }
    
    func test_day18_2_example3() {
        let input = [
            "((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2"
        ]
        let day18 = TwentyTwenty.Day18()
        let value = day18.solvePart2(input: input)
        XCTAssertEqual(value, 23340)

    }
    
    func test_day18_2_example4() {
        let input = [
            "5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))"
        ]
        let day18 = TwentyTwenty.Day18()
        let value = day18.solvePart2(input: input)
        XCTAssertEqual(value, 669060)

    }
    
    
    func test_day18_part2() {
        measure {
            
        let input = Input.getInputString(name: "Day182020").components(separatedBy: "\n")
        let day18 = TwentyTwenty.Day18()
        let value = day18.solvePart2(input: input)
        XCTAssertEqual(value, 60807587180737)
        }
    }



}
