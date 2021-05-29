//
//  TestCallBytes.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns the received bytes; for testing only. This is an offline method. Can be called before authorization
internal struct TestCallBytes: Codable {
    /// Bytes to return
    internal let x: Data

    internal init(x: Data) {
        self.x = x
    }
}
