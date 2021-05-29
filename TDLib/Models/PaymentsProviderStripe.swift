//
//  PaymentsProviderStripe.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Stripe payment provider
internal struct PaymentsProviderStripe: Codable {
    /// True, if the cardholder name must be provided
    internal let needCardholderName: Bool

    /// True, if the user country must be provided
    internal let needCountry: Bool

    /// True, if the user ZIP/postal code must be provided
    internal let needPostalCode: Bool

    /// Stripe API publishable key
    internal let publishableKey: String

    internal init(
        needCardholderName: Bool,
        needCountry: Bool,
        needPostalCode: Bool,
        publishableKey: String
    ) {
        self.needCardholderName = needCardholderName
        self.needCountry = needCountry
        self.needPostalCode = needPostalCode
        self.publishableKey = publishableKey
    }
}
