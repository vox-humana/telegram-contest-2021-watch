//
//  PassportRequiredElement.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a description of the required Telegram Passport element that was requested by a service
internal struct PassportRequiredElement: Codable {
    /// List of Telegram Passport elements any of which is enough to provide
    internal let suitableElements: [PassportSuitableElement]

    internal init(suitableElements: [PassportSuitableElement]) {
        self.suitableElements = suitableElements
    }
}
