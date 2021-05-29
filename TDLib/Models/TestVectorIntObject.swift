//
//  TestVectorIntObject.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// A simple object containing a vector of objects that hold a number; for testing only
internal struct TestVectorIntObject: Codable {
    /// Vector of objects
    internal let value: [TestInt]

    internal init(value: [TestInt]) {
        self.value = value
    }
}
