//
//  TestInt.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// A simple object containing a number; for testing only
internal struct TestInt: Codable {
    /// Number
    internal let value: Int

    internal init(value: Int) {
        self.value = value
    }
}
