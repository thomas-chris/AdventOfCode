//
//  Input.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 02/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

class InputBundle { }

public  struct Input {
    public let line: String
    
    public init(line: String) {
        self.line = line
    }
}

public extension Input {
    static func getInput(name: String) -> Data {
        let bundle = Bundle(for: InputBundle.self)

        guard let url = bundle.url(forResource: name, withExtension: "txt"),
            let data = try? Data(contentsOf: url) else {
                fatalError("Couldn't get the data")
        }
        
        return data
    }
    
    static func getInputString(name: String) -> String {
        let bundle = Bundle(for: InputBundle.self)

        guard let url = bundle.url(forResource: name, withExtension: "txt"),
              let string = try? String(contentsOf: url).trimmingCharacters(in: .whitespacesAndNewlines) else {
                fatalError("Couldn't get the data")
        }
        
        return string
    }
    
    static func getInputStringNoTrim(name: String) -> String {
        let bundle = Bundle(for: InputBundle.self)

        guard let url = bundle.url(forResource: name, withExtension: "txt"),
              let string = try? String(contentsOf: url) else {
                fatalError("Couldn't get the data")
        }
        
        return string
    }
}
