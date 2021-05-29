//
//  TestCallString.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns the received string; for testing only. This is an offline method. Can be called before authorization
internal struct TestCallString: Codable {
    /// String to return
    internal let x: String

    internal init(x: String) {
        self.x = x
    }
}
