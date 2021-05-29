//
//  SharePhoneNumber.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Shares the phone number of the current user with a mutual contact. Supposed to be called when the user clicks on chatActionBarSharePhoneNumber
internal struct SharePhoneNumber: Codable {
    /// Identifier of the user with whom to share the phone number. The user must be a mutual contact
    internal let userId: Int

    internal init(userId: Int) {
        self.userId = userId
    }
}
