//
//  Error.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// An object of this type can be returned on every function call, in case of an error
internal struct Error: Codable, Swift.Error {
    /// Error code; subject to future changes. If the error code is 406, the error message must not be processed in any way and must not be displayed to the user
    internal let code: Int

    /// Error message; subject to future changes
    internal let message: String

    internal init(
        code: Int,
        message: String
    ) {
        self.code = code
        self.message = message
    }
}
