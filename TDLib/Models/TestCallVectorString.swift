//
//  TestCallVectorString.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns the received vector of strings; for testing only. This is an offline method. Can be called before authorization
internal struct TestCallVectorString: Codable {
    /// Vector of strings to return
    internal let x: [String]

    internal init(x: [String]) {
        self.x = x
    }
}
