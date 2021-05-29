//
//  StorageStatistics.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains the exact storage usage statistics split by chats and file type
internal struct StorageStatistics: Codable {
    /// Statistics split by chats
    internal let byChat: [StorageStatisticsByChat]

    /// Total number of files
    internal let count: Int

    /// Total size of files
    internal let size: Int64

    internal init(
        byChat: [StorageStatisticsByChat],
        count: Int,
        size: Int64
    ) {
        self.byChat = byChat
        self.count = count
        self.size = size
    }
}
