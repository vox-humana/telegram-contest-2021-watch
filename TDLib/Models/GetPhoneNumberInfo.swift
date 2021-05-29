//
//  GetPhoneNumberInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns information about a phone number by its prefix. Can be called before authorization
internal struct GetPhoneNumberInfo: Codable {
    /// The phone number prefix
    internal let phoneNumberPrefix: String

    internal init(phoneNumberPrefix: String) {
        self.phoneNumberPrefix = phoneNumberPrefix
    }
}
