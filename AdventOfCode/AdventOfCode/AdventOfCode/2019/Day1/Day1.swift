//
//  DayOne.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 02/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation


public func getFuel(from mass: Double) -> Double {

    let fuel = max(floor(mass / 3) - 2, 0)
    return fuel > 0 ? fuel : 0
}

public func recursiveFuelRequired(mass: Double, result: Double) -> Double {
    let fuel = getFuel(from: mass)
    var accumalatedFuel = result
    accumalatedFuel += fuel
    if fuel > 0 {
        return recursiveFuelRequired(mass: fuel, result: accumalatedFuel)
    }
    
    return accumalatedFuel
}

public struct Day1Answer {
    public static func getAnswer() -> Double {
        let moduleMasses = Input.day1Input()
        return moduleMasses.map {
            recursiveFuelRequired(mass: $0, result: 0)
        }.reduce(0, +)
    }
}
