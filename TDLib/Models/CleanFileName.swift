//
//  CleanFileName.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Removes potentially dangerous characters from the name of a file. The encoding of the file name is supposed to be UTF-8. Returns an empty string on failure. Can be called synchronously
internal struct CleanFileName: Codable {
    /// File name or path to the file
    internal let fileName: String

    internal init(fileName: String) {
        self.fileName = fileName
    }
}
