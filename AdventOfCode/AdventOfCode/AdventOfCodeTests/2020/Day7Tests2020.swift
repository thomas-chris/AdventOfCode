import XCTest
import AdventOfCode

class Advent2020TestsDay7: XCTestCase {
    
    func test_day7_example1() {
        let input = Input.getInputString(name: "Day72020_Example1")
        let array = input.components(separatedBy: "\n")
        
        let bagSolver = TwentyTwenty.Day7()
        let count = bagSolver.solve(input: array)
        XCTAssertEqual(count.0, 4)
    }
    
    
    func test_day7_part1() {
        measure{
            let input = Input.getInputStringNoTrim(name: "Day72020")
            
            let array = input.components(separatedBy: "\n")
            
            let bagSolver = TwentyTwenty.Day7()
            let count = bagSolver.solve(input: array)
            XCTAssertEqual(count.0, 370)
        }
    }
    
    func test_day7_example2() {
        let input = Input.getInputString(name: "Day72020_Example2")
        let array = input.components(separatedBy: "\n")
        
        let bagSolver = TwentyTwenty.Day7()
        let count = bagSolver.solve(input: array)
        XCTAssertEqual(count.1, 126)
    }
    
    func test_day7_part2() {
        let input = Input.getInputString(name: "Day72020")
        let array = input.components(separatedBy: "\n")
        
        let bagSolver = TwentyTwenty.Day7()
        let count = bagSolver.solve(input: array)
        XCTAssertEqual(count.1, 29547)
    }
}
