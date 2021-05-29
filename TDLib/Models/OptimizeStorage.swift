//
//  OptimizeStorage.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Optimizes storage usage, i.e. deletes some files and returns new storage usage statistics. Secret thumbnails can't be deleted
internal struct OptimizeStorage: Codable {
    /// If not empty, only files from the given chats are considered. Use 0 as chat identifier to delete files not belonging to any chat (e.g., profile photos)
    internal let chatIds: [Int64]

    /// Same as in getStorageStatistics. Affects only returned statistics
    internal let chatLimit: Int

    /// Limit on the total count of files after deletion. Pass -1 to use the default limit
    internal let count: Int

    /// If not empty, files from the given chats are excluded. Use 0 as chat identifier to exclude all files not belonging to any chat (e.g., profile photos)
    internal let excludeChatIds: [Int64]

    /// If not empty, only files with the given type(s) are considered. By default, all types except thumbnails, profile photos, stickers and wallpapers are deleted
    internal let fileTypes: [FileType]

    /// The amount of time after the creation of a file during which it can't be deleted, in seconds. Pass -1 to use the default value
    internal let immunityDelay: Int

    /// Pass true if statistics about the files that were deleted must be returned instead of the whole storage usage statistics. Affects only returned statistics
    internal let returnDeletedFileStatistics: Bool

    /// Limit on the total size of files after deletion. Pass -1 to use the default limit
    internal let size: Int64

    /// Limit on the time that has passed since the last time a file was accessed (or creation time for some filesystems). Pass -1 to use the default limit
    internal let ttl: Int

    internal init(
        chatIds: [Int64],
        chatLimit: Int,
        count: Int,
        excludeChatIds: [Int64],
        fileTypes: [FileType],
        immunityDelay: Int,
        returnDeletedFileStatistics: Bool,
        size: Int64,
        ttl: Int
    ) {
        self.chatIds = chatIds
        self.chatLimit = chatLimit
        self.count = count
        self.excludeChatIds = excludeChatIds
        self.fileTypes = fileTypes
        self.immunityDelay = immunityDelay
        self.returnDeletedFileStatistics = returnDeletedFileStatistics
        self.size = size
        self.ttl = ttl
    }
}
