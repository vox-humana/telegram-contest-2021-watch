import Combine

// Based on https://github.com/tdlib/td/blob/9293f07464276d58974164e41a4bb57d3362a258/example/java/org/drinkless/tdlib/example/Example.java#L235

final class ChatListService {
    let chatListSignal = CurrentValueSubject<[Chat], Never>([])

    private let api: TdApi
    private var mainChatList: [OrderedChat] = []
    private var chats: [Int64: Chat] = [:]

    private var chatIcons: [Int: ChatId] = [:]

    init(api: TdApi) {
        self.api = api
    }

    func process(update: Update) {
        switch update {
        // CHAT
        case let .updateNewChat(state):
            let chat = state.chat
            chats[chat.id] = chat
            setChatOrder(chat, chat.positions)
            notifyChats()

        case let .updateChatTitle(state):
            chats[state.chatId]?.title = state.title
            notifyChats()

        case let .updateChatPhoto(state):
            chats[state.chatId]?.photo = state.photo
            notifyChats()

        case let .updateChatLastMessage(state):
            if var chat = chats[state.chatId] {
                chat.lastMessage = state.lastMessage
                chats[state.chatId] = chat
                setChatOrder(chat, state.positions)
                notifyChats()
            }

        case let .updateChatPosition(state):
            if let chat = chats[state.chatId] {
                setChatOrder(chat, [state.position])
                notifyChats()
            }

        case let .updateChatReadInbox(state):
            if var chat = chats[state.chatId] {
                chat.lastReadInboxMessageId = state.lastReadInboxMessageId
                chat.unreadCount = state.unreadCount
                chats[state.chatId] = chat
                notifyChats()
            }

        case let .updateChatReadOutbox(state):
            chats[state.chatId]?.lastReadOutboxMessageId = state.lastReadOutboxMessageId
            // TODO: unread for chat cell? notifyChats()

        case let .updateChatUnreadMentionCount(state):
            if var chat = chats[state.chatId] {
                chat.unreadMentionCount = state.unreadMentionCount
                chats[state.chatId] = chat
            }
            notifyChats()

        case let .updateMessageMentionRead(state):
            chats[state.chatId]?.unreadMentionCount = state.unreadMentionCount
            notifyChats()

        case .updateChatReplyMarkup:
            break

        case let .updateChatDraftMessage(state):
            if var chat = chats[state.chatId] {
                chat.draftMessage = state.draftMessage
                chats[state.chatId] = chat
                setChatOrder(chat, state.positions)
                notifyChats()
            }

        case .updateChatNotificationSettings:
            break

        case .updateChatDefaultDisableNotification:
            break

        case let .updateChatIsMarkedAsUnread(state):
            if var chat = chats[state.chatId] {
                chat.isMarkedAsUnread = state.isMarkedAsUnread
                chats[state.chatId] = chat
            }

        // ICON
        case let .updateFile(state):
            let file = state.file
            guard let chatId = chatIcons[file.id] else {
                logger.assert("Can't find chat for download \(file.id)")
                break
            }
            chats[chatId]?.photo?.small = state.file
            notifyChats()

        default:
            break
        }
    }

    func requestMainChatList() {
        let chunkSize = 20
        logger.debug("getChats....\(mainChatList)")

        let offsetChatId: ChatId
        let offsetOrder: TdInt64
        if !mainChatList.isEmpty {
            let last = mainChatList.last!
            offsetChatId = last.chatId
            offsetOrder = last.position.order
        } else {
            offsetChatId = 0
            offsetOrder = TdInt64.max
        }

        // https://core.telegram.org/tdlib/getting-started#getting-the-lists-of-chats
        try! api.getChats(chatList: .chatListMain, limit: chunkSize, offsetChatId: offsetChatId, offsetOrder: offsetOrder) { [weak self] response in
            guard let self = self else { return }

            guard let chats = try? response.get() else {
                logger.assert("got error")
                return
            }

            let chatIds: [ChatId] = chats.chatIds
            if chatIds.isEmpty {
                logger.debug("getChats done \(self.mainChatList.count) total: \(chats.totalCount)")
                return
            }

            logger.debug("getChats more \(self.mainChatList.count) total: \(chats.totalCount)")
            self.requestMainChatList()
        }
    }

    private func setChatOrder(_ chat: Chat, _ positions: [ChatPosition]) {
        var chatModel = chat
        for position in positions {
            if case .chatListMain = position.list, let idx = mainChatList.firstIndex(where: { $0.chatId == chat.id }) {
                mainChatList.remove(at: idx)
            }
        }
        chatModel.positions = positions
        chats[chatModel.id] = chatModel
        for position in positions {
            if case .chatListMain = position.list {
                mainChatList.append(OrderedChat(chatId: chat.id, position: position))
            }
        }
        mainChatList.sort()
    }

    private func notifyChats() {
        let chatList = mainChatList.compactMap {
            self.chats[$0.chatId]
        }
        logger.debug("Sending \(chatList.count) of \(chats.count)")
        chatListSignal.send(chatList)
    }
}

extension ChatListService: FileLoader {
    func downloadPhoto(for chat: Chat) {
        guard let file = chat.photo?.small, !file.local.isDownloadingCompleted else {
            return
        }

        logger.debug("Start download \(file.id)")
        chatIcons[file.id] = chat.id

        let chatAvatarsDownloadPriority = 1 // [1..32]
        try? api.downloadFile(fileId: file.id, limit: 0, offset: 0, priority: chatAvatarsDownloadPriority, synchronous: false) {
            logger.debug($0)
        }
    }
}

private struct OrderedChat: Comparable {
    let chatId: ChatId
    let position: ChatPosition

    static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.position.order > rhs.position.order
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.chatId == rhs.chatId && lhs.position.order == rhs.position.order
    }
}
