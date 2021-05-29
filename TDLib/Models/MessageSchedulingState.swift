//
//  MessageSchedulingState.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about the time when a scheduled message will be sent
internal enum MessageSchedulingState: Codable {
    /// The message will be sent at the specified date
    case messageSchedulingStateSendAtDate(MessageSchedulingStateSendAtDate)

    /// The message will be sent when the peer will be online. Applicable to private chats only and when the exact online status of the peer is known
    case messageSchedulingStateSendWhenOnline

    private enum Kind: String, Codable {
        case messageSchedulingStateSendAtDate
        case messageSchedulingStateSendWhenOnline
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .messageSchedulingStateSendAtDate:
            let value = try MessageSchedulingStateSendAtDate(from: decoder)
            self = .messageSchedulingStateSendAtDate(value)
        case .messageSchedulingStateSendWhenOnline:
            self = .messageSchedulingStateSendWhenOnline
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .messageSchedulingStateSendAtDate(value):
            try container.encode(Kind.messageSchedulingStateSendAtDate, forKey: .type)
            try value.encode(to: encoder)
        case .messageSchedulingStateSendWhenOnline:
            try container.encode(Kind.messageSchedulingStateSendWhenOnline, forKey: .type)
        }
    }
}

/// The message will be sent at the specified date
internal struct MessageSchedulingStateSendAtDate: Codable {
    /// Date the message will be sent. The date must be within 367 days in the future
    internal let sendDate: Int

    internal init(sendDate: Int) {
        self.sendDate = sendDate
    }
}
