//
//  AddContact.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Adds a user to the contact list or edits an existing contact by their user identifier
internal struct AddContact: Codable {
    /// The contact to add or edit; phone number can be empty and needs to be specified only if known, vCard is ignored
    internal let contact: Contact

    /// True, if the new contact needs to be allowed to see current user's phone number. A corresponding rule to userPrivacySettingShowPhoneNumber will be added if needed. Use the field UserFullInfo.need_phone_number_privacy_exception to check whether the current user needs to be asked to share their phone number
    internal let sharePhoneNumber: Bool

    internal init(
        contact: Contact,
        sharePhoneNumber: Bool
    ) {
        self.contact = contact
        self.sharePhoneNumber = sharePhoneNumber
    }
}
