//
//  Collection+Extensions.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 03/12/2021.
//  Copyright © 2021 Chris Thomas. All rights reserved.
//

import Foundation

extension Collection where Self.Iterator.Element: RandomAccessCollection {
    // PRECONDITION: `self` must be rectangular, i.e. every row has equal size.
    func transposed() -> [[Self.Iterator.Element.Iterator.Element]] {
        guard let firstRow = self.first else { return [] }
        return firstRow.indices.map { index in
            self.map{ $0[index] }
        }
    }
}
