//
//  AcceptTermsOfService.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Accepts Telegram terms of services
internal struct AcceptTermsOfService: Codable {
    /// Terms of service identifier
    internal let termsOfServiceId: String

    internal init(termsOfServiceId: String) {
        self.termsOfServiceId = termsOfServiceId
    }
}
