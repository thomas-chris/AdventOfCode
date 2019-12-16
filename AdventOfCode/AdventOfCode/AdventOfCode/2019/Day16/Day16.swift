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
        
        
        for j in 0..<loops {
            var newList = [Int]()
            for i in 1...list.count {
                var pattern = generatePattern(for: basePattern.repeatValues(by: i), input: list)
                    .dropFirst()
                
                let bitsToDrop = pattern.count - list.count
                
                pattern = pattern.dropLast(bitsToDrop)
                
                var total  = 0
                pattern.enumerated().forEach { (index, value) in
                    total += value * list[index]
                }
                newList.append(abs(total) % 10)
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
        
        var list = baseInput.repeated(count: 10000)
        
        
        for j in 0..<loops {
            var newList = [Int]()
            for i in 1...list.count {
                var pattern = generatePattern(for: basePattern.repeatValues(by: i), input: list)
                    .dropFirst()
                
                let bitsToDrop = pattern.count - list.count
                
                pattern = pattern.dropLast(bitsToDrop)
                
                var total  = 0
                pattern.enumerated().forEach { (index, value) in
                    total += value * list[index]
                }
                newList.append(abs(total) % 10)
            }
            list = newList
            print(j)
        }
        
        var string = ""
        list.forEach {
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
        var newArray = [Element]()
        self.forEach { value in
            for i in 0..<by {
                newArray.append(value)
            }
        }
        return newArray
    }
    
    init(repeating: [Element], count: Int) {
        self.init([[Element]](repeating: repeating, count: count).flatMap{$0})
    }
    
    func repeated(count: Int) -> [Element] {
        return [Element](repeating: self, count: count)
    }
}
