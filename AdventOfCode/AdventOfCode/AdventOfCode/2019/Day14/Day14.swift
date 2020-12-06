//
//  Day14.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 14/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

public class Day14 {
    
    let chemicalsDictionary: [String: Chemical]
    var unusedChemicals = [String: Int]()
    
    public init(input: [String: Chemical]) {
        self.chemicalsDictionary = input
    }
    
    public func part1(fuel: Int) -> (Int, [String: Int]) {
        var consumedOre = 0
        var chemicalsToProcess: [(id: String, quantity: Int)] = [("FUEL", fuel)]
        
        repeat {
            let chemicalToProcess = chemicalsToProcess.removeFirst()
            if chemicalToProcess.id == "ORE" {
                consumedOre += chemicalToProcess.quantity
            } else {
                var spareChems = unusedChemicals[chemicalToProcess.id] ?? 0
                spareChems -= chemicalToProcess.quantity
                while spareChems < 0 {
                    let chemToProcess = chemicalsDictionary[chemicalToProcess.id]!
                    chemicalsToProcess += chemToProcess.recipe
                    spareChems += chemToProcess.quantity
                }
                unusedChemicals[chemicalToProcess.id] = spareChems
            }
        } while chemicalsToProcess.isEmpty == false

        return (consumedOre, unusedChemicals)
    }
    
    public func part2(ore: Int) -> Int {
        let anAmount = 1672135
        let _ = part1(fuel: 1)
        var unusedChemicals2 = [String: Int]()
        unusedChemicals.forEach { (key, value) in
            let newValue = value * anAmount
            unusedChemicals2[key] = newValue
        }
        
        unusedChemicals = unusedChemicals2
    
        var totalOre = ore - 999979339800
        var totalFuel = 1672100
        var lastOreUsage = 0
        while (lastOreUsage <= totalOre) {
            let result = part1(fuel: 1)
            totalOre -= result.0
            lastOreUsage = result.0
            totalFuel += 1
        }
        
        return totalFuel
    }
}

