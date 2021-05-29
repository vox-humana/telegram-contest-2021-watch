//
//  DeleteFile.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Deletes a file from the TDLib file cache
internal struct DeleteFile: Codable {
    /// Identifier of the file to delete
    internal let fileId: Int

    internal init(fileId: Int) {
        self.fileId = fileId
    }
}
