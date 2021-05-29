//
//  Invoice.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Product invoice
internal struct Invoice: Codable {
    /// ISO 4217 currency code
    internal let currency: String

    /// True, if the total price depends on the shipping method
    internal let isFlexible: Bool

    /// True, if the payment is a test payment
    internal let isTest: Bool

    /// The maximum allowed amount of tip in the smallest units of the currency
    internal let maxTipAmount: Int64

    /// True, if the user's email address is needed for payment
    internal let needEmailAddress: Bool

    /// True, if the user's name is needed for payment
    internal let needName: Bool

    /// True, if the user's phone number is needed for payment
    internal let needPhoneNumber: Bool

    /// True, if the user's shipping address is needed for payment
    internal let needShippingAddress: Bool

    /// A list of objects used to calculate the total price of the product
    internal let priceParts: [LabeledPricePart]

    /// True, if the user's email address will be sent to the provider
    internal let sendEmailAddressToProvider: Bool

    /// True, if the user's phone number will be sent to the provider
    internal let sendPhoneNumberToProvider: Bool

    /// Suggested amounts of tip in the smallest units of the currency
    internal let suggestedTipAmounts: [Int64]

    internal init(
        currency: String,
        isFlexible: Bool,
        isTest: Bool,
        maxTipAmount: Int64,
        needEmailAddress: Bool,
        needName: Bool,
        needPhoneNumber: Bool,
        needShippingAddress: Bool,
        priceParts: [LabeledPricePart],
        sendEmailAddressToProvider: Bool,
        sendPhoneNumberToProvider: Bool,
        suggestedTipAmounts: [Int64]
    ) {
        self.currency = currency
        self.isFlexible = isFlexible
        self.isTest = isTest
        self.maxTipAmount = maxTipAmount
        self.needEmailAddress = needEmailAddress
        self.needName = needName
        self.needPhoneNumber = needPhoneNumber
        self.needShippingAddress = needShippingAddress
        self.priceParts = priceParts
        self.sendEmailAddressToProvider = sendEmailAddressToProvider
        self.sendPhoneNumberToProvider = sendPhoneNumberToProvider
        self.suggestedTipAmounts = suggestedTipAmounts
    }
}
