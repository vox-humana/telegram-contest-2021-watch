//
//  StorageStatisticsByChat.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains the storage usage statistics for a specific chat
internal struct StorageStatisticsByChat: Codable {
    /// Statistics split by file types
    internal let byFileType: [StorageStatisticsByFileType]

    /// Chat identifier; 0 if none
    internal let chatId: Int64

    /// Total number of files in the chat
    internal let count: Int

    /// Total size of the files in the chat
    internal let size: Int64

    internal init(
        byFileType: [StorageStatisticsByFileType],
        chatId: Int64,
        count: Int,
        size: Int64
    ) {
        self.byFileType = byFileType
        self.chatId = chatId
        self.count = count
        self.size = size
    }
}
