//
//  DatedFile.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// File with the date it was uploaded
internal struct DatedFile: Codable {
    /// Point in time (Unix timestamp) when the file was uploaded
    internal let date: Int

    /// The file
    internal let file: File

    internal init(
        date: Int,
        file: File
    ) {
        self.date = date
        self.file = file
    }
}
