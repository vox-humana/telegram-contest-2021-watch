//
//  CustomRequestResult.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains the result of a custom request
internal struct CustomRequestResult: Codable {
    /// A JSON-serialized result
    internal let result: String

    internal init(result: String) {
        self.result = result
    }
}
