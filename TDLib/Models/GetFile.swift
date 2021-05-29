//
//  GetFile.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns information about a file; this is an offline request
internal struct GetFile: Codable {
    /// Identifier of the file to get
    internal let fileId: Int

    internal init(fileId: Int) {
        self.fileId = fileId
    }
}
