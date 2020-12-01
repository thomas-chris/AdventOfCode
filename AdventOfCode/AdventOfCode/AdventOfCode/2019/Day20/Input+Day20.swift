//
//  Created by Chris Thomas on 18/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

extension Input {
    public static func day20(file: String) -> String {
        let data = Input.getInput(name: file)
        return String(decoding: data, as: UTF8.self)
    }
}
