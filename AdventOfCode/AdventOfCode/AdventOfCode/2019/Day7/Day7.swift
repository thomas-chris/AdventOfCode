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
                let intCode = IntCode(list: list)
                intCode.calculate(inputs: [value, output])
                output = intCode.output.last!

            }
            result = max(result, output)
        }
        return result
    }
    
    func part2() -> Int {
        let allCombinations = generateSignalOptions(for: [5,6,7,8,9])
        var result = 0
        
        allCombinations.forEach { combination in
            
            // have a program per thruster
            let intCodeA = IntCode(list: list)
            let intCodeB = IntCode(list: list)
            let intCodeC = IntCode(list: list)
            let intCodeD = IntCode(list: list)
            let intCodeE = IntCode(list: list)
            
            var firstRun = true
            
            var count = 0
            while !intCodeE.finished {
                intCodeA.calculate(inputs: firstRun ? [combination[0], 0]: [intCodeE.output.last!])
                intCodeB.calculate(inputs: firstRun ? [combination[1], intCodeA.output.last!]: [intCodeA.output.last!])
                intCodeC.calculate(inputs: firstRun ? [combination[2], intCodeB.output.last!]: [intCodeB.output.last!])
                intCodeD.calculate(inputs: firstRun ? [combination[3], intCodeC.output.last!]: [intCodeC.output.last!])
                intCodeE.calculate(inputs: firstRun ? [combination[4], intCodeD.output.last!]: [intCodeD.output.last!])
                count += 1
                firstRun = false
            }
            
            result = max(result, intCodeE.output.last ?? 0)
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

