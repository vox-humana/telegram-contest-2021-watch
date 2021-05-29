//
//  PageBlockListItem.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes an item of a list page block
internal struct PageBlockListItem: Codable {
    /// Item label
    internal let label: String

    /// Item blocks
    internal let pageBlocks: [PageBlock]

    internal init(
        label: String,
        pageBlocks: [PageBlock]
    ) {
        self.label = label
        self.pageBlocks = pageBlocks
    }
}
