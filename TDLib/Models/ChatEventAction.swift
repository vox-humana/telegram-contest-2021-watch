//
//  ChatEventAction.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a chat event
internal enum ChatEventAction: Codable {
    /// A message was edited
    case chatEventMessageEdited(ChatEventMessageEdited)

    /// A message was deleted
    case chatEventMessageDeleted(ChatEventMessageDeleted)

    /// A poll in a message was stopped
    case chatEventPollStopped(ChatEventPollStopped)

    /// A message was pinned
    case chatEventMessagePinned(ChatEventMessagePinned)

    /// A message was unpinned
    case chatEventMessageUnpinned(ChatEventMessageUnpinned)

    /// A new member joined the chat
    case chatEventMemberJoined

    /// A new member joined the chat by an invite link
    case chatEventMemberJoinedByInviteLink(ChatEventMemberJoinedByInviteLink)

    /// A member left the chat
    case chatEventMemberLeft

    /// A new chat member was invited
    case chatEventMemberInvited(ChatEventMemberInvited)

    /// A chat member has gained/lost administrator status, or the list of their administrator privileges has changed
    case chatEventMemberPromoted(ChatEventMemberPromoted)

    /// A chat member was restricted/unrestricted or banned/unbanned, or the list of their restrictions has changed
    case chatEventMemberRestricted(ChatEventMemberRestricted)

    /// The chat title was changed
    case chatEventTitleChanged(ChatEventTitleChanged)

    /// The chat permissions was changed
    case chatEventPermissionsChanged(ChatEventPermissionsChanged)

    /// The chat description was changed
    case chatEventDescriptionChanged(ChatEventDescriptionChanged)

    /// The chat username was changed
    case chatEventUsernameChanged(ChatEventUsernameChanged)

    /// The chat photo was changed
    case chatEventPhotoChanged(ChatEventPhotoChanged)

    /// The can_invite_users permission of a supergroup chat was toggled
    case chatEventInvitesToggled(ChatEventInvitesToggled)

    /// The linked chat of a supergroup was changed
    case chatEventLinkedChatChanged(ChatEventLinkedChatChanged)

    /// The slow_mode_delay setting of a supergroup was changed
    case chatEventSlowModeDelayChanged(ChatEventSlowModeDelayChanged)

    /// The message TTL setting was changed
    case chatEventMessageTtlSettingChanged(ChatEventMessageTtlSettingChanged)

    /// The sign_messages setting of a channel was toggled
    case chatEventSignMessagesToggled(ChatEventSignMessagesToggled)

    /// The supergroup sticker set was changed
    case chatEventStickerSetChanged(ChatEventStickerSetChanged)

    /// The supergroup location was changed
    case chatEventLocationChanged(ChatEventLocationChanged)

    /// The is_all_history_available setting of a supergroup was toggled
    case chatEventIsAllHistoryAvailableToggled(ChatEventIsAllHistoryAvailableToggled)

    /// A chat invite link was edited
    case chatEventInviteLinkEdited(ChatEventInviteLinkEdited)

    /// A chat invite link was revoked
    case chatEventInviteLinkRevoked(ChatEventInviteLinkRevoked)

    /// A revoked chat invite link was deleted
    case chatEventInviteLinkDeleted(ChatEventInviteLinkDeleted)

    /// A voice chat was created
    case chatEventVoiceChatCreated(ChatEventVoiceChatCreated)

    /// A voice chat was discarded
    case chatEventVoiceChatDiscarded(ChatEventVoiceChatDiscarded)

    /// A voice chat participant was muted or unmuted
    case chatEventVoiceChatParticipantIsMutedToggled(ChatEventVoiceChatParticipantIsMutedToggled)

    /// A voice chat participant volume level was changed
    case chatEventVoiceChatParticipantVolumeLevelChanged(ChatEventVoiceChatParticipantVolumeLevelChanged)

    /// The mute_new_participants setting of a voice chat was toggled
    case chatEventVoiceChatMuteNewParticipantsToggled(ChatEventVoiceChatMuteNewParticipantsToggled)

    private enum Kind: String, Codable {
        case chatEventMessageEdited
        case chatEventMessageDeleted
        case chatEventPollStopped
        case chatEventMessagePinned
        case chatEventMessageUnpinned
        case chatEventMemberJoined
        case chatEventMemberJoinedByInviteLink
        case chatEventMemberLeft
        case chatEventMemberInvited
        case chatEventMemberPromoted
        case chatEventMemberRestricted
        case chatEventTitleChanged
        case chatEventPermissionsChanged
        case chatEventDescriptionChanged
        case chatEventUsernameChanged
        case chatEventPhotoChanged
        case chatEventInvitesToggled
        case chatEventLinkedChatChanged
        case chatEventSlowModeDelayChanged
        case chatEventMessageTtlSettingChanged
        case chatEventSignMessagesToggled
        case chatEventStickerSetChanged
        case chatEventLocationChanged
        case chatEventIsAllHistoryAvailableToggled
        case chatEventInviteLinkEdited
        case chatEventInviteLinkRevoked
        case chatEventInviteLinkDeleted
        case chatEventVoiceChatCreated
        case chatEventVoiceChatDiscarded
        case chatEventVoiceChatParticipantIsMutedToggled
        case chatEventVoiceChatParticipantVolumeLevelChanged
        case chatEventVoiceChatMuteNewParticipantsToggled
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .chatEventMessageEdited:
            let value = try ChatEventMessageEdited(from: decoder)
            self = .chatEventMessageEdited(value)
        case .chatEventMessageDeleted:
            let value = try ChatEventMessageDeleted(from: decoder)
            self = .chatEventMessageDeleted(value)
        case .chatEventPollStopped:
            let value = try ChatEventPollStopped(from: decoder)
            self = .chatEventPollStopped(value)
        case .chatEventMessagePinned:
            let value = try ChatEventMessagePinned(from: decoder)
            self = .chatEventMessagePinned(value)
        case .chatEventMessageUnpinned:
            let value = try ChatEventMessageUnpinned(from: decoder)
            self = .chatEventMessageUnpinned(value)
        case .chatEventMemberJoined:
            self = .chatEventMemberJoined
        case .chatEventMemberJoinedByInviteLink:
            let value = try ChatEventMemberJoinedByInviteLink(from: decoder)
            self = .chatEventMemberJoinedByInviteLink(value)
        case .chatEventMemberLeft:
            self = .chatEventMemberLeft
        case .chatEventMemberInvited:
            let value = try ChatEventMemberInvited(from: decoder)
            self = .chatEventMemberInvited(value)
        case .chatEventMemberPromoted:
            let value = try ChatEventMemberPromoted(from: decoder)
            self = .chatEventMemberPromoted(value)
        case .chatEventMemberRestricted:
            let value = try ChatEventMemberRestricted(from: decoder)
            self = .chatEventMemberRestricted(value)
        case .chatEventTitleChanged:
            let value = try ChatEventTitleChanged(from: decoder)
            self = .chatEventTitleChanged(value)
        case .chatEventPermissionsChanged:
            let value = try ChatEventPermissionsChanged(from: decoder)
            self = .chatEventPermissionsChanged(value)
        case .chatEventDescriptionChanged:
            let value = try ChatEventDescriptionChanged(from: decoder)
            self = .chatEventDescriptionChanged(value)
        case .chatEventUsernameChanged:
            let value = try ChatEventUsernameChanged(from: decoder)
            self = .chatEventUsernameChanged(value)
        case .chatEventPhotoChanged:
            let value = try ChatEventPhotoChanged(from: decoder)
            self = .chatEventPhotoChanged(value)
        case .chatEventInvitesToggled:
            let value = try ChatEventInvitesToggled(from: decoder)
            self = .chatEventInvitesToggled(value)
        case .chatEventLinkedChatChanged:
            let value = try ChatEventLinkedChatChanged(from: decoder)
            self = .chatEventLinkedChatChanged(value)
        case .chatEventSlowModeDelayChanged:
            let value = try ChatEventSlowModeDelayChanged(from: decoder)
            self = .chatEventSlowModeDelayChanged(value)
        case .chatEventMessageTtlSettingChanged:
            let value = try ChatEventMessageTtlSettingChanged(from: decoder)
            self = .chatEventMessageTtlSettingChanged(value)
        case .chatEventSignMessagesToggled:
            let value = try ChatEventSignMessagesToggled(from: decoder)
            self = .chatEventSignMessagesToggled(value)
        case .chatEventStickerSetChanged:
            let value = try ChatEventStickerSetChanged(from: decoder)
            self = .chatEventStickerSetChanged(value)
        case .chatEventLocationChanged:
            let value = try ChatEventLocationChanged(from: decoder)
            self = .chatEventLocationChanged(value)
        case .chatEventIsAllHistoryAvailableToggled:
            let value = try ChatEventIsAllHistoryAvailableToggled(from: decoder)
            self = .chatEventIsAllHistoryAvailableToggled(value)
        case .chatEventInviteLinkEdited:
            let value = try ChatEventInviteLinkEdited(from: decoder)
            self = .chatEventInviteLinkEdited(value)
        case .chatEventInviteLinkRevoked:
            let value = try ChatEventInviteLinkRevoked(from: decoder)
            self = .chatEventInviteLinkRevoked(value)
        case .chatEventInviteLinkDeleted:
            let value = try ChatEventInviteLinkDeleted(from: decoder)
            self = .chatEventInviteLinkDeleted(value)
        case .chatEventVoiceChatCreated:
            let value = try ChatEventVoiceChatCreated(from: decoder)
            self = .chatEventVoiceChatCreated(value)
        case .chatEventVoiceChatDiscarded:
            let value = try ChatEventVoiceChatDiscarded(from: decoder)
            self = .chatEventVoiceChatDiscarded(value)
        case .chatEventVoiceChatParticipantIsMutedToggled:
            let value = try ChatEventVoiceChatParticipantIsMutedToggled(from: decoder)
            self = .chatEventVoiceChatParticipantIsMutedToggled(value)
        case .chatEventVoiceChatParticipantVolumeLevelChanged:
            let value = try ChatEventVoiceChatParticipantVolumeLevelChanged(from: decoder)
            self = .chatEventVoiceChatParticipantVolumeLevelChanged(value)
        case .chatEventVoiceChatMuteNewParticipantsToggled:
            let value = try ChatEventVoiceChatMuteNewParticipantsToggled(from: decoder)
            self = .chatEventVoiceChatMuteNewParticipantsToggled(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .chatEventMessageEdited(value):
            try container.encode(Kind.chatEventMessageEdited, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventMessageDeleted(value):
            try container.encode(Kind.chatEventMessageDeleted, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventPollStopped(value):
            try container.encode(Kind.chatEventPollStopped, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventMessagePinned(value):
            try container.encode(Kind.chatEventMessagePinned, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventMessageUnpinned(value):
            try container.encode(Kind.chatEventMessageUnpinned, forKey: .type)
            try value.encode(to: encoder)
        case .chatEventMemberJoined:
            try container.encode(Kind.chatEventMemberJoined, forKey: .type)
        case let .chatEventMemberJoinedByInviteLink(value):
            try container.encode(Kind.chatEventMemberJoinedByInviteLink, forKey: .type)
            try value.encode(to: encoder)
        case .chatEventMemberLeft:
            try container.encode(Kind.chatEventMemberLeft, forKey: .type)
        case let .chatEventMemberInvited(value):
            try container.encode(Kind.chatEventMemberInvited, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventMemberPromoted(value):
            try container.encode(Kind.chatEventMemberPromoted, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventMemberRestricted(value):
            try container.encode(Kind.chatEventMemberRestricted, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventTitleChanged(value):
            try container.encode(Kind.chatEventTitleChanged, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventPermissionsChanged(value):
            try container.encode(Kind.chatEventPermissionsChanged, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventDescriptionChanged(value):
            try container.encode(Kind.chatEventDescriptionChanged, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventUsernameChanged(value):
            try container.encode(Kind.chatEventUsernameChanged, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventPhotoChanged(value):
            try container.encode(Kind.chatEventPhotoChanged, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventInvitesToggled(value):
            try container.encode(Kind.chatEventInvitesToggled, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventLinkedChatChanged(value):
            try container.encode(Kind.chatEventLinkedChatChanged, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventSlowModeDelayChanged(value):
            try container.encode(Kind.chatEventSlowModeDelayChanged, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventMessageTtlSettingChanged(value):
            try container.encode(Kind.chatEventMessageTtlSettingChanged, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventSignMessagesToggled(value):
            try container.encode(Kind.chatEventSignMessagesToggled, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventStickerSetChanged(value):
            try container.encode(Kind.chatEventStickerSetChanged, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventLocationChanged(value):
            try container.encode(Kind.chatEventLocationChanged, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventIsAllHistoryAvailableToggled(value):
            try container.encode(Kind.chatEventIsAllHistoryAvailableToggled, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventInviteLinkEdited(value):
            try container.encode(Kind.chatEventInviteLinkEdited, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventInviteLinkRevoked(value):
            try container.encode(Kind.chatEventInviteLinkRevoked, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventInviteLinkDeleted(value):
            try container.encode(Kind.chatEventInviteLinkDeleted, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventVoiceChatCreated(value):
            try container.encode(Kind.chatEventVoiceChatCreated, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventVoiceChatDiscarded(value):
            try container.encode(Kind.chatEventVoiceChatDiscarded, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventVoiceChatParticipantIsMutedToggled(value):
            try container.encode(Kind.chatEventVoiceChatParticipantIsMutedToggled, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventVoiceChatParticipantVolumeLevelChanged(value):
            try container.encode(Kind.chatEventVoiceChatParticipantVolumeLevelChanged, forKey: .type)
            try value.encode(to: encoder)
        case let .chatEventVoiceChatMuteNewParticipantsToggled(value):
            try container.encode(Kind.chatEventVoiceChatMuteNewParticipantsToggled, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// A message was edited
internal struct ChatEventMessageEdited: Codable {
    /// The message after it was edited
    internal let newMessage: Message

    /// The original message before the edit
    internal let oldMessage: Message

    internal init(
        newMessage: Message,
        oldMessage: Message
    ) {
        self.newMessage = newMessage
        self.oldMessage = oldMessage
    }
}

/// A message was deleted
internal struct ChatEventMessageDeleted: Codable {
    /// Deleted message
    internal let message: Message

    internal init(message: Message) {
        self.message = message
    }
}

/// A poll in a message was stopped
internal struct ChatEventPollStopped: Codable {
    /// The message with the poll
    internal let message: Message

    internal init(message: Message) {
        self.message = message
    }
}

/// A message was pinned
internal struct ChatEventMessagePinned: Codable {
    /// Pinned message
    internal let message: Message

    internal init(message: Message) {
        self.message = message
    }
}

/// A message was unpinned
internal struct ChatEventMessageUnpinned: Codable {
    /// Unpinned message
    internal let message: Message

    internal init(message: Message) {
        self.message = message
    }
}

/// A new member joined the chat by an invite link
internal struct ChatEventMemberJoinedByInviteLink: Codable {
    /// Invite link used to join the chat
    internal let inviteLink: ChatInviteLink

    internal init(inviteLink: ChatInviteLink) {
        self.inviteLink = inviteLink
    }
}

/// A new chat member was invited
internal struct ChatEventMemberInvited: Codable {
    /// New member status
    internal let status: ChatMemberStatus

    /// New member user identifier
    internal let userId: Int

    internal init(
        status: ChatMemberStatus,
        userId: Int
    ) {
        self.status = status
        self.userId = userId
    }
}

/// A chat member has gained/lost administrator status, or the list of their administrator privileges has changed
internal struct ChatEventMemberPromoted: Codable {
    /// New status of the chat member
    internal let newStatus: ChatMemberStatus

    /// Previous status of the chat member
    internal let oldStatus: ChatMemberStatus

    /// Affected chat member user identifier
    internal let userId: Int

    internal init(
        newStatus: ChatMemberStatus,
        oldStatus: ChatMemberStatus,
        userId: Int
    ) {
        self.newStatus = newStatus
        self.oldStatus = oldStatus
        self.userId = userId
    }
}

/// A chat member was restricted/unrestricted or banned/unbanned, or the list of their restrictions has changed
internal struct ChatEventMemberRestricted: Codable {
    /// Affected chat member identifier
    internal let memberId: MessageSender

    /// New status of the chat member
    internal let newStatus: ChatMemberStatus

    /// Previous status of the chat member
    internal let oldStatus: ChatMemberStatus

    internal init(
        memberId: MessageSender,
        newStatus: ChatMemberStatus,
        oldStatus: ChatMemberStatus
    ) {
        self.memberId = memberId
        self.newStatus = newStatus
        self.oldStatus = oldStatus
    }
}

/// The chat title was changed
internal struct ChatEventTitleChanged: Codable {
    /// New chat title
    internal let newTitle: String

    /// Previous chat title
    internal let oldTitle: String

    internal init(
        newTitle: String,
        oldTitle: String
    ) {
        self.newTitle = newTitle
        self.oldTitle = oldTitle
    }
}

/// The chat permissions was changed
internal struct ChatEventPermissionsChanged: Codable {
    /// New chat permissions
    internal let newPermissions: ChatPermissions

    /// Previous chat permissions
    internal let oldPermissions: ChatPermissions

    internal init(
        newPermissions: ChatPermissions,
        oldPermissions: ChatPermissions
    ) {
        self.newPermissions = newPermissions
        self.oldPermissions = oldPermissions
    }
}

/// The chat description was changed
internal struct ChatEventDescriptionChanged: Codable {
    /// New chat description
    internal let newDescription: String

    /// Previous chat description
    internal let oldDescription: String

    internal init(
        newDescription: String,
        oldDescription: String
    ) {
        self.newDescription = newDescription
        self.oldDescription = oldDescription
    }
}

/// The chat username was changed
internal struct ChatEventUsernameChanged: Codable {
    /// New chat username
    internal let newUsername: String

    /// Previous chat username
    internal let oldUsername: String

    internal init(
        newUsername: String,
        oldUsername: String
    ) {
        self.newUsername = newUsername
        self.oldUsername = oldUsername
    }
}

/// The chat photo was changed
internal struct ChatEventPhotoChanged: Codable {
    /// New chat photo value; may be null
    internal let newPhoto: ChatPhoto?

    /// Previous chat photo value; may be null
    internal let oldPhoto: ChatPhoto?

    internal init(
        newPhoto: ChatPhoto?,
        oldPhoto: ChatPhoto?
    ) {
        self.newPhoto = newPhoto
        self.oldPhoto = oldPhoto
    }
}

/// The can_invite_users permission of a supergroup chat was toggled
internal struct ChatEventInvitesToggled: Codable {
    /// New value of can_invite_users permission
    internal let canInviteUsers: Bool

    internal init(canInviteUsers: Bool) {
        self.canInviteUsers = canInviteUsers
    }
}

/// The linked chat of a supergroup was changed
internal struct ChatEventLinkedChatChanged: Codable {
    /// New supergroup linked chat identifier
    internal let newLinkedChatId: Int64

    /// Previous supergroup linked chat identifier
    internal let oldLinkedChatId: Int64

    internal init(
        newLinkedChatId: Int64,
        oldLinkedChatId: Int64
    ) {
        self.newLinkedChatId = newLinkedChatId
        self.oldLinkedChatId = oldLinkedChatId
    }
}

/// The slow_mode_delay setting of a supergroup was changed
internal struct ChatEventSlowModeDelayChanged: Codable {
    /// New value of slow_mode_delay
    internal let newSlowModeDelay: Int

    /// Previous value of slow_mode_delay
    internal let oldSlowModeDelay: Int

    internal init(
        newSlowModeDelay: Int,
        oldSlowModeDelay: Int
    ) {
        self.newSlowModeDelay = newSlowModeDelay
        self.oldSlowModeDelay = oldSlowModeDelay
    }
}

/// The message TTL setting was changed
internal struct ChatEventMessageTtlSettingChanged: Codable {
    /// New value of message_ttl_setting
    internal let newMessageTtlSetting: Int

    /// Previous value of message_ttl_setting
    internal let oldMessageTtlSetting: Int

    internal init(
        newMessageTtlSetting: Int,
        oldMessageTtlSetting: Int
    ) {
        self.newMessageTtlSetting = newMessageTtlSetting
        self.oldMessageTtlSetting = oldMessageTtlSetting
    }
}

/// The sign_messages setting of a channel was toggled
internal struct ChatEventSignMessagesToggled: Codable {
    /// New value of sign_messages
    internal let signMessages: Bool

    internal init(signMessages: Bool) {
        self.signMessages = signMessages
    }
}

/// The supergroup sticker set was changed
internal struct ChatEventStickerSetChanged: Codable {
    /// New identifier of the chat sticker set; 0 if none
    internal let newStickerSetId: TdInt64

    /// Previous identifier of the chat sticker set; 0 if none
    internal let oldStickerSetId: TdInt64

    internal init(
        newStickerSetId: TdInt64,
        oldStickerSetId: TdInt64
    ) {
        self.newStickerSetId = newStickerSetId
        self.oldStickerSetId = oldStickerSetId
    }
}

/// The supergroup location was changed
internal struct ChatEventLocationChanged: Codable {
    /// New location; may be null
    internal let newLocation: ChatLocation?

    /// Previous location; may be null
    internal let oldLocation: ChatLocation?

    internal init(
        newLocation: ChatLocation?,
        oldLocation: ChatLocation?
    ) {
        self.newLocation = newLocation
        self.oldLocation = oldLocation
    }
}

/// The is_all_history_available setting of a supergroup was toggled
internal struct ChatEventIsAllHistoryAvailableToggled: Codable {
    /// New value of is_all_history_available
    internal let isAllHistoryAvailable: Bool

    internal init(isAllHistoryAvailable: Bool) {
        self.isAllHistoryAvailable = isAllHistoryAvailable
    }
}

/// A chat invite link was edited
internal struct ChatEventInviteLinkEdited: Codable {
    /// New information about the invite link
    internal let newInviteLink: ChatInviteLink

    /// Previous information about the invite link
    internal let oldInviteLink: ChatInviteLink

    internal init(
        newInviteLink: ChatInviteLink,
        oldInviteLink: ChatInviteLink
    ) {
        self.newInviteLink = newInviteLink
        self.oldInviteLink = oldInviteLink
    }
}

/// A chat invite link was revoked
internal struct ChatEventInviteLinkRevoked: Codable {
    /// The invite link
    internal let inviteLink: ChatInviteLink

    internal init(inviteLink: ChatInviteLink) {
        self.inviteLink = inviteLink
    }
}

/// A revoked chat invite link was deleted
internal struct ChatEventInviteLinkDeleted: Codable {
    /// The invite link
    internal let inviteLink: ChatInviteLink

    internal init(inviteLink: ChatInviteLink) {
        self.inviteLink = inviteLink
    }
}

/// A voice chat was created
internal struct ChatEventVoiceChatCreated: Codable {
    /// Identifier of the voice chat. The voice chat can be received through the method getGroupCall
    internal let groupCallId: Int

    internal init(groupCallId: Int) {
        self.groupCallId = groupCallId
    }
}

/// A voice chat was discarded
internal struct ChatEventVoiceChatDiscarded: Codable {
    /// Identifier of the voice chat. The voice chat can be received through the method getGroupCall
    internal let groupCallId: Int

    internal init(groupCallId: Int) {
        self.groupCallId = groupCallId
    }
}

/// A voice chat participant was muted or unmuted
internal struct ChatEventVoiceChatParticipantIsMutedToggled: Codable {
    /// New value of is_muted
    internal let isMuted: Bool

    /// Identifier of the affected group call participant
    internal let participantId: MessageSender

    internal init(
        isMuted: Bool,
        participantId: MessageSender
    ) {
        self.isMuted = isMuted
        self.participantId = participantId
    }
}

/// A voice chat participant volume level was changed
internal struct ChatEventVoiceChatParticipantVolumeLevelChanged: Codable {
    /// Identifier of the affected group call participant
    internal let participantId: MessageSender

    /// New value of volume_level; 1-20000 in hundreds of percents
    internal let volumeLevel: Int

    internal init(
        participantId: MessageSender,
        volumeLevel: Int
    ) {
        self.participantId = participantId
        self.volumeLevel = volumeLevel
    }
}

/// The mute_new_participants setting of a voice chat was toggled
internal struct ChatEventVoiceChatMuteNewParticipantsToggled: Codable {
    /// New value of the mute_new_participants setting
    internal let muteNewParticipants: Bool

    internal init(muteNewParticipants: Bool) {
        self.muteNewParticipants = muteNewParticipants
    }
}
