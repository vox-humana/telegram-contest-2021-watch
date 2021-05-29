//
//  TestCallVectorStringObject.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns the received vector of objects containing a string; for testing only. This is an offline method. Can be called before authorization
internal struct TestCallVectorStringObject: Codable {
    /// Vector of objects to return
    internal let x: [TestString]

    internal init(x: [TestString]) {
        self.x = x
    }
}
