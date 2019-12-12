//
//  Day2.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 02/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

public struct Day2 {
    public static func calculate(list: [Int]) -> [Int] {
        
        var result = list
        
        for n in stride(from: 0, through: result.count, by: 4) {
            
            let operatorValue = result[n]
            let first = result[n+1]
            let second = result[n+2]
            let resultAddress = result[n+3]

            guard operatorValue != 99,
                first <= result.count,
                second <= result.count,
                resultAddress <= result.count,
                operatorValue <= result.count else { break }
            
            
            
            switch operatorValue {
            case 1:
                result[resultAddress] = result[first] + result[second]
            case 2:
                result[resultAddress] = result[first] * result[second]
            default:
                break
            }
        }
        
        return result
    }

   public static func getPair(list: [Int], pair: (noun: Int, verb: Int)) -> ([Int]) {
        let newList = changePair(list: list, pair: pair)
        return calculate(list: newList)
    }
    
    public static func changePair(list: [Int], pair: (noun: Int, verb: Int)) -> ([Int]) {
        var list = list
        list[1] = pair.noun
        list[2] = pair.verb
        return list
    }
    
    public static func reverseEngineerIt(result: Int, initialInput: [Int]) -> (noun: Int, verb: Int)? {
        
        if result == calculate(list: initialInput)[0] {
            return (noun: initialInput[1], verb: initialInput[2])
        }
        
        for i in 0...99 {
            for j in 0...99 {
                let total = calculate(list: getPair(list: initialInput, pair: (noun: i, verb: j)))[0]
                if total == result {
                    return (noun: i, verb: j)
                }
            }
        }
        
        return nil
    }
}

