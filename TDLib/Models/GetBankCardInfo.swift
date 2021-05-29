//
//  GetBankCardInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns information about a bank card
internal struct GetBankCardInfo: Codable {
    /// The bank card number
    internal let bankCardNumber: String

    internal init(bankCardNumber: String) {
        self.bankCardNumber = bankCardNumber
    }
}
