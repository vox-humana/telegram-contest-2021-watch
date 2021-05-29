//
//  FilePart.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a part of a file
internal struct FilePart: Codable {
    /// File bytes
    internal let data: Data

    internal init(data: Data) {
        self.data = data
    }
}
