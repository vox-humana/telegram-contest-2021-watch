//
//  TestVectorStringObject.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// A simple object containing a vector of objects that hold a string; for testing only
internal struct TestVectorStringObject: Codable {
    /// Vector of objects
    internal let value: [TestString]

    internal init(value: [TestString]) {
        self.value = value
    }
}
