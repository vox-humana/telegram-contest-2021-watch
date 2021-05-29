//
//  CancelUploadFile.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Stops the uploading of a file. Supported only for files uploaded by using uploadFile. For other files the behavior is undefined
internal struct CancelUploadFile: Codable {
    /// Identifier of the file to stop uploading
    internal let fileId: Int

    internal init(fileId: Int) {
        self.fileId = fileId
    }
}
