//
//  PaymentResult.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains the result of a payment request
internal struct PaymentResult: Codable {
    /// True, if the payment request was successful; otherwise the verification_url will be not empty
    internal let success: Bool

    /// URL for additional payment credentials verification
    internal let verificationUrl: String

    internal init(
        success: Bool,
        verificationUrl: String
    ) {
        self.success = success
        self.verificationUrl = verificationUrl
    }
}
