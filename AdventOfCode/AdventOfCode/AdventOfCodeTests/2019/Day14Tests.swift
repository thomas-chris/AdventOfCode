//
//  Day14Tests.swift
//  AdventOfCodeTests
//
import AdventOfCode
import XCTest

class Day14Tests: XCTestCase {
    func test_part1() throws {
        let input = Input.getInputString(name: "Day14").components(separatedBy: "\n")
        let recipes = parseMineralInput(input)
        let calculator = OreCalculator(recipes: recipes)
        let fuel = recipes.first { $0.ingredient.id == .fuel }!
        let ore = calculator.calculate(fuel.ingredient)
        XCTAssertEqual(598038, ore)
    }
    
    func test_part2() throws {
        let input = Input.getInputString(name: "Day14").components(separatedBy: "\n")
        let recipes = parseMineralInput(input)
        let calculator = OreCalculator(recipes: recipes)
        let fuel = recipes.first { $0.ingredient.id == .fuel }!
        let maxFuelProduced = calculator.calculateMaxFuel(fuel.ingredient, 1000000000000)
        XCTAssertEqual(2269325, maxFuelProduced)
    }
}
