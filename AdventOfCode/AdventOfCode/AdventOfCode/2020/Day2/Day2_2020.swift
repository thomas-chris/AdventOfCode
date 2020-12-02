import Foundation

public func validSledPasswords(_ input: [Password: PasswordPolicy]) -> Int {
    
    var validPasswords = 0
    
    input.forEach { (password, policy) in
        let count = password.password.count(of: policy.character)
        print(count, policy.character, policy.min, policy.max)
        if count <= policy.max && count >= policy.min {
            validPasswords += 1
        }
        
    }
    
    return validPasswords
}

public func validPasswords(_ input: [Password: PasswordPolicy]) -> Int {
    
    var validPasswords = 0
    
    input.forEach { (password, policy) in
        let characterAtMin = password.password[policy.min-1..<policy.min]
        let characterAtMax = password.password[policy.max-1..<policy.max]
        print(characterAtMin, characterAtMax, policy.character)
        if ((characterAtMin == String(policy.character) && characterAtMax != String(policy.character))) ||
            (characterAtMin != String(policy.character) && characterAtMax == String(policy.character)) {
            validPasswords += 1
        }
    }
    
    return validPasswords
}
