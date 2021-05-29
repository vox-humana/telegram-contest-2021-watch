//
//  PassportSuitableElement.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about a Telegram Passport element that was requested by a service
internal struct PassportSuitableElement: Codable {
    /// True, if personal details must include the user's name in the language of their country of residence
    internal let isNativeNameRequired: Bool

    /// True, if a selfie is required with the identity document
    internal let isSelfieRequired: Bool

    /// True, if a certified English translation is required with the document
    internal let isTranslationRequired: Bool

    /// Type of the element
    internal let type: PassportElementType

    internal init(
        isNativeNameRequired: Bool,
        isSelfieRequired: Bool,
        isTranslationRequired: Bool,
        type: PassportElementType
    ) {
        self.isNativeNameRequired = isNativeNameRequired
        self.isSelfieRequired = isSelfieRequired
        self.isTranslationRequired = isTranslationRequired
        self.type = type
    }
}
