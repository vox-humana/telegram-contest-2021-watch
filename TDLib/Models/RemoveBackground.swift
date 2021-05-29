//
//  RemoveBackground.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Removes background from the list of installed backgrounds
internal struct RemoveBackground: Codable {
    /// The background identifier
    internal let backgroundId: TdInt64

    internal init(backgroundId: TdInt64) {
        self.backgroundId = backgroundId
    }
}
