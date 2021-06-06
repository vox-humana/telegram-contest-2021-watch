import Combine
import Foundation
import TGWatchUI // TODO: extract model

// Based on https://github.com/tdlib/td/blob/9293f07464276d58974164e41a4bb57d3362a258/example/java/org/drinkless/tdlib/example/Example.java#L235

final class TGChatListService {
    private let chatListSubject = CurrentValueSubject<[Chat], Never>([])
    private let api: TdApi
    private let list: ChatList
    private var chatList: [OrderedChat] = []
    private var chats: [Int64: Chat] = [:]

    private var chatIcons: [Int: ChatId] = [:]
    private let subscriptionQueue = DispatchQueue(label: "chat-list-queue")

    init(api: TdApi, list: ChatList) {
        self.api = api
        self.list = list
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
            if chats[state.chatId] != nil {
                chats[state.chatId]?.title = state.title
                notifyChats()
            }

        case let .updateChatPhoto(state):
            if chats[state.chatId] != nil {
                chats[state.chatId]?.photo = state.photo
                notifyChats()
            }

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
                notifyChats()
            }

        case let .updateMessageMentionRead(state):
            if chats[state.chatId] != nil {
                chats[state.chatId]?.unreadMentionCount = state.unreadMentionCount
                notifyChats()
            }

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
                logger.debug("Can't find chat for download \(file.id) for \(list)")
                break
            }
            chats[chatId]?.photo?.small = state.file
            notifyChats()

        default:
            break
        }
    }

    private func setChatOrder(_ chat: Chat, _ positions: [ChatPosition]) {
        var chatState = chat
        for position in positions {
            if position.list == list, let idx = chatList.firstIndex(where: { $0.chatId == chat.id }) {
                chatList.remove(at: idx)
            }
        }
        chatState.positions = positions
        chats[chatState.id] = chatState
        for position in positions {
            if position.list == list {
                chatList.append(OrderedChat(chatId: chat.id, position: position))
            }
        }
        chatList.sort()
    }

    private func notifyChats() {
        let chatList = chatList.compactMap {
            self.chats[$0.chatId]
        }
        guard !chatList.isEmpty else {
            return
        }
        // logger.debug("Sending \(chatList.count) of \(chats.count)")
        chatListSubject.send(chatList)
    }
}

extension ChatList: Equatable {
    public static func == (lhs: ChatList, rhs: ChatList) -> Bool {
        switch (lhs, rhs) {
        case (.chatListMain, .chatListMain):
            return true
        case (.chatListArchive, .chatListArchive):
            return true
        case let (.chatListFilter(lhsFilter), .chatListFilter(rhsFilter)):
            return lhsFilter.chatFilterId == rhsFilter.chatFilterId
        default:
            return false
        }
    }
}

extension TGChatListService: ChatListService {
    var chatListSignal: AnyPublisher<[Chat], Never> {
        chatListSubject
            .throttle(for: .seconds(0.5), scheduler: subscriptionQueue, latest: true)
            .eraseToAnyPublisher()
    }

    func requestChatList() {
        let chunkSize = 20
        logger.debug("getChats... \(chatList.count)")

        let offsetChatId: ChatId
        let offsetOrder: TdInt64
        if !chatList.isEmpty {
            let last = chatList.last!
            offsetChatId = last.chatId
            offsetOrder = last.position.order
        } else {
            offsetChatId = 0
            offsetOrder = TdInt64.max
        }

        // https://core.telegram.org/tdlib/getting-started#getting-the-lists-of-chats
        try! api.getChats(chatList: list, limit: chunkSize, offsetChatId: offsetChatId, offsetOrder: offsetOrder) { [weak self] response in
            guard let self = self else { return }

            guard let chats = try? response.get() else {
                logger.assert("got error")
                return
            }

            let chatIds: [ChatId] = chats.chatIds
            if chatIds.isEmpty {
                logger.debug("getChats done \(self.chatList.count) total: \(chats.totalCount)")
                return
            }

            logger.debug("getChats more \(self.chatList.count) total: \(chats.totalCount)")
            self.requestChatList()
        }
    }

    func downloadPhoto(for chat: ChatState) {
        guard let file = chat.photo?.thumbnail?.file, !file.downloaded else {
            return
        }

        logger.debug("Start download \(file.fileId)")
        chatIcons[file.fileId] = chat.id

        let chatAvatarsDownloadPriority = 1 // [1..32]
        try? api.downloadFile(fileId: file.fileId, limit: 0, offset: 0, priority: chatAvatarsDownloadPriority, synchronous: false) {
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
