//
//  TestCallVectorIntObject.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns the received vector of objects containing a number; for testing only. This is an offline method. Can be called before authorization
internal struct TestCallVectorIntObject: Codable {
    /// Vector of objects to return
    internal let x: [TestInt]

    internal init(x: [TestInt]) {
        self.x = x
    }
}
