//
//  Input.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 02/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

class InputBundle { }

struct Input {
    let line: String
}

extension Input {
    static func getInput(name: String) -> Data {
        let bundle = Bundle(for: InputBundle.self)

        guard let url = bundle.url(forResource: name, withExtension: "txt"),
            let data = try? Data(contentsOf: url) else {
                fatalError("Couldn't get the data")
        }
        
        return data
    }
}
