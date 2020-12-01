import Foundation

public extension Input {
	static func array(seperator: String, file: String) -> [Double] {
		let data = Input.getInput(name: file)
		let string = String(decoding: data, as: UTF8.self)
		let array = string.components(separatedBy: seperator)
		return array.compactMap { Double($0) }
	}
}
