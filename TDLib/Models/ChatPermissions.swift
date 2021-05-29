//
//  ChatPermissions.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes actions that a user is allowed to take in a chat
internal struct ChatPermissions: Codable {
    /// True, if the user may add a web page preview to their messages. Implies can_send_messages permissions
    internal let canAddWebPagePreviews: Bool

    /// True, if the user can change the chat title, photo, and other settings
    internal let canChangeInfo: Bool

    /// True, if the user can invite new users to the chat
    internal let canInviteUsers: Bool

    /// True, if the user can pin messages
    internal let canPinMessages: Bool

    /// True, if the user can send audio files, documents, photos, videos, video notes, and voice notes. Implies can_send_messages permissions
    internal let canSendMediaMessages: Bool

    /// True, if the user can send text messages, contacts, locations, and venues
    internal let canSendMessages: Bool

    /// True, if the user can send animations, games, stickers, and dice and use inline bots. Implies can_send_messages permissions
    internal let canSendOtherMessages: Bool

    /// True, if the user can send polls. Implies can_send_messages permissions
    internal let canSendPolls: Bool

    internal init(
        canAddWebPagePreviews: Bool,
        canChangeInfo: Bool,
        canInviteUsers: Bool,
        canPinMessages: Bool,
        canSendMediaMessages: Bool,
        canSendMessages: Bool,
        canSendOtherMessages: Bool,
        canSendPolls: Bool
    ) {
        self.canAddWebPagePreviews = canAddWebPagePreviews
        self.canChangeInfo = canChangeInfo
        self.canInviteUsers = canInviteUsers
        self.canPinMessages = canPinMessages
        self.canSendMediaMessages = canSendMediaMessages
        self.canSendMessages = canSendMessages
        self.canSendOtherMessages = canSendOtherMessages
        self.canSendPolls = canSendPolls
    }
}
