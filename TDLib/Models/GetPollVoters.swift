//
//  GetPollVoters.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns users voted for the specified option in a non-anonymous polls. For the optimal performance the number of returned users is chosen by the library
internal struct GetPollVoters: Codable {
    /// Identifier of the chat to which the poll belongs
    internal let chatId: Int64

    /// The maximum number of users to be returned; must be positive and can't be greater than 50. Fewer users may be returned than specified by the limit, even if the end of the voter list has not been reached
    internal let limit: Int

    /// Identifier of the message containing the poll
    internal let messageId: Int64

    /// Number of users to skip in the result; must be non-negative
    internal let offset: Int

    /// 0-based identifier of the answer option
    internal let optionId: Int

    internal init(
        chatId: Int64,
        limit: Int,
        messageId: Int64,
        offset: Int,
        optionId: Int
    ) {
        self.chatId = chatId
        self.limit = limit
        self.messageId = messageId
        self.offset = offset
        self.optionId = optionId
    }
}
