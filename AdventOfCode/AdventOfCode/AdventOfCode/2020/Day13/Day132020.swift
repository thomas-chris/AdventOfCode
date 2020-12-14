import Foundation
import Algorithms

extension TwentyTwenty {
    public class Day13 {
        public init() {}
    }
    
}

extension TwentyTwenty.Day13 {
    public func solvePart1(input: [String]) -> Int {
        
        let time = Int(input.first!)!
        
        let buses = input.last!.components(separatedBy: ",").compactMap { character in
            return Int(character)
        }
        
        var busAndTimes: [Int: Int] = [:]
        buses.forEach { bus in
            let mod = time % bus
            busAndTimes[bus] = (time - mod + bus)
        }
        
        var minKey = Int.max
        var minValue = Int.max
        busAndTimes.forEach { key, value in
            if value < minValue {
                minKey = key
                minValue = value
            }
        }
        
        return (minKey * (minValue - time))
    }
    
    public func solvePart2(input: [String]) -> Int {
        var buses: [(difference: Int, bus: Int)] = []
        var loop = 0
        
        input.last!.components(separatedBy: ",").forEach { character in
            if let value = Int(character) {
                buses.append((difference: loop, bus:value))
            }
            loop += 1
        }
       
        var departTime = 1
        
        var strideBy = 1
        for (difference, bus) in buses {
            
            // create a list of things to evaluate - as you add more numbers, the list shrinks (first is over all time... )
            let strides = stride(from: departTime, to: .max, by: strideBy)
            
            // first time where is multiple of bus - so don't evaluate eveything
            departTime = strides
                .first(where: { time in (time + difference).isMultiple(of: bus) })!
            
            // this pattern repeats every previous pattern * bus, so becomes the new value to stride by
            strideBy *= bus
        }
       
        return departTime
    }
}

extension TwentyTwenty.Day13 {
    
    public func solvePart2crt(input: [String]) -> Int {
        var buses: [Int] = []
        var variance: [Int] = []
        
        var loop = 0
        
        input.last!.components(separatedBy: ",").forEach { character in
            if let value = Int(character) {
                buses.append(value)
                variance.append(loop)
            }
            loop += 1
        }
        
        return chineseRemainderTheorm(variance, buses)
    }
    
    func extendedEuclidianAlgo(_ value1: Int, _ value2: Int) -> (r: Int, s:Int) {
        if value1 % value2 == 0 {
            return (0,1)
        } else {
            let result = extendedEuclidianAlgo(value2 % value1, value1)
            let multipleOfValue1 = result.1 - result.0 * (value2 / value1)
            let multipleOfValue2 = result.0
     
            return (multipleOfValue1,multipleOfValue2)
        }
    }
    
    func greatestCommonDivisor(_ value1: Int, _ value2: Int) -> Int {
        let remainder = value1 % value2
          if remainder != 0 {
            return greatestCommonDivisor(value2, remainder)
          } else {
            return value2
          }
    }
    
    func chineseRemainderTheorm(_ list1: [Int], _ list2: [Int]) -> Int {
        let N = list2.reduce(1, *)
        
        var s:[Int] = []
        
        list2.forEach {
            s.append(extendedEuclidianAlgo($0, N /  $0).1)
        }
        
        var x = 0
        
        list1.enumerated().forEach {
            x += $0.1 * s[$0.0] * N / list2[$0.0]
        }
        
        return x % N
    }
}
