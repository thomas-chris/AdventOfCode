import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG

extension TwentyFifteen {
    public struct Day4 {
        public init() {}
    }
}

extension TwentyFifteen.Day4 {
    public func solvePart1(input: String) -> Int {
        for i in 1...Int.max {
            let md5Data = MD5(string: "\(input)\(i)")
            let md5Hex =  md5Data.map { String(format: "%02hhx", $0) }.joined()
            if md5Hex.prefix(5) == "00000" {
                return i
            }
        }
        return 0
    }
    
    public func solvePart2(input: String) -> Int {
        for i in 282749...Int.max {
            let md5Data = MD5(string: "\(input)\(i)")
            let md5Hex =  md5Data.map { String(format: "%02hhx", $0) }.joined()
            if md5Hex.prefix(6) == "000000" {
                return i
            }
        }
        return 0
    }
    
    func MD5(string: String) -> Data {
            let length = Int(CC_MD5_DIGEST_LENGTH)
            let messageData = string.data(using:.utf8)!
            var digestData = Data(count: length)

            _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
                messageData.withUnsafeBytes { messageBytes -> UInt8 in
                    if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                        let messageLength = CC_LONG(messageData.count)
                        CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                    }
                    return 0
                }
            }
            return digestData
        }
}
