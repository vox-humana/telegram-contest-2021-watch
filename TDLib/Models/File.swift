//
//  File.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a file
internal struct File: Codable {
    /// Expected file size in case the exact file size is unknown, but an approximate size is known. Can be used to show download/upload progress
    internal let expectedSize: Int

    /// Unique file identifier
    internal let id: Int

    /// Information about the local copy of the file
    internal let local: LocalFile

    /// Information about the remote copy of the file
    internal let remote: RemoteFile

    /// File size; 0 if unknown
    internal let size: Int

    internal init(
        expectedSize: Int,
        id: Int,
        local: LocalFile,
        remote: RemoteFile,
        size: Int
    ) {
        self.expectedSize = expectedSize
        self.id = id
        self.local = local
        self.remote = remote
        self.size = size
    }
}
