//
//  GetRemoteFile.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns information about a file by its remote ID; this is an offline request. Can be used to register a URL as a file for further uploading, or sending as a message. Even the request succeeds, the file can be used only if it is still accessible to the user. For example, if the file is from a message, then the message must be not deleted and accessible to the user. If the file database is disabled, then the corresponding object with the file must be preloaded by the application
internal struct GetRemoteFile: Codable {
    /// File type, if known
    internal let fileType: FileType

    /// Remote identifier of the file to get
    internal let remoteFileId: String

    internal init(
        fileType: FileType,
        remoteFileId: String
    ) {
        self.fileType = fileType
        self.remoteFileId = remoteFileId
    }
}
