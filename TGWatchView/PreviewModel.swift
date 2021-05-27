import Combine
import Foundation

#if DEBUG
    extension ChatNotificationSettings {
        static let preview = ChatNotificationSettings(disableMentionNotifications: false, disablePinnedMessageNotifications: false, muteFor: 0, showPreview: false, sound: "", useDefaultDisableMentionNotifications: false, useDefaultDisablePinnedMessageNotifications: false, useDefaultMuteFor: false, useDefaultShowPreview: false, useDefaultSound: false)
    }

    extension ChatPermissions {
        static let preview = ChatPermissions(canAddWebPagePreviews: false, canChangeInfo: false, canInviteUsers: false, canPinMessages: false, canSendMediaMessages: false, canSendMessages: false, canSendOtherMessages: false, canSendPolls: false)
    }

    extension ChatPhotoInfo {
        static func preview(_ filename: String) -> ChatPhotoInfo {
            ChatPhotoInfo(big: .localFile(filename), hasAnimation: false, minithumbnail: nil, small: .localFile(filename))
        }
    }

    extension VoiceChat {
        static let preview = VoiceChat(defaultParticipantId: nil, groupCallId: 0, hasParticipants: false)
    }

    public extension Array where Element == Chat {
        static func preview() -> [Chat] {
            [
                .preview(
                    id: 0,
                    title: "Alicia Torreaux",
                    lastMessage: .preview(
                        id: 1,
                        content: .messageText(.preview("🥰Sticker")),
                        outgoing: false
                    ),
                    photo: .preview("user-avatar.png")
                ),
                .preview(
                    id: 1,
                    title: "Digital Nomads",
                    lastMessage: .preview(
                        id: 1,
                        content: .messageText(.preview("We just reached")),
                        outgoing: false
                    ),
                    unreadCount: 6
                ),
                .preview(
                    id: 3,
                    title: "James",
                    lastMessage: .preview(
                        id: 1,
                        content: .messageText(.preview("I'm good thank you!")),
                        outgoing: false
                    )
                ),
            ]
        }
    }

    public extension Array where Element == Message {
        static func preview() -> [Message] {
            [
                .preview(
                    id: 3,
                    content: .messageLocation(
                        MessageLocation(expiresIn: 0, heading: 0, livePeriod: 0, location: Location(horizontalAccuracy: 0, latitude: 60, longitude: 30), proximityAlertRadius: 0)
                    ),
                    outgoing: true
                ),
                .preview(
                    id: 2,
                    content: .messagePhoto(.withCaption),
                    outgoing: false
                ),
                .preview(
                    id: 1,
                    content: .messageText(.preview("A dog!")),
                    outgoing: true
                ),
                .preview(
                    id: 0,
                    content: .messageText(.preview("Any gift ideas for mom? 🎁")),
                    outgoing: false
                ),
            ]
        }
    }

    extension Message {
        static func preview(id: MessageId, content: MessageContent, outgoing: Bool) -> Message {
            Message(authorSignature: "Alice", canBeDeletedForAllUsers: false, canBeDeletedOnlyForSelf: false, canBeEdited: false, canBeForwarded: false, canGetMessageThread: false, canGetStatistics: false, chatId: 1, containsUnreadMention: false, content: content, date: 0, editDate: 0, forwardInfo: nil, id: id, interactionInfo: nil, isChannelPost: false, isOutgoing: outgoing, isPinned: false, mediaAlbumId: 1, messageThreadId: 1, replyInChatId: 1, replyMarkup: nil, replyToMessageId: .zero, restrictionReason: "", schedulingState: nil, sender: .messageSenderUser(.init(userId: 1)), sendingState: nil, ttl: 0, ttlExpiresIn: 0, viaBotUserId: 0)
        }
    }

    extension Chat {
        static func preview(id: ChatId, title: String, lastMessage: Message?, photo: ChatPhotoInfo? = nil, unreadCount: Int = 0) -> Chat {
            Chat(actionBar: nil, canBeDeletedForAllUsers: false, canBeDeletedOnlyForSelf: false, canBeReported: false, clientData: "", defaultDisableNotification: false, draftMessage: nil, hasScheduledMessages: false, id: id, isBlocked: false, isMarkedAsUnread: false, lastMessage: lastMessage, lastReadInboxMessageId: 0, lastReadOutboxMessageId: 0, messageTtlSetting: 0, notificationSettings: .preview, permissions: .preview, photo: photo, positions: [], replyMarkupMessageId: 0, title: title, type: .chatTypePrivate(.init(userId: 1)), unreadCount: unreadCount, unreadMentionCount: 0, voiceChat: .preview)
        }
    }

    extension File {
        static func localFile(_ filename: String) -> File {
            File(
                expectedSize: 0,
                id: 1,
                local: LocalFile(canBeDeleted: true, canBeDownloaded: true, downloadOffset: 0, downloadedPrefixSize: 0, downloadedSize: 0, isDownloadingActive: false, isDownloadingCompleted: true, path: imagePath(filename)),
                remote: RemoteFile(id: "fileId", isUploadingActive: false, isUploadingCompleted: false, uniqueId: "uniqueId", uploadedSize: 9),
                size: 0
            )
        }

        static let userAvatar = localFile("user-avatar.png")

        static let photo = localFile("Image.png")

        private static func imagePath(_ filename: String) -> String {
            URL(fileURLWithPath: #file)
                .deletingLastPathComponent()
                .appendingPathComponent("Preview Content")
                .appendingPathComponent(filename)
                .path
        }
    }

    public extension User {
        static let profile = User(
            firstName: "Alicia", haveAccess: false, id: 1, isContact: true, isFake: false, isMutualContact: true, isScam: false, isSupport: false, isVerified: true, languageCode: "RU", lastName: "", phoneNumber: "123456789", profilePhoto: ProfilePhoto(big: .userAvatar, hasAnimation: false, id: 0, minithumbnail: nil, small: .userAvatar), restrictionReason: "", status: .userStatusEmpty, type: .userTypeRegular, username: "alice"
        )
    }

    public extension Photo {
        static let photo = Photo(hasStickers: false, minithumbnail: nil, sizes: [
            PhotoSize(height: 240, photo: .photo, progressiveSizes: [], type: "m", width: 320),
        ])
    }

    extension MessageText {
        static func preview(_ text: String) -> MessageText {
            MessageText(text: .preview(text), webPage: nil)
        }
    }

    extension FormattedText {
        static func preview(_ text: String) -> FormattedText {
            FormattedText(entities: [], text: text)
        }
    }

    extension MessagePhoto {
        static let withCaption = MessagePhoto(
            caption: .preview("🛰 Ocean clouds seen from space"), isSecret: false, photo: .photo
        )
    }

    extension MessageVideo {
        static let withCaption = MessageVideo(
            caption: .preview("Text Message"),
            isSecret: false,
            video: Video(duration: 26, fileName: "", hasStickers: false, height: 0, mimeType: "", minithumbnail: nil, supportsStreaming: false, thumbnail: .jpeg, video: .localFile("Thumbnail.jpg"), width: 0)
        )
    }

    extension Thumbnail {
        static let jpeg = Thumbnail(file: .localFile("Thumbnail.jpg"), format: .thumbnailFormatJpeg, height: 0, width: 0)
    }

#endif
