//
//  TestReturnError.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns the specified error and ensures that the Error object is used; for testing only. Can be called synchronously
internal struct TestReturnError: Codable {
    /// The error to be returned
    internal let error: Error

    internal init(error: Error) {
        self.error = error
    }
}
