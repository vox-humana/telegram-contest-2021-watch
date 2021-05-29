//
//  TermsOfService.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains Telegram terms of service
internal struct TermsOfService: Codable {
    /// The minimum age of a user to be able to accept the terms; 0 if any
    internal let minUserAge: Int

    /// True, if a blocking popup with terms of service must be shown to the user
    internal let showPopup: Bool

    /// Text of the terms of service
    internal let text: FormattedText

    internal init(
        minUserAge: Int,
        showPopup: Bool,
        text: FormattedText
    ) {
        self.minUserAge = minUserAge
        self.showPopup = showPopup
        self.text = text
    }
}
