//
//  Message.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a message
internal struct Message: Codable {
    /// For channel posts and anonymous group messages, optional author signature
    internal let authorSignature: String

    /// True, if the message can be deleted for all users
    internal let canBeDeletedForAllUsers: Bool

    /// True, if the message can be deleted only for the current user while other users will continue to see it
    internal let canBeDeletedOnlyForSelf: Bool

    /// True, if the message can be edited. For live location and poll messages this fields shows whether editMessageLiveLocation or stopPoll can be used with this message by the application
    internal let canBeEdited: Bool

    /// True, if the message can be forwarded
    internal let canBeForwarded: Bool

    /// True, if the message thread info is available
    internal let canGetMessageThread: Bool

    /// True, if the message statistics are available
    internal let canGetStatistics: Bool

    /// Chat identifier
    internal let chatId: Int64

    /// True, if the message contains an unread mention for the current user
    internal let containsUnreadMention: Bool

    /// Content of the message
    internal let content: MessageContent

    /// Point in time (Unix timestamp) when the message was sent
    internal let date: Int

    /// Point in time (Unix timestamp) when the message was last edited
    internal let editDate: Int

    /// Information about the initial message sender; may be null
    internal let forwardInfo: MessageForwardInfo?

    /// Message identifier; unique for the chat to which the message belongs
    internal let id: Int64

    /// Information about interactions with the message; may be null
    internal let interactionInfo: MessageInteractionInfo?

    /// True, if the message is a channel post. All messages to channels are channel posts, all other messages are not channel posts
    internal let isChannelPost: Bool

    /// True, if the message is outgoing
    internal let isOutgoing: Bool

    /// True, if the message is pinned
    internal let isPinned: Bool

    /// Unique identifier of an album this message belongs to. Only audios, documents, photos and videos can be grouped together in albums
    internal let mediaAlbumId: TdInt64

    /// If non-zero, the identifier of the message thread the message belongs to; unique within the chat to which the message belongs
    internal let messageThreadId: Int64

    /// If non-zero, the identifier of the chat to which the replied message belongs; Currently, only messages in the Replies chat can have different reply_in_chat_id and chat_id
    internal let replyInChatId: Int64

    /// Reply markup for the message; may be null
    internal let replyMarkup: ReplyMarkup?

    /// If non-zero, the identifier of the message this message is replying to; can be the identifier of a deleted message
    internal let replyToMessageId: Int64

    /// If non-empty, contains a human-readable description of the reason why access to this message must be restricted
    internal let restrictionReason: String

    /// Information about the scheduling state of the message; may be null
    internal let schedulingState: MessageSchedulingState?

    /// The sender of the message
    internal let sender: MessageSender

    /// Information about the sending state of the message; may be null
    internal let sendingState: MessageSendingState?

    /// For self-destructing messages, the message's TTL (Time To Live), in seconds; 0 if none. TDLib will send updateDeleteMessages or updateMessageContent once the TTL expires
    internal let ttl: Int

    /// Time left before the message expires, in seconds
    internal let ttlExpiresIn: Double

    /// If non-zero, the user identifier of the bot through which this message was sent
    internal let viaBotUserId: Int

    internal init(
        authorSignature: String,
        canBeDeletedForAllUsers: Bool,
        canBeDeletedOnlyForSelf: Bool,
        canBeEdited: Bool,
        canBeForwarded: Bool,
        canGetMessageThread: Bool,
        canGetStatistics: Bool,
        chatId: Int64,
        containsUnreadMention: Bool,
        content: MessageContent,
        date: Int,
        editDate: Int,
        forwardInfo: MessageForwardInfo?,
        id: Int64,
        interactionInfo: MessageInteractionInfo?,
        isChannelPost: Bool,
        isOutgoing: Bool,
        isPinned: Bool,
        mediaAlbumId: TdInt64,
        messageThreadId: Int64,
        replyInChatId: Int64,
        replyMarkup: ReplyMarkup?,
        replyToMessageId: Int64,
        restrictionReason: String,
        schedulingState: MessageSchedulingState?,
        sender: MessageSender,
        sendingState: MessageSendingState?,
        ttl: Int,
        ttlExpiresIn: Double,
        viaBotUserId: Int
    ) {
        self.authorSignature = authorSignature
        self.canBeDeletedForAllUsers = canBeDeletedForAllUsers
        self.canBeDeletedOnlyForSelf = canBeDeletedOnlyForSelf
        self.canBeEdited = canBeEdited
        self.canBeForwarded = canBeForwarded
        self.canGetMessageThread = canGetMessageThread
        self.canGetStatistics = canGetStatistics
        self.chatId = chatId
        self.containsUnreadMention = containsUnreadMention
        self.content = content
        self.date = date
        self.editDate = editDate
        self.forwardInfo = forwardInfo
        self.id = id
        self.interactionInfo = interactionInfo
        self.isChannelPost = isChannelPost
        self.isOutgoing = isOutgoing
        self.isPinned = isPinned
        self.mediaAlbumId = mediaAlbumId
        self.messageThreadId = messageThreadId
        self.replyInChatId = replyInChatId
        self.replyMarkup = replyMarkup
        self.replyToMessageId = replyToMessageId
        self.restrictionReason = restrictionReason
        self.schedulingState = schedulingState
        self.sender = sender
        self.sendingState = sendingState
        self.ttl = ttl
        self.ttlExpiresIn = ttlExpiresIn
        self.viaBotUserId = viaBotUserId
    }
}
