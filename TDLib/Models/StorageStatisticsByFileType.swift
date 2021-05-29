//
//  StorageStatisticsByFileType.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains the storage usage statistics for a specific file type
internal struct StorageStatisticsByFileType: Codable {
    /// Total number of files
    internal let count: Int

    /// File type
    internal let fileType: FileType

    /// Total size of the files
    internal let size: Int64

    internal init(
        count: Int,
        fileType: FileType,
        size: Int64
    ) {
        self.count = count
        self.fileType = fileType
        self.size = size
    }
}
