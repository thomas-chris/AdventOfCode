import Foundation

public extension Input {
    static func day2Input_2020(name: String) -> [Password: PasswordPolicy] {
        let data = Input.getInput(name: name)
        let string = String(decoding: data, as: UTF8.self)
        let array = string.components(separatedBy: "\n")
        var dictionary: [Password: PasswordPolicy] = [:]
        array.forEach { line in
            
            guard line.count > 0 else {
                return
            }
            
            let passwordAndPolicy = line.components(separatedBy: ":")
            let policyValues = passwordAndPolicy[0].trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ")
            let minMax = policyValues[0].trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: "-")
            
            guard let min = Int(minMax[0]), let max = Int(minMax[1]) else {
                print(minMax)
                fatalError("Failure to get input")
            }
            dictionary[Password(password: passwordAndPolicy[1].trimmingCharacters(in: .whitespacesAndNewlines), uuid: UUID())] = PasswordPolicy(min: min, max: max, character: Character(policyValues[1].trimmingCharacters(in: .whitespacesAndNewlines)))
            
        }
        return dictionary
    }
}
