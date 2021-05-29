//
//  TestCallVectorInt.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns the received vector of numbers; for testing only. This is an offline method. Can be called before authorization
internal struct TestCallVectorInt: Codable {
    /// Vector of numbers to return
    internal let x: [Int]

    internal init(x: [Int]) {
        self.x = x
    }
}
