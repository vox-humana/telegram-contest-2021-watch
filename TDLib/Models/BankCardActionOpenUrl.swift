//
//  BankCardActionOpenUrl.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes an action associated with a bank card number
internal struct BankCardActionOpenUrl: Codable {
    /// Action text
    internal let text: String

    /// The URL to be opened
    internal let url: String

    internal init(
        text: String,
        url: String
    ) {
        self.text = text
        self.url = url
    }
}
