import XCTest
import AdventOfCode

class Advent2020TestsDay14: XCTestCase {
    
    func test_day14_example1() {
        let input = Input.getInputString(name: "Day142020_Example1").components(separatedBy: "\n")
        let day14 = TwentyTwenty.Day14()
        let value = day14.solvePart1(input: input)
        XCTAssertEqual(value, 165)

    }
    
    func test_day14_part1() {
        let input = Input.getInputString(name: "Day142020").components(separatedBy: "\n")
        let day14 = TwentyTwenty.Day14()
        let value = day14.solvePart1(input: input)
        XCTAssertEqual(value, 15172047086292)

    }
    
    func test_part2_examplePJ() {
            let input = """
            mask = 000000000000000000000000000000X1001X
            mem[42] = 100
            mask = 00000000000000000000000000000000X0XX
            mem[26] = 1
            """.components(separatedBy: "\n")
        let day14 = TwentyTwenty.Day14()
        let value = day14.solvePart2(input: input)
        XCTAssertEqual(value, 208)
        }
    
    func test_day14_part2() {
        let input = Input.getInputString(name: "Day142020").components(separatedBy: "\n")
        let day14 = TwentyTwenty.Day14()
        let value = day14.solvePart2(input: input)
        XCTAssertEqual(value, 4197941339968)

    }



}
