//
//  EditInlineMessageLiveLocation.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Edits the content of a live location in an inline message sent via a bot; for bots only
internal struct EditInlineMessageLiveLocation: Codable {
    /// The new direction in which the location moves, in degrees; 1-360. Pass 0 if unknown
    internal let heading: Int

    /// Inline message identifier
    internal let inlineMessageId: String

    /// New location content of the message; may be null. Pass null to stop sharing the live location
    internal let location: Location?

    /// The new maximum distance for proximity alerts, in meters (0-100000). Pass 0 if the notification is disabled
    internal let proximityAlertRadius: Int

    /// The new message reply markup
    internal let replyMarkup: ReplyMarkup

    internal init(
        heading: Int,
        inlineMessageId: String,
        location: Location?,
        proximityAlertRadius: Int,
        replyMarkup: ReplyMarkup
    ) {
        self.heading = heading
        self.inlineMessageId = inlineMessageId
        self.location = location
        self.proximityAlertRadius = proximityAlertRadius
        self.replyMarkup = replyMarkup
    }
}
