//
//  Day2.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 02/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

struct Day2 {
    static func calculate(list: [Int]) -> [Int] {
        
        var result = list
        
        for n in stride(from: 0, through: result.count, by: 4) {
            
            let operatorValue = result[n]
            guard operatorValue != 99 else { break }
            
            let first = result[n+1]
            let second = result[n+2]
            let resultAddress = result[n+3]
            
            
            switch operatorValue {
            case 1:
                result[resultAddress] = result[first] + result[second]
            case 2:
                result[resultAddress] = result[first] * result[second]
            default:
                fatalError("Avast, something doesn't sit well here")
            }
        }
        
        return result
    }

}
