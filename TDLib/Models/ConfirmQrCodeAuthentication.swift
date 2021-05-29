//
//  ConfirmQrCodeAuthentication.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Confirms QR code authentication on another device. Returns created session on success
internal struct ConfirmQrCodeAuthentication: Codable {
    /// A link from a QR code. The link must be scanned by the in-app camera
    internal let link: String

    internal init(link: String) {
        self.link = link
    }
}
