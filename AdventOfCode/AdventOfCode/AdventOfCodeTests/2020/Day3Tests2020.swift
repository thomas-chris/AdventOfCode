import XCTest
import AdventOfCode

class Advent2020TestsDay3: XCTestCase {

    func test_day3_example1() {
        let input = Input.getInputString(name: "Day32020_Example1")
        let treeCalculator = TwentyTwenty.Day3(input)
        
        let data = treeCalculator.getMapAndHeight(from: input)
        let numberOfTrees = treeCalculator.countTreesInPath(describedBy: (right: 3, down: 1), for: data.forest, with: data.height, and: data.width)
        
        XCTAssertEqual(numberOfTrees, 7)
    }

    func test_day3_part1() {
        let input = Input.getInputString(name: "Day32020")
        let treeCalculator = TwentyTwenty.Day3(input)
        
        let data = treeCalculator.getMapAndHeight(from: input)
        let numberOfTrees = treeCalculator.countTreesInPath(describedBy: (right: 3, down: 1), for: data.forest, with: data.height, and: data.width)
        
        XCTAssertEqual(numberOfTrees, 270)
    }

    func test_day3_example2() {
        let input = Input.getInputString(name: "Day32020_Example1")
        let treeCalculator = TwentyTwenty.Day3(input)
        
        let data = treeCalculator.getMapAndHeight(from: input)
        let part1 =
            treeCalculator.countTreesInPath(describedBy: (right: 3, down: 1), for: data.forest, with: data.height, and: data.width)
        let part2 = treeCalculator.countTreesInPath(describedBy: (right: 1, down: 1), for: data.forest, with: data.height, and: data.width)
        let part3 = treeCalculator.countTreesInPath(describedBy: (right: 5, down: 1), for: data.forest, with: data.height, and: data.width)

        let part4 = treeCalculator.countTreesInPath(describedBy: (right: 7, down: 1), for: data.forest, with: data.height, and: data.width)
        
        let part5 = treeCalculator.countTreesInPath(describedBy: (right: 1, down: 2), for: data.forest, with: data.height, and: data.width)
        
        let answer = part1 * part2 * part3 * part4 * part5
        XCTAssertEqual(answer, 336)
    }

    func test_day3_part2() {
        let input = Input.getInputString(name: "Day32020")
        let treeCalculator = TwentyTwenty.Day3(input)
        
        let data = treeCalculator.getMapAndHeight(from: input)
        let answer = treeCalculator.countTreesInPath(describedBy: (right: 3, down: 1), for: data.forest, with: data.height, and: data.width) * treeCalculator.countTreesInPath(describedBy: (right: 1, down: 1), for: data.forest, with: data.height, and: data.width) *
            treeCalculator.countTreesInPath(describedBy: (right: 5, down: 1), for: data.forest, with: data.height, and: data.width) *
            treeCalculator.countTreesInPath(describedBy: (right: 7, down: 1), for: data.forest, with: data.height, and: data.width) *
            treeCalculator.countTreesInPath(describedBy: (right: 1, down: 2), for: data.forest, with: data.height, and: data.width)
        
        XCTAssertEqual(answer, 2122848000)
    }
}
