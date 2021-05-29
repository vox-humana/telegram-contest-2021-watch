//
//  LogTags.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a list of available TDLib internal log tags
internal struct LogTags: Codable {
    /// List of log tags
    internal let tags: [String]

    internal init(tags: [String]) {
        self.tags = tags
    }
}
