//
//  NotificationType.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains detailed information about a notification
internal enum NotificationType: Codable {
    /// New message was received
    case notificationTypeNewMessage(NotificationTypeNewMessage)

    /// New secret chat was created
    case notificationTypeNewSecretChat

    /// New call was received
    case notificationTypeNewCall(NotificationTypeNewCall)

    /// New message was received through a push notification
    case notificationTypeNewPushMessage(NotificationTypeNewPushMessage)

    private enum Kind: String, Codable {
        case notificationTypeNewMessage
        case notificationTypeNewSecretChat
        case notificationTypeNewCall
        case notificationTypeNewPushMessage
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .notificationTypeNewMessage:
            let value = try NotificationTypeNewMessage(from: decoder)
            self = .notificationTypeNewMessage(value)
        case .notificationTypeNewSecretChat:
            self = .notificationTypeNewSecretChat
        case .notificationTypeNewCall:
            let value = try NotificationTypeNewCall(from: decoder)
            self = .notificationTypeNewCall(value)
        case .notificationTypeNewPushMessage:
            let value = try NotificationTypeNewPushMessage(from: decoder)
            self = .notificationTypeNewPushMessage(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .notificationTypeNewMessage(value):
            try container.encode(Kind.notificationTypeNewMessage, forKey: .type)
            try value.encode(to: encoder)
        case .notificationTypeNewSecretChat:
            try container.encode(Kind.notificationTypeNewSecretChat, forKey: .type)
        case let .notificationTypeNewCall(value):
            try container.encode(Kind.notificationTypeNewCall, forKey: .type)
            try value.encode(to: encoder)
        case let .notificationTypeNewPushMessage(value):
            try container.encode(Kind.notificationTypeNewPushMessage, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// New message was received
internal struct NotificationTypeNewMessage: Codable {
    /// The message
    internal let message: Message

    internal init(message: Message) {
        self.message = message
    }
}

/// New call was received
internal struct NotificationTypeNewCall: Codable {
    /// Call identifier
    internal let callId: Int

    internal init(callId: Int) {
        self.callId = callId
    }
}

/// New message was received through a push notification
internal struct NotificationTypeNewPushMessage: Codable {
    /// Push message content
    internal let content: PushMessageContent

    /// True, if the message is outgoing
    internal let isOutgoing: Bool

    /// The message identifier. The message will not be available in the chat history, but the ID can be used in viewMessages, or as reply_to_message_id
    internal let messageId: Int64

    /// The sender of the message. Corresponding user or chat may be inaccessible
    internal let sender: MessageSender

    /// Name of the sender
    internal let senderName: String

    internal init(
        content: PushMessageContent,
        isOutgoing: Bool,
        messageId: Int64,
        sender: MessageSender,
        senderName: String
    ) {
        self.content = content
        self.isOutgoing = isOutgoing
        self.messageId = messageId
        self.sender = sender
        self.senderName = senderName
    }
}
