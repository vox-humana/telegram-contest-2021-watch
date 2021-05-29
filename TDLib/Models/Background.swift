//
//  Background.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a chat background
internal struct Background: Codable {
    /// Document with the background; may be null. Null only for filled backgrounds
    internal let document: Document?

    /// Unique background identifier
    internal let id: TdInt64

    /// True, if the background is dark and is recommended to be used with dark theme
    internal let isDark: Bool

    /// True, if this is one of default backgrounds
    internal let isDefault: Bool

    /// Unique background name
    internal let name: String

    /// Type of the background
    internal let type: BackgroundType

    internal init(
        document: Document?,
        id: TdInt64,
        isDark: Bool,
        isDefault: Bool,
        name: String,
        type: BackgroundType
    ) {
        self.document = document
        self.id = id
        self.isDark = isDark
        self.isDefault = isDefault
        self.name = name
        self.type = type
    }
}
