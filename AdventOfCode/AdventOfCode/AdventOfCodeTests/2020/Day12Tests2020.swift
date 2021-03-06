import XCTest
import AdventOfCode

class Advent2020TestsDay12: XCTestCase {
    
    func test_day12_example1() {
        let input = Input.getInputString(name: "Day122020_Example1").components(separatedBy: "\n")
        let day12 = TwentyTwenty.Day12()
        let instructions = day12.getInstructions(input: input)
        let count = day12.solve1(instructions: instructions)
        XCTAssertEqual(count, 25)
    }
    
    func test_day12() {
        measure {
            let input = Input.getInputString(name: "Day122020").components(separatedBy: "\n")
            let day12 = TwentyTwenty.Day12()
            let instructions = day12.getInstructions(input: input)
            let count = day12.solve1(instructions: instructions)
            XCTAssertEqual(count, 415)
        }
    }
    
    func test_day12_drawPart1() {
        measure {
            let input = Input.getInputString(name: "Day122020").components(separatedBy: "\n")
            let day12 = TwentyTwenty.Day12()
            let instructions = day12.getInstructions(input: input)
            day12.createMapForPart1(instructions: instructions)
        }
    }
    
    func test_day12_example2() {
        let input = Input.getInputString(name: "Day122020_Example1").components(separatedBy: "\n")
        let day12 = TwentyTwenty.Day12()
        let instructions = day12.getInstructions(input: input)
        let count = day12.solve2(instructions: instructions)
        XCTAssertEqual(count, 286)
    }
    
    func test_day12_part2() {
        measure {
            let input = Input.getInputString(name: "Day122020").components(separatedBy: "\n")
            let day12 = TwentyTwenty.Day12()
            let instructions = day12.getInstructions(input: input)
            let count = day12.solve2(instructions: instructions)
            XCTAssertEqual(count, 29401)
        }
    }
}
