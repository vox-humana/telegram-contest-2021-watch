//
//  Update.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains notifications about data changes
internal enum Update: Codable {
    /// The user authorization state has changed
    case updateAuthorizationState(UpdateAuthorizationState)

    /// A new message was received; can also be an outgoing message
    case updateNewMessage(UpdateNewMessage)

    /// A request to send a message has reached the Telegram server. This doesn't mean that the message will be sent successfully or even that the send message request will be processed. This update will be sent only if the option "use_quick_ack" is set to true. This update may be sent multiple times for the same message
    case updateMessageSendAcknowledged(UpdateMessageSendAcknowledged)

    /// A message has been successfully sent
    case updateMessageSendSucceeded(UpdateMessageSendSucceeded)

    /// A message failed to send. Be aware that some messages being sent can be irrecoverably deleted, in which case updateDeleteMessages will be received instead of this update
    case updateMessageSendFailed(UpdateMessageSendFailed)

    /// The message content has changed
    case updateMessageContent(UpdateMessageContent)

    /// A message was edited. Changes in the message content will come in a separate updateMessageContent
    case updateMessageEdited(UpdateMessageEdited)

    /// The message pinned state was changed
    case updateMessageIsPinned(UpdateMessageIsPinned)

    /// The information about interactions with a message has changed
    case updateMessageInteractionInfo(UpdateMessageInteractionInfo)

    /// The message content was opened. Updates voice note messages to "listened", video note messages to "viewed" and starts the TTL timer for self-destructing messages
    case updateMessageContentOpened(UpdateMessageContentOpened)

    /// A message with an unread mention was read
    case updateMessageMentionRead(UpdateMessageMentionRead)

    /// A message with a live location was viewed. When the update is received, the application is supposed to update the live location
    case updateMessageLiveLocationViewed(UpdateMessageLiveLocationViewed)

    /// A new chat has been loaded/created. This update is guaranteed to come before the chat identifier is returned to the application. The chat field changes will be reported through separate updates
    case updateNewChat(UpdateNewChat)

    /// The title of a chat was changed
    case updateChatTitle(UpdateChatTitle)

    /// A chat photo was changed
    case updateChatPhoto(UpdateChatPhoto)

    /// Chat permissions was changed
    case updateChatPermissions(UpdateChatPermissions)

    /// The last message of a chat was changed. If last_message is null, then the last message in the chat became unknown. Some new unknown messages might be added to the chat in this case
    case updateChatLastMessage(UpdateChatLastMessage)

    /// The position of a chat in a chat list has changed. Instead of this update updateChatLastMessage or updateChatDraftMessage might be sent
    case updateChatPosition(UpdateChatPosition)

    /// A chat was marked as unread or was read
    case updateChatIsMarkedAsUnread(UpdateChatIsMarkedAsUnread)

    /// A chat was blocked or unblocked
    case updateChatIsBlocked(UpdateChatIsBlocked)

    /// A chat's has_scheduled_messages field has changed
    case updateChatHasScheduledMessages(UpdateChatHasScheduledMessages)

    /// A chat voice chat state has changed
    case updateChatVoiceChat(UpdateChatVoiceChat)

    /// The value of the default disable_notification parameter, used when a message is sent to the chat, was changed
    case updateChatDefaultDisableNotification(UpdateChatDefaultDisableNotification)

    /// Incoming messages were read or number of unread messages has been changed
    case updateChatReadInbox(UpdateChatReadInbox)

    /// Outgoing messages were read
    case updateChatReadOutbox(UpdateChatReadOutbox)

    /// The chat unread_mention_count has changed
    case updateChatUnreadMentionCount(UpdateChatUnreadMentionCount)

    /// Notification settings for a chat were changed
    case updateChatNotificationSettings(UpdateChatNotificationSettings)

    /// Notification settings for some type of chats were updated
    case updateScopeNotificationSettings(UpdateScopeNotificationSettings)

    /// The message Time To Live setting for a chat was changed
    case updateChatMessageTtlSetting(UpdateChatMessageTtlSetting)

    /// The chat action bar was changed
    case updateChatActionBar(UpdateChatActionBar)

    /// The default chat reply markup was changed. Can occur because new messages with reply markup were received or because an old reply markup was hidden by the user
    case updateChatReplyMarkup(UpdateChatReplyMarkup)

    /// A chat draft has changed. Be aware that the update may come in the currently opened chat but with old content of the draft. If the user has changed the content of the draft, this update shouldn't be applied
    case updateChatDraftMessage(UpdateChatDraftMessage)

    /// The list of chat filters or a chat filter has changed
    case updateChatFilters(UpdateChatFilters)

    /// The number of online group members has changed. This update with non-zero count is sent only for currently opened chats. There is no guarantee that it will be sent just after the count has changed
    case updateChatOnlineMemberCount(UpdateChatOnlineMemberCount)

    /// A notification was changed
    case updateNotification(UpdateNotification)

    /// A list of active notifications in a notification group has changed
    case updateNotificationGroup(UpdateNotificationGroup)

    /// Contains active notifications that was shown on previous application launches. This update is sent only if the message database is used. In that case it comes once before any updateNotification and updateNotificationGroup update
    case updateActiveNotifications(UpdateActiveNotifications)

    /// Describes whether there are some pending notification updates. Can be used to prevent application from killing, while there are some pending notifications
    case updateHavePendingNotifications(UpdateHavePendingNotifications)

    /// Some messages were deleted
    case updateDeleteMessages(UpdateDeleteMessages)

    /// User activity in the chat has changed
    case updateUserChatAction(UpdateUserChatAction)

    /// The user went online or offline
    case updateUserStatus(UpdateUserStatus)

    /// Some data of a user has changed. This update is guaranteed to come before the user identifier is returned to the application
    case updateUser(UpdateUser)

    /// Some data of a basic group has changed. This update is guaranteed to come before the basic group identifier is returned to the application
    case updateBasicGroup(UpdateBasicGroup)

    /// Some data of a supergroup or a channel has changed. This update is guaranteed to come before the supergroup identifier is returned to the application
    case updateSupergroup(UpdateSupergroup)

    /// Some data of a secret chat has changed. This update is guaranteed to come before the secret chat identifier is returned to the application
    case updateSecretChat(UpdateSecretChat)

    /// Some data from userFullInfo has been changed
    case updateUserFullInfo(UpdateUserFullInfo)

    /// Some data from basicGroupFullInfo has been changed
    case updateBasicGroupFullInfo(UpdateBasicGroupFullInfo)

    /// Some data from supergroupFullInfo has been changed
    case updateSupergroupFullInfo(UpdateSupergroupFullInfo)

    /// Service notification from the server. Upon receiving this the application must show a popup with the content of the notification
    case updateServiceNotification(UpdateServiceNotification)

    /// Information about a file was updated
    case updateFile(UpdateFile)

    /// The file generation process needs to be started by the application
    case updateFileGenerationStart(UpdateFileGenerationStart)

    /// File generation is no longer needed
    case updateFileGenerationStop(UpdateFileGenerationStop)

    /// New call was created or information about a call was updated
    case updateCall(UpdateCall)

    /// Information about a group call was updated
    case updateGroupCall(UpdateGroupCall)

    /// Information about a group call participant was changed. The updates are sent only after the group call is received through getGroupCall and only if the call is joined or being joined
    case updateGroupCallParticipant(UpdateGroupCallParticipant)

    /// New call signaling data arrived
    case updateNewCallSignalingData(UpdateNewCallSignalingData)

    /// Some privacy setting rules have been changed
    case updateUserPrivacySettingRules(UpdateUserPrivacySettingRules)

    /// Number of unread messages in a chat list has changed. This update is sent only if the message database is used
    case updateUnreadMessageCount(UpdateUnreadMessageCount)

    /// Number of unread chats, i.e. with unread messages or marked as unread, has changed. This update is sent only if the message database is used
    case updateUnreadChatCount(UpdateUnreadChatCount)

    /// An option changed its value
    case updateOption(UpdateOption)

    /// A sticker set has changed
    case updateStickerSet(UpdateStickerSet)

    /// The list of installed sticker sets was updated
    case updateInstalledStickerSets(UpdateInstalledStickerSets)

    /// The list of trending sticker sets was updated or some of them were viewed
    case updateTrendingStickerSets(UpdateTrendingStickerSets)

    /// The list of recently used stickers was updated
    case updateRecentStickers(UpdateRecentStickers)

    /// The list of favorite stickers was updated
    case updateFavoriteStickers(UpdateFavoriteStickers)

    /// The list of saved animations was updated
    case updateSavedAnimations(UpdateSavedAnimations)

    /// The selected background has changed
    case updateSelectedBackground(UpdateSelectedBackground)

    /// Some language pack strings have been updated
    case updateLanguagePackStrings(UpdateLanguagePackStrings)

    /// The connection state has changed. This update must be used only to show a human-readable description of the connection state
    case updateConnectionState(UpdateConnectionState)

    /// New terms of service must be accepted by the user. If the terms of service are declined, then the deleteAccount method should be called with the reason "Decline ToS update"
    case updateTermsOfService(UpdateTermsOfService)

    /// The list of users nearby has changed. The update is guaranteed to be sent only 60 seconds after a successful searchChatsNearby request
    case updateUsersNearby(UpdateUsersNearby)

    /// The list of supported dice emojis has changed
    case updateDiceEmojis(UpdateDiceEmojis)

    /// The parameters of animation search through GetOption("animation_search_bot_username") bot has changed
    case updateAnimationSearchParameters(UpdateAnimationSearchParameters)

    /// The list of suggested to the user actions has changed
    case updateSuggestedActions(UpdateSuggestedActions)

    /// A new incoming inline query; for bots only
    case updateNewInlineQuery(UpdateNewInlineQuery)

    /// The user has chosen a result of an inline query; for bots only
    case updateNewChosenInlineResult(UpdateNewChosenInlineResult)

    /// A new incoming callback query; for bots only
    case updateNewCallbackQuery(UpdateNewCallbackQuery)

    /// A new incoming callback query from a message sent via a bot; for bots only
    case updateNewInlineCallbackQuery(UpdateNewInlineCallbackQuery)

    /// A new incoming shipping query; for bots only. Only for invoices with flexible price
    case updateNewShippingQuery(UpdateNewShippingQuery)

    /// A new incoming pre-checkout query; for bots only. Contains full information about a checkout
    case updateNewPreCheckoutQuery(UpdateNewPreCheckoutQuery)

    /// A new incoming event; for bots only
    case updateNewCustomEvent(UpdateNewCustomEvent)

    /// A new incoming query; for bots only
    case updateNewCustomQuery(UpdateNewCustomQuery)

    /// A poll was updated; for bots only
    case updatePoll(UpdatePoll)

    /// A user changed the answer to a poll; for bots only
    case updatePollAnswer(UpdatePollAnswer)

    /// User rights changed in a chat; for bots only
    case updateChatMember(UpdateChatMember)

    private enum Kind: String, Codable {
        case updateAuthorizationState
        case updateNewMessage
        case updateMessageSendAcknowledged
        case updateMessageSendSucceeded
        case updateMessageSendFailed
        case updateMessageContent
        case updateMessageEdited
        case updateMessageIsPinned
        case updateMessageInteractionInfo
        case updateMessageContentOpened
        case updateMessageMentionRead
        case updateMessageLiveLocationViewed
        case updateNewChat
        case updateChatTitle
        case updateChatPhoto
        case updateChatPermissions
        case updateChatLastMessage
        case updateChatPosition
        case updateChatIsMarkedAsUnread
        case updateChatIsBlocked
        case updateChatHasScheduledMessages
        case updateChatVoiceChat
        case updateChatDefaultDisableNotification
        case updateChatReadInbox
        case updateChatReadOutbox
        case updateChatUnreadMentionCount
        case updateChatNotificationSettings
        case updateScopeNotificationSettings
        case updateChatMessageTtlSetting
        case updateChatActionBar
        case updateChatReplyMarkup
        case updateChatDraftMessage
        case updateChatFilters
        case updateChatOnlineMemberCount
        case updateNotification
        case updateNotificationGroup
        case updateActiveNotifications
        case updateHavePendingNotifications
        case updateDeleteMessages
        case updateUserChatAction
        case updateUserStatus
        case updateUser
        case updateBasicGroup
        case updateSupergroup
        case updateSecretChat
        case updateUserFullInfo
        case updateBasicGroupFullInfo
        case updateSupergroupFullInfo
        case updateServiceNotification
        case updateFile
        case updateFileGenerationStart
        case updateFileGenerationStop
        case updateCall
        case updateGroupCall
        case updateGroupCallParticipant
        case updateNewCallSignalingData
        case updateUserPrivacySettingRules
        case updateUnreadMessageCount
        case updateUnreadChatCount
        case updateOption
        case updateStickerSet
        case updateInstalledStickerSets
        case updateTrendingStickerSets
        case updateRecentStickers
        case updateFavoriteStickers
        case updateSavedAnimations
        case updateSelectedBackground
        case updateLanguagePackStrings
        case updateConnectionState
        case updateTermsOfService
        case updateUsersNearby
        case updateDiceEmojis
        case updateAnimationSearchParameters
        case updateSuggestedActions
        case updateNewInlineQuery
        case updateNewChosenInlineResult
        case updateNewCallbackQuery
        case updateNewInlineCallbackQuery
        case updateNewShippingQuery
        case updateNewPreCheckoutQuery
        case updateNewCustomEvent
        case updateNewCustomQuery
        case updatePoll
        case updatePollAnswer
        case updateChatMember
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .updateAuthorizationState:
            let value = try UpdateAuthorizationState(from: decoder)
            self = .updateAuthorizationState(value)
        case .updateNewMessage:
            let value = try UpdateNewMessage(from: decoder)
            self = .updateNewMessage(value)
        case .updateMessageSendAcknowledged:
            let value = try UpdateMessageSendAcknowledged(from: decoder)
            self = .updateMessageSendAcknowledged(value)
        case .updateMessageSendSucceeded:
            let value = try UpdateMessageSendSucceeded(from: decoder)
            self = .updateMessageSendSucceeded(value)
        case .updateMessageSendFailed:
            let value = try UpdateMessageSendFailed(from: decoder)
            self = .updateMessageSendFailed(value)
        case .updateMessageContent:
            let value = try UpdateMessageContent(from: decoder)
            self = .updateMessageContent(value)
        case .updateMessageEdited:
            let value = try UpdateMessageEdited(from: decoder)
            self = .updateMessageEdited(value)
        case .updateMessageIsPinned:
            let value = try UpdateMessageIsPinned(from: decoder)
            self = .updateMessageIsPinned(value)
        case .updateMessageInteractionInfo:
            let value = try UpdateMessageInteractionInfo(from: decoder)
            self = .updateMessageInteractionInfo(value)
        case .updateMessageContentOpened:
            let value = try UpdateMessageContentOpened(from: decoder)
            self = .updateMessageContentOpened(value)
        case .updateMessageMentionRead:
            let value = try UpdateMessageMentionRead(from: decoder)
            self = .updateMessageMentionRead(value)
        case .updateMessageLiveLocationViewed:
            let value = try UpdateMessageLiveLocationViewed(from: decoder)
            self = .updateMessageLiveLocationViewed(value)
        case .updateNewChat:
            let value = try UpdateNewChat(from: decoder)
            self = .updateNewChat(value)
        case .updateChatTitle:
            let value = try UpdateChatTitle(from: decoder)
            self = .updateChatTitle(value)
        case .updateChatPhoto:
            let value = try UpdateChatPhoto(from: decoder)
            self = .updateChatPhoto(value)
        case .updateChatPermissions:
            let value = try UpdateChatPermissions(from: decoder)
            self = .updateChatPermissions(value)
        case .updateChatLastMessage:
            let value = try UpdateChatLastMessage(from: decoder)
            self = .updateChatLastMessage(value)
        case .updateChatPosition:
            let value = try UpdateChatPosition(from: decoder)
            self = .updateChatPosition(value)
        case .updateChatIsMarkedAsUnread:
            let value = try UpdateChatIsMarkedAsUnread(from: decoder)
            self = .updateChatIsMarkedAsUnread(value)
        case .updateChatIsBlocked:
            let value = try UpdateChatIsBlocked(from: decoder)
            self = .updateChatIsBlocked(value)
        case .updateChatHasScheduledMessages:
            let value = try UpdateChatHasScheduledMessages(from: decoder)
            self = .updateChatHasScheduledMessages(value)
        case .updateChatVoiceChat:
            let value = try UpdateChatVoiceChat(from: decoder)
            self = .updateChatVoiceChat(value)
        case .updateChatDefaultDisableNotification:
            let value = try UpdateChatDefaultDisableNotification(from: decoder)
            self = .updateChatDefaultDisableNotification(value)
        case .updateChatReadInbox:
            let value = try UpdateChatReadInbox(from: decoder)
            self = .updateChatReadInbox(value)
        case .updateChatReadOutbox:
            let value = try UpdateChatReadOutbox(from: decoder)
            self = .updateChatReadOutbox(value)
        case .updateChatUnreadMentionCount:
            let value = try UpdateChatUnreadMentionCount(from: decoder)
            self = .updateChatUnreadMentionCount(value)
        case .updateChatNotificationSettings:
            let value = try UpdateChatNotificationSettings(from: decoder)
            self = .updateChatNotificationSettings(value)
        case .updateScopeNotificationSettings:
            let value = try UpdateScopeNotificationSettings(from: decoder)
            self = .updateScopeNotificationSettings(value)
        case .updateChatMessageTtlSetting:
            let value = try UpdateChatMessageTtlSetting(from: decoder)
            self = .updateChatMessageTtlSetting(value)
        case .updateChatActionBar:
            let value = try UpdateChatActionBar(from: decoder)
            self = .updateChatActionBar(value)
        case .updateChatReplyMarkup:
            let value = try UpdateChatReplyMarkup(from: decoder)
            self = .updateChatReplyMarkup(value)
        case .updateChatDraftMessage:
            let value = try UpdateChatDraftMessage(from: decoder)
            self = .updateChatDraftMessage(value)
        case .updateChatFilters:
            let value = try UpdateChatFilters(from: decoder)
            self = .updateChatFilters(value)
        case .updateChatOnlineMemberCount:
            let value = try UpdateChatOnlineMemberCount(from: decoder)
            self = .updateChatOnlineMemberCount(value)
        case .updateNotification:
            let value = try UpdateNotification(from: decoder)
            self = .updateNotification(value)
        case .updateNotificationGroup:
            let value = try UpdateNotificationGroup(from: decoder)
            self = .updateNotificationGroup(value)
        case .updateActiveNotifications:
            let value = try UpdateActiveNotifications(from: decoder)
            self = .updateActiveNotifications(value)
        case .updateHavePendingNotifications:
            let value = try UpdateHavePendingNotifications(from: decoder)
            self = .updateHavePendingNotifications(value)
        case .updateDeleteMessages:
            let value = try UpdateDeleteMessages(from: decoder)
            self = .updateDeleteMessages(value)
        case .updateUserChatAction:
            let value = try UpdateUserChatAction(from: decoder)
            self = .updateUserChatAction(value)
        case .updateUserStatus:
            let value = try UpdateUserStatus(from: decoder)
            self = .updateUserStatus(value)
        case .updateUser:
            let value = try UpdateUser(from: decoder)
            self = .updateUser(value)
        case .updateBasicGroup:
            let value = try UpdateBasicGroup(from: decoder)
            self = .updateBasicGroup(value)
        case .updateSupergroup:
            let value = try UpdateSupergroup(from: decoder)
            self = .updateSupergroup(value)
        case .updateSecretChat:
            let value = try UpdateSecretChat(from: decoder)
            self = .updateSecretChat(value)
        case .updateUserFullInfo:
            let value = try UpdateUserFullInfo(from: decoder)
            self = .updateUserFullInfo(value)
        case .updateBasicGroupFullInfo:
            let value = try UpdateBasicGroupFullInfo(from: decoder)
            self = .updateBasicGroupFullInfo(value)
        case .updateSupergroupFullInfo:
            let value = try UpdateSupergroupFullInfo(from: decoder)
            self = .updateSupergroupFullInfo(value)
        case .updateServiceNotification:
            let value = try UpdateServiceNotification(from: decoder)
            self = .updateServiceNotification(value)
        case .updateFile:
            let value = try UpdateFile(from: decoder)
            self = .updateFile(value)
        case .updateFileGenerationStart:
            let value = try UpdateFileGenerationStart(from: decoder)
            self = .updateFileGenerationStart(value)
        case .updateFileGenerationStop:
            let value = try UpdateFileGenerationStop(from: decoder)
            self = .updateFileGenerationStop(value)
        case .updateCall:
            let value = try UpdateCall(from: decoder)
            self = .updateCall(value)
        case .updateGroupCall:
            let value = try UpdateGroupCall(from: decoder)
            self = .updateGroupCall(value)
        case .updateGroupCallParticipant:
            let value = try UpdateGroupCallParticipant(from: decoder)
            self = .updateGroupCallParticipant(value)
        case .updateNewCallSignalingData:
            let value = try UpdateNewCallSignalingData(from: decoder)
            self = .updateNewCallSignalingData(value)
        case .updateUserPrivacySettingRules:
            let value = try UpdateUserPrivacySettingRules(from: decoder)
            self = .updateUserPrivacySettingRules(value)
        case .updateUnreadMessageCount:
            let value = try UpdateUnreadMessageCount(from: decoder)
            self = .updateUnreadMessageCount(value)
        case .updateUnreadChatCount:
            let value = try UpdateUnreadChatCount(from: decoder)
            self = .updateUnreadChatCount(value)
        case .updateOption:
            let value = try UpdateOption(from: decoder)
            self = .updateOption(value)
        case .updateStickerSet:
            let value = try UpdateStickerSet(from: decoder)
            self = .updateStickerSet(value)
        case .updateInstalledStickerSets:
            let value = try UpdateInstalledStickerSets(from: decoder)
            self = .updateInstalledStickerSets(value)
        case .updateTrendingStickerSets:
            let value = try UpdateTrendingStickerSets(from: decoder)
            self = .updateTrendingStickerSets(value)
        case .updateRecentStickers:
            let value = try UpdateRecentStickers(from: decoder)
            self = .updateRecentStickers(value)
        case .updateFavoriteStickers:
            let value = try UpdateFavoriteStickers(from: decoder)
            self = .updateFavoriteStickers(value)
        case .updateSavedAnimations:
            let value = try UpdateSavedAnimations(from: decoder)
            self = .updateSavedAnimations(value)
        case .updateSelectedBackground:
            let value = try UpdateSelectedBackground(from: decoder)
            self = .updateSelectedBackground(value)
        case .updateLanguagePackStrings:
            let value = try UpdateLanguagePackStrings(from: decoder)
            self = .updateLanguagePackStrings(value)
        case .updateConnectionState:
            let value = try UpdateConnectionState(from: decoder)
            self = .updateConnectionState(value)
        case .updateTermsOfService:
            let value = try UpdateTermsOfService(from: decoder)
            self = .updateTermsOfService(value)
        case .updateUsersNearby:
            let value = try UpdateUsersNearby(from: decoder)
            self = .updateUsersNearby(value)
        case .updateDiceEmojis:
            let value = try UpdateDiceEmojis(from: decoder)
            self = .updateDiceEmojis(value)
        case .updateAnimationSearchParameters:
            let value = try UpdateAnimationSearchParameters(from: decoder)
            self = .updateAnimationSearchParameters(value)
        case .updateSuggestedActions:
            let value = try UpdateSuggestedActions(from: decoder)
            self = .updateSuggestedActions(value)
        case .updateNewInlineQuery:
            let value = try UpdateNewInlineQuery(from: decoder)
            self = .updateNewInlineQuery(value)
        case .updateNewChosenInlineResult:
            let value = try UpdateNewChosenInlineResult(from: decoder)
            self = .updateNewChosenInlineResult(value)
        case .updateNewCallbackQuery:
            let value = try UpdateNewCallbackQuery(from: decoder)
            self = .updateNewCallbackQuery(value)
        case .updateNewInlineCallbackQuery:
            let value = try UpdateNewInlineCallbackQuery(from: decoder)
            self = .updateNewInlineCallbackQuery(value)
        case .updateNewShippingQuery:
            let value = try UpdateNewShippingQuery(from: decoder)
            self = .updateNewShippingQuery(value)
        case .updateNewPreCheckoutQuery:
            let value = try UpdateNewPreCheckoutQuery(from: decoder)
            self = .updateNewPreCheckoutQuery(value)
        case .updateNewCustomEvent:
            let value = try UpdateNewCustomEvent(from: decoder)
            self = .updateNewCustomEvent(value)
        case .updateNewCustomQuery:
            let value = try UpdateNewCustomQuery(from: decoder)
            self = .updateNewCustomQuery(value)
        case .updatePoll:
            let value = try UpdatePoll(from: decoder)
            self = .updatePoll(value)
        case .updatePollAnswer:
            let value = try UpdatePollAnswer(from: decoder)
            self = .updatePollAnswer(value)
        case .updateChatMember:
            let value = try UpdateChatMember(from: decoder)
            self = .updateChatMember(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .updateAuthorizationState(value):
            try container.encode(Kind.updateAuthorizationState, forKey: .type)
            try value.encode(to: encoder)
        case let .updateNewMessage(value):
            try container.encode(Kind.updateNewMessage, forKey: .type)
            try value.encode(to: encoder)
        case let .updateMessageSendAcknowledged(value):
            try container.encode(Kind.updateMessageSendAcknowledged, forKey: .type)
            try value.encode(to: encoder)
        case let .updateMessageSendSucceeded(value):
            try container.encode(Kind.updateMessageSendSucceeded, forKey: .type)
            try value.encode(to: encoder)
        case let .updateMessageSendFailed(value):
            try container.encode(Kind.updateMessageSendFailed, forKey: .type)
            try value.encode(to: encoder)
        case let .updateMessageContent(value):
            try container.encode(Kind.updateMessageContent, forKey: .type)
            try value.encode(to: encoder)
        case let .updateMessageEdited(value):
            try container.encode(Kind.updateMessageEdited, forKey: .type)
            try value.encode(to: encoder)
        case let .updateMessageIsPinned(value):
            try container.encode(Kind.updateMessageIsPinned, forKey: .type)
            try value.encode(to: encoder)
        case let .updateMessageInteractionInfo(value):
            try container.encode(Kind.updateMessageInteractionInfo, forKey: .type)
            try value.encode(to: encoder)
        case let .updateMessageContentOpened(value):
            try container.encode(Kind.updateMessageContentOpened, forKey: .type)
            try value.encode(to: encoder)
        case let .updateMessageMentionRead(value):
            try container.encode(Kind.updateMessageMentionRead, forKey: .type)
            try value.encode(to: encoder)
        case let .updateMessageLiveLocationViewed(value):
            try container.encode(Kind.updateMessageLiveLocationViewed, forKey: .type)
            try value.encode(to: encoder)
        case let .updateNewChat(value):
            try container.encode(Kind.updateNewChat, forKey: .type)
            try value.encode(to: encoder)
        case let .updateChatTitle(value):
            try container.encode(Kind.updateChatTitle, forKey: .type)
            try value.encode(to: encoder)
        case let .updateChatPhoto(value):
            try container.encode(Kind.updateChatPhoto, forKey: .type)
            try value.encode(to: encoder)
        case let .updateChatPermissions(value):
            try container.encode(Kind.updateChatPermissions, forKey: .type)
            try value.encode(to: encoder)
        case let .updateChatLastMessage(value):
            try container.encode(Kind.updateChatLastMessage, forKey: .type)
            try value.encode(to: encoder)
        case let .updateChatPosition(value):
            try container.encode(Kind.updateChatPosition, forKey: .type)
            try value.encode(to: encoder)
        case let .updateChatIsMarkedAsUnread(value):
            try container.encode(Kind.updateChatIsMarkedAsUnread, forKey: .type)
            try value.encode(to: encoder)
        case let .updateChatIsBlocked(value):
            try container.encode(Kind.updateChatIsBlocked, forKey: .type)
            try value.encode(to: encoder)
        case let .updateChatHasScheduledMessages(value):
            try container.encode(Kind.updateChatHasScheduledMessages, forKey: .type)
            try value.encode(to: encoder)
        case let .updateChatVoiceChat(value):
            try container.encode(Kind.updateChatVoiceChat, forKey: .type)
            try value.encode(to: encoder)
        case let .updateChatDefaultDisableNotification(value):
            try container.encode(Kind.updateChatDefaultDisableNotification, forKey: .type)
            try value.encode(to: encoder)
        case let .updateChatReadInbox(value):
            try container.encode(Kind.updateChatReadInbox, forKey: .type)
            try value.encode(to: encoder)
        case let .updateChatReadOutbox(value):
            try container.encode(Kind.updateChatReadOutbox, forKey: .type)
            try value.encode(to: encoder)
        case let .updateChatUnreadMentionCount(value):
            try container.encode(Kind.updateChatUnreadMentionCount, forKey: .type)
            try value.encode(to: encoder)
        case let .updateChatNotificationSettings(value):
            try container.encode(Kind.updateChatNotificationSettings, forKey: .type)
            try value.encode(to: encoder)
        case let .updateScopeNotificationSettings(value):
            try container.encode(Kind.updateScopeNotificationSettings, forKey: .type)
            try value.encode(to: encoder)
        case let .updateChatMessageTtlSetting(value):
            try container.encode(Kind.updateChatMessageTtlSetting, forKey: .type)
            try value.encode(to: encoder)
        case let .updateChatActionBar(value):
            try container.encode(Kind.updateChatActionBar, forKey: .type)
            try value.encode(to: encoder)
        case let .updateChatReplyMarkup(value):
            try container.encode(Kind.updateChatReplyMarkup, forKey: .type)
            try value.encode(to: encoder)
        case let .updateChatDraftMessage(value):
            try container.encode(Kind.updateChatDraftMessage, forKey: .type)
            try value.encode(to: encoder)
        case let .updateChatFilters(value):
            try container.encode(Kind.updateChatFilters, forKey: .type)
            try value.encode(to: encoder)
        case let .updateChatOnlineMemberCount(value):
            try container.encode(Kind.updateChatOnlineMemberCount, forKey: .type)
            try value.encode(to: encoder)
        case let .updateNotification(value):
            try container.encode(Kind.updateNotification, forKey: .type)
            try value.encode(to: encoder)
        case let .updateNotificationGroup(value):
            try container.encode(Kind.updateNotificationGroup, forKey: .type)
            try value.encode(to: encoder)
        case let .updateActiveNotifications(value):
            try container.encode(Kind.updateActiveNotifications, forKey: .type)
            try value.encode(to: encoder)
        case let .updateHavePendingNotifications(value):
            try container.encode(Kind.updateHavePendingNotifications, forKey: .type)
            try value.encode(to: encoder)
        case let .updateDeleteMessages(value):
            try container.encode(Kind.updateDeleteMessages, forKey: .type)
            try value.encode(to: encoder)
        case let .updateUserChatAction(value):
            try container.encode(Kind.updateUserChatAction, forKey: .type)
            try value.encode(to: encoder)
        case let .updateUserStatus(value):
            try container.encode(Kind.updateUserStatus, forKey: .type)
            try value.encode(to: encoder)
        case let .updateUser(value):
            try container.encode(Kind.updateUser, forKey: .type)
            try value.encode(to: encoder)
        case let .updateBasicGroup(value):
            try container.encode(Kind.updateBasicGroup, forKey: .type)
            try value.encode(to: encoder)
        case let .updateSupergroup(value):
            try container.encode(Kind.updateSupergroup, forKey: .type)
            try value.encode(to: encoder)
        case let .updateSecretChat(value):
            try container.encode(Kind.updateSecretChat, forKey: .type)
            try value.encode(to: encoder)
        case let .updateUserFullInfo(value):
            try container.encode(Kind.updateUserFullInfo, forKey: .type)
            try value.encode(to: encoder)
        case let .updateBasicGroupFullInfo(value):
            try container.encode(Kind.updateBasicGroupFullInfo, forKey: .type)
            try value.encode(to: encoder)
        case let .updateSupergroupFullInfo(value):
            try container.encode(Kind.updateSupergroupFullInfo, forKey: .type)
            try value.encode(to: encoder)
        case let .updateServiceNotification(value):
            try container.encode(Kind.updateServiceNotification, forKey: .type)
            try value.encode(to: encoder)
        case let .updateFile(value):
            try container.encode(Kind.updateFile, forKey: .type)
            try value.encode(to: encoder)
        case let .updateFileGenerationStart(value):
            try container.encode(Kind.updateFileGenerationStart, forKey: .type)
            try value.encode(to: encoder)
        case let .updateFileGenerationStop(value):
            try container.encode(Kind.updateFileGenerationStop, forKey: .type)
            try value.encode(to: encoder)
        case let .updateCall(value):
            try container.encode(Kind.updateCall, forKey: .type)
            try value.encode(to: encoder)
        case let .updateGroupCall(value):
            try container.encode(Kind.updateGroupCall, forKey: .type)
            try value.encode(to: encoder)
        case let .updateGroupCallParticipant(value):
            try container.encode(Kind.updateGroupCallParticipant, forKey: .type)
            try value.encode(to: encoder)
        case let .updateNewCallSignalingData(value):
            try container.encode(Kind.updateNewCallSignalingData, forKey: .type)
            try value.encode(to: encoder)
        case let .updateUserPrivacySettingRules(value):
            try container.encode(Kind.updateUserPrivacySettingRules, forKey: .type)
            try value.encode(to: encoder)
        case let .updateUnreadMessageCount(value):
            try container.encode(Kind.updateUnreadMessageCount, forKey: .type)
            try value.encode(to: encoder)
        case let .updateUnreadChatCount(value):
            try container.encode(Kind.updateUnreadChatCount, forKey: .type)
            try value.encode(to: encoder)
        case let .updateOption(value):
            try container.encode(Kind.updateOption, forKey: .type)
            try value.encode(to: encoder)
        case let .updateStickerSet(value):
            try container.encode(Kind.updateStickerSet, forKey: .type)
            try value.encode(to: encoder)
        case let .updateInstalledStickerSets(value):
            try container.encode(Kind.updateInstalledStickerSets, forKey: .type)
            try value.encode(to: encoder)
        case let .updateTrendingStickerSets(value):
            try container.encode(Kind.updateTrendingStickerSets, forKey: .type)
            try value.encode(to: encoder)
        case let .updateRecentStickers(value):
            try container.encode(Kind.updateRecentStickers, forKey: .type)
            try value.encode(to: encoder)
        case let .updateFavoriteStickers(value):
            try container.encode(Kind.updateFavoriteStickers, forKey: .type)
            try value.encode(to: encoder)
        case let .updateSavedAnimations(value):
            try container.encode(Kind.updateSavedAnimations, forKey: .type)
            try value.encode(to: encoder)
        case let .updateSelectedBackground(value):
            try container.encode(Kind.updateSelectedBackground, forKey: .type)
            try value.encode(to: encoder)
        case let .updateLanguagePackStrings(value):
            try container.encode(Kind.updateLanguagePackStrings, forKey: .type)
            try value.encode(to: encoder)
        case let .updateConnectionState(value):
            try container.encode(Kind.updateConnectionState, forKey: .type)
            try value.encode(to: encoder)
        case let .updateTermsOfService(value):
            try container.encode(Kind.updateTermsOfService, forKey: .type)
            try value.encode(to: encoder)
        case let .updateUsersNearby(value):
            try container.encode(Kind.updateUsersNearby, forKey: .type)
            try value.encode(to: encoder)
        case let .updateDiceEmojis(value):
            try container.encode(Kind.updateDiceEmojis, forKey: .type)
            try value.encode(to: encoder)
        case let .updateAnimationSearchParameters(value):
            try container.encode(Kind.updateAnimationSearchParameters, forKey: .type)
            try value.encode(to: encoder)
        case let .updateSuggestedActions(value):
            try container.encode(Kind.updateSuggestedActions, forKey: .type)
            try value.encode(to: encoder)
        case let .updateNewInlineQuery(value):
            try container.encode(Kind.updateNewInlineQuery, forKey: .type)
            try value.encode(to: encoder)
        case let .updateNewChosenInlineResult(value):
            try container.encode(Kind.updateNewChosenInlineResult, forKey: .type)
            try value.encode(to: encoder)
        case let .updateNewCallbackQuery(value):
            try container.encode(Kind.updateNewCallbackQuery, forKey: .type)
            try value.encode(to: encoder)
        case let .updateNewInlineCallbackQuery(value):
            try container.encode(Kind.updateNewInlineCallbackQuery, forKey: .type)
            try value.encode(to: encoder)
        case let .updateNewShippingQuery(value):
            try container.encode(Kind.updateNewShippingQuery, forKey: .type)
            try value.encode(to: encoder)
        case let .updateNewPreCheckoutQuery(value):
            try container.encode(Kind.updateNewPreCheckoutQuery, forKey: .type)
            try value.encode(to: encoder)
        case let .updateNewCustomEvent(value):
            try container.encode(Kind.updateNewCustomEvent, forKey: .type)
            try value.encode(to: encoder)
        case let .updateNewCustomQuery(value):
            try container.encode(Kind.updateNewCustomQuery, forKey: .type)
            try value.encode(to: encoder)
        case let .updatePoll(value):
            try container.encode(Kind.updatePoll, forKey: .type)
            try value.encode(to: encoder)
        case let .updatePollAnswer(value):
            try container.encode(Kind.updatePollAnswer, forKey: .type)
            try value.encode(to: encoder)
        case let .updateChatMember(value):
            try container.encode(Kind.updateChatMember, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// The user authorization state has changed
internal struct UpdateAuthorizationState: Codable {
    /// New authorization state
    internal let authorizationState: AuthorizationState

    internal init(authorizationState: AuthorizationState) {
        self.authorizationState = authorizationState
    }
}

/// A new message was received; can also be an outgoing message
internal struct UpdateNewMessage: Codable {
    /// The new message
    internal let message: Message

    internal init(message: Message) {
        self.message = message
    }
}

/// A request to send a message has reached the Telegram server. This doesn't mean that the message will be sent successfully or even that the send message request will be processed. This update will be sent only if the option "use_quick_ack" is set to true. This update may be sent multiple times for the same message
internal struct UpdateMessageSendAcknowledged: Codable {
    /// The chat identifier of the sent message
    internal let chatId: Int64

    /// A temporary message identifier
    internal let messageId: Int64

    internal init(
        chatId: Int64,
        messageId: Int64
    ) {
        self.chatId = chatId
        self.messageId = messageId
    }
}

/// A message has been successfully sent
internal struct UpdateMessageSendSucceeded: Codable {
    /// Information about the sent message. Usually only the message identifier, date, and content are changed, but almost all other fields can also change
    internal let message: Message

    /// The previous temporary message identifier
    internal let oldMessageId: Int64

    internal init(
        message: Message,
        oldMessageId: Int64
    ) {
        self.message = message
        self.oldMessageId = oldMessageId
    }
}

/// A message failed to send. Be aware that some messages being sent can be irrecoverably deleted, in which case updateDeleteMessages will be received instead of this update
internal struct UpdateMessageSendFailed: Codable {
    /// An error code
    internal let errorCode: Int

    /// Error message
    internal let errorMessage: String

    /// Contains information about the message which failed to send
    internal let message: Message

    /// The previous temporary message identifier
    internal let oldMessageId: Int64

    internal init(
        errorCode: Int,
        errorMessage: String,
        message: Message,
        oldMessageId: Int64
    ) {
        self.errorCode = errorCode
        self.errorMessage = errorMessage
        self.message = message
        self.oldMessageId = oldMessageId
    }
}

/// The message content has changed
internal struct UpdateMessageContent: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// Message identifier
    internal let messageId: Int64

    /// New message content
    internal let newContent: MessageContent

    internal init(
        chatId: Int64,
        messageId: Int64,
        newContent: MessageContent
    ) {
        self.chatId = chatId
        self.messageId = messageId
        self.newContent = newContent
    }
}

/// A message was edited. Changes in the message content will come in a separate updateMessageContent
internal struct UpdateMessageEdited: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// Point in time (Unix timestamp) when the message was edited
    internal let editDate: Int

    /// Message identifier
    internal let messageId: Int64

    /// New message reply markup; may be null
    internal let replyMarkup: ReplyMarkup?

    internal init(
        chatId: Int64,
        editDate: Int,
        messageId: Int64,
        replyMarkup: ReplyMarkup?
    ) {
        self.chatId = chatId
        self.editDate = editDate
        self.messageId = messageId
        self.replyMarkup = replyMarkup
    }
}

/// The message pinned state was changed
internal struct UpdateMessageIsPinned: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// True, if the message is pinned
    internal let isPinned: Bool

    /// The message identifier
    internal let messageId: Int64

    internal init(
        chatId: Int64,
        isPinned: Bool,
        messageId: Int64
    ) {
        self.chatId = chatId
        self.isPinned = isPinned
        self.messageId = messageId
    }
}

/// The information about interactions with a message has changed
internal struct UpdateMessageInteractionInfo: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// New information about interactions with the message; may be null
    internal let interactionInfo: MessageInteractionInfo?

    /// Message identifier
    internal let messageId: Int64

    internal init(
        chatId: Int64,
        interactionInfo: MessageInteractionInfo?,
        messageId: Int64
    ) {
        self.chatId = chatId
        self.interactionInfo = interactionInfo
        self.messageId = messageId
    }
}

/// The message content was opened. Updates voice note messages to "listened", video note messages to "viewed" and starts the TTL timer for self-destructing messages
internal struct UpdateMessageContentOpened: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// Message identifier
    internal let messageId: Int64

    internal init(
        chatId: Int64,
        messageId: Int64
    ) {
        self.chatId = chatId
        self.messageId = messageId
    }
}

/// A message with an unread mention was read
internal struct UpdateMessageMentionRead: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// Message identifier
    internal let messageId: Int64

    /// The new number of unread mention messages left in the chat
    internal let unreadMentionCount: Int

    internal init(
        chatId: Int64,
        messageId: Int64,
        unreadMentionCount: Int
    ) {
        self.chatId = chatId
        self.messageId = messageId
        self.unreadMentionCount = unreadMentionCount
    }
}

/// A message with a live location was viewed. When the update is received, the application is supposed to update the live location
internal struct UpdateMessageLiveLocationViewed: Codable {
    /// Identifier of the chat with the live location message
    internal let chatId: Int64

    /// Identifier of the message with live location
    internal let messageId: Int64

    internal init(
        chatId: Int64,
        messageId: Int64
    ) {
        self.chatId = chatId
        self.messageId = messageId
    }
}

/// A new chat has been loaded/created. This update is guaranteed to come before the chat identifier is returned to the application. The chat field changes will be reported through separate updates
internal struct UpdateNewChat: Codable {
    /// The chat
    internal let chat: Chat

    internal init(chat: Chat) {
        self.chat = chat
    }
}

/// The title of a chat was changed
internal struct UpdateChatTitle: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// The new chat title
    internal let title: String

    internal init(
        chatId: Int64,
        title: String
    ) {
        self.chatId = chatId
        self.title = title
    }
}

/// A chat photo was changed
internal struct UpdateChatPhoto: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// The new chat photo; may be null
    internal let photo: ChatPhotoInfo?

    internal init(
        chatId: Int64,
        photo: ChatPhotoInfo?
    ) {
        self.chatId = chatId
        self.photo = photo
    }
}

/// Chat permissions was changed
internal struct UpdateChatPermissions: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// The new chat permissions
    internal let permissions: ChatPermissions

    internal init(
        chatId: Int64,
        permissions: ChatPermissions
    ) {
        self.chatId = chatId
        self.permissions = permissions
    }
}

/// The last message of a chat was changed. If last_message is null, then the last message in the chat became unknown. Some new unknown messages might be added to the chat in this case
internal struct UpdateChatLastMessage: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// The new last message in the chat; may be null
    internal let lastMessage: Message?

    /// The new chat positions in the chat lists
    internal let positions: [ChatPosition]

    internal init(
        chatId: Int64,
        lastMessage: Message?,
        positions: [ChatPosition]
    ) {
        self.chatId = chatId
        self.lastMessage = lastMessage
        self.positions = positions
    }
}

/// The position of a chat in a chat list has changed. Instead of this update updateChatLastMessage or updateChatDraftMessage might be sent
internal struct UpdateChatPosition: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// New chat position. If new order is 0, then the chat needs to be removed from the list
    internal let position: ChatPosition

    internal init(
        chatId: Int64,
        position: ChatPosition
    ) {
        self.chatId = chatId
        self.position = position
    }
}

/// A chat was marked as unread or was read
internal struct UpdateChatIsMarkedAsUnread: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// New value of is_marked_as_unread
    internal let isMarkedAsUnread: Bool

    internal init(
        chatId: Int64,
        isMarkedAsUnread: Bool
    ) {
        self.chatId = chatId
        self.isMarkedAsUnread = isMarkedAsUnread
    }
}

/// A chat was blocked or unblocked
internal struct UpdateChatIsBlocked: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// New value of is_blocked
    internal let isBlocked: Bool

    internal init(
        chatId: Int64,
        isBlocked: Bool
    ) {
        self.chatId = chatId
        self.isBlocked = isBlocked
    }
}

/// A chat's has_scheduled_messages field has changed
internal struct UpdateChatHasScheduledMessages: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// New value of has_scheduled_messages
    internal let hasScheduledMessages: Bool

    internal init(
        chatId: Int64,
        hasScheduledMessages: Bool
    ) {
        self.chatId = chatId
        self.hasScheduledMessages = hasScheduledMessages
    }
}

/// A chat voice chat state has changed
internal struct UpdateChatVoiceChat: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// New value of voice_chat
    internal let voiceChat: VoiceChat

    internal init(
        chatId: Int64,
        voiceChat: VoiceChat
    ) {
        self.chatId = chatId
        self.voiceChat = voiceChat
    }
}

/// The value of the default disable_notification parameter, used when a message is sent to the chat, was changed
internal struct UpdateChatDefaultDisableNotification: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// The new default_disable_notification value
    internal let defaultDisableNotification: Bool

    internal init(
        chatId: Int64,
        defaultDisableNotification: Bool
    ) {
        self.chatId = chatId
        self.defaultDisableNotification = defaultDisableNotification
    }
}

/// Incoming messages were read or number of unread messages has been changed
internal struct UpdateChatReadInbox: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// Identifier of the last read incoming message
    internal let lastReadInboxMessageId: Int64

    /// The number of unread messages left in the chat
    internal let unreadCount: Int

    internal init(
        chatId: Int64,
        lastReadInboxMessageId: Int64,
        unreadCount: Int
    ) {
        self.chatId = chatId
        self.lastReadInboxMessageId = lastReadInboxMessageId
        self.unreadCount = unreadCount
    }
}

/// Outgoing messages were read
internal struct UpdateChatReadOutbox: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// Identifier of last read outgoing message
    internal let lastReadOutboxMessageId: Int64

    internal init(
        chatId: Int64,
        lastReadOutboxMessageId: Int64
    ) {
        self.chatId = chatId
        self.lastReadOutboxMessageId = lastReadOutboxMessageId
    }
}

/// The chat unread_mention_count has changed
internal struct UpdateChatUnreadMentionCount: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// The number of unread mention messages left in the chat
    internal let unreadMentionCount: Int

    internal init(
        chatId: Int64,
        unreadMentionCount: Int
    ) {
        self.chatId = chatId
        self.unreadMentionCount = unreadMentionCount
    }
}

/// Notification settings for a chat were changed
internal struct UpdateChatNotificationSettings: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// The new notification settings
    internal let notificationSettings: ChatNotificationSettings

    internal init(
        chatId: Int64,
        notificationSettings: ChatNotificationSettings
    ) {
        self.chatId = chatId
        self.notificationSettings = notificationSettings
    }
}

/// Notification settings for some type of chats were updated
internal struct UpdateScopeNotificationSettings: Codable {
    /// The new notification settings
    internal let notificationSettings: ScopeNotificationSettings

    /// Types of chats for which notification settings were updated
    internal let scope: NotificationSettingsScope

    internal init(
        notificationSettings: ScopeNotificationSettings,
        scope: NotificationSettingsScope
    ) {
        self.notificationSettings = notificationSettings
        self.scope = scope
    }
}

/// The message Time To Live setting for a chat was changed
internal struct UpdateChatMessageTtlSetting: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// New value of message_ttl_setting
    internal let messageTtlSetting: Int

    internal init(
        chatId: Int64,
        messageTtlSetting: Int
    ) {
        self.chatId = chatId
        self.messageTtlSetting = messageTtlSetting
    }
}

/// The chat action bar was changed
internal struct UpdateChatActionBar: Codable {
    /// The new value of the action bar; may be null
    internal let actionBar: ChatActionBar?

    /// Chat identifier
    internal let chatId: Int64

    internal init(
        actionBar: ChatActionBar?,
        chatId: Int64
    ) {
        self.actionBar = actionBar
        self.chatId = chatId
    }
}

/// The default chat reply markup was changed. Can occur because new messages with reply markup were received or because an old reply markup was hidden by the user
internal struct UpdateChatReplyMarkup: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// Identifier of the message from which reply markup needs to be used; 0 if there is no default custom reply markup in the chat
    internal let replyMarkupMessageId: Int64

    internal init(
        chatId: Int64,
        replyMarkupMessageId: Int64
    ) {
        self.chatId = chatId
        self.replyMarkupMessageId = replyMarkupMessageId
    }
}

/// A chat draft has changed. Be aware that the update may come in the currently opened chat but with old content of the draft. If the user has changed the content of the draft, this update shouldn't be applied
internal struct UpdateChatDraftMessage: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// The new draft message; may be null
    internal let draftMessage: DraftMessage?

    /// The new chat positions in the chat lists
    internal let positions: [ChatPosition]

    internal init(
        chatId: Int64,
        draftMessage: DraftMessage?,
        positions: [ChatPosition]
    ) {
        self.chatId = chatId
        self.draftMessage = draftMessage
        self.positions = positions
    }
}

/// The list of chat filters or a chat filter has changed
internal struct UpdateChatFilters: Codable {
    /// The new list of chat filters
    internal let chatFilters: [ChatFilterInfo]

    internal init(chatFilters: [ChatFilterInfo]) {
        self.chatFilters = chatFilters
    }
}

/// The number of online group members has changed. This update with non-zero count is sent only for currently opened chats. There is no guarantee that it will be sent just after the count has changed
internal struct UpdateChatOnlineMemberCount: Codable {
    /// Identifier of the chat
    internal let chatId: Int64

    /// New number of online members in the chat, or 0 if unknown
    internal let onlineMemberCount: Int

    internal init(
        chatId: Int64,
        onlineMemberCount: Int
    ) {
        self.chatId = chatId
        self.onlineMemberCount = onlineMemberCount
    }
}

/// A notification was changed
internal struct UpdateNotification: Codable {
    /// Changed notification
    internal let notification: Notification

    /// Unique notification group identifier
    internal let notificationGroupId: Int

    internal init(
        notification: Notification,
        notificationGroupId: Int
    ) {
        self.notification = notification
        self.notificationGroupId = notificationGroupId
    }
}

/// A list of active notifications in a notification group has changed
internal struct UpdateNotificationGroup: Codable {
    /// List of added group notifications, sorted by notification ID
    internal let addedNotifications: [Notification]

    /// Identifier of a chat to which all notifications in the group belong
    internal let chatId: Int64

    /// True, if the notifications should be shown without sound
    internal let isSilent: Bool

    /// Unique notification group identifier
    internal let notificationGroupId: Int

    /// Chat identifier, which notification settings must be applied to the added notifications
    internal let notificationSettingsChatId: Int64

    /// Identifiers of removed group notifications, sorted by notification ID
    internal let removedNotificationIds: [Int]

    /// Total number of unread notifications in the group, can be bigger than number of active notifications
    internal let totalCount: Int

    /// New type of the notification group
    internal let type: NotificationGroupType

    internal init(
        addedNotifications: [Notification],
        chatId: Int64,
        isSilent: Bool,
        notificationGroupId: Int,
        notificationSettingsChatId: Int64,
        removedNotificationIds: [Int],
        totalCount: Int,
        type: NotificationGroupType
    ) {
        self.addedNotifications = addedNotifications
        self.chatId = chatId
        self.isSilent = isSilent
        self.notificationGroupId = notificationGroupId
        self.notificationSettingsChatId = notificationSettingsChatId
        self.removedNotificationIds = removedNotificationIds
        self.totalCount = totalCount
        self.type = type
    }
}

/// Contains active notifications that was shown on previous application launches. This update is sent only if the message database is used. In that case it comes once before any updateNotification and updateNotificationGroup update
internal struct UpdateActiveNotifications: Codable {
    /// Lists of active notification groups
    internal let groups: [NotificationGroup]

    internal init(groups: [NotificationGroup]) {
        self.groups = groups
    }
}

/// Describes whether there are some pending notification updates. Can be used to prevent application from killing, while there are some pending notifications
internal struct UpdateHavePendingNotifications: Codable {
    /// True, if there are some delayed notification updates, which will be sent soon
    internal let haveDelayedNotifications: Bool

    /// True, if there can be some yet unreceived notifications, which are being fetched from the server
    internal let haveUnreceivedNotifications: Bool

    internal init(
        haveDelayedNotifications: Bool,
        haveUnreceivedNotifications: Bool
    ) {
        self.haveDelayedNotifications = haveDelayedNotifications
        self.haveUnreceivedNotifications = haveUnreceivedNotifications
    }
}

/// Some messages were deleted
internal struct UpdateDeleteMessages: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// True, if the messages are deleted only from the cache and can possibly be retrieved again in the future
    internal let fromCache: Bool

    /// True, if the messages are permanently deleted by a user (as opposed to just becoming inaccessible)
    internal let isPermanent: Bool

    /// Identifiers of the deleted messages
    internal let messageIds: [Int64]

    internal init(
        chatId: Int64,
        fromCache: Bool,
        isPermanent: Bool,
        messageIds: [Int64]
    ) {
        self.chatId = chatId
        self.fromCache = fromCache
        self.isPermanent = isPermanent
        self.messageIds = messageIds
    }
}

/// User activity in the chat has changed
internal struct UpdateUserChatAction: Codable {
    /// The action description
    internal let action: ChatAction

    /// Chat identifier
    internal let chatId: Int64

    /// If not 0, a message thread identifier in which the action was performed
    internal let messageThreadId: Int64

    /// Identifier of a user performing an action
    internal let userId: Int

    internal init(
        action: ChatAction,
        chatId: Int64,
        messageThreadId: Int64,
        userId: Int
    ) {
        self.action = action
        self.chatId = chatId
        self.messageThreadId = messageThreadId
        self.userId = userId
    }
}

/// The user went online or offline
internal struct UpdateUserStatus: Codable {
    /// New status of the user
    internal let status: UserStatus

    /// User identifier
    internal let userId: Int

    internal init(
        status: UserStatus,
        userId: Int
    ) {
        self.status = status
        self.userId = userId
    }
}

/// Some data of a user has changed. This update is guaranteed to come before the user identifier is returned to the application
internal struct UpdateUser: Codable {
    /// New data about the user
    internal let user: User

    internal init(user: User) {
        self.user = user
    }
}

/// Some data of a basic group has changed. This update is guaranteed to come before the basic group identifier is returned to the application
internal struct UpdateBasicGroup: Codable {
    /// New data about the group
    internal let basicGroup: BasicGroup

    internal init(basicGroup: BasicGroup) {
        self.basicGroup = basicGroup
    }
}

/// Some data of a supergroup or a channel has changed. This update is guaranteed to come before the supergroup identifier is returned to the application
internal struct UpdateSupergroup: Codable {
    /// New data about the supergroup
    internal let supergroup: Supergroup

    internal init(supergroup: Supergroup) {
        self.supergroup = supergroup
    }
}

/// Some data of a secret chat has changed. This update is guaranteed to come before the secret chat identifier is returned to the application
internal struct UpdateSecretChat: Codable {
    /// New data about the secret chat
    internal let secretChat: SecretChat

    internal init(secretChat: SecretChat) {
        self.secretChat = secretChat
    }
}

/// Some data from userFullInfo has been changed
internal struct UpdateUserFullInfo: Codable {
    /// New full information about the user
    internal let userFullInfo: UserFullInfo

    /// User identifier
    internal let userId: Int

    internal init(
        userFullInfo: UserFullInfo,
        userId: Int
    ) {
        self.userFullInfo = userFullInfo
        self.userId = userId
    }
}

/// Some data from basicGroupFullInfo has been changed
internal struct UpdateBasicGroupFullInfo: Codable {
    /// New full information about the group
    internal let basicGroupFullInfo: BasicGroupFullInfo

    /// Identifier of a basic group
    internal let basicGroupId: Int

    internal init(
        basicGroupFullInfo: BasicGroupFullInfo,
        basicGroupId: Int
    ) {
        self.basicGroupFullInfo = basicGroupFullInfo
        self.basicGroupId = basicGroupId
    }
}

/// Some data from supergroupFullInfo has been changed
internal struct UpdateSupergroupFullInfo: Codable {
    /// New full information about the supergroup
    internal let supergroupFullInfo: SupergroupFullInfo

    /// Identifier of the supergroup or channel
    internal let supergroupId: Int

    internal init(
        supergroupFullInfo: SupergroupFullInfo,
        supergroupId: Int
    ) {
        self.supergroupFullInfo = supergroupFullInfo
        self.supergroupId = supergroupId
    }
}

/// Service notification from the server. Upon receiving this the application must show a popup with the content of the notification
internal struct UpdateServiceNotification: Codable {
    /// Notification content
    internal let content: MessageContent

    /// Notification type. If type begins with "AUTH_KEY_DROP_", then two buttons "Cancel" and "Log out" should be shown under notification; if user presses the second, all local data should be destroyed using Destroy method
    internal let type: String

    internal init(
        content: MessageContent,
        type: String
    ) {
        self.content = content
        self.type = type
    }
}

/// Information about a file was updated
internal struct UpdateFile: Codable {
    /// New data about the file
    internal let file: File

    internal init(file: File) {
        self.file = file
    }
}

/// The file generation process needs to be started by the application
internal struct UpdateFileGenerationStart: Codable {
    /// String specifying the conversion applied to the original file. If conversion is "#url#" than original_path contains an HTTP/HTTPS URL of a file, which should be downloaded by the application
    internal let conversion: String

    /// The path to a file that should be created and where the new file should be generated
    internal let destinationPath: String

    /// Unique identifier for the generation process
    internal let generationId: TdInt64

    /// The path to a file from which a new file is generated; may be empty
    internal let originalPath: String

    internal init(
        conversion: String,
        destinationPath: String,
        generationId: TdInt64,
        originalPath: String
    ) {
        self.conversion = conversion
        self.destinationPath = destinationPath
        self.generationId = generationId
        self.originalPath = originalPath
    }
}

/// File generation is no longer needed
internal struct UpdateFileGenerationStop: Codable {
    /// Unique identifier for the generation process
    internal let generationId: TdInt64

    internal init(generationId: TdInt64) {
        self.generationId = generationId
    }
}

/// New call was created or information about a call was updated
internal struct UpdateCall: Codable {
    /// New data about a call
    internal let call: Call

    internal init(call: Call) {
        self.call = call
    }
}

/// Information about a group call was updated
internal struct UpdateGroupCall: Codable {
    /// New data about a group call
    internal let groupCall: GroupCall

    internal init(groupCall: GroupCall) {
        self.groupCall = groupCall
    }
}

/// Information about a group call participant was changed. The updates are sent only after the group call is received through getGroupCall and only if the call is joined or being joined
internal struct UpdateGroupCallParticipant: Codable {
    /// Identifier of group call
    internal let groupCallId: Int

    /// New data about a participant
    internal let participant: GroupCallParticipant

    internal init(
        groupCallId: Int,
        participant: GroupCallParticipant
    ) {
        self.groupCallId = groupCallId
        self.participant = participant
    }
}

/// New call signaling data arrived
internal struct UpdateNewCallSignalingData: Codable {
    /// The call identifier
    internal let callId: Int

    /// The data
    internal let data: Data

    internal init(
        callId: Int,
        data: Data
    ) {
        self.callId = callId
        self.data = data
    }
}

/// Some privacy setting rules have been changed
internal struct UpdateUserPrivacySettingRules: Codable {
    /// New privacy rules
    internal let rules: UserPrivacySettingRules

    /// The privacy setting
    internal let setting: UserPrivacySetting

    internal init(
        rules: UserPrivacySettingRules,
        setting: UserPrivacySetting
    ) {
        self.rules = rules
        self.setting = setting
    }
}

/// Number of unread messages in a chat list has changed. This update is sent only if the message database is used
internal struct UpdateUnreadMessageCount: Codable {
    /// The chat list with changed number of unread messages
    internal let chatList: ChatList

    /// Total number of unread messages
    internal let unreadCount: Int

    /// Total number of unread messages in unmuted chats
    internal let unreadUnmutedCount: Int

    internal init(
        chatList: ChatList,
        unreadCount: Int,
        unreadUnmutedCount: Int
    ) {
        self.chatList = chatList
        self.unreadCount = unreadCount
        self.unreadUnmutedCount = unreadUnmutedCount
    }
}

/// Number of unread chats, i.e. with unread messages or marked as unread, has changed. This update is sent only if the message database is used
internal struct UpdateUnreadChatCount: Codable {
    /// The chat list with changed number of unread messages
    internal let chatList: ChatList

    /// Total number of chats marked as unread
    internal let markedAsUnreadCount: Int

    /// Total number of unmuted chats marked as unread
    internal let markedAsUnreadUnmutedCount: Int

    /// Approximate total number of chats in the chat list
    internal let totalCount: Int

    /// Total number of unread chats
    internal let unreadCount: Int

    /// Total number of unread unmuted chats
    internal let unreadUnmutedCount: Int

    internal init(
        chatList: ChatList,
        markedAsUnreadCount: Int,
        markedAsUnreadUnmutedCount: Int,
        totalCount: Int,
        unreadCount: Int,
        unreadUnmutedCount: Int
    ) {
        self.chatList = chatList
        self.markedAsUnreadCount = markedAsUnreadCount
        self.markedAsUnreadUnmutedCount = markedAsUnreadUnmutedCount
        self.totalCount = totalCount
        self.unreadCount = unreadCount
        self.unreadUnmutedCount = unreadUnmutedCount
    }
}

/// An option changed its value
internal struct UpdateOption: Codable {
    /// The option name
    internal let name: String

    /// The new option value
    internal let value: OptionValue

    internal init(
        name: String,
        value: OptionValue
    ) {
        self.name = name
        self.value = value
    }
}

/// A sticker set has changed
internal struct UpdateStickerSet: Codable {
    /// The sticker set
    internal let stickerSet: StickerSet

    internal init(stickerSet: StickerSet) {
        self.stickerSet = stickerSet
    }
}

/// The list of installed sticker sets was updated
internal struct UpdateInstalledStickerSets: Codable {
    /// True, if the list of installed mask sticker sets was updated
    internal let isMasks: Bool

    /// The new list of installed ordinary sticker sets
    internal let stickerSetIds: [TdInt64]

    internal init(
        isMasks: Bool,
        stickerSetIds: [TdInt64]
    ) {
        self.isMasks = isMasks
        self.stickerSetIds = stickerSetIds
    }
}

/// The list of trending sticker sets was updated or some of them were viewed
internal struct UpdateTrendingStickerSets: Codable {
    /// The prefix of the list of trending sticker sets with the newest trending sticker sets
    internal let stickerSets: StickerSets

    internal init(stickerSets: StickerSets) {
        self.stickerSets = stickerSets
    }
}

/// The list of recently used stickers was updated
internal struct UpdateRecentStickers: Codable {
    /// True, if the list of stickers attached to photo or video files was updated, otherwise the list of sent stickers is updated
    internal let isAttached: Bool

    /// The new list of file identifiers of recently used stickers
    internal let stickerIds: [Int]

    internal init(
        isAttached: Bool,
        stickerIds: [Int]
    ) {
        self.isAttached = isAttached
        self.stickerIds = stickerIds
    }
}

/// The list of favorite stickers was updated
internal struct UpdateFavoriteStickers: Codable {
    /// The new list of file identifiers of favorite stickers
    internal let stickerIds: [Int]

    internal init(stickerIds: [Int]) {
        self.stickerIds = stickerIds
    }
}

/// The list of saved animations was updated
internal struct UpdateSavedAnimations: Codable {
    /// The new list of file identifiers of saved animations
    internal let animationIds: [Int]

    internal init(animationIds: [Int]) {
        self.animationIds = animationIds
    }
}

/// The selected background has changed
internal struct UpdateSelectedBackground: Codable {
    /// The new selected background; may be null
    internal let background: Background?

    /// True, if background for dark theme has changed
    internal let forDarkTheme: Bool

    internal init(
        background: Background?,
        forDarkTheme: Bool
    ) {
        self.background = background
        self.forDarkTheme = forDarkTheme
    }
}

/// Some language pack strings have been updated
internal struct UpdateLanguagePackStrings: Codable {
    /// Identifier of the updated language pack
    internal let languagePackId: String

    /// Localization target to which the language pack belongs
    internal let localizationTarget: String

    /// List of changed language pack strings
    internal let strings: [LanguagePackString]

    internal init(
        languagePackId: String,
        localizationTarget: String,
        strings: [LanguagePackString]
    ) {
        self.languagePackId = languagePackId
        self.localizationTarget = localizationTarget
        self.strings = strings
    }
}

/// The connection state has changed. This update must be used only to show a human-readable description of the connection state
internal struct UpdateConnectionState: Codable {
    /// The new connection state
    internal let state: ConnectionState

    internal init(state: ConnectionState) {
        self.state = state
    }
}

/// New terms of service must be accepted by the user. If the terms of service are declined, then the deleteAccount method should be called with the reason "Decline ToS update"
internal struct UpdateTermsOfService: Codable {
    /// The new terms of service
    internal let termsOfService: TermsOfService

    /// Identifier of the terms of service
    internal let termsOfServiceId: String

    internal init(
        termsOfService: TermsOfService,
        termsOfServiceId: String
    ) {
        self.termsOfService = termsOfService
        self.termsOfServiceId = termsOfServiceId
    }
}

/// The list of users nearby has changed. The update is guaranteed to be sent only 60 seconds after a successful searchChatsNearby request
internal struct UpdateUsersNearby: Codable {
    /// The new list of users nearby
    internal let usersNearby: [ChatNearby]

    internal init(usersNearby: [ChatNearby]) {
        self.usersNearby = usersNearby
    }
}

/// The list of supported dice emojis has changed
internal struct UpdateDiceEmojis: Codable {
    /// The new list of supported dice emojis
    internal let emojis: [String]

    internal init(emojis: [String]) {
        self.emojis = emojis
    }
}

/// The parameters of animation search through GetOption("animation_search_bot_username") bot has changed
internal struct UpdateAnimationSearchParameters: Codable {
    /// The new list of emojis suggested for searching
    internal let emojis: [String]

    /// Name of the animation search provider
    internal let provider: String

    internal init(
        emojis: [String],
        provider: String
    ) {
        self.emojis = emojis
        self.provider = provider
    }
}

/// The list of suggested to the user actions has changed
internal struct UpdateSuggestedActions: Codable {
    /// Added suggested actions
    internal let addedActions: [SuggestedAction]

    /// Removed suggested actions
    internal let removedActions: [SuggestedAction]

    internal init(
        addedActions: [SuggestedAction],
        removedActions: [SuggestedAction]
    ) {
        self.addedActions = addedActions
        self.removedActions = removedActions
    }
}

/// A new incoming inline query; for bots only
internal struct UpdateNewInlineQuery: Codable {
    /// Contains information about the type of the chat, from which the query originated; may be null if unknown
    internal let chatType: ChatType?

    /// Unique query identifier
    internal let id: TdInt64

    /// Offset of the first entry to return
    internal let offset: String

    /// Text of the query
    internal let query: String

    /// Identifier of the user who sent the query
    internal let senderUserId: Int

    /// User location; may be null
    internal let userLocation: Location?

    internal init(
        chatType: ChatType?,
        id: TdInt64,
        offset: String,
        query: String,
        senderUserId: Int,
        userLocation: Location?
    ) {
        self.chatType = chatType
        self.id = id
        self.offset = offset
        self.query = query
        self.senderUserId = senderUserId
        self.userLocation = userLocation
    }
}

/// The user has chosen a result of an inline query; for bots only
internal struct UpdateNewChosenInlineResult: Codable {
    /// Identifier of the sent inline message, if known
    internal let inlineMessageId: String

    /// Text of the query
    internal let query: String

    /// Identifier of the chosen result
    internal let resultId: String

    /// Identifier of the user who sent the query
    internal let senderUserId: Int

    /// User location; may be null
    internal let userLocation: Location?

    internal init(
        inlineMessageId: String,
        query: String,
        resultId: String,
        senderUserId: Int,
        userLocation: Location?
    ) {
        self.inlineMessageId = inlineMessageId
        self.query = query
        self.resultId = resultId
        self.senderUserId = senderUserId
        self.userLocation = userLocation
    }
}

/// A new incoming callback query; for bots only
internal struct UpdateNewCallbackQuery: Codable {
    /// Identifier of the chat where the query was sent
    internal let chatId: Int64

    /// Identifier that uniquely corresponds to the chat to which the message was sent
    internal let chatInstance: TdInt64

    /// Unique query identifier
    internal let id: TdInt64

    /// Identifier of the message, from which the query originated
    internal let messageId: Int64

    /// Query payload
    internal let payload: CallbackQueryPayload

    /// Identifier of the user who sent the query
    internal let senderUserId: Int

    internal init(
        chatId: Int64,
        chatInstance: TdInt64,
        id: TdInt64,
        messageId: Int64,
        payload: CallbackQueryPayload,
        senderUserId: Int
    ) {
        self.chatId = chatId
        self.chatInstance = chatInstance
        self.id = id
        self.messageId = messageId
        self.payload = payload
        self.senderUserId = senderUserId
    }
}

/// A new incoming callback query from a message sent via a bot; for bots only
internal struct UpdateNewInlineCallbackQuery: Codable {
    /// An identifier uniquely corresponding to the chat a message was sent to
    internal let chatInstance: TdInt64

    /// Unique query identifier
    internal let id: TdInt64

    /// Identifier of the inline message, from which the query originated
    internal let inlineMessageId: String

    /// Query payload
    internal let payload: CallbackQueryPayload

    /// Identifier of the user who sent the query
    internal let senderUserId: Int

    internal init(
        chatInstance: TdInt64,
        id: TdInt64,
        inlineMessageId: String,
        payload: CallbackQueryPayload,
        senderUserId: Int
    ) {
        self.chatInstance = chatInstance
        self.id = id
        self.inlineMessageId = inlineMessageId
        self.payload = payload
        self.senderUserId = senderUserId
    }
}

/// A new incoming shipping query; for bots only. Only for invoices with flexible price
internal struct UpdateNewShippingQuery: Codable {
    /// Unique query identifier
    internal let id: TdInt64

    /// Invoice payload
    internal let invoicePayload: String

    /// Identifier of the user who sent the query
    internal let senderUserId: Int

    /// User shipping address
    internal let shippingAddress: Address

    internal init(
        id: TdInt64,
        invoicePayload: String,
        senderUserId: Int,
        shippingAddress: Address
    ) {
        self.id = id
        self.invoicePayload = invoicePayload
        self.senderUserId = senderUserId
        self.shippingAddress = shippingAddress
    }
}

/// A new incoming pre-checkout query; for bots only. Contains full information about a checkout
internal struct UpdateNewPreCheckoutQuery: Codable {
    /// Currency for the product price
    internal let currency: String

    /// Unique query identifier
    internal let id: TdInt64

    /// Invoice payload
    internal let invoicePayload: Data

    /// Information about the order; may be null
    internal let orderInfo: OrderInfo?

    /// Identifier of the user who sent the query
    internal let senderUserId: Int

    /// Identifier of a shipping option chosen by the user; may be empty if not applicable
    internal let shippingOptionId: String

    /// Total price for the product, in the smallest units of the currency
    internal let totalAmount: Int64

    internal init(
        currency: String,
        id: TdInt64,
        invoicePayload: Data,
        orderInfo: OrderInfo?,
        senderUserId: Int,
        shippingOptionId: String,
        totalAmount: Int64
    ) {
        self.currency = currency
        self.id = id
        self.invoicePayload = invoicePayload
        self.orderInfo = orderInfo
        self.senderUserId = senderUserId
        self.shippingOptionId = shippingOptionId
        self.totalAmount = totalAmount
    }
}

/// A new incoming event; for bots only
internal struct UpdateNewCustomEvent: Codable {
    /// A JSON-serialized event
    internal let event: String

    internal init(event: String) {
        self.event = event
    }
}

/// A new incoming query; for bots only
internal struct UpdateNewCustomQuery: Codable {
    /// JSON-serialized query data
    internal let data: String

    /// The query identifier
    internal let id: TdInt64

    /// Query timeout
    internal let timeout: Int

    internal init(
        data: String,
        id: TdInt64,
        timeout: Int
    ) {
        self.data = data
        self.id = id
        self.timeout = timeout
    }
}

/// A poll was updated; for bots only
internal struct UpdatePoll: Codable {
    /// New data about the poll
    internal let poll: Poll

    internal init(poll: Poll) {
        self.poll = poll
    }
}

/// A user changed the answer to a poll; for bots only
internal struct UpdatePollAnswer: Codable {
    /// 0-based identifiers of answer options, chosen by the user
    internal let optionIds: [Int]

    /// Unique poll identifier
    internal let pollId: TdInt64

    /// The user, who changed the answer to the poll
    internal let userId: Int

    internal init(
        optionIds: [Int],
        pollId: TdInt64,
        userId: Int
    ) {
        self.optionIds = optionIds
        self.pollId = pollId
        self.userId = userId
    }
}

/// User rights changed in a chat; for bots only
internal struct UpdateChatMember: Codable {
    /// Identifier of the user, changing the rights
    internal let actorUserId: Int

    /// Chat identifier
    internal let chatId: Int64

    /// Point in time (Unix timestamp) when the user rights was changed
    internal let date: Int

    /// If user has joined the chat using an invite link, the invite link; may be null
    internal let inviteLink: ChatInviteLink?

    /// New chat member
    internal let newChatMember: ChatMember

    /// Previous chat member
    internal let oldChatMember: ChatMember

    internal init(
        actorUserId: Int,
        chatId: Int64,
        date: Int,
        inviteLink: ChatInviteLink?,
        newChatMember: ChatMember,
        oldChatMember: ChatMember
    ) {
        self.actorUserId = actorUserId
        self.chatId = chatId
        self.date = date
        self.inviteLink = inviteLink
        self.newChatMember = newChatMember
        self.oldChatMember = oldChatMember
    }
}
