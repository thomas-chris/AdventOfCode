//
//  Math.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 05/12/2021.
//  Copyright © 2021 Chris Thomas. All rights reserved.
//

import Foundation

public func gcd(_ m: Int, _ n: Int) -> Int {
  var a = 0
  var b = max(m, n)
  var r = min(m, n)

  while r != 0 {
    a = b
    b = r
    r = a % b
  }
  return b
}
