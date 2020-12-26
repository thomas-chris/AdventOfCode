import Foundation

public struct Chemical {
    let id: String
    let recipe: [(id: String, quantity: Int)]
    let quantity: Int
}

public extension Input {
    static func day14(file: String) -> [String: Chemical] {
        let data = Input.getInput(name: file)
        let string = String(decoding: data, as: UTF8.self)
        let array = string.components(separatedBy: "\n").dropLast()
        var result: [String: Chemical] = [:]
        
        array.forEach { string in
            let sides = String(string).components(separatedBy: "=>")
            .map { String($0.trimmingCharacters(in: .whitespacesAndNewlines))}
            
            let RHS = sides[1].components(separatedBy: " ")
            let chemicalId = RHS[1]
            let quantity = Int(RHS[0])!
            let LHS = sides[0].components(separatedBy: ",").map { $0.trimmingCharacters(in: .whitespacesAndNewlines)}
            
            var formula = [(id: String, quantity: Int)]()
            LHS.forEach { value in
                let pair = value.components(separatedBy: " ")
                formula.append((id: pair[1], quantity: Int(pair[0])!))
            }
            
            result[chemicalId] =  Chemical(id: chemicalId, recipe: formula, quantity: quantity)
        }
         return result
    }
    
}
