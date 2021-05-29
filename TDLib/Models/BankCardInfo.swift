//
//  BankCardInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Information about a bank card
internal struct BankCardInfo: Codable {
    /// Actions that can be done with the bank card number
    internal let actions: [BankCardActionOpenUrl]

    /// Title of the bank card description
    internal let title: String

    internal init(
        actions: [BankCardActionOpenUrl],
        title: String
    ) {
        self.actions = actions
        self.title = title
    }
}
