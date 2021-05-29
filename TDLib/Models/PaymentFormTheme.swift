//
//  PaymentFormTheme.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Theme colors for a payment form
internal struct PaymentFormTheme: Codable {
    /// A color of the payment form background in the RGB24 format
    internal let backgroundColor: Int

    /// A color of thebuttons in the RGB24 format
    internal let buttonColor: Int

    /// A color of text on the buttons in the RGB24 format
    internal let buttonTextColor: Int

    /// A color of hints in the RGB24 format
    internal let hintColor: Int

    /// A color of links in the RGB24 format
    internal let linkColor: Int

    /// A color of text in the RGB24 format
    internal let textColor: Int

    internal init(
        backgroundColor: Int,
        buttonColor: Int,
        buttonTextColor: Int,
        hintColor: Int,
        linkColor: Int,
        textColor: Int
    ) {
        self.backgroundColor = backgroundColor
        self.buttonColor = buttonColor
        self.buttonTextColor = buttonTextColor
        self.hintColor = hintColor
        self.linkColor = linkColor
        self.textColor = textColor
    }
}
