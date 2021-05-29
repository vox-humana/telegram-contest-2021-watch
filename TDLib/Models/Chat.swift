//
//  Chat.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// A chat. (Can be a private chat, basic group, supergroup, or secret chat)
internal struct Chat: Codable {
    /// Describes actions which should be possible to do through a chat action bar; may be null
    internal let actionBar: ChatActionBar?

    /// True, if the chat messages can be deleted for all users
    internal let canBeDeletedForAllUsers: Bool

    /// True, if the chat messages can be deleted only for the current user while other users will continue to see the messages
    internal let canBeDeletedOnlyForSelf: Bool

    /// True, if the chat can be reported to Telegram moderators through reportChat or reportChatPhoto
    internal let canBeReported: Bool

    /// Contains application-specific data associated with the chat. (For example, the chat scroll position or local chat notification settings can be stored here.) Persistent if the message database is used
    internal let clientData: String

    /// Default value of the disable_notification parameter, used when a message is sent to the chat
    internal let defaultDisableNotification: Bool

    /// A draft of a message in the chat; may be null
    internal var draftMessage: DraftMessage?

    /// True, if the chat has scheduled messages
    internal let hasScheduledMessages: Bool

    /// Chat unique identifier
    internal let id: Int64

    /// True, if the chat is blocked by the current user and private messages from the chat can't be received
    internal let isBlocked: Bool

    /// True, if the chat is marked as unread
    internal var isMarkedAsUnread: Bool

    /// Last message in the chat; may be null
    internal var lastMessage: Message?

    /// Identifier of the last read incoming message
    internal var lastReadInboxMessageId: Int64

    /// Identifier of the last read outgoing message
    internal var lastReadOutboxMessageId: Int64

    /// Current message Time To Live setting (self-destruct timer) for the chat; 0 if not defined. TTL is counted from the time message or its content is viewed in secret chats and from the send date in other chats
    internal let messageTtlSetting: Int

    /// Notification settings for this chat
    internal let notificationSettings: ChatNotificationSettings

    /// Actions that non-administrator chat members are allowed to take in the chat
    internal let permissions: ChatPermissions

    /// Chat photo; may be null
    internal var photo: ChatPhotoInfo?

    /// Positions of the chat in chat lists
    internal var positions: [ChatPosition]

    /// Identifier of the message from which reply markup needs to be used; 0 if there is no default custom reply markup in the chat
    internal let replyMarkupMessageId: Int64

    /// Chat title
    internal var title: String

    /// Type of the chat
    internal let type: ChatType

    /// Number of unread messages in the chat
    internal var unreadCount: Int

    /// Number of unread messages with a mention/reply in the chat
    internal var unreadMentionCount: Int

    /// Contains information about voice chat of the chat
    internal let voiceChat: VoiceChat

    internal init(
        actionBar: ChatActionBar?,
        canBeDeletedForAllUsers: Bool,
        canBeDeletedOnlyForSelf: Bool,
        canBeReported: Bool,
        clientData: String,
        defaultDisableNotification: Bool,
        draftMessage: DraftMessage?,
        hasScheduledMessages: Bool,
        id: Int64,
        isBlocked: Bool,
        isMarkedAsUnread: Bool,
        lastMessage: Message?,
        lastReadInboxMessageId: Int64,
        lastReadOutboxMessageId: Int64,
        messageTtlSetting: Int,
        notificationSettings: ChatNotificationSettings,
        permissions: ChatPermissions,
        photo: ChatPhotoInfo?,
        positions: [ChatPosition],
        replyMarkupMessageId: Int64,
        title: String,
        type: ChatType,
        unreadCount: Int,
        unreadMentionCount: Int,
        voiceChat: VoiceChat
    ) {
        self.actionBar = actionBar
        self.canBeDeletedForAllUsers = canBeDeletedForAllUsers
        self.canBeDeletedOnlyForSelf = canBeDeletedOnlyForSelf
        self.canBeReported = canBeReported
        self.clientData = clientData
        self.defaultDisableNotification = defaultDisableNotification
        self.draftMessage = draftMessage
        self.hasScheduledMessages = hasScheduledMessages
        self.id = id
        self.isBlocked = isBlocked
        self.isMarkedAsUnread = isMarkedAsUnread
        self.lastMessage = lastMessage
        self.lastReadInboxMessageId = lastReadInboxMessageId
        self.lastReadOutboxMessageId = lastReadOutboxMessageId
        self.messageTtlSetting = messageTtlSetting
        self.notificationSettings = notificationSettings
        self.permissions = permissions
        self.photo = photo
        self.positions = positions
        self.replyMarkupMessageId = replyMarkupMessageId
        self.title = title
        self.type = type
        self.unreadCount = unreadCount
        self.unreadMentionCount = unreadMentionCount
        self.voiceChat = voiceChat
    }
}
