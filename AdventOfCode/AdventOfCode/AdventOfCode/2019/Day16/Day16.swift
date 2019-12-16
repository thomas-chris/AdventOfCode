//
//  Day16.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 16/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

public class Day16 {
    
    let baseInput: [Int]
    let basePattern = [0,1,0,-1]
    
    public init(input: [Int]) {
        self.baseInput = input
    }
    
    
    public func part1(loops: Int) -> String {
        
        var list = baseInput
        
        for _ in 0..<loops {
            let newList = list.enumerated().map { (index, value) -> Int in
                var pattern = generatePattern(for: basePattern.repeatValues(by: index + 1), input: list)
                    .dropFirst()
                
                let bitsToDrop = pattern.count - list.count
                
                pattern = pattern.dropLast(bitsToDrop)
                
                let total = pattern.enumerated().map { (index, value) in
                    value * list[index]
                }.reduce(0, +)
                
                return (abs(total) % 10)
            }
            list = newList
        }
        
        var string = ""
        list.forEach {
            string += String($0)
        }
        
        return string
    }
    
    public func part2(loops: Int) -> String {
        
        let list = baseInput.repeated(count: 10000)
        let drop = Int(baseInput.prefix(7).map { String($0) }.reduce("", +))!
                    
        var values = Array(list.dropFirst(drop))
        
        for _ in 0..<100 {
            let base = values.reduce(0, +)
            var subtracting = 0
//            var newArray = [Int]()
//            newArray.reserveCapacity(values.count)
            
            values = values.enumerated().map { index, value in
                let result = abs(base - subtracting) % 10
                subtracting += value
                return result
            }
             
            // THIS IS SUPER SLOW BECAUSE....
            
            /// dropFirst works by creating a list as output. You then needed to iterate over the sequence returned by the drop, and then creates an array - its this array creation that is the slow thing, as you loop over every return from dropFirst, to create a new array
            
            
            
//            while values.count > 0 {
//                newArray.append(abs(base) % 10)
//                let number = values.first!
//                base -= number
//                values = Array(values.dropFirst())
//            }
//
//
//
//            values = newArray
        }
        
        var string = ""
        values.forEach {
            string += String($0)
        }
        
        return string
    }
    
    
    
    func generatePattern(for pattern: [Int], input: [Int]) -> [Int] {
        let repeatValue = (input.count / basePattern.count) + 1
        return pattern.repeated(count: repeatValue)
    }
}

extension Array {
    func repeatValues(by: Int) -> Array {
        self.flatMap { Array(repeating: $0, count: by) }
    }
    
    init(repeating: [Element], count: Int) {
        self.init([[Element]](repeating: repeating, count: count).flatMap{$0})
    }
    
    func repeated(count: Int) -> [Element] {
        return [Element](repeating: self, count: count)
    }
}
