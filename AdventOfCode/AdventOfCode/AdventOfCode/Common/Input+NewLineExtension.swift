import Foundation

public extension Input {
    static func array<T>(seperator: String, file: String, compactmap: @escaping (String) -> T) -> [T] {
		let data = Input.getInput(name: file)
		let string = String(decoding: data, as: UTF8.self)
		let array = string.components(separatedBy: seperator)
		return array.compactMap { return compactmap($0) }
	}
}
