import Foundation

extension TwentyTwenty {
    public class Day4 {
        public init() {}
    }
    
    public struct Passport {
        let byr: String
        let iyr: String
        let eyr: String
        let hgt: String
        let hcl: String
        let ecl: String
        let pid: String
        let cid: String?
        
        public init?(byr: String?, iyr: String?, eyr: String?, hgt: String?, hcl: String?, ecl: String?, pid: String?, cid: String?) {
            guard let byr = byr, let iyr = iyr, let eyr = eyr, let hgt = hgt, let hcl = hcl, let ecl = ecl, let pid = pid else {
                return nil
            }
            
            self.byr = byr
            self.iyr = iyr
            self.eyr = eyr
            self.hgt = hgt
            self.hcl = hcl
            self.ecl = ecl
            self.pid = pid
            self.cid = cid
        }
        
        public func validate() -> Passport? {
            func verifyHGT(_ hgt: String) -> String? {
                let range = NSRange(location: 0, length: hgt.utf16.count)
                let regex = try! NSRegularExpression(pattern: "(1[5-8][0-9]|19[0-3])[c][m]|(59|6[0-9]|7[0-6])[i][n]")
                guard let _ = regex.firstMatch(in: hgt, options: [], range: range) else {
                    return nil
                }
                return hgt
            }
            
            func verifyHCL(_ hcl: String) -> String? {
                let range = NSRange(location: 0, length: hcl.utf16.count)
                let regex = try! NSRegularExpression(pattern: "[#][0-9,a-f]{1,6}")
                guard let _ = regex.firstMatch(in: hcl, options: [], range: range) else {
                    return nil
                }
                return hgt
            }
            
            func verifyPID(_ hcl: String) -> String? {
                let range = NSRange(location: 0, length: hcl.utf16.count)
                let regex = try! NSRegularExpression(pattern: "^[0-9]{9}")
                guard let _ = regex.firstMatch(in: hcl, options: [], range: range) else {
                    return nil
                }
                return hgt
            }
            
            guard let byr1 = Int(self.byr),
                  byr1 >= 1920 && byr1 <= 2002,
                  let iyr1 = Int(self.iyr),
                  iyr1 >= 2010 && iyr1 <= 2020,
                  let eyr1 = Int(self.eyr),
                  eyr1 >= 2020 && eyr1 <= 2030,
                  let hgt1 = verifyHGT(self.hgt),
                  let hcl1 = verifyHCL(self.hcl),
                  let ecl1 = EyeColour(rawValue: self.ecl),
                  let pid1 = verifyPID(self.pid) else {
                return nil
            }
            
            return Passport(byr: String(byr1), iyr: String(iyr1), eyr: String(eyr1), hgt: hgt1, hcl: hcl1, ecl: ecl1.rawValue, pid: pid1, cid: self.cid)
        }
    }
    
    public enum PassportKey: String {
        case byr
        case iyr
        case eyr
        case hgt
        case hcl
        case ecl
        case pid
        case cid
    }
    
    public enum EyeColour: String {
        case amb
        case blu
        case brn
        case gry
        case grn
        case hzl
        case oth
    }
}

extension TwentyTwenty.Day4 {
    
    public func createPassports(_ input: String) -> ([TwentyTwenty.Passport], Int) {
        let components = input.components(separatedBy: "\n")
        var passports: [TwentyTwenty.Passport] = []
        var validPassports = 0
        var passportToProcess = ""
        var tryCreatePassport = false
        components.forEach { line in
            if line.count > 0 {
                passportToProcess += (line + " ")
                
            } else {
                tryCreatePassport = true
            }
            
            if tryCreatePassport {
                let keyFields = passportToProcess.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ")
                var passportValuesDictionary: [TwentyTwenty.PassportKey: String] = [:]
                keyFields.forEach { pair in
                    let keyValue = pair.components(separatedBy: ":")
                    guard let key = TwentyTwenty.PassportKey(rawValue: keyValue[0]) else {
                        return
                    }
                    passportValuesDictionary[key] = keyValue[1]
                }
                
                if let passport = TwentyTwenty.Passport(byr: passportValuesDictionary[.byr],
                                                        iyr: passportValuesDictionary[.iyr],
                                                        eyr: passportValuesDictionary[.eyr],
                                                        hgt: passportValuesDictionary[.hgt],
                                                        hcl: passportValuesDictionary[.hcl],
                                                        ecl: passportValuesDictionary[.ecl],
                                                        pid: passportValuesDictionary[.pid],
                                                        cid: passportValuesDictionary[.cid]) {
                    passports.append(passport)
                    if let _ = passport.validate() {
                        validPassports += 1
                    }
                }
                
                passportToProcess = ""
                tryCreatePassport = false
            }
        }
        
        return (passports, validPassports)
    }
    
    public func validatePassports(_ passports: [TwentyTwenty.Passport]) -> Int {
        var validPassports = 0
        
        passports.forEach { passport in
            guard let _ = passport.validate() else {
                return
            }
            validPassports += 1
        }
        
        return validPassports
    }
}
