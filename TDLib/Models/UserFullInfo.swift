//
//  UserFullInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains full information about a user
internal struct UserFullInfo: Codable {
    /// A short user bio
    internal let bio: String

    /// If the user is a bot, information about the bot; may be null
    internal let botInfo: BotInfo?

    /// True, if the user can be called
    internal let canBeCalled: Bool

    /// Number of group chats where both the other user and the current user are a member; 0 for the current user
    internal let groupInCommonCount: Int

    /// True, if the user can't be called due to their privacy settings
    internal let hasPrivateCalls: Bool

    /// True, if the user is blocked by the current user
    internal let isBlocked: Bool

    /// True, if the current user needs to explicitly allow to share their phone number with the user when the method addContact is used
    internal let needPhoneNumberPrivacyException: Bool

    /// User profile photo; may be null
    internal let photo: ChatPhoto?

    /// For bots, the text that is included with the link when users share the bot
    internal let shareText: String

    /// True, if a video call can be created with the user
    internal let supportsVideoCalls: Bool

    internal init(
        bio: String,
        botInfo: BotInfo?,
        canBeCalled: Bool,
        groupInCommonCount: Int,
        hasPrivateCalls: Bool,
        isBlocked: Bool,
        needPhoneNumberPrivacyException: Bool,
        photo: ChatPhoto?,
        shareText: String,
        supportsVideoCalls: Bool
    ) {
        self.bio = bio
        self.botInfo = botInfo
        self.canBeCalled = canBeCalled
        self.groupInCommonCount = groupInCommonCount
        self.hasPrivateCalls = hasPrivateCalls
        self.isBlocked = isBlocked
        self.needPhoneNumberPrivacyException = needPhoneNumberPrivacyException
        self.photo = photo
        self.shareText = shareText
        self.supportsVideoCalls = supportsVideoCalls
    }
}
