import Algorithms
import Foundation
import UIKit

public struct Day24 {

    enum MonadValue {
        case inp(String)
        case add(String, String)
        case mul(String, String)
        case div(String, String)
        case mod(String, String)
        case eql(String, String)
    }

    public static func part1(_ input: [String]) -> Int {
        var monads = [[MonadValue]]()
        var monad = [MonadValue]()
        
        for row in input {
            let components = row.split(separator: " ").map { String($0) }
            switch components[0] {
            case "inp":
                if monad.count > 0 {
                    monads.append(monad)
                }
                monad = [.inp(components[1])]
            case "add":
                monad.append(.add(components[1], components[2]))
            case "mul":
                monad.append(.mul(components[1], components[2]))
            case "div":
                monad.append(.div(components[1], components[2]))
            case "mod":
                monad.append(.mod(components[1], components[2]))
            case "eql":
                monad.append(.eql(components[1], components[2]))
            default:
                fatalError()
            }
        }
        
        monads.append(monad)
        
        var params = [(Int, Int, Int)]()
        
        for monad in monads {
            let p1 = monad[4]
            let p2 = monad[5]
            let p3 = monad[15]
            
            switch (p1, p2, p3) {
            case (.div(_, let string), .add(_, let string2), .add(_, let string3)):
                params.append((Int(string)!, Int(string2)!, Int(string3)!))
            default:
                break
            }
        }

        var array = [String]()
        for (index, para) in params.enumerated() {
            if para.1 > 0 {
                array.append("\(index) + \(para.2)")
            } else {
                print("\(index) = \(array.popLast()) - \(para.2) \n")
            }
        }
        
        return 1
    }
    
    private static func solve(monad: [MonadValue], for input: String) throws -> Int {
        var w = 0
        var x = 0
        var y = 0
        var z = 0
        
        var intCount = 0
        
        for value in monad {
            switch value {
            case .inp(let string):
                switch string {
                case "w":
                    w = Int(input[intCount])!
                case "x":
                    x = Int(input[intCount])!
                case "y":
                    y = Int(input[intCount])!
                case "z":
                    z = Int(input[intCount])!
                default:
                    fatalError()
                }
            case .add(let string, let string2):
                var int = 0
                
                switch string2 {
                case "w":
                    int = w
                case "x":
                    int = x
                case "y":
                    int = y
                case "z":
                    int = z
                default:
                    int = Int(string2)!
                }
                
                switch string {
                case "w":
                    w = w + int
                case "x":
                    x = x + int
                case "y":
                    y = y + int
                case "z":
                    z = z + int
                default:
                    fatalError()
                }
            case .mul(let string, let string2):
                var int = 0
                
                switch string2 {
                case "w":
                    int = w
                case "x":
                    int = x
                case "y":
                    int = y
                case "z":
                    int = z
                default:
                    int = Int(string2)!
                }
                
                switch string {
                case "w":
                    w = w * int
                case "x":
                    x = x * int
                case "y":
                    y = y * int
                case "z":
                    z = z * int
                default:
                    fatalError()
                }
            case .div(let string, let string2):
                var int = 0
                
                switch string2 {
                case "w":
                    int = w
                case "x":
                    int = x
                case "y":
                    int = y
                case "z":
                    int = z
                default:
                    int = Int(string2)!
                }
                
                if int == 0 {
                    fatalError()
                }
                
                switch string {
                case "w":
                    w = w / int
                case "x":
                    x = x / int
                case "y":
                    y = y / int
                case "z":
                    z = z / int
                default:
                    fatalError()
                }
            case .mod(let string, let string2):
                var int = 0
                
                switch string2 {
                case "w":
                    int = w
                case "x":
                    int = x
                case "y":
                    int = y
                case "z":
                    int = z
                default:
                    int = Int(string2)!
                }
                
                if int <= 0 {
                    fatalError()
                }
                
                switch string {
                case "w":
                    if w < 0 { fatalError() }
                    w = w % int
                case "x":
                    if x < 0 { fatalError() }
                    x = x % int
                case "y":
                    if y < 0 { fatalError() }
                    y = y % int
                case "z":
                    if z < 0 { fatalError() }
                    z = z % int
                default:
                    fatalError()
                }
            case .eql(let string, let string2):
                var int = 0
                
                switch string2 {
                case "w":
                    int = w
                case "x":
                    int = x
                case "y":
                    int = y
                case "z":
                    int = z
                default:
                    int = Int(string2)!
                }
                
                switch string {
                case "w":
                    w = w == int ? 1 : 0
                case "x":
                    x = x == int  ? 1 : 0
                case "y":
                    y = y == int ? 1 : 0
                case "z":
                    z = z == int ? 1 : 0
                default:
                    fatalError()
                }
            }
        }
        
        return z
    }
    
    public static func part2(_ input: [String]) -> Int {
        return 1
    }
    
}
