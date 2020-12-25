import XCTest
import AdventOfCode

class Advent2015TestsDay5: XCTestCase {

    func test_day5_example() {
        let input = ["ugknbfddgicrmopn","aaa","jchzalrnumimnmhp", "haegwjzuvuyypxyu", "dvszwmarrgswjxmb"]
        
        let day5 = TwentyFifteen.Day5()
        let results = day5.solvePart1(input: input)
        XCTAssertEqual(results, 2)
    }
    func test_day5() {
        let input = Input.getInputString(name: "Day5_2015").components(separatedBy: "\n")
        
        let day5 = TwentyFifteen.Day5()
        let results = day5.solvePart1(input: input)
        XCTAssertEqual(results, 255)
    }
    
    func test_day5_example2() {
        let input = ["qjhvhtzxzqqjkmpb","xxyxx","uurcxstgmygtbstg", "ieodomkazucvgmuy"]
        
        let day5 = TwentyFifteen.Day5()
        let results = day5.solvePart2(input: input)
        XCTAssertEqual(results, 2)
    }
    
    func test_day5_part2() {
        let input = Input.getInputString(name: "Day5_2015").components(separatedBy: "\n")
        
        let day5 = TwentyFifteen.Day5()
        let results = day5.solvePart2(input: input)
        XCTAssertEqual(results, 55)
    }
}
