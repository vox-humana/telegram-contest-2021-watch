//
//  EditMessageLiveLocation.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Edits the message content of a live location. Messages can be edited for a limited period of time specified in the live location. Returns the edited message after the edit is completed on the server side
internal struct EditMessageLiveLocation: Codable {
    /// The chat the message belongs to
    internal let chatId: Int64

    /// The new direction in which the location moves, in degrees; 1-360. Pass 0 if unknown
    internal let heading: Int

    /// New location content of the message; may be null. Pass null to stop sharing the live location
    internal let location: Location?

    /// Identifier of the message
    internal let messageId: Int64

    /// The new maximum distance for proximity alerts, in meters (0-100000). Pass 0 if the notification is disabled
    internal let proximityAlertRadius: Int

    /// The new message reply markup; for bots only
    internal let replyMarkup: ReplyMarkup

    internal init(
        chatId: Int64,
        heading: Int,
        location: Location?,
        messageId: Int64,
        proximityAlertRadius: Int,
        replyMarkup: ReplyMarkup
    ) {
        self.chatId = chatId
        self.heading = heading
        self.location = location
        self.messageId = messageId
        self.proximityAlertRadius = proximityAlertRadius
        self.replyMarkup = replyMarkup
    }
}
