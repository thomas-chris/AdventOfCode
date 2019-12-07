//
//  Day7.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 07/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

struct Day7 {
    
    let list: [Int]
    
    init(list: [Int]) {
        self.list = list
    }
    
    func part1() -> Int {
        let allCombinations = generateSignalOptions(for: [0,1,2,3,4])
        var result = 0
        
        allCombinations.forEach { combination in
            var output = 0
            combination.forEach { value in
                output = Day5.calculate(list: list, inputs: [value, output])

            }
            result = max(result, output)
        }
        return result
    }
    
    func part2() -> Int {
        let allCombinations = generateSignalOptions(for: [5,6,7,8,9])
        var result = 0
        
        [[9,8,7,6,5]].forEach { combination in
            var output = (0, list)
            var dictionary: [Int : [Int]] = [
                0: list,
                1: list,
                2: list,
                3: list,
                4: list
            ]
            combination.enumerated().forEach { (index, value) in
                output = Day5.calculateForFeedback(list: dictionary[index]!, inputs: [value, output.0], output: output.0)
                dictionary[index] = output.1

            }
            result = max(result, output.0)
        }
        return result
    }
    
    func generateSignalOptions(for array: [Int]) -> [[Int]] {
        let totalNumberOfChoices = 120
        let combinations = array.allPermutations()
        guard totalNumberOfChoices == combinations.count else {
            fatalError()
        }
        return combinations
    }
}


// This was super hard to do so looked for help here
// https://stackoverflow.com/questions/30586711/order-array-of-objects-into-every-possible-sequence-in-swift


extension Array {
    private var decompose : (head: Element, tail: [Element])? {
        return (count > 0) ? (self[0], Array(self[1..<count])) : nil
    }
    
    private func between<T>(x: T, ys: [T]) -> [[T]] {
        if let (head, tail) = ys.decompose {
            return [[x] + ys] + between(x: x, ys: tail).map { [head] + $0 }
        } else {
            return [[x]]
        }
    }
    
    private func permutations<T>(xs: [T]) -> [[T]] {
        if let (head, tail) = xs.decompose {
            return permutations(xs: tail) >>= { permTail in
                self.between(x: head, ys: permTail)
            }
        } else {
            return [[]]
        }
    }
    
    func allPermutations() -> [[Element]] {
        return permutations(xs: self)
    }
}

infix operator >>=
func >>=<A, B>(xs: [A], f: (A) -> [B]) -> [B] {
    return xs.map(f).reduce([], +)
}

