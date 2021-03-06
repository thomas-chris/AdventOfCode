import XCTest
import AdventOfCode

class Advent2020TestsDay8: XCTestCase {
    
    func test_day8_example1() {
        let input = Input.getInputString(name: "Day82020_Example1")
        let array = input.components(separatedBy: "\n")
        
        let game = TwentyTwenty.Day8()
        let count = game.solve1(input: array)
        XCTAssertEqual(count, 5)
    }
    
    
    func test_day8_part1() {
        measure{
            let input = Input.getInputString(name: "Day82020")
            let array = input.components(separatedBy: "\n")
            
            let game = TwentyTwenty.Day8()
            let count = game.solve1(input: array)
            XCTAssertEqual(count, 2051)
        }
    }
    
    func test_day8_part2() {
        measure {
        let input = Input.getInputString(name: "Day82020")
        let array = input.components(separatedBy: "\n")
        
        let bagSolver = TwentyTwenty.Day8()
        let count = bagSolver.solve2(input: array)
            XCTAssertEqual(count, 2304)
        }
    }
    
    func test_day8_part1_PJ() {
        measure{
            let input = Input.getInputString(name: "Day82020PJsInput")
            let array = input.components(separatedBy: "\n")
            
            let game = TwentyTwenty.Day8()
            let count = game.solve1(input: array)
            XCTAssertEqual(count, 1475)
        }
    }
    
    func test_day8_part2_PJ() {
        measure {
        let input = Input.getInputString(name: "Day82020PJsInput")
        let array = input.components(separatedBy: "\n")
        
        let bagSolver = TwentyTwenty.Day8()
        let count = bagSolver.solve2(input: array)
            XCTAssertEqual(count, 1270)
        }
    }
}
