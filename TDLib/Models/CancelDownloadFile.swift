//
//  CancelDownloadFile.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Stops the downloading of a file. If a file has already been downloaded, does nothing
internal struct CancelDownloadFile: Codable {
    /// Identifier of a file to stop downloading
    internal let fileId: Int

    /// Pass true to stop downloading only if it hasn't been started, i.e. request hasn't been sent to server
    internal let onlyIfPending: Bool

    internal init(
        fileId: Int,
        onlyIfPending: Bool
    ) {
        self.fileId = fileId
        self.onlyIfPending = onlyIfPending
    }
}
