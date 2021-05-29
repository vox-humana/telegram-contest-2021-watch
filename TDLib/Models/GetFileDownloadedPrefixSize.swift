//
//  GetFileDownloadedPrefixSize.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns file downloaded prefix size from a given offset
internal struct GetFileDownloadedPrefixSize: Codable {
    /// Identifier of the file
    internal let fileId: Int

    /// Offset from which downloaded prefix size should be calculated
    internal let offset: Int

    internal init(
        fileId: Int,
        offset: Int
    ) {
        self.fileId = fileId
        self.offset = offset
    }
}
